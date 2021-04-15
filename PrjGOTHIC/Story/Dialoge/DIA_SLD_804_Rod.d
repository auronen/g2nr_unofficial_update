
instance DIA_Rod_EXIT(C_Info)
{
	npc = SLD_804_Rod;
	nr = 999;
	condition = DIA_Rod_EXIT_Condition;
	information = DIA_Rod_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rod_EXIT_Info()
{
	B_ClearFakeItems(other);
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rod_Hello(C_Info)
{
	npc = SLD_804_Rod;
	nr = 1;
	condition = DIA_Rod_Hello_Condition;
	information = DIA_Rod_Hello_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Rod_Hello_Condition()
{
	return TRUE;
};

func void DIA_Rod_Hello_Info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//��� ����?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//��� ���� ����� �� ����, �����?
		if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//���, ��� ���� �� ������� ����� � ���������?
		};
	}
	else if(Wld_IsRaining())
	{
		B_Say(self,other,"$WEATHER");
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
};


var int Rod_SchwachGesagt;
var int DIA_Rod_Teach_permanent;
var int Rod_Merke_2h;

instance DIA_Rod_WannaLearn(C_Info)
{
	npc = SLD_804_Rod;
	nr = 2;
	condition = DIA_Rod_WannaLearn_Condition;
	information = DIA_Rod_WannaLearn_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� �������� ��������� �������?";
};


func int DIA_Rod_WannaLearn_Condition()
{
	if(Rod_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//�� ������ ������� ���� �������� ��������� �������?
	if((Rod_WetteGewonnen == TRUE) || (self.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		if(!Npc_HasItems(self,ItMw_2h_Rod))
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//��, ���� �� ������ ��� ����� ��� ���.
		}
		else if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Rod)
		{
			B_Say(self,other,"$NOLEARNYOUREBETTER");
			Rod_Teach2H = TRUE;
			DIA_Rod_Teach_permanent = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//� �������� ����, �� ��� �� ��������, ��� � ������� �������.
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//� ��� �� � �����, � ���� �������� ���� ������ ��� ��������� �������.
			Rod_Teach2H = TRUE;
			Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_SoldierTeacher,"��� ����� �������� ���, ��� ����� ������� ��������� �������.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//��������, �������. ����� ������� ��������� �������, ����� �������� ���������� �����.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//������ �� ���� �� ����� �� �������� � �� �������� � ������� � ��������?
		Rod_SchwachGesagt = TRUE;
	};
};


func void B_BuildLearnDialog_Rod()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Rod)
	{
		Info_ClearChoices(DIA_Rod_Teach);
		Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
		Info_AddChoice(DIA_Rod_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
		Info_AddChoice(DIA_Rod_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Rod)
		{
			DIA_Rod_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Rod)),-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Rod_Teach(C_Info)
{
	npc = SLD_804_Rod;
	nr = 3;
	condition = DIA_Rod_Teach_Condition;
	information = DIA_Rod_Teach_Info;
	permanent = TRUE;
	description = "� ���� ��������� ����� ������� ��������� �������!";
};


func int DIA_Rod_Teach_Condition()
{
	if((Rod_Teach2H == TRUE) && (DIA_Rod_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_Teach_Info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//� ���� ��������� ����� ������� ��������� �������!
	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	B_BuildLearnDialog_Rod();
};

func void DIA_Rod_Teach_Back()
{
	if(Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//�� ��� �������� �� �����.
	};
	Info_ClearChoices(DIA_Rod_Teach);
};

func void DIA_Rod_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Rod))
	{
		B_BuildLearnDialog_Rod();
	};
};

func void DIA_Rod_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Rod))
	{
		B_BuildLearnDialog_Rod();
	};
};

var int DIA_Rod_WannaJoin_noPerm;

instance DIA_Rod_WannaJoin(C_Info)
{
	npc = SLD_804_Rod;
	nr = 4;
	condition = DIA_Rod_WannaJoin_Condition;
	information = DIA_Rod_WannaJoin_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int DIA_Rod_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (DIA_Rod_WannaJoin_noPerm == FALSE))
	{
		return TRUE;
	};
};


func void DIA_Rod_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//� ���� �������������� � ���������!
	if(!Npc_HasItems(self,ItMw_2h_Rod))
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//� ��� ������ ����, ����� ������� ������� ��� ��� ���, �?
	}
	else if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//������. � �� ����� �����.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//�� ������ ���������, � ������ ��� ����� ��������.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//����������� ������ ����� �� �������� �������� �� ������ ������ ����� ��������. �� ���������� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//��, ��, � ���� �������� ���. ���������� �� ���������.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//���� ���� ��������� ��� ������, �� � �� ������.
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		SCKnowsSLDVotes = TRUE;
		B_LogEntry(TOPIC_SLDRespekt,"� ������ ����� ����, ���� � ������ �������������� � ���������.");
		DIA_Rod_WannaJoin_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//� ��� ����� �� ��� ��������!
		Rod_SchwachGesagt = TRUE;
	};
};


instance DIA_Rod_Duell(C_Info)
{
	npc = SLD_804_Rod;
	nr = 6;
	condition = DIA_Rod_Duell_Condition;
	information = DIA_Rod_Duell_Info;
	permanent = TRUE;
	description = "������, ��� ����� ������� ���� ������� �������, �� �� ������?";
};


func int DIA_Rod_Duell_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if(((Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE)) || (MIS_Jarvis_SldKO == LOG_Running))
		{
			return TRUE;
		};
	};
};

func void DIA_Rod_Duell_Info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//������, ��� ����� ������� ���� ������� �������, �� �� ������?
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//�����, ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//�� ������ �� �������!
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Rod_StarkGenug(C_Info)
{
	npc = SLD_804_Rod;
	nr = 5;
	condition = DIA_Rod_StarkGenug_Condition;
	information = DIA_Rod_StarkGenug_Info;
	permanent = FALSE;
	description = "� ���������� �����!";
};


func int DIA_Rod_StarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rod_StarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//� ���������� �����!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//����! �� ���� �� ���� ������� ��������� ��� ����� �����!
	Log_CreateTopic(Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus(Topic_RodWette,LOG_Running);
	B_LogEntry(Topic_RodWette,"������� ��� ������, ��� � �� ����� �������� ��� ���.");
};


instance DIA_Rod_BINStarkGenug(C_Info)
{
	npc = SLD_804_Rod;
	nr = 5;
	condition = DIA_Rod_BINStarkGenug_Condition;
	information = DIA_Rod_BINStarkGenug_Info;
	permanent = FALSE;
	description = "� ������, � ���������� �����!";
};


func int DIA_Rod_BINStarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};

func void DIA_Rod_BINStarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//� ������, � ���������� �����!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//���, �� ���������� ��� ������! �������� ��������� ��������� ����?
};


var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
var int Rod_Gold;

instance DIA_Rod_Wette(C_Info)
{
	npc = SLD_804_Rod;
	nr = 5;
	condition = DIA_Rod_Wette_Condition;
	information = DIA_Rod_Wette_Info;
	permanent = TRUE;
	description = "����� ���������, ��� ����� �������� ���� ���!";
};


func int DIA_Rod_Wette_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_BINStarkGenug) && Npc_HasItems(self,ItMw_2h_Rod) && (Rod_WetteAngenommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_Wette_Info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//����� ���������, ��� ����� �������� ���� ���!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//�����? ���... (������) � ������� �� ��� � ���� �����?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//��... �� ����� �� ������ �������. ������, ��� ����� 30 �����! � ���� ���� ���� �� �������?
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"���.",DIA_Rod_Wette_No);
	Info_AddChoice(DIA_Rod_Wette,"�������.",DIA_Rod_Wette_Yes);
	if(Rod_Gold == FALSE)
	{
		B_LogEntry(Topic_RodWette,"��� ������ 30 ������� ����� �� ��, ��� � �� ����� �������� ��� ���.");
		Rod_Gold = TRUE;
	};
};

func void DIA_Rod_Wette_No()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//���.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//��, ����� ����������.
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_Yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//�������.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//������...
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		Rod_WetteAngenommen = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//���!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//(��������) ������, ����� ���������, ��������� �� �����...
		B_GiveInvItems(self,other,ItMw_2h_Rod,1);
		if(other.attribute[ATR_STRENGTH] >= Condition_Rod)
		{
			if(Npc_HasReadiedMeleeWeapon(other) || Npc_HasReadiedRangedWeapon(other))
			{
				AI_RemoveWeapon(other);
			};
			AI_WaitTillEnd(other,self);
			CreateInvItem(other,ItMw_2h_Rod_Fake);
			AI_UseItem(other,ItMw_2h_Rod_Fake);
			AI_Wait(other,0.5);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//��� ����������?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//(������ � �����) ������, �� ����� ����.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//� ����� �� ������ �� ���� ������. �� �� ����� �� ��������, ����������� ����� �����.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//��, ������, � ������ ��� ������� 30 ������� �����. �����.
			B_GiveInvItems(self,other,ItMi_Gold,60);
			B_LogEntry(Topic_RodWette,"� ���� �������� ��� ����.");
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP(XP_Rod);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//� �� ���� ������� ��� ������.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(�������) ��� � � �������!
			B_LogEntry(Topic_RodWette,"� �� ���� �������� ��� ����.");
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//� ������ ����� ��� ��� ������ �����.
		Info_ClearChoices(DIA_Rod_Wette);
		Info_AddChoice(DIA_Rod_Wette,"�����, ��� ���...",DIA_Rod_Wette_KeepIt);
		Info_AddChoice(DIA_Rod_Wette,"���, �����.",DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//� ���� �� � ��� ���...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//��. �����������, ����� � ���� ����� ���������� ������, ����� ������� ������.
		Info_ClearChoices(DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	B_ClearFakeItems(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//���, �����.
	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	if(Rod_WetteGewonnen == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01_add");	//�� �� ������ ������!
	};
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	B_ClearFakeItems(other);
	DIA_Common_IThinkNo();
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(���������) ��� ��� ������?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//����� � ������� ��� � ���� �������.
	AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//�� �� ������ ������ ����� �����!
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//��, �������, �������...
	Info_ClearChoices(DIA_Rod_Wette);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Rod_GiveItBack(C_Info)
{
	npc = SLD_804_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = "���, ����� ���� ���!";
};


func int DIA_Rod_GiveItBack_Condition()
{
	if(Npc_HasItems(other,ItMw_2h_Rod))
	{
		return TRUE;
	};
};

func void DIA_Rod_GiveItBack_Info()
{
	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//���, ����� ���� ���!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//�������!
	if(Rod_SchwertXPGiven == FALSE)
	{
		if(CurrentLevel == NEWWORLD_ZEN)
		{
			B_GivePlayerXP(XP_Ambient);
		}
		else
		{
			B_GivePlayerXP(XP_AmbientKap1);
		};
		Rod_SchwertXPGiven = TRUE;
	};
};


instance DIA_Rod_PERM(C_Info)
{
	npc = SLD_804_Rod;
	nr = 1;
	condition = DIA_Rod_PERM_Condition;
	information = DIA_Rod_PERM_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Rod_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rod_Hello))
	{
		return TRUE;
	};
};

func void DIA_Rod_PERM_Info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//��� ����?
	if(Kapitel <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//��� �� ���� ����, ������.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//��� ���������, �������� �� ���� �������������� � ���.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//������ �� ���� �� ���, �����. ����� �� � ���� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//�� �� ��� �������. �������� �� �� ����� � ������ �����!
		};
	};
	if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//���� ��� ��� ������� � �������� ������������� ������, ��� ����� ������� ����� � ���������� ���� ������!
	};
};


instance DIA_RodSLD_PICKPOCKET(C_Info)
{
	npc = SLD_804_Rod;
	nr = 900;
	condition = DIA_RodSLD_PICKPOCKET_Condition;
	information = DIA_RodSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_RodSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void DIA_RodSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,Dialog_Back,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

