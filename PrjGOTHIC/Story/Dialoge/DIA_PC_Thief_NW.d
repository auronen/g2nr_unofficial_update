
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 800;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Kapitel > 3))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//��� ����?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//�������. ������ ����� �� ������ ���, ��� ������� �� ��� ����� ��������� ���������?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//������� �� ����. � ���� ���� ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//�� �� ����� ��� ��������� ��� �����. �� �� ���� ������ �� ���������� � �������� ���������.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if(Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//��! �� ��������� ���, ����� ������ ��������!
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(�������) � �� �����, ��� ��� ������ �����, �����?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//� ����� �������� ����� ���������� ��� ��������. �� ��� ������, � ��� ��� ���.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//�����, ����� ������ - ��� ��, ��� ������ �� ��� �����.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//�� ������ ��� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//������, ��� �� �����. �� ������ ������ ���.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(!Npc_KnowsInfo(other,DIA_DiegoOW_Hallo))
	{
		Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��?",DIA_DiegoNW_NeedHelp_WhoAreYou);
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��� �� ���� �� ������?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �� ������� �����?",DIA_DiegoNW_NeedHelp_Plan);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//�� ���� ������ ������. ��� ������ ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//�� �����, ��� ��� ����� ����� ���������� �����.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//����, ��� ���, ��������, ��-�� ������. � ������ ������ ��������� �� ������� �� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//��� ������ � ����� ��� ������� � �������� �� �������. ������-��, �������, �� �������� ����? � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//� ������ ������� � ���� ���� �����, ��� ���������� ��� ���������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//�� �� �� ��� ��� ��� ������ ��� ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//��... � ��� ������ ��������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//���� ������! �� ������������� ������ �� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//��������, � ���� ������������� ��� ������� ��������� ��� ���� ������. �������� ������ ����: �� ���� ��������� �������� ��������, � � �� ��� ������ ���� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//� ������ ��� ����� ���� ������.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//��� ��� �� ���� �� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//� ����� �� � �������� �� �������. ������ �� ������ ���������� ���� � �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//����� �� ����� ������ ��������, ������ � ������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//��� ����� �����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//� ���� ��� �����. �� ���� ���� � ���� ���� ������ �����, � ��� ����� ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//� � ���� ������� ����� ���������� ����� ������.
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"����� �����?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//����� ������ ������������ � ��� ���, ��� � ������� ���. ��� ���-�� ����� ����� ������ �� ����.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//� ��� ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//� ������ ������� � ������� �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//�� � �� ��������� ����� ������, � � ���� ��� �����, ����� ��������� ������. ��� ����� ����� ��!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//�� ����, �� ������, ����� � ������� ���� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//����. � ���� ���� ������. � �� ������ ���� ����� ���� ������! ��, � ���������, ��� �� ��� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//�� ������ ������� ��� ������ ���, ��� ��� ���������.
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"� ���� ��� ������� �� ���.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� ��� � ����� �����?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"�����, � ������ ����.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//� ���� ��� ������� �� ���.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//��, � ����� �� ������! ��� ���� �, �� �������, ������ ���� �������, ����� ���� ������� � �������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//�� ���������������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//��?! � �� ��������� �� �������, ��� ����� �� ����, ���� �� � �� �������� ���� �����, ��� ����� ����� ���� � �������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//������ ������ ������� �� ���� �� �������, � �� �� ����� ������ ������� ���-������ � �����.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//��� ��� � ����� �����?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//� �����-������ ��������� ����, ��� �� ��� ���� ������? �� �� ������, ����� ����� ������������?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//�����, � ������ ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//���������. ������ �����������. ����� ������ ��� ��� �� �����, � ������� � ������ �������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//��� ���� �������� �����, � ������� ����� � ������ ������, � ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//� ������ ��� ����� ����� ��� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//���� �������, �� ������ ����� � ������ �������� � ������� ��� ������.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �� ����������� ������ � ���� �������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"������ � ���� ��� ������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"��� �������� ��� ������?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"������ �� �� �������� ��� ���?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//��� �� ����������� ������ � ���� �������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//� ���� ������ ����� � ����� �� ��������� � ������� ��������. � ����� ����� ����.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//� ����� � ���� ����� ������ ����� �������!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//������ � ���� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//� ���, ������������ ��� ��, ��� ���������� ������ ��� ���� � ������ ��������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//������� ��������� ������ ������ ���� ����� �������. ������ �� ������, ���� ��� �����-������ ������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//��� ���� ��� ������������� �� ����, ��� �� ������ ����� �� ������� ��������...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//��� �������� ��� ������?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//����� �� �������� �������. ��� ����������� ������. ��� � ������� ��������.
	if(Diego_Nostalgie == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//�������� ��� ������������. � � ��� �����, ��� �� ��������� ���� ����� �����.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//������ ������� ��� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_02");	//� ��������� ����� � ������� ���, �� ���������� ����� ����� ����� ��������� ����� �����.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//�� �������, ����� ��� ��� ��� ����� �������, ����� �� ������ ���� ���������.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//��� � ������� ���?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//�� ����� ������. ������� �����!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"� ��������� ����� ���� ������.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� ���-�� �� ������ �������� �������, ���, ��� ������ �������������� � ������� �� �������� ������, ���������� �� ����������� �����.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//� ��������� ����� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(����������) ������ ���. ����� ����� ���������� ��� ����.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_04");	//������ �� �� �������� ��� ���?
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_05");	//������ ��� ���, ��� ��� ��������, ��������� ����. �� ��� ������ ����� ��������� ��� ���� ������, ������ ���.
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "�����, � ��� �� ������ ����.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//�����, � ��� �� ������ ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//� ���� ���.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//����� �������� ����� � ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//������. � ������� ������ � ������ ��������, � �� ������ ������� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//� � ���� ����� ����� � ��� ���������� ��� ���������� ��������.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_Why();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"������ ����� ��������� � ������ ��������. ��� ����� ���, ����� ������� � ������� ����� ������, � �� �������� ���� ����� ��� ������.");
};


func void B_DiegoNW_DiegosRevenge()
{
	if(!Npc_IsDead(Gerbrandt))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//����� ������. ����� ��������� ������ ������ �� ������.
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
	MIS_HelpDiegoNW = LOG_SUCCESS;
	B_GivePlayerXP(XP_HelpDiegoNW);
};

instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "� ����� ���� ������!";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || Npc_HasItems(other,ItSe_DiegosTreasure_MIS)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//� ����� ���� ������!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//�������. ������.
	if(Npc_HasItems(other,ItSe_DiegosTreasure_MIS))
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_MIS,1);
		B_DiegoNW_DiegosRevenge();
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//�� ����� �� ���! �� ���, �� ��������� ���? ��� ����� ��� �����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//���� ��� ���� ���������, ������ ��������� ���������� � ��� ����.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//��� ���, ����������, ������� ��� �����. ��� ����� �����!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		B_DiegoNW_DiegosRevenge();
	};
	if(!Npc_IsDead(Gerbrandt) && (MIS_HelpDiegoNW == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//��������, � ��� ��� �� ����������� �� �������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//� ����, ����� �� ����� ��� ������ ����������. ��� ���� �� ��������� � ������� ��������.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//������� ��� ������ �� ����. � ����� ���������� ����� ����� ����������.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WAITFORDIEGO");
		MIS_DiegosResidence = LOG_Running;
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"����� ��� ��� ������ ��� �������� ����������.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "� �������� ���� ������.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if(MIS_DiegosResidence == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//� �������� ���� ������.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//����� ������. ��� ��������� ��������� ���?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//�� ��� � ���� � ����������� ����� ����-��.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(��������������) � ��� � �����.
	if(Diego_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//�����, ������, ��� � ������ ������� ��� �������� �������� ����������� ����� ������ ����. ���� � ��������� �����, ���� � ���������� ������ �������.
	};
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	if(GerbrandtMovedToHarbour == FALSE)
	{
		B_StartOtherRoutine(Gerbrandt,"NEWLIFE");
		GerbrandtMovedToHarbour = TRUE;
	};
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ������ ���� ����?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ������ ����������?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"��� ���� ������� ���������� ���?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	if(Diego_IsOnBoard != LOG_SUCCESS)
	{
		Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"������, ��� ������ ���� ���?",DIA_DiegoNW_DeliveredLetter_YourHouse);
	};
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//��� ������ ����������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//�� ����������� ����������� ������ ������� �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//�� ��� �����, ������� � �������, ����� � ������� ��������� �� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//������� �� ����, ���� �� ������ ������, �� �� ������ �� ��������� ��������� � �������� ����� - � ���������� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//���� �� ����� ���, �������� �������� � �������� ��������.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//������, ��� ������ ���� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//��, �� ������� �� �������! �� ���� �������!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//� ������� ��� ������ � ����������� �������� � ������ ������ � ���, ��� � ���� ����� � �������� ������� � ����������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//� �����, �� �������, � ���� ���� ������������ ������ � �������� ��� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//��, �� ������ �� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//�����.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//��� ���� ������� ���������� ���?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//�� �������, ��������� ��������� ���� ��������� �� ������� �������?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//�������, �� ������� �� ����� ����, ����� �������� �� ������� ���. � ���� ��� ����� ��� ��������.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//� �� ���� ������� ����� ����� ���� ����. ���������, � ����� ������, ����� ���������� �� ����. ��������, �� ��������, ��� � ���� ������� �����.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//�� ������� �� ������� ��� �� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//� �� ������� � �� ���������.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//��� ������ ���� ����?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//������, �� ������ �� ����� �� ����, ���� � ���� ����.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//�� �� ����, � ���� ������ �� �� ����� ��� ����� ������. ��� ���� ����.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 888;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if(Diego_Teach == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//�� ������ ������� ���� ����-������?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter) || (Diego_IsOnBoard == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//��, �������. ��� ��� �����, ����� ������ �����.
		if(DiegoOW_Teach == FALSE)
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"����� ����� ������ ��� �������� ��� �������� � ����.");
		};
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOW_Teach_11_01");	//������ �� ����� ��� �����. � ���� ���� ���� ��������.
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//������� ��� ����� ������ ���� ��������.
	};
};


var int DiegoNW_Merke_DEX;
var int DiegoNW_Merke_STR;

func void B_BuildLearnDialog_Diego_NW()
{
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(ATR_DEXTERITY,1)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(ATR_DEXTERITY,5)),DIA_DiegoNW_TeachDEX_5);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(ATR_STRENGTH,1)),DIA_DiegoNW_TeachSTR_1);
	Info_AddChoice(DIA_DiegoNW_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(ATR_STRENGTH,5)),DIA_DiegoNW_TeachSTR_5);
};

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 888;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if(Diego_Teach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//����� ����.
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//�������. ��� �� ������ �����?
	DiegoNW_Merke_DEX = ATR_Training[ATR_DEXTERITY];
	DiegoNW_Merke_STR = ATR_Training[ATR_STRENGTH];
	B_BuildLearnDialog_Diego_NW();
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < ATR_Training[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//�� ��� ���� ����� ������. ��� �������!
	};
	if(DiegoNW_Merke_STR < ATR_Training[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(����������) ����� ������. ���� ���� �����������.
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachDEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachSTR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void DIA_DiegoNW_TeachSTR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Diego_NW();
	};
};

func void B_DiegoNW_GoHomeAndChangeArmor()
{
	if(C_NpcIsNearWP(self,"NW_CITY_UPTOWN_PATH_23") && !ArmorEquipped(self,ITAR_Diego))
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//�������, � ���� ����� ����� ������.
		AI_SetWalkMode(self,NPC_RUN);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		if(!Npc_HasItems(self,ITAR_Diego))
		{
			CreateInvItems(self,ITAR_Diego,1);
		};
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,"NW_CITY_UPTOWN_PATH_23");
	};
};

instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ��������� �������� �������.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//� ��������� �������� �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//������ �������. � ��� �� �� ����� ����������� � �����. ���� ����� ��������� ������� ������ - �������, ����� ����� ����� ���� �����������, ��� � �������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//� ��� �� ������� ���� ����� ��������, ������������ ��������� � ��� �� �������� ���� ��������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//�����, � ������, ���� �� �������� ������� ���.
	if(SCToldDiegoHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"������� ��, ����� ����� ����� �� ����. ��� �������, ��� ��� ������ �� ������� �������, ��� �����. �� ��� �� ������� ����, ��� ����� ����� ������ � ������� �� ���� ��������� �������. ����� �� ����� ������� ���� ������������ ���������.");
		SCToldDiegoHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//� ������� ��� ����. �� ���� ��� ������� ��������� ��������������.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//�� ��������. � ��� ����� ������ �� ������.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"��������, � ��� ���� �����, ����� ������ �����.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"������ �� ���� �� ����������� � ���� �� ����? ���������� � ������.",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//������ �� ���� �� ����������� � ���� �� ����? ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//��-�, �� ����, � �������� ��� ����� ������ ������. � ������� � �����.
	B_DiegoNW_GoHomeAndChangeArmor();
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//��, � �����. ���������� � �������.
	B_JoinShip(self);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//��������, � ��� ���� �����, ����� ������ �����.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//��������. �, ��������, � ���� ������������ � ����. ��� �����?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "�� ������ ���������� � ������.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//�� ������ ���������� � ������.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//��? � ���� ������ �� �����? ��, �����. �� ������ ��������� �� ���, ����� ��������� � �����.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//�� �������, �� ��� ����������?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//� ������� �� ������ ��������� ������ ����, ����� �� ����� �� ����� ����� ����, ��� ������ ������� ����. ����� �� ����������� � ������ ���.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//�� ������� �� ������� ����. �� ����������� ���������� �����. ������ ����.
	if(!Npc_HasItems(self,ITAR_Vlk_H))
	{
		CreateInvItems(self,ITAR_Vlk_H,1);
	};
	if(!ArmorEquipped(self,ITAR_Vlk_H))
	{
		AI_EquipArmor(self,ITAR_Vlk_H);
	};
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	if(MIS_DiegosResidence == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"GERBRANDT");
	}
	else
	{
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "�����������. � ����, ����� �� ����������� ����.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Diego_WasOnBoard == TRUE)
		{
			DIA_DiegoNW_StillNeedYou.description = "�����������. � ����, ����� �� ����������� ����.";
		}
		else
		{
			DIA_DiegoNW_StillNeedYou.description = "��� �� �������� �� ���� ������.";
		};
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	if(Diego_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//�����������. � ����, ����� �� ����������� ����.
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//���� ���������� ���� �������������, ����? �������, � ������������ � ���� - �� ������ ���������� � ���, ��� ���� �����.
	}
	else
	{
		DIA_Common_INeedYourHelp();
	};
	B_DiegoNW_GoHomeAndChangeArmor();
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//�������, �� ����� ����.
	B_JoinShip(self);
};

