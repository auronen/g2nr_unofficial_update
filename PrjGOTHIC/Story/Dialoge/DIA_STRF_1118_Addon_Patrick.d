
instance DIA_Addon_Patrick_EXIT(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 999;
	condition = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_Hi(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent = FALSE;
	description = "���� ������� ���� ����. � ������, ����� ���������� ���.";
};


func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//���� ������� ���� ����. � ������, ����� ���������� ���.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//������? � ������ � ������ ���� ������?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//�� ������ ������ ��������� ��� ���?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//�������, ����, ��...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//���� ������ ������. ���� � ��� ���� �� ������, ������ ���������� ����� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//������, ������, � ���� ����.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//�������? ���� ��, ��� ��������� �������, ��� � �����. ������, � ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//������� ������ ����� ������� �����������. ������ ��� ���������. ������ �� �����...
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//�������� - � �������� ���������. ��� ��� ��������, �� �� ����� �� ���������.
	if(FoundDeadWilliam == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_MissingPeople,"������ ������ ���, ��� ���� �� ����� �� ����� ������ ����� ��� ������� �������.");
	};
	FoundDeadWilliam = TRUE;
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"��� �� ���� ��� �������������? � ������ ������� ������ ���������� ���?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"��� ����� �������� ���� �������� �� �������?",DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//��� ��� ����� � ��� ����.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//�� ������ ������� ���, ����� ��������� ���������� ���. ����� �� �����.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//�����, � ���������� �� ����. ����� ���������, ����� ��� ����������.
	B_LogEntry(TOPIC_Addon_Sklaven,"���� �� ��������� �� �����. � ������ ����� ������ ������ ������� �� �� ������.");
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//��� �� ���� ��� �������������? � ������ ������� ������ ���������� ���?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(����������) �������� �����.
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//��� ����� �������� ���� �������� �� �������?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(���������) ��. ��� ���� �� ��������!
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};


instance DIA_Addon_Patrick_ready(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent = FALSE;
	description = "��� ������. �� ������ ����.";
};


func int DIA_Addon_Patrick_ready_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		if(Ready_Togo == TRUE)
		{
			return TRUE;
		}
		else if(Npc_IsDead(PrisonGuard) && Npc_IsDead(Bloodwyn))
		{
			if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
			{
				return TRUE;
			}
			else if(Npc_IsDead(Thorus))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//��� ������. �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//�������! � ���� �� ������ ���� ������, ��� �� ����� ��������. �� ��� ��� ������ ������?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//����� �� ���-�����. ������� ������, �� ������� ��������� �������� �����. ��� �������� ������ ���� ����.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//��� ��������� ���, ��� ��������� �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//�������, ������� �������. �� ��� ����� ����� � �����...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//�� �� ���.
	Sklaven_Flucht = TRUE;
	B_GivePlayerXP(XP_Addon_Flucht);
	Info_ClearChoices(DIA_Addon_Patrick_ready);
	Info_AddChoice(DIA_Addon_Patrick_ready,Dialog_Ende,DIA_Addon_Patrick_ready_END);
};

func void DIA_Addon_Patrick_ready_END()
{
	var C_Npc Slave_1;
	var C_Npc Slave_2;
	var C_Npc Slave_3;
	var C_Npc Slave_4;
	var C_Npc Slave_5;
	var C_Npc Slave_6;
	var C_Npc Slave_7;
	var C_Npc Buddler_1;
	var C_Npc Buddler_2;
	var C_Npc Buddler_3;
	var C_Npc Buddler_4;
	Slave_1 = Hlp_GetNpc(STRF_1128_Addon_Sklave);
	Slave_2 = Hlp_GetNpc(STRF_1129_Addon_Sklave);
	Slave_3 = Hlp_GetNpc(STRF_1130_Addon_Sklave);
	Slave_4 = Hlp_GetNpc(STRF_1137_Addon_Sklave);
	Slave_5 = Hlp_GetNpc(STRF_1138_Addon_Sklave);
	Slave_6 = Hlp_GetNpc(STRF_1139_Addon_Sklave);
	Slave_7 = Hlp_GetNpc(STRF_1140_Addon_Sklave);
	Buddler_1 = Hlp_GetNpc(BDT_10027_Addon_Buddler);
	Buddler_2 = Hlp_GetNpc(BDT_10028_Addon_Buddler);
	Buddler_3 = Hlp_GetNpc(BDT_10029_Addon_Buddler);
	Buddler_4 = Hlp_GetNpc(BDT_10030_Addon_Buddler);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	B_StartOtherRoutine(Telbor,"FLUCHT");
	B_StartOtherRoutine(Tonak,"FLUCHT");
	B_StartOtherRoutine(Pardos,"FLUCHT");
	B_StartOtherRoutine(Monty,"FLUCHT");
	B_StartOtherRoutine(Slave_1,"FLUCHT");
	B_StartOtherRoutine(Slave_2,"FLUCHT");
	B_StartOtherRoutine(Slave_3,"FLUCHT");
	B_StartOtherRoutine(Slave_4,"FLUCHT");
	B_StartOtherRoutine(Slave_5,"FLUCHT");
	B_StartOtherRoutine(Slave_6,"FLUCHT");
	B_StartOtherRoutine(Slave_7,"FLUCHT");
	B_StartOtherRoutine(Buddler_1,"WORK");
	B_StartOtherRoutine(Buddler_2,"WORK");
	B_StartOtherRoutine(Buddler_3,"WORK");
	B_StartOtherRoutine(Buddler_4,"WORK");
};


instance DIA_Addon_Patrick_Killer(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent = FALSE;
	description = "� ���������� � ����������. �� ������ ����.";
};


func int DIA_Addon_Patrick_Killer_Condition()
{
	if(Npc_IsDead(PrisonGuard) && (Ready_Togo == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//� ���������� � ����������. �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//� ��� � ���� �����, ����� �� ������� �����? ���������� ��������� ��� ��������. ���, ��� ������� ����������.
};


instance DIA_Addon_Patrick_Hoehle(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent = TRUE;
	description = "�� �� ������ ���� ������?";
};


func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_05") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//�� �� ������ ���� ������?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//�������, �����. �� �� ���� ����������� �������.
};

