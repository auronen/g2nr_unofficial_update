
var int Vatras_LaresExit;

func int C_Vatras_Away()
{
	if(MIS_RitualInnosEyeRepair == LOG_Running)
	{
		return TRUE;
	};
	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Vatras_ListenersControl()
{
	var string pos;
	if(C_Vatras_Away())
	{
		pos = "VATRASAWAY";
	}
	else
	{
		pos = "START";
	};
	if(Vatras_Listeners_ReadyToGo == TRUE)
	{
		B_StartOtherRoutine(Valentino,pos);
		B_StartOtherRoutine(VLK_426_Buergerin,pos);
		B_StartOtherRoutine(VLK_428_Buergerin,pos);
		B_StartOtherRoutine(VLK_450_Buerger,pos);
		B_StartOtherRoutine(VLK_454_Buerger,pos);
		B_StartOtherRoutine(VLK_455_Buerger,pos);
		Vatras_Listeners_ReadyToGo = FALSE;
	};
};

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 3) && (MadKillerCount < 7) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//� ������ ��� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//�������, ��� �� ������� � �������� �������� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//���� ��� ���, �� � ������ ������������ ����, �����.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//�� ����� �������� ������ ���, ��� � ��������� ������ ���� �������� ����������� � ������������� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//��� � ���� ������ ����?
};


instance DIA_Addon_Vatras_LastWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount >= 7) && (VatrasPissedOffForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//��� �� ������ ������� � ���� ����������?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"������.",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"��� ����� ����. � �� �������, ��� �����.",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//� �� ����� � ����� ������ �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//�� �� ���������� ��� ������� ������.
	if(C_Vatras_Away())
	{
		Vatras_Listeners_ReadyToGo = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//��� ����� ����. � �� �������, ��� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//� ���� �������� �� ���� � ������� �����, ����� ��� ������� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//���� ����, ���� � ������ ���� �� �� ����� ��������, � �������� �� �������� ����.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if((MadKillerCount > VatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Vatras_LastWarning) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//���� ����� ��� �� �����, ��� � ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//�� ����� �� ������ ���������� ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//�� �� ���������� ��� ������� ������...
	if(C_Vatras_Away())
	{
		Vatras_Listeners_ReadyToGo = TRUE;
	};
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//�������!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//���� ������� ������...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//� ����, ����� �� ������ ��� ��������� ������.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//����������� � ����. ��� �� ������� �������� �� ����� �����.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//������� ��� ���� �������� � �����, ��� ��� ����� �������. �� �����, ��� ������.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	AI_StopProcessInfos(self);
	B_Vatras_ListenersControl();
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//�� �������� � ����� ������.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//��� ��?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//� ������, ����� �������, ������ ���������� ������������� � �������.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//��� � ���� ������� ��� ����?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "� ���� ��� ���� ������.";
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//� ���� ��� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//��� ����?
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
		Npc_RemoveInvItem(self,ItWr_SaturasFirstMessage_Addon_Sealed);
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		Npc_RemoveInvItem(self,ItWr_SaturasFirstMessage_Addon);
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras / 4);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//��, ��... ��� �������. � �������, ��� �� ������ � ����� ����?
	};
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//��. ��� ����� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//���������, ��� � ���� ������ ��� ������?
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"� ������ ��� � ��������.",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"� ������� ��� � ���������, ��������.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//� ������ ��� � ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(�����������) � ������! ��� �����. ��� ����� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//���� ��, ��� �� �������� ������, �� � ��� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//� ������ ��� ����� ������ ����������� � ����.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//� ������� ��� � ���������, ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(� ����������) ��������? � ��� ��?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//�� ������ �������� ����, ��� �� �������� � ����� ���������� � ����� �������. ��� �� ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//� ������, �� �������� ������� ���������. ��� ������� � ���� ������.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = "���� ������� � ���� ��������!";
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Vatras_Why == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//���� ������� � ���� ��������!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//� ��� �� �� ���� ������?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//�� ������, ��� �� ����� ������ �����.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(���������) ���... ������, �� ������ �������������� � ���, �����?
};


var int Vatras_ToldAboutDuty;
var int Vatras_ToldAboutOtherKDW;
var int Vatras_ToldAboutUnexplored;

instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "�������� ��� � ������ ����.";
};


func int DIA_Addon_Vatras_TellMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//�������� ��� � ������ ����.
	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(���������) � ����� ��� ��� ������?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//��� ��� �� ���� �� ��������� ������ ������ ����������, � �� ����� ���������� ���� ���.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//�� � �������� ���� ��, ��� ���� ����� ��������.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"��� ������ �� �����������?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"� ��� ��������� ���� ����?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"��� �������� ������ ������ ����?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//��� ������ �� �����������?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//�� ����� �� ���� ������� ������ � ����� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//���� ���� �� ������ ������� ����, �� ��� ����� �������� ���� ������ ����, ���� ������������� ������ �������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//������� �� ������������ ������ ���� ���. ��������� ��� ���������� ��� �����.
	Vatras_ToldAboutDuty = TRUE;
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//� ��� ��������� ���� ����?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//��� ��������� ��������� ������� ����������� � ������-������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//�� �����������, ��� � ���� ������ ����� ���������� ������ � ��� ����� �������, ������� ��� �� �������� �� �����.
	if(Vatras_ToldAboutOtherKDW == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"���� ���� ��������� ����� �������� ������� ��������, ������� ��������� �� ������-������� �� ��������. ��������, ��� ��������� ������ � ��������������� ����� �������.");
	};
	Vatras_ToldAboutOtherKDW = TRUE;
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"�������� ��� �� ����.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//�������� ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//���� ������ �������������� � ����������, � ���� �������� � ����� ������, ������� �� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//�� ������ ����� � ���� ������ � ��� ������, ���� �� ������ ����� �� ���.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//����������.
	if(Vatras_ToldAboutUnexplored == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW,"������ ��� ��������� ���� �� ������� � ����������, ������ �������, ����� � ������������� � ������ ����.");
	};
	Vatras_ToldAboutUnexplored = TRUE;
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//��� �������� ������ ������ ����?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//���� �� �� �������� � ���� ��������, � �� ���� �������� ���� �����������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//�� �� ��������� ��� ���������� � ����.
};


instance DIA_Addon_Vatras_Bandittrader(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Bandittrader_Condition;
	information = DIA_Addon_Vatras_Bandittrader_Info;
	description = "� ��� ��� ������ ��� ����?";
};


func int DIA_Addon_Vatras_Bandittrader_Condition()
{
	if((Vatras_ToldAboutDuty == TRUE) || (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};


func void DIA_Addon_Vatras_Bandittrader_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(�����) � ��� ��� ������ ��� ����?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//������� ������� ����� �������� ������������� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//�������, ��������, ����� ��������� �� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//� ���� �� ������ � ���, ��� ������ ������ �������������� � ������������...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//� ������ ���� ���-��, ��� �������� ��������!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//�� ������, ��� ������� �������� ���������� �������� �� �������� ������� � ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//������ �� �������� ����� ������ �������� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//���� ���-������ ������� �� ����, ��� ��� �����.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntries(TOPIC_Addon_Bandittrader,"����� �������� �� �������� ���������� �������� ������. ������ �����, ����� � ����� ��� �� ������ ����.");
	B_LogNextEntry(TOPIC_Addon_RingOfWater,"������ ���� ���������� ��������� �������� � ��������.");
};


func void B_Vatras_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//������, ����� ���������:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//�� ������ �����������...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//�� �������� ����������� � ���...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... �������� ������ ��������� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... ������� ������ �����...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... � ���, ��� ������ �������, ����� ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... ��� ����� ���������� ������� ����.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//� �� ������, ����� �������� ��� ���������...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//��� ��� ������ �������� �������������, �� � �� �����, ��� �� ������ ���.
	};
};

func void B_Vatras_ReadyToJoin()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//������� � �������� ������������, ��� ���� ������ ����������.
	AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//� ���� ���� ���� ���� �������������� � ������ ����.
};

instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "� ���� �������������� � �������� ������ ����!";
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if(SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//� ���� �������������� � �������� ������ ����!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//������? ������, �� ��� �������� ������ ����������.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//��� �� ������ ���� �������?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//������ ����, ����� ��� ���� ���-��, ��� �������� ����. � ��������� ������ �� �� ������ ������ �� �����.
	};
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		B_Vatras_REPEAT();
		B_Vatras_ReadyToJoin();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//�� � ������ ������ �� ���� ��� ����...
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//��� �� ������ �����?
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//��, �� ������ ���������� ���, ������ �� ������ � ����� �� ������ � ���� �����.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//� ���� ������ ��������� ��� ����� ���������.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//��� �� ���������?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"���� �� �������������, ���������� �������� �����, ������� ���������.",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"����� ���������� ������� ����!",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void B_Vatras_First_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//���� �� �������������, ���������� �������� �����, ������� ���������. ��� ����� ������������ ��������� ���� ������.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//���� ��� ������������� ������, ������ �� ����� ����� �������. ��� ������ ���� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(���������) �������? �� �������� � ���������, ������� �� ���������� ������� ����������� ������ � ��������. ������ �� ������ ���?
	};
	Vatras_First = TRUE;
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons) && Wld_IsTime(6,0,20,10))
	{
		Player_TalkedAboutDragonsToSomeone = TRUE;
	};
};

func void B_Vatras_First_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//����� ���������� ������� ����!
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(�������) ���. � ��� ������ ���� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//������� ����, ��... ������ �� ������ ���?
	};
	Vatras_First = 2;
};

func void B_Vatras_Second_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//� ���� ����� �������� ��� ������� � ��������������� ������� �����. � �� ������ ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//���������... ��� �� ���... (���������) � �� ������ ����? � ��� �� �� ����� �����?
	};
	Vatras_Second = TRUE;
};

func void B_Vatras_Second_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//��, � ���-�� ������ �� ����...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(�����������) �� ���� �� �������, ������ �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//���. � ������� �� ������� ���� ���� ������ ����. ��� �� ����� ������?
	};
	Vatras_Second = 2;
};

func void B_Vatras_Third_Truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//� ������ ����������� ������� ��������.
	Vatras_Third = TRUE;
};

func void B_Vatras_Third_Lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//� �������� ����������� � ���...
	Vatras_Third = FALSE;
};

func void B_Vatras_PLEASEDONTLIE()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_00");	//��� �������, ��� �� �� ��� �������� ���.
	AI_Output(self,other,"DIA_Vatras_Add_05_01");	//���� �� ����������, ��� � �������� ����-������ � ���, ��� �� ��������� ���, �� ������� ��� ������� ����.
	AI_Output(self,other,"DIA_Vatras_Add_05_02");	//� �������� ������� ��� �������, ������� �������� ���, ��� ���� �����������.
	if(Wld_IsTime(5,5,20,10))
	{
		AI_Output(other,self,"DIA_Vatras_Add_15_03");	//� ��� ������ �����, ������� �����?
		AI_Output(self,other,"DIA_Vatras_Add_05_04");	//��� �������� ������ �������� ����, ��� � ���������� ��. ��� ��� �� ����������.
	};
	AI_Output(self,other,"DIA_Vatras_Add_05_05");	//������ � ������. ��� ��� �� ���������?
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	B_Vatras_REPEAT();
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		B_Vatras_ReadyToJoin();
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		B_Vatras_PLEASEDONTLIE();
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"���� �� �������������, ���������� �������� �����, ������� ���������.",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"����� ���������� ������� ����!",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	B_Vatras_First_Truth();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"��, � ���-�� ������ �� ����...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	B_Vatras_First_Lie();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"��, � ���-�� ������ �� ����...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	B_Vatras_Second_Truth();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"� �������� ����������� � ���...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"� ������ ����������� ������� ��������.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	B_Vatras_Second_Lie();
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"� �������� ����������� � ���...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"� ������ ����������� ������� ��������.",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	B_Vatras_Third_Truth();
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	B_Vatras_Third_Lie();
	B_Vatras_INFLUENCE_REPEAT();
};

instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "��� � ������ ������?";
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//��� � ������ ������?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//�� ������ ��������, ����� ��������������� ������ �� ����, ������� � ���� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//�� �� ��������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//���� ������ �������������� � ��������, �� ������ ��������, ��� ����� ����������� ��� ���� �� ���.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//��� ��� ������?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//����� ���, ��� ����� ���� ������� � ���� ����, �� ������ ��������� �� ����� ������ ������� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//� ������ ����� ����� �� ������, ����� �� �������� ��� ������� ���� �� ���������� ������� ��� �� ���� �������.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"� ��� �� ��� ����� �������, ����� ������� ����?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"� ��������� ������ �����. ������� ������ ���.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"� ��������� �������. ��� �������, ��� ���������� ������� ������.",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//� ��������� �������. ��� �������, ��� ���������� ������� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//� ��������� ����� � ������ ����� ����������� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//������� ������� ��� ����������� �����, �������� �������� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//� �� ������, ����� ��� ���� ��������� ����� ���������, ���� � ����� ������ ��� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//���� ��� ������� �������, �� ��� ������� ������ ������ �� ���� ���� �����.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//� ��������� ������ �����. ������� ������ ���.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//���� ���� ��� ������������� ���� ������...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//������� ������� � ������ �������� ����� �������� ������������ �� ������ ����� ����, �� � ������ �����������.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//����������� �� ���� ������ ����� � ������������ ��������, ������� �������� ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//������� ��� ��������� �������� ���������� ������ �� ��������� ������. ������ ����������� ���������� ����� �� ������� ������ � ��������� ������� ����� � ����������.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//� ��� �� ��� ����� �������, ����� ������� ����?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//������� ���������� � ������� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//����� �����, ��������� ��� �����, ������������� � ������ �������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//���� ������� ��������� ��� ������� �� ������������, �� ������� ��������� ����� ����� ���.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	if(!Npc_KnowsInfo(other,DIA_Addon_Lares_WannaBeRanger))
	{
		Log_AddEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	};
	B_LogEntry(TOPIC_Addon_RingOfWater,"������ ������ ���� � ������ ���� ������ � ��� ������, ���� � ����� ��������� �����.");
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
		SC_HearedAboutMissingPeople = TRUE;
	};
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//������...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//��� ���?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... ������� �� ������ ��������� ��������� ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//��� ���� �������������� ��������!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//�������� � ������ �������.
	Player_KnowsLordHagen = TRUE;
	Log_AddEntry(TOPIC_Addon_RingOfWater,"������ �����, ����� � ������� ����� ������ ������ ���������.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "�� ���� ����� �� ������ ���� ���������!";
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && ((other.guild == GIL_NONE) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//�� ���� ����� �� ������ ���� ���������!
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//�������� � ���������, �� �������� ���, ��� ���� ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//���, ������, ������ �� �����������. ��� �������, ��� ������� �� ������� ������ ������������ ��������.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//� ������ ���� �����.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//�� ������� ���� �������� ��������� ��� ����� ������.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//�� ������ ���������� � �������, ��� � �������. �� ������� ����.
		B_LogEntry(TOPIC_Addon_RingOfWater,"����� ����������� � ������ �������, � ������ �������� � ���� �� ����������� ��������� ��������.");
		Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
		Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"��� � �������.",DIA_Addon_Vatras_GuildBypass_BACK);
		Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"� ����� ���������� � ������ ��������?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
	};
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//��� � �������.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//� ����� ���������� � ������ ��������?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//���� ������ ��� ����������, ������� �������� ����������� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//� ������: ��������� ���������, ��������� ����� ���� � ����� ��������� �� ����� ��������������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//����� �� �����, ��� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//����� ������� ���� ������� ��� ��������� �������. �������� � ���.
	B_LogEntry(TOPIC_Addon_RingOfWater,"� ���� �������������� � ���������� ���������, ����� ���� � ��������� ��� ���������, ������� �� ����� �������� ��������������.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"��� � �������.",DIA_Addon_Vatras_GuildBypass_BACK);
};


instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "� ����� �������� � �������� ������ ����!";
};


func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (SC_IsRanger == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//� ����� �������� � �������� ������ ����!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//������, �� �������� ��������� ����� ������?
	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//��.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//�� �� �������� ���� � ������ ��������, ����� � ����� ��� �������������� ����� ����!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//���� ������, ��� ������ ������.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//��� ���� �����, ����� �� ������� ���������. ������ ��� ������, ����������� ������ ��� ����� ����� �������������.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//���� �� �������������...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//������.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//�� �������, ��� ����� ���. �� ������� ����� �� ��� � ������ ������� �� ����� �������.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//� ������ ���� ��� ������. ����� ��� ������� ���� ����� ����� ��������� � ������ � ���� ������� ������ ��� � ���� ����.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//�� ������ ��� ���� ����� ���. � ����� ��� ����� �����.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//�� ������ ���� ������. � ������ ��� � ����������� �� ������ ��������.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//��� ����� ����� ���� � ������� '������� ������'. ������ ������ ������� ���� � ���� ��������.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//�� ��������� ������ ��� �������. ��� ��������� �� ���� � ����� �����.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//�� ������ ������ ������, ����� ������ ������ ����.
		B_LogEntry(TOPIC_Addon_RingOfWater,"� ���� ������ ������ ����. ��� ����� ������ ���� ���� � ������� '������� ������'.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//���. ���� ���.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//� ����� ������ �������. ����������� � ����. ��� ��������� ����� ������!
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "������ ������ ������� ���� � ����.";
};


func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if(Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//������ ������ ������� ���� � ����.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//������! � ���� ����!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//� �������� ���� ����� ������, ����� �� ������������� � ��������� ����� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//�� ������ ��������� ������� ������� ������ ������ � ������, � ����� ����� �� �������� ������� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//� �� ��������� ����� � ���������� ����������� � ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//������� ��� ������ ��������. ������ �� ����� ������ ���� �������.
	if((MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//����� ������� ���� � ����, ���� �� ��� �� ������� ��������.
	};
	CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//�� �������� � ����� ������.
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_LogEntries(TOPIC_Addon_Sklaven,"� ������ ������, � ����� ����� ����� �������� ������� ��������.");
	B_LogNextEntry(TOPIC_Addon_KDW,"������ ��� ��� ������ ��� ��������. � ������ �������������� � ����� ���� � ������ ����� ������ � ����������� ����� ��������, ����� ����� ������� ������� ������ ������.");
	SC_KnowsPortal = TRUE;
	RangerMeetingRunning = LOG_SUCCESS;
	B_SchlussMitRangerMeeting();
	B_GivePlayerXP(XP_AmbientKap3);
};


var int MISSINGPEOPLEINFO[9];
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = "������ �����, ��������� ��� �����...";
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if(MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//������ �����, ��������� ��� �����...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//��?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"������� ���������� ���� ��, ��� � ����...",DIA_Addon_Vatras_MissingPeople_Report);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"� ����, ��� ��������� ��������� ����.",DIA_Addon_Vatras_MissingPeople_Success);
	};
	if((DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"��� ��� �� ������?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//����������� ����� ������� � ������. ���� ������� �������� ���� ������ ������ ���.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"����������� �� ����� ������� � ������������ �����. ����� ����� ������ ������ ������ ���.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//������� ���������� ���� ��, ��� � ����...
	if(((MIS_Akil_BringMissPeopleBack != FALSE) || (MIS_Bengar_BringMissPeopleBack != FALSE)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//������� ���� �������� ����� �������.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//� �����, ��� ��������������� �� ��� ������������ ����� �� ��������.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//������, ������ ������� �������, ��������� ���, ��� ������� ������� ���������� ����� �� ����.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//� ���� ���-�� ������� ������. � ���� �� �� ����� ����� �� ���� � ���� �����������.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//� ���� ������� �� ��������.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//������� ��������� ������� �� ����� �����.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if(((MIS_LuciasLetter == LOG_Running) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//�����, �������, ���������� ���������, ������ �������������� � ���.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//�� ���� ���������, ��� �������������� � ��� �� ������ ����.
		};
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//������� �������� ����� �������. �� ����� ��������������� �� ��� ��� ���������.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//� ������������ � ��������� �� �������. ����� �� ������� �� �������� ����� ������.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//�� ��������� ������ ����. ���� ���������.
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//��� �������, �� �� ������ ����. ���������.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//��� �� �����?
		DIA_Common_NothingImportantYet();
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//� ����, ��� ��������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//��� �� �����?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//������� �� �������� ����� ������� �� � ��������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//������ �� ��� ������ � ����?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//� ����� ��� �������. �� ���� �������� ������� �������.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//���.
		B_GiveInvItems(other,self,ItWr_RavensKidnapperMission_Addon,1);
		B_ReadFakeItem(self,other,Fakescroll,1);
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//�������� ������. � ������, ��� �� ������� �� ������ ������ �� ��� �������.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	Vatras_MissingPeopleReports = 0;
	if(((MIS_Akil_BringMissPeopleBack != FALSE) || (MIS_Bengar_BringMissPeopleBack != FALSE)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if(((MIS_LuciasLetter == LOG_Running) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		Vatras_MissingPeopleReports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
	XP_Vatras_MissingPeopleReports += XP_Addon_Vatras_WhereAreMissingPeople;
	B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "��������� ���� ��������� � ���� ����.";
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//��������� ���� ��������� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//������� ������, ��� ���.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//�� �� ������ ���������� ���� ����. �� ����������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(�������) ������, ���������� ����� �����. ������ ��� ���� � ����� ��� ���� ������������� ����� ����������.
	B_RaiseAttributeByPermBonus(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("LEVELUP");
};


instance DIA_Addon_Vatras_Waffen(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = "������ ����� �������� �������...";
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//������ ����� �������� �������...
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"� ���� ��������, ������� ������� ������ ��������!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"��� ����� �� ������ ��� ����� ��������?",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//��� ����� �� ������ ��� ����� ��������?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//������ �������, ���������� ���������. �� ������ ���������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//�� ������ ������� �������� ������� �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//�� ������� ������� � �������� ������. ����� ������� ���� ������ � ��������� ���������, �� ����: ������ ����������.
	if(Vatras_ToMartin == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"��������� ��������� ������ ����� ���������� ��������� � ����������� ������. � ���� ����� ��� � ������, ��� �������� ������ ���� ������.");
	};
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//� ���� ��������, ������� ������� ������ ��������!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//��� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//�������. ������ ���������� ����������� ����, ����� ���������� ���?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//��. ������ ��������� �� ���, ����� �� ������� ����� �� ������.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//������� ������, ��� ���.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(� ��������) � ������ �� ������� ���� � ������ ����?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(���������) �� �� �� ���� ��������������, � �� ��� ������.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//�� ������� ���� ���� ������.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//���� ���.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//����� ������� � ��� ����� ������ ����������� � ����. ��� ���������� ���������� ���������� ����������.
		Vatras_ToMartin = TRUE;
	};
};


instance DIA_Addon_Vatras_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_WISP_Condition;
	information = DIA_Addon_Vatras_WISP_Info;
	description = "�� ������ ������ ��� � ���� �������?";
};


func int DIA_Addon_Vatras_WISP_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader != FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WISP_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//�� ������ ������ ��� � ���� �������?
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//�� ����� ����������� �����. �� � ������������� ���� ���-��� ���� ����, ����� ��������� ���� ������.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//� ��� ���� ���� ������. ���� �� ����������.
	CreateInvItems(self,ItAm_Addon_WispDetector,1);
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//��� ������ ������� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//����� ������ ����. ������ ������, ������� ����� � ���� �������, �������� ������� ����������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//�� ����� �������� ���� ������ ��������, ������� ��� ���� �� ��� �� � �� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//����� ������� �������, ������ ������ ������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//���� ������ �������� ���� ���� ��� ����������, ����� ������ � ������ ��� �����, � ������ ��������.
	B_LogEntries(TOPIC_Addon_Bandittrader,"������ ��� ��� ������ ������� ����������� �������, ������� ������� ��� � ������� �������� �������.");
	Log_CreateTopic(TOPIC_WispDetector,LOG_NOTE);
	B_LogNextEntry(TOPIC_WispDetector,LogText_Addon_WispLearned);
	Log_AddEntry(TOPIC_WispDetector,LogText_Addon_WispLearned_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//������ ������ ������� ���� ������ ������.
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (MIS_Vatras_FindTheBanditTrader == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//� ��� ������� �� ������� ������, ������ ������ ������ �������� � ��������.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//����� ���, � �� ������� �� �������� ����.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"�������! � ����������� ������������ ��.",DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"� ��� ��� ����� ������ ������ ������?",DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP,"������ ������ � �������?",DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;
};

func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//�������! � ����������� ������������ ��.
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
};

func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//� ��� ��� ����� ������ ������ ������?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//��� ���, ����� ������ ������? ������ ������, ���� ������ �� ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//��� �������, �������� �����, ��� ������� ��� �����. �� ���� �� ���, � � ������ ������ �� ������������ ������ � ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//��������, �� ������ ���������� ���� ������.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Bandittrader,"��� ���������� ������ ����� ������ �� ������ ������ �������� ���. ������� ��� ������ ������ �������� ����� ��� ���� ��������.");
	};
};

func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//������ ������ � �������?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//������ ������� - ��� ������������ ��������. ��� ��������� ������� �� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//��� ������� � ���������� ����� ����� ����. ��� ���� �� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//���� �� ��������, ��� �� ������� �� ������ � ���. ��� �������� ������ �����, � ������� ��� ���� ���� �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//������ ������� ���� �������� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//�� ����� �� ����� ������ ���� ���������� ���������. ���� ����� ��������� �� ��� ��������.
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "� ���� � ����� ���� �������� ��������. �� ��� �� �� ��� ���������� � ��� ���-������?";
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if(C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//� ���� � ����� ���� �������� ��������. �� ��� �� �� ��� ���������� � ��� ���-������?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//��� �������� ������� ��������, ������� �� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//���������� ��������� �������������� ����� ��������. � ��������� �� ��� ���������� ���������� �� ������� ������� �������.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//���� ���������� ������ ���. ������� ��� ���, ����� ������� �����.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//���� ����� ����� ��������� �������.
	if(TOPIC_End_Stoneplates == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	};
	if(Erol_AskedKDW == FALSE)
	{
		B_LogEntries(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
		if(CurrentLevel != DRAGONISLAND_ZEN)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogNextEntry(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
		}
		else
		{
			B_LogNextEntry(TOPIC_MyCrew,"������� ���������� �������� �������� ��������.");
		};
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	};
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "� ������ ���� ��� ��������...";
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Vatras_Stoneplate) || Npc_KnowsInfo(other,DIA_Addon_Vatras_DI_Stoneplate)) && Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);
	TotalStoneplatesForVatras += anzahl;
	AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//� ������ ���� ��� ��������...
	if((TotalStoneplatesForVatras > 25) && (MIS_Addon_Erol_BanditStuff == LOG_Running) && (CurrentLevel != DRAGONISLAND_ZEN))
	{
		MIS_Addon_Erol_BanditStuff = LOG_FAILED;
		B_CheckLog();
	};
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//�������!
	if(anzahl >= 10)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//�� ��� � ������ ���� ���������� �����������!
		B_RaiseAttributeByPermBonus(other,ATR_MANA_MAX,anzahl);
	}
	else if(anzahl >= 5)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//���, ������ � ������� ��������� ���������� �������...
		if(!Npc_HasItems(other,ItRu_InstantFireball))
		{
			CreateInvItems(self,ItSc_InstantFireball,anzahl);
			B_GiveInvItems(self,other,ItSc_InstantFireball,anzahl);
		}
		else if(!Npc_HasItems(other,ItRu_Icelance))
		{
			CreateInvItems(self,ItSc_Icelance,anzahl);
			B_GiveInvItems(self,other,ItSc_Icelance,anzahl);
		}
		else
		{
			CreateInvItems(self,ItSc_SumSkel,anzahl);
			B_GiveInvItems(self,other,ItSc_SumSkel,anzahl);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//���, ������ � ������� ��������� �����...
		CreateInvItems(self,ItPo_Health_03,anzahl + 1);
		B_GiveInvItems(self,other,ItPo_Health_03,anzahl + 1);
	};
	B_RemoveEveryInvItem(self,ItWr_StonePlateCommon_Addon);
	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = "����� ������, ��� �� ������ ������ ��� ������� � ��������� ����� ����.";
};


func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if((RangerHelp_gildeKDF == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//����� ������, ��� �� ������ ������ ��� ������� � ��������� ����� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//��� ���� �����? ���� �� ���� ����?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//��. � ���� ����� ����� ����.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//��������� ��� ��������, ��� � �������� ��������� �����������. ��� ����� ���� ����� ��� ������?
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//��������� ����� ������� ��������� �������, ����� � �������� �� ����. �� ������� ���� � ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//����� ��������, ��� ��� ������� ����� �� ���� � ���������.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//� �� ����� �������� ���� � ���������. � ���-���� ��� ����, ������ ��. �� � ����� ������ ���� ���� ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//������� ����� ������� �� �������� �� �������� �������, ������� �������������.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//�� � ������, ��� ������ �� ���������� �� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//�� ��������� ��� � ���������, ������� � ���� ������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//��� ������ ����� ����� ������ ��� ����. ���� �� ������� ������� ���������, �� ����������� �������� ���� � ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//�����, ��� ���� ���� �� �������� � ���� ����, �� ��� ��� ������� �������������� � ���.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//����, �������, �������� ���� ����������.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
//	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
//	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"��� ���� ����� ������� ��� ������� � ���������, ���� � ����� ��� ���������� ���������.");
};


func void B_Vatras_Segen()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Blessing == FALSE))
	{
		B_LogEntry(TOPIC_Thorben,"��� ���� ������ ����������� ����.");
	};
	Vatras_Segen += 1;
	if((MadKillerCount > 0) && (VatrasMadKillerCount == 0) && (Vatras_Segen > 9))
	{
		MadKillerCount -= 1;
		Vatras_Segen = 0;
	};
	Snd_Play("LEVELUP");
	Vatras_Blessing = TRUE;
};

func void B_Vatras_NoMoreBlessing()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//� ��� ���� ��� ����� ������� ��� ������, �� ��, ��-��������, �� ������ �����. � �� ��� ���� ����� �������������.
	AI_StopProcessInfos(self);
};

func void B_Vatras_Blessing()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//������ � �������������� �������, ��� ���!
	B_GivePlayerXP(XP_VatrasTruth);
	B_Vatras_Segen();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
};

instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = TRUE;
	description = "� ����� ������ �������������.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (Vatras_Blessing == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//� ����� ������ �������������.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		B_Vatras_Blessing();
	}
	else if(Vatras_Chance == TRUE)
	{
		B_Vatras_NoMoreBlessing();
	}
	else 
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//������ � ������ ���� ���� ��� �������������, ���������?
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//� ���� ����� �������� ������ �� �������� � ������ ����� ������.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//� ���� ���� ���� �������������, ���������, �� � ������ �� ���� � ����. �������� ��� � ����.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//��� �� ������ �����?
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//��, �� ������ ���������� ���, ������ �� ������ � ����� �� ������ � ���� �����.
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//� ���� ������ ��������� ��� ����� ���������.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//��� �� ���������?
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"���� �� �������������, ���������� �������� �����, ������� ���������.",DIA_Vatras_BLESSING_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"����� ���������� ������� ����!",DIA_Vatras_BLESSING_FIRST_LIE);
	};
};


func void B_Vatras_BLESSING_REPEAT()
{
	B_Vatras_REPEAT();
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//��� �� ���� ��� ���� �������������?
		B_Vatras_Blessing();
	}
	else if(Vatras_Chance == FALSE)
	{
		B_Vatras_PLEASEDONTLIE();
		Vatras_Chance = TRUE;
		Info_ClearChoices(DIA_Vatras_INFLUENCE);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"���� �� �������������, ���������� �������� �����, ������� ���������.",DIA_Vatras_BLESSING_FIRST_TRUTH);
		Info_AddChoice(DIA_Vatras_INFLUENCE,"����� ���������� ������� ����!",DIA_Vatras_BLESSING_FIRST_LIE);
	}
	else
	{
		B_Vatras_NoMoreBlessing();
	};
};

func void DIA_Vatras_BLESSING_FIRST_TRUTH()
{
	B_Vatras_First_Truth();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"��, � ���-�� ������ �� ����...",DIA_Vatras_BLESSING_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.",DIA_Vatras_BLESSING_SECOND_TRUTH);
};

func void DIA_Vatras_BLESSING_FIRST_LIE()
{
	B_Vatras_First_Lie();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"��, � ���-�� ������ �� ����...",DIA_Vatras_BLESSING_SECOND_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.",DIA_Vatras_BLESSING_SECOND_TRUTH);
};

func void DIA_Vatras_BLESSING_SECOND_TRUTH()
{
	B_Vatras_Second_Truth();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"� �������� ����������� � ���...",DIA_Vatras_BLESSING_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"� ������ ����������� ������� ��������.",DIA_Vatras_BLESSING_THIRD_TRUTH);
};

func void DIA_Vatras_BLESSING_SECOND_LIE()
{
	B_Vatras_Second_Lie();
	Info_ClearChoices(DIA_Vatras_INFLUENCE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"� �������� ����������� � ���...",DIA_Vatras_BLESSING_THIRD_LIE);
	Info_AddChoice(DIA_Vatras_INFLUENCE,"� ������ ����������� ������� ��������.",DIA_Vatras_BLESSING_THIRD_TRUTH);
};

func void DIA_Vatras_BLESSING_THIRD_TRUTH()
{
	B_Vatras_Third_Truth();
	B_Vatras_BLESSING_REPEAT();
};

func void DIA_Vatras_BLESSING_THIRD_LIE()
{
	B_Vatras_Third_Lie();
	B_Vatras_BLESSING_REPEAT();
};

instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ������?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Blessing == TRUE) && (Vatras_SentToDaron == FALSE) && !C_GotAnyInnosBlessing() && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//��� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//�������� �������� ��� �� �������� �������. �� ������� ��� ������������� ���������.
};


var int Vatras_Spende;
var int Vatras_Spende_Day;
var int Vatras_Spende_Day_First;

instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "� ���� ������� ������������� �������!";
};


func int DIA_Vatras_Spende_Condition()
{
	if(((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE)) || (Vatras_Chance == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_Spende_Info()
{
	if((Vatras_Spende_Day_First == TRUE) && (Vatras_Spende_Day < Wld_GetDay()))
	{
		Vatras_Spende = 0;
	};
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//� ���� ������� ������������� �������!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//������������� ������ ������� ������ ����� ������, ������� �� ��� ���������, ��� ���.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//������� �� ������ ������������?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"��� ������ ����� ����������...",DIA_Vatras_Spende_BACK);
	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"� ���� ���� 50 ������� �����...",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"� ���� ���� 100 ������� �����...",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//��� ������ ����� ����������...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//��� �� ��������, �� ������ �������� ���� ������ ��������� �����, ��� ���.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void B_Vatras_Spende_Check()
{
	if(Vatras_Spende < 100)
	{
		AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//� ��������� ���� �� ����� �������, ��� ���. ���� ������ ����� ������� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//� ������������ ���� �� ����� ������� �� ���� ������������ ���!
		AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//�� ����� ����, �� �������� �� �����, ������������ ��������!
		B_Vatras_Segen();
		Vatras_Spende = 0;
	};
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//� ���� ���� 50 ������� �����...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	if(Vatras_Spende_Day == 0)
	{
		Vatras_Spende += 50;
		Vatras_Spende_Day_First = TRUE;
	}
	else if(Vatras_Spende_Day >= Wld_GetDay())
	{
		Vatras_Spende += 50;
	};
	Vatras_Spende_Day = B_GetDayPlus();
	B_Vatras_Spende_Check();
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//� ���� ���� 100 ������� �����...
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Vatras_Spende += 100;
	B_Vatras_Spende_Check();
};


instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������ �� ������� �����?";
};


func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//�� ������ ������� ���� ����-������ �� ������� �����?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//������ ��������� ������ � ��������� ������� ��������� ������������ ������ ���.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//�� ������� �������� ����� ����� ������������ ������ ��� ������ �������.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//� ���� �������� ����, ��� ���������� � ��������� ���� ���������� �����������.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"��� ���� ������ ����� ������ ��� �������� ��� ���������� �����������.");
};


var int Vatras_TeachMANA_NoPerm;

func void B_BuildLearnDialog_Vatras()
{
	if(RealAttributeValue(ATR_MANA_MAX) >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//���� ���������� ������� ����� ������� ������, ����� � ��� ��� �������� ��.
		Vatras_TeachMANA_NoPerm = TRUE;
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_Teach);
		Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
		Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(ATR_MANA_MAX,1)),DIA_Vatras_Teach_1);
		Info_AddChoice(DIA_Vatras_Teach,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(ATR_MANA_MAX,5)),DIA_Vatras_Teach_5);
	};
};

instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int DIA_Vatras_Teach_Condition()
{
	if((Vatras_TeachMANA == TRUE) && (Vatras_TeachMANA_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//� ���� �������� ��� ���������� �����������.
	B_BuildLearnDialog_Vatras();
};

func void DIA_Vatras_Teach_BACK()
{
	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		B_BuildLearnDialog_Vatras();
	};
};

func void DIA_Vatras_Teach_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		B_BuildLearnDialog_Vatras();
	};
};

instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "�������� ��� � �����.";
};


func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//��� ������ �� ������ �����?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//�������� ��� �� ������.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//������. (�����������) ����� - ������ � ���������� �� �����. �� ������ ������ � ���.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//�� ���������� ������ � ����� - ��� ����� ������������. �� ���� ����� � ����������.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//��� ����� - ���� ����, � �������� - ��� �����.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//�������� ��� �� �������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//������ - ��� ������. �� - ���� ����������, ����� ���������� ����� ������� � ��������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//�� ���������� ����� ���������. ��� ��� - ���� �� ���� �������, ����� � ������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//��� ����� - ���� ����. � ���� ����� � ���� �������.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//�������� ��� � �������.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//������ - ��� ������ ��� ������, ���������� � ����� ���������������.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//�� ����� ������ ����� � �������, �� ������ ����� �� ������ ������� ����� ����� �����.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//������ �������� ���� ������� ���� �������, ������ �� ������ �������� ���� ����� ������.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� ������.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� �� �������.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"�������� ��� � �������.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "�� ������ �������� ����?";
};


func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//�� ������ �������� ����?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(������������) ������, ���������� ��� ����. �������� ��� �� ��� � ������ � ���� ���� ����� �����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_PrintScreen(PRINT_FullyHealed,-1,-1,FONT_Screen,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//������ �� �� ���������� � ����� ���������.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2) && !Npc_IsDead(Isgaroth) && Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//� ���� ���� ��������� ��� ������� ��������. �� �������� ������� ����� ����������.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//���� �� ��������� ��� ������� ��� ����, �� ������ ������� ��������������.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"���� ���!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"� ������ ���.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//������. ��� ��� �� � ������� ��������.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//� ������ ���.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//������, ����� ������� ��� ��������� � ������ ���� �� ���� ������� � ������������.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//� ����� �� ��������� ���������, � ���������� ���� ��������������� �������.
	B_GiveInvItems(self,other,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"������ ��� ��� ������� ��� ������� ��������. �� ��������� � ������� ���������� �� ���������.");
	Info_ClearChoices(DIA_Vatras_MISSION);
/*	Info_AddChoice(DIA_Vatras_MISSION,"� ������ ���������� �����.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"� ������� �������� ����������.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"��� ��� '������� ������'.",DIA_Vatras_MISSION_ICE);*/
	Info_AddChoice(DIA_Vatras_MISSION,"(������� ������ �����)",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"(������� ������ ������� ������ �������)",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"(������� ������ ������� ������)",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//���� ���!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//��� �������. � �������� ����-������ �������.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//� ������� �������� ����������.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//��� ��� '������� ������'.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//� ������ ���������� �����.
	B_SayVatrasGo();
	B_GiveInvItems(self,other,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "� �������� ���� ���������.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//� �������� ���� ���������.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//����� ��� �������������. � ���� �������.
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(������� ������� ������)",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(������� ������ ����������)",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"(������� ����� ����)",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00_Plant_add");	//� ������ ������� ������.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//� ������ ������.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00_Ore_add");	//� ������ ����� ����.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//���������� ����, ����! � ����� � ������ �����.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//��� �� ������ ����� �������. � ����� � �������, � �������� ��� ��������� ���� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//� �� ����, ������� �� �. ���� �� �� ������ ����� ���������, �������� ��� ������� � ��������.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//�� �������� � ���� ������!
		Vatras_Listeners_ReadyToGo = TRUE;
		B_TurnToNpc(self,other);
	};
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = "� ���� ��������� � ����� � ������ ������. � ����� ��������� � ������.";
};


func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == FALSE))
	{
		if((RavenIsDead == FALSE) && (AddonDisabled == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//� ���� ��������� � ����� � ������ ������. � ����� ��������� � ������.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//� ��-�� ����� �������� ��� �������� �������� �����?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//� �� ����, ��������.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//� ��� ����� ���� ���, ����� ���� �������. ��������� ���� ���� ������ ���� ��� ��������� � �������.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//���� �� �������� ���, ����� ���� �� ���� �� ��� ������ ����, � ����� ������ ����.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"������ �� ����� ������ ��� ������ �������� � '������ ������' ���� �� �������� ��� ������ ���� ����, �������� �������� ��� � ������.");
};


instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "� ����� ���� �����.";
};


func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if(RavenIsDead == TRUE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
		{
			DIA_Addon_Vatras_AddonSolved.description = "� ����� ���� �����.";
		}
		else
		{
			DIA_Addon_Vatras_AddonSolved.description = "� ��������.";
		};
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//� ����� ���� �����.
	}
	else
	{
		DIA_Common_ImBack();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//��� ������� ���� � ��������� � ������-��������� �����?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//���������. ����� �����, ������ ���������.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//��� ����� ������� �������. ����� ���������, ��� ������ ��������� ������ �� ��������.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//������ � ���� ������ ����.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//�������, ���� �������� ����� ������, �� ��� ��?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "���� ������ ���������.";
};


func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3))
	{
		if((VatrasCanLeaveTown_Kap3 == TRUE) || (AddonDisabled == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	DIA_Common_InnosEyeBroken();
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//���� ������� �������.
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//���� ������� �������.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//� ����. � ��� ����� �� ���� �� ������ ����� ����������� ����������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//������ ������������ ���� ������ ����� ����, ����� ���������� ����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//� �� ������ ��� ����������� ����� �����.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"� ���� ������ ������� ���������������� ������.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"������ ������� ������ ���� ������ � ����?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"��� ������ ����� � ������?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//��� ������ ����� � ������?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//�� ������ ������������ ���. �� ���, �����, ����� ��������� �������.
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis))
	{
		if(MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//������ ������� �� ��� �����. �������� ������ ������ ���� �������� �������� ��.
			AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//�� �������� �� � ����. ���� ������ ������� ����������� ������.
		};
		AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//�� ����� � �����������. ����, ������, ������ ����, ��� �������� ���.
		if(!Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye))
		{
			Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"��� ��� ����� �������, ���������� �������� ������ �����?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
		};
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"��� ����� ������������ ���� �����?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
	}
	else
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"� ��� ��� ������ ������?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis))
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//��� ����� ������������ ���� �����?
	}
	else
	{
		AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//� ��� ��� ������ ������?
	};
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//� ���� ������ ���� ������. ���� ���� �������� ������� ������ ���� �������� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//������ �������������� ������ ��������� � ����� ����������� ����� ������ ��� ��� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//������ �������� ������� � ���, ��� �� ������ �������� � ��� ����� ������ �������������� ������� �� ���� ����� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//����� ����, ��� ����� ������� ���������� ����� �������� �����. � �����, ���������� �� ����� ���� ��������.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"��� ����� ���� ����� ����� ������� ��������������� �����?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"��� ��� ����� �������� �����?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//��� ��� ����� �������� �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//� ������ � ������ ������� �������, ������� � ����. ����������������, ��� ������� ����� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//�� ����� �� ������ �������� ������� � ������� ������.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//��� ����� ���� ����� ����� ������� ��������������� �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//� ���� ������������ ���� ������� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//�������, ������ ��� ����, ��� �� ���������� ������������ �� ������������� ���� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//�� ��� ������� ��� �� �������� � ������ ���������� ��������. ��� ������ ���� ���-��, ��� ������� ������ ������.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"������ ������? � ��� ������ ��������?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//������ ������? � ��� ������ ��������?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//�����. ��� ����� ���������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//�� � ����� ���� ������ - ��� �� ��������� ��� ����� � ���� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//����������� ��������� ���� ��������, ����� �� �������, ��� ������ �������� ���� �� ���� � ���������.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"� ������ ����.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//��� ��� ����� �������, ���������� �������� ������ �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//����������� ������ � ���, ��� ����� ������������� �������������.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//������ ������� ������ ���� ������ � ����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//� ����������, ��� ���� ��� ������ ���-�� �������� ������ ���� ���������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//������� ������ ������ ���� ����� ���������� � ���������������, ��� ��� ����� ��������� � ������������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//���, ��� ���� ���������������� �� ������ ����� ���� ���� ����������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//� ������ �����, ��� �� �������������� ���������� �� �����������, ������� ������ ������� ���.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//���������� ������, ��� ����� �� ���������, ���� �� � ������ ��� ����������.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//� ���� ������ ������� ���������������� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//���, �������, ������, �� ���� ���� �� ����� �����.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//� ������ ����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//� ���� ������ ������������ � ����, ����� ����������� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//����� �������� � �������� ����. � �� ������ �������� �������� �����. � ��������� �� ����.
	B_LogEntry(TOPIC_INNOSEYE,"������ ����� �������� ������ � ����� ������, ����� ������������ ����. � ������ ������� �������� � �������� ������� � ��� �������. �����, � ������ ����� �������, ������� ����� �������� ������������ ������ �������.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	B_Vatras_GeheWeg(kurz);
	if(!Npc_IsDead(DMT_1202))
	{
		DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1202,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1204))
	{
		DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1204,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1206))
	{
		DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1206,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1207))
	{
		DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1207,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1209))
	{
		DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1209,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1210))
	{
		DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1210,"AfterRitual");
	};
	if(!Npc_IsDead(DMT_1211))
	{
		DMT_1211.aivar[AIV_EnemyOverride] = TRUE;
		B_StartOtherRoutine(DMT_1211,"AfterRitual");
	};
};


instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "��� ������� ���� � ������ ������?";
};


func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//��� ������� ���� � ������ ������?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//�����: ������ ������ ��������� � ����� ������ ������ � ��������� � ��������� ����������� ����.
	if(RitualInnosEyeRuns != LOG_Running)
	{
		AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//� �� ������ �������� ���� � ����������������� �������.
	};
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "� ������ ���, ��� �� ������ ���. ��� ���������� ����.";
};


func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//� ������ ���, ��� �� ������ ���. ��� ���������� ����.
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//��, ������ ��� ������ ��� ���������� �������.
	if(Npc_HasItems(other,ItPl_SwampHerb) >= 3)
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//��� ������ �������� �����?
		B_GivePlayerXP(XP_RitualInnosEyeRuns + XP_AmbientKap3);
	}
	else
	{
		B_GivePlayerXP(XP_RitualInnosEyeRuns);
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//��, ��. �� ������ ��� ������ �������� �����?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//��. ��. ��� ��� ��������.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//�����������.
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//���, ���� ���, ���!
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//������. ����� ��� �������� �������� ��� ���.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//�� ������ ���������, �� ������ ������ � �������, ����� �� ����� ������ ���������. �� ����������� ���� ����!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};


func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && !Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//�� ���������. ��� ������� ��������� ���� ����� � ������������ ����.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//����� ������� �������� ����, ��� ������������ ��� �����.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//�������, � ��� ����� ����, ����� �� ��������� ���� ������. ������.
	B_LogEntry(TOPIC_INNOSEYE,"���� ��� ������������. ������� ������ ��� ���, � ���������� ����� �� ��������.");
	AI_StopProcessInfos(self);
	Vatras_Listeners_ReadyToGo = TRUE;
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_Vatras_ListenersControl();
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "�������, ��� ����� ������������ ���� ������.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//�������, ��� ����� ������������ ���� ������.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//������ ������ ����� �������������. ����� ������� ��� ���� ���� �������.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//�������� � ���������, �� �������� ���, ��� ���� ����� �����.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//������� ������� ���� ����� ����� � ����������, ��� ���.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "���� �������, ������, ������.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//���� �������, ������, ������.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//���? �����? ��� ������ ������� ������ ������ ���������� � ����.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//��� ���� ������� ����, � �� � ���� ������ �� �����. ������, � ��� �� ���������, ������� �������� ���������.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//��, ������, ��� ��� ����� �� �����, �� ��� �� ������� �� ���.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "� ������ ���������� �������.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//� ������ ���������� �������.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//��, � ��������� �� ������. �� ������� ����� ����������� ����������� ������� ������� ������.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//���, ��� � ���� - ��� �������� ���� ����, �� ������ ��������� ����� �������� ���� ����. �������� � ���������. �� ������� ����.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "������� ������ �� ����� ����� ����.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//������� ������ �� ����� ����� ����.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//� ����, ��� �� ��������� � ������ �������. ������ ����� ������� ��������� ��� ���� ���� �������.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//� ����.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//����� ����� ���� ���������� ������� � ������� �� ���, ���� ���� ����� ������. � ������ ���� � ����� ���� ������, �������? ������ ������������� ����.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ����, ��� ��������� ��� ����.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//� ����, ��� ��������� ��� ����.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//����� �� ����� ������ ������� � ������ ��� � ��� ������, ���� �� ��� �� ������ � ���.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//�� ������ ������������ ����?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//� ����� ����� �� ����. ��, � ������� �� ��� ��� ������ � ����� ������, ��� ����.
	if(SCToldVatrasHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"��� ��� �� �������, ������ ��������� ��� ������������ ���� � ���� �����������. �������, ���������� ��� �������� � ������, ����� ��������� ����� �������� ��� ����.");
		SCToldVatrasHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//� ���� ������ � ��� ��� ������� ����� ������. �����, ��� �� �������� ����� ��� ����.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//��� �������� �����. � ���� �����������.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"��� ����� ��� �������� �� ����.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"� ����� �� �����, ��� �� ������ �� ���� �������. ���������� � ������.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//� ����� �� �����, ��� �� ������ �� ���� �������. ���������� � ������.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//������ �� ����� ����� ����������. �����, ���� ���, ���� �� �������.
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
	Info_AddChoice(DIA_Vatras_KnowWhereEnemy,Dialog_Ende,DIA_Vatras_JoinShip);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//��� ����� ��� �������� �� ����.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//��� ������. ����������� �� ���, ���� �����������.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

var int Vatras_JoinShip_Once;

func void DIA_Vatras_JoinShip()
{
	B_JoinShip(self);
	if(Vatras_JoinShip_Once == FALSE)
	{
		B_Vatras_ListenersControl();
		Vatras_JoinShip_Once = TRUE;
	};
};

instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "���� ����� �������� �����. �� ����� ������.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//���� ����� �������� �����. �� ����� ������.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//��������, �� ����. � ��� �� � ����� ������������ ����, ���� �� ����� ��������. �� ������ ���.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "�������� ������ �� ��������� ������.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//�������� ������ �� ��������� ������.
	if(Vatras_WasOnBoard == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//������ �������. �������, �� ������ ��� �� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//������ �� ����� ����� ����������. �����, ���� ���, ���� �� �������.
	};
	B_Vatras_GeheWeg(lang);
	if(Vatras_JoinShip_Once == FALSE)
	{
		Info_ClearChoices(DIA_Vatras_StillNeedYou);
		Info_AddChoice(DIA_Vatras_StillNeedYou,Dialog_Ende,DIA_Vatras_JoinShip);
	}
	else
	{
		B_JoinShip(self);
	};
};


instance DIA_Addon_Vatras_PissOffForever(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PissOffForever_Condition;
	information = DIA_Addon_Vatras_PissOffForever_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Vatras_PissOffForever_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissOffForever_Info()
{
	B_VatrasPissedOff();
};

