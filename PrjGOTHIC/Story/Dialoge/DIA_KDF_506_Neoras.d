
instance DIA_Neoras_Kap1_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Hallo(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Neoras_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_ALCHEMY_01") <= 500)
	{
		AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//���... ���-�� ���������? ����� �� ���������� ����? ����� �� �� ������ - � ������� ����� ������� �����������?
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Hallo_01_00_add");	//���... ���-�� ���������? ����� �� ���������� ����?
	};
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//� �� ����� ������������ ����.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//�� ��� �����������. (��������) �����, ������, ���� �� ������?
};


instance DIA_Neoras_Arbeit(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Arbeit_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int DIA_Neoras_Arbeit_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//� ���� ���� ������ ��� ����?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//��, ��� ����� ����� ��� ���� �������������. �� ���� ���������� ��, �� � ��� ������ ����������� �������� �������.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//���� ������� ����� ����������. ������� ��� �� - ��, �� - � ��� ������� ������ ���������� �����.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//���� �� ������� ���, � ���� ����� ����������.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntries(Topic_NeorasPflanzen,"� ������ �������� ���� ������ �������� ������� ������� �������, ��������.");
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogNextEntry(Topic_Neorasrezept,"������� ������� �� ������� ������� ��� ������������� ����� ����.");
	if(Npc_KnowsInfo(other,DIA_Opolos_beibringen))
	{
		Log_AddEntry(Topic_Neorasrezept,"���, ������ ����, ������, �� ������� ��� ����� ��������� ������.");
	};
};


instance DIA_Neoras_Rezept(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = "������ �������...";
};


func int DIA_Neoras_Rezept_Condition()
{
	if(MIS_NeorasRezept == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	DIA_Common_AboutThatRecipe();
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		DIA_Common_IFoundHim();
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//������. � ������, ��� �� ������� ��� ���� ��������.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//���, ������ � ���� ���� ������������� ��� ���������� �����.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//� ��� �� ����� ���.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//��, � ��� �� �������, ��� ���� ������� ��� �����.
	};
};


instance DIA_Neoras_Flieder(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Flieder_Info;
	permanent = TRUE;
	description = "� ������ ���� �������� �������.";
};


func int DIA_Neoras_Flieder_Condition()
{
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//� ������ ���� �������� �������.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//�����������, ������ � ���� ��������. ������ ���� ������ � ����������� '����� �����', �������, �� ���� ����������.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//��, �������������? �� �� ������ ������������. ��� ����� ���� �����������.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = "���� � ����-������ ��������� � ����?";
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//���� � ����-������ ��������� � ����?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//� ���� ������� ���� �������� �������.
		if(Neoras_TeachAlchemy == FALSE)
		{
			Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
			B_LogEntry(Topic_KlosterTeacher,"������ ����� ������� ���� ������ �����.");
			Neoras_TeachAlchemy = TRUE;
		};
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HP_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_HPMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//� �� ������ ��������. ���� ������� �� ������ ������ � ���� ����,
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//����� � ������ ����, ��� ��������� ������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//� ������� ���� ������ ������ ������ ����� ������.
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Neoras_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Neoras_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Neoras_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void B_Neoras_Price()
{
	AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//�� ���� ������������� � ���� 10 ������� �����.
};

instance DIA_Neoras_BrewPotion(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent = TRUE;
	description = "�� ��� �� �� ������� ��� �����?";
};


func int DIA_Neoras_BrewPotion_Condition()
{
	if(NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//�� ��� �� �� ������� ��� �����?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//��� ������� �� ������� ����������. ���, ��������� ������ �������������.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//�� ������ ������ ���, ��� ���� �����, � �������.
		if(Gorax_Trade == FALSE)
		{
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			B_LogEntry(Topic_KlosterTrader,"������ ������ � ��������� ����� ������������ ��� ���, ��� ��� �����.");
			Gorax_Trade = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//�� ������������ � ���� ������������? � ���� ������� ����� �����.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//�������.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//�� ��� ������. ������� �� ������ �������� ��� ����������� ����������� � ������ �������� ����� �� ��� �����, � ����� �� ���������.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//������� �� �������?
		B_Neoras_Price();
		NeorasBrewsForYou = TRUE;
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = "����� ���...";
};


func int DIA_Neoras_BrewForMe_Condition()
{
	if(NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... ����� ��������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... �������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"... �������� ��������.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

var int Neoras_Ingrediences_Advice;

func void B_Neoras_BuildBrewDialog()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe,"����� ��� ����� ��������.",DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe,"����� ��� �������� ����.",DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe,"����� ��� �������� ��������.",DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//����� ��� ����� ��������.
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//������, � ���� ���� ����������� ����������� � ������?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//��, ���, �����.
		Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("�������-����� ������",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("������� ����� ������",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//������, �������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//� ���� ��� ����������� ������������. �����������, ����� �������� ��.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			AI_Output(other,self,"DIA_Neoras_INGREDIENCES_Speed_15_00");	//����� ����������� ����� ��� ����� ���������?
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//����� ��� �������� ����.
	if((Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//������, � ���� ���� ����������� ����������� � ������?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//��, ���, �����.
		Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("2 ��������� ������ (�������� �����)",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("������� ����� ������",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//� ���� ��� ����������� ������������. �����������, ����� �������� ��.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			AI_Output(other,self,"DIA_Neoras_INGREDIENCES_Mana_15_00");	//����� ����������� ����� ��� ��������� ����?
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//����� ��� �������� ��������.
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && Npc_HasItems(other,ItPl_Temp_Herb) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//������, � ���� ���� ����������� ����������� � ������?
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//��, ���, �����.
		Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		AI_PrintScreen("2 ��������� ������ (�������� ��������)",-1,31,FONT_ScreenSmall,2);
		AI_PrintScreen("������� ����� ������",-1,28,FONT_ScreenSmall,2);
		B_GiveInvItems(other,self,ItMi_Gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//������. ������ � ��� ���� �����, ���� �� �������� ����� �����.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 10)
	{
		B_Neoras_Price();
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//� ���� ��� ����������� ������������. �����������, ����� �������� ��.
		if(Neoras_Ingrediences_Advice == FALSE)
		{
			DIA_Common_SureWhatsNeeded();
			DIA_Common_14_GoReadAboutIt();
			Neoras_Ingrediences_Advice = TRUE;
		};
	};
	B_Neoras_BuildBrewDialog();
};


instance DIA_Neoras_DRACHENEIER(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 40;
	condition = DIA_Neoras_DRACHENEIER_Condition;
	information = DIA_Neoras_DRACHENEIER_Info;
	permanent = TRUE;
	description = "�� ��� ������� ���������, ��� ���� �������.";
};


func int DIA_Neoras_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_Neoras_DragonEgg == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_ALCHEMY_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//�� ��� ������� ���������, ��� ���� �������.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//��, � ��������� �������. ��� ��������� ���� � ������� ����������� ��� ������� �����. � ������ �� ����������.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"���� ��� �������� �� ��������.",DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"� ��� ��� ������ ���� �� �����?",DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"� � ��� ��������?",DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//� � ��� ��������?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//� ������� ��������� ���-�� � ���� �������. ������� ��, � ���� ��� ���.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//������� � ������� �������� ���� ����������. ������ ���� ��� ������.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//���� �������, � �����-������ ������, �� ���������� �� ���� �� ����� ����, ����������, �� ������ ��� ���.
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"� ��� �� ����������� ������ ���������� ����?",DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER,"� �������� ���-������ �������.",DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//� �������� ���-������ �������.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//��. � ������ �������. � �� ����, ��� ���� ������������� ������� ����� ���� �������.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//����� ����� ��������.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIERNeoras,"������� ��� ������������� ����� �������� ����. �� ������, ���, �������� � ����� ����� ��� � �����-������ ������.");
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//� ��� �� ����������� ������ ���������� ����?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//������ ���, ���� ����� �� �����.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//� ��� ��� ������ ���� �� �����?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//� ����� ���� ������ � �������������� ��������. � ��� ��������� � �������� ��������, �� ����� ���������� �����.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//� �� ������, ������ �� ��� ����� ������ ���-������, �� ����� ������ ���������� ���� ���������� ���� �����������.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//���� ��� �������� �� ��������.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//�����, ����������, �� �������� ���� ������.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = "���, � ����� ��� ���� ���� �������.";
};


func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (MIS_Neoras_DragonEgg == LOG_Running))
	{
		return TRUE;
	};
};


var int Neoras_DragonEggDrink_Day;

func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//���, � ����� ��� ���� ���� �������.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//�� ���, ����������� ���� ����?
//	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("�������� ���� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItem(other,ItAt_DragonEgg_MIS);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//��� ���������! � ���� �� �����, ��� ��� ��������. ��� �� ����� ���?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//���� ����� ����� �� �����.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//�����������. ��� �� ������ �� ����?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"���� �� ����.",DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"��� ������ ���������� �������� �����?",DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG,"��� ��� ������� ����� �����, ����� ��� ����� ������.",DIA_Neoras_FOUNDDRAGONEGG_trank);
};


func void B_Neoras_Later()
{
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//����� �������, ����� � ������� ���.
};

var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//��� ��� ������� ����� �����, ����� ��� ����� ������.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//������. ��, ��� � ��� ������, � ������� �� ����, ��� ��� ���������.
	B_Neoras_Later();
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//��� ������ ���������� �������� �����?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//������� �����. ���, �����. �������, ��� ���� ����������.
	CreateInvItems(self,ItPo_Health_Addon_04,5);
	B_GiveInvItems(self,other,ItPo_Health_Addon_04,5);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//���� �� ����.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//���. ������. ����� ������ ��� ���������� ������. � ������, ��� ������� ���� � �������� � ������ �������.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//��� ������� ���� �� ���� ���������� ��������.
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};


instance DIA_Neoras_DRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_DRAGONEGGDRINK_Condition;
	information = DIA_Neoras_DRAGONEGGDRINK_Info;
	description = "� ������ �������� ��� ���������� ����� �� ���� �������.";
	permanent = TRUE;
};


func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if((Neoras_SCWantsDragonEggDrink == TRUE) && (Neoras_DragonEggDrinkGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//� ������ �������� ��� ���������� ����� �� ���� �������.
	if(Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//��. � ������ ��� �������� ���. � ��� �� ��������� ��� � �� ���� ������� ��������������� �� ��� ��������. �� �������?
		AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//����� ��� ����.
		AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//������. �������, ��� ����� �� �������� ���� ������ ����������.
		CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
		B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
		Neoras_DragonEggDrinkGiven = TRUE;
	}
	else
	{
		B_Neoras_Later();
		AI_StopProcessInfos(self);
	};
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = "� ���������� ���� ����� �� ���� �������. �������� �����!";
};


func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if(Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//� ���������� ���� ����� �� ���� �������. �������� �����!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//���. ����� ���������. � ������ ���������� ���� ������������.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//�� �� ��� �� ������� ��� ���?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//����� �����, ���� �� �������� ��� ����� ��������� ������. �����, �����, � ���� ����� ������� ����.
};


instance DIA_Neoras_PICKPOCKET(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 900;
	condition = DIA_Neoras_PICKPOCKET_Condition;
	information = DIA_Neoras_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Neoras_PICKPOCKET_Condition()
{
	return C_Beklauen(72,140);
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,Dialog_Back,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

