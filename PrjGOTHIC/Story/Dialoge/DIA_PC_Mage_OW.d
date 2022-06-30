
instance DIA_MiltenOW_EXIT(C_Info)
{
	npc = PC_Mage_OW;
	nr = 999;
	condition = DIA_MiltenOW_EXIT_Condition;
	information = DIA_MiltenOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenOW_Hello(C_Info)
{
	npc = PC_Mage_OW;
	nr = TRUE;
	condition = DIA_MiltenOW_Hello_Condition;
	information = DIA_MiltenOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//����������, ��� ��������! ��� ����� ��-�� �������!
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"��� ������ ����, ������. �� ��� ��� ����� ��� ����� �����?",DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello,"� ������ ����� ����?",DIA_MiltenOW_Hello_NO);
};

func void B_Milten_GornDiegoLester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//�� ������� �����, ����� � �������?
};

func void DIA_MiltenOW_Hello_YES()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//��� ������ ����, ������. �� ��� ��� ����� ��� ����� �����?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//�����. ����� ����, ��� ������ ������, � ������� � ��������� ����� ����.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//�� ����� ����� ����, ��� �������� ����� ����������� ����, ��� ���� � ������ ���� ���� ��������� ������ ���������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//������� ���� ������ �������� ��� ��� ��������� ������ ����������� ���������� ��������� ���� ����������.
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"������� ��, � ����� ������.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"��� ����� �� � ��� ��� �� �������.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//� ������ ����� ����?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//�� ����� ������ ������, ��?
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"������� ��, � ����� ������.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"��� ����� �� � ��� ��� �� �������.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//������� ��, � ����� ������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//��, ���� � ����� �� ���� ������. �� ��������� �������� �����, � ������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//������ �����, ������� - � � ������� �� ����, ��� �� ������ ���������.
	if(Npc_KnowsInfo(other,DIA_Lester_Hello))
	{
		if(Npc_KnowsInfo(other,DIA_Lester_SEND_XARDAS))
		{
			AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//� �������� ������� - �� ������ � ���������.
		}
		else
		{
			AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03_add");	//� �������� �������. �� � �������.
		};
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//��, ���� �����-�� ������� �������.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//��, � � ���� ��� ������ ��������.
	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//��� ����� �� � ��� ��� �� �������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//�� ������ �����, ��? ��� �, ������� ������� � ����� � �������� ���� ����� �������� ����.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//���� � ���� � ��� �������� ��������.
	Info_ClearChoices(DIA_MiltenOW_Hello);
};


instance DIA_MiltenOW_Bericht(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Bericht_Condition;
	information = DIA_MiltenOW_Bericht_Info;
	permanent = FALSE;
	description = "��� ����� ������� ����?";
};


func int DIA_MiltenOW_Bericht_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Bericht_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//��� ����� ������� ����?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//�������� ������ ����, ����� �������� ���������� ����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//�� ��-�� ���� ���� ��������� �������� � �����, � ����������, ��� �������� ����� ������ � �����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//���, ������� ������� - � �������� ����������� ����-�� �������... ������-�� ���, ��� ������������ �����. ���-�� ������ ����������� �� ���� ������.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//�� ��������� ������� ���� �� ����������� �������. ���������� ������� �������� � ��� �����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//�� ����� ������� ���� ��������������, ���� ��� ������� �������� ��� ���.
};


instance DIA_MiltenOW_Erz(C_Info)
{
	npc = PC_Mage_OW;
	nr = 4;
	condition = DIA_MiltenOW_Erz_Condition;
	information = DIA_MiltenOW_Erz_Info;
	permanent = FALSE;
	description = "������� ���� ������� ������?";
};


func int DIA_MiltenOW_Erz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Bericht))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//������� ���� ������� ������?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//������� ����? �� ������ �����! � ��� ��� ����� ��� ������ �� ����������.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//� �� ��������, ���� ��� ��� ����� ������. � ��� ������� ������� � �������� ����!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//��� ���������� ���������� ������ ��������.
};


instance DIA_MiltenOW_Wo(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Wo_Condition;
	information = DIA_MiltenOW_Wo_Info;
	permanent = FALSE;
	description = "� ��� ������ ���� � �����?";
};


func int DIA_MiltenOW_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello) && (Knows_Diego == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//� ��� ������ ���� � �����?
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//��, ���� ����� �����, � �������, �� ��, ��� ������������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//����, ������, ������ �� ��������� ����� ���������� � ������ �������.
	};
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//����� ���������� � ������ ����������. ������ �������� ���������, �� ��������� ���� �����.
	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_Running;
};


instance DIA_MiltenOW_Gorn(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Gorn_Condition;
	information = DIA_MiltenOW_Gorn_Info;
	permanent = FALSE;
	description = "������, ��������� �����!";
};


func int DIA_MiltenOW_Gorn_Condition()
{
	if((KnowsAboutGorn == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//������, ��������� �����!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//��... �������� ����������� � ���, ��� ���� - ���������� �����������.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//�� ���� ��� �������, ������ ���������� �� ������ � �� ������ ������ ����� �������.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//��, ����� ����...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//����� ���� � �����.
	Log_CreateTopic(TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn,LOG_Running);
	B_LogEntry(TOPIC_RescueGorn,"����������� ������ ������� ����� � ������. ��������, � ��� ����� ������������ � ��� ������� �������� �������.");
};


instance DIA_MiltenOW_Preis(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Preis_Condition;
	information = DIA_MiltenOW_Preis_Info;
	permanent = FALSE;
	description = "������ ����� 1000 ������� ����� �� �����.";
};


func int DIA_MiltenOW_Preis_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//������ ����� 1000 ������� ����� �� �����.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//����������� �����. � ���� ������������ 250 �����.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	B_LogEntry(TOPIC_RescueGorn,"������ ��� ��� 250 �������, ����� � �������� �� ������������ �����.");
};


instance DIA_MiltenOW_Mehr(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Mehr_Condition;
	information = DIA_MiltenOW_Mehr_Info;
	permanent = FALSE;
	description = "��� ����� ������ ������, ����� ������ ������� �����.";
};


func int DIA_MiltenOW_Mehr_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && Npc_KnowsInfo(other,DIA_MiltenOW_Preis))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mehr_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//��� ����� ������ ������, ����� ������ ������� �����.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//������ ��� ������... ��... ����� ��� �� ������, �� ��� ����� ���.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//�����, ���� ��������� ���-������ ������ ��� ����. ����� �������� ���.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//� ������ ��� ������� - ���, �������� �������� �� � �������.
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"������ ��� ��� ������� ��� �����. ���� � ����� ���������� � ������, ��������, ���� ������ ��������, �� ��������� �� �� ���-������ ������� ������.");
};


instance DIA_MiltenOW_Equipment(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Equipment_Condition;
	information = DIA_MiltenOW_Equipment_Info;
	permanent = FALSE;
	description = "�� ������ ���������� ���� �����������? ������ �������� ���� ����������� � �����.";
};


func int DIA_MiltenOW_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//�� ������ ���������� ���� �����������? ������ �������� ���� ����������� � �����.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//� ��� �, ��-������, ������ ���? ������������, ��� � ���� ���� ���� - ��� ������ ������ ������.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_MiltenOW_Versteck(C_Info)
{
	npc = PC_Mage_OW;
	nr = 1;
	condition = DIA_MiltenOW_Versteck_Condition;
	information = DIA_MiltenOW_Versteck_Info;
	permanent = FALSE;
	important = FALSE;
	description = "� ������� ����� �� �����. �� �������, ��� ��� ������ ��������� � ����� �����.";
};


func int DIA_MiltenOW_Versteck_Condition()
{
	if((GornsTreasure == TRUE) && !Npc_HasItems(other,ItMi_GornsTreasure_MIS) && (Gorns_Beutel == FALSE) && (Kapitel == 2) && (MIS_RescueGorn == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//� ������� ����� �� �����. �� �������, ��� ��� ������ ��������� � ����� �����.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(� �������) ������ ����� �����, �� ������ �������. ������ ��������� �� � ���������.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//��� ��� ��������� ����?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//��� ���������� �� ������ �����. ����� ������ ���� ������ �� ����.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//��� ����� �������� - ��� ��� ���������� ������� ��� ��������� � �� ��������� �������� �����.
	B_LogEntry(TOPIC_RescueGorn,"������ ����� ������ ��������� ������ �� ������ �����. ������ ����� �������� ���-�� ���.");
};


instance DIA_MiltenOW_Frei(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Frei_Condition;
	information = DIA_MiltenOW_Frei_Info;
	permanent = FALSE;
	description = "� ��������� �����.";
};


func int DIA_MiltenOW_Frei_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//� ��������� �����.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//������. ������ �� ����� �������� � ���, ��� ������ ������.
};


instance DIA_MiltenOW_Lehren(C_Info)
{
	npc = PC_Mage_OW;
	nr = 9;
	condition = DIA_MiltenOW_Lehren_Condition;
	information = DIA_MiltenOW_Lehren_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_MiltenOW_Lehren_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Lehren_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//� ���� ������� ���� ����� �� ������� �����, ��� � ���� ������ �������� ���� ���������� �������.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//���� �� ����� �������� ���� �������, � ���� ������� ����.
};


instance DIA_MiltenOW_TeachCircle1(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle1_Condition;
	information = DIA_MiltenOW_TeachCircle1_Info;
	permanent = TRUE;
	description = B_BuildLearnString("������ ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,1));
};


func int DIA_MiltenOW_TeachCircle1_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle1_Info()
{
	DIA_Common_TeachMe_FirstMagicCirlce();
	if(B_TeachMagicCircle(self,other,1))
	{
		DIA_Milten_RunesComment_01();
		DIA_Milten_RunesComment_02();
		DIA_Milten_RunesComment_03();
	};
};


instance DIA_MiltenOW_TeachCircle2(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle2_Condition;
	information = DIA_MiltenOW_TeachCircle2_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ������� ����� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
	description = B_BuildLearnString("������ ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,2));
};


func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//����� ���� ������� ����� �����!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//��� ������ ���������� �������� ������ ������.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//�� � �����, ��� � ����� ������ �� ����� ������� ����������...
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//� �� ������, ��� ����� ��� ��� ����������� � ������������� �����...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//����� �� ������ ����. �-�... �� ������� ���� �����������, �� ���� ���� ��������� ����...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//� �����, �� ���������, � ��� ��� ���...
	};
};


instance DIA_MiltenOW_Teach(C_Info)
{
	npc = PC_Mage_OW;
	nr = 90;
	condition = DIA_MiltenOW_Teach_Condition;
	information = DIA_MiltenOW_Teach_Info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int DIA_MiltenOW_Teach_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	DIA_Common_WantToLearnNewRunes();
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach,Dialog_Back,DIA_MiltenOW_Teach_BACK);
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
		{
			if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_Light,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_MiltenOW_Teach_Light);
			};
			if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_MiltenOW_Teach_Heal);
			};
		};
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
		{
			if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenOW_Teach_Windfist);
			};
			if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
			};
			if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
			{
				Info_AddChoice(DIA_MiltenOW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenOW_Teach_Eispfeil);
			};
		};
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_Windfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WindFist);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_MiltenOW_Teach_Heal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightHeal);
};

func void DIA_MiltenOW_Teach_Light()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Light);
};

var int Milten_OW_TeachMANA_NoPerm;

func void B_BuildLearnDialog_Milten_OW()
{
	if(RealAttributeValue(ATR_MANA_MAX) >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
		Milten_OW_TeachMANA_NoPerm = TRUE;
	}
	else
	{
		Info_ClearChoices(DIA_MiltenOW_Mana);
		Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
		Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(ATR_MANA_MAX,1)),DIA_MiltenOW_Mana_1);
		Info_AddChoice(DIA_MiltenOW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(ATR_MANA_MAX,5)),DIA_MiltenOW_Mana_5);
	};
};

instance DIA_MiltenOW_Mana(C_Info)
{
	npc = PC_Mage_OW;
	nr = 100;
	condition = DIA_MiltenOW_Mana_Condition;
	information = DIA_MiltenOW_Mana_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int DIA_MiltenOW_Mana_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2) && (Milten_OW_TeachMANA_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//� ���� �������� ��� ���������� �����������.
	B_BuildLearnDialog_Milten_OW();
};

func void DIA_MiltenOW_Mana_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED))
	{
		B_BuildLearnDialog_Milten_OW();
	};
};

func void DIA_MiltenOW_Mana_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED))
	{
		B_BuildLearnDialog_Milten_OW();
	};
};

instance DIA_MiltenOW_Perm(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Perm_Condition;
	information = DIA_MiltenOW_Perm_Info;
	permanent = TRUE;
	description = "� ����� � ���� ����� �����������?";
};


func int DIA_MiltenOW_Perm_Condition()
{
	if((Kapitel == 2) && !Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//� ����� � ���� ����� �����������?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//����������... � ������ ��� ��������� ���������� ����. �� ��� ����� ����� �������� ��� � ����.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//� ������ � �������������� �� �������� �������.
};


instance DIA_MiltenOW_Plan(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Plan_Condition;
	information = DIA_MiltenOW_Plan_Info;
	permanent = TRUE;
	description = "� ��� �� ���������� ������ ������?";
};


func int DIA_MiltenOW_Plan_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//� ��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//� �������. ������� ��� �������, � ������, ����� ���� ��������, � ���� ����������� � ���� ������ � ���.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//������ �����, ����� ������� ����� � �������� �����.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//��, ���� �� ��� ��������.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//� �������, ��� ���� ����� ������, ����� ������ ������� �� ���� ������. �� ������� ������, ��� ����������, ���� ���� ������� ����� ������.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//��, ����� �������� �����������.
};

