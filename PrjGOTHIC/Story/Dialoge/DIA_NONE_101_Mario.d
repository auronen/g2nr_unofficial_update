
instance DIA_None_101_Mario_EXIT(C_Info)
{
	npc = NONE_101_Mario;
	nr = 999;
	condition = DIA_None_101_Mario_EXIT_Condition;
	information = DIA_None_101_Mario_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_None_101_Mario_Job(C_Info)
{
	npc = NONE_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_Job_Condition;
	information = DIA_None_101_Mario_Job_Info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int DIA_None_101_Mario_Job_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && !Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//�������, ����� ������ �����-������ �������, � � ������� �� ����.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//��� ������� ��� ���� ��� ��������� ��� �� �����.
};


instance DIA_None_101_Mario_YouNeedMe(C_Info)
{
	npc = NONE_101_Mario;
	nr = 4;
	condition = DIA_None_101_Mario_YouNeedMe_Condition;
	information = DIA_None_101_Mario_YouNeedMe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//� ������, ��� �� ��������� ������� �� ���� �������?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//�?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//� �����!
	B_LogEntry(Topic_Crew,"����� ����� ��������� �� ���� � �������� �������. �� �������� ����� �� �������.");
};


instance DIA_None_101_Mario_WhyNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 5;
	condition = DIA_None_101_Mario_WhyNeedYou_Condition;
	information = DIA_None_101_Mario_WhyNeedYou_Info;
	permanent = FALSE;
	description = "������ � ������ ����� ����?";
};


func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//������ � ������ ����� ����?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//��� ������. ������ ��� � ����� ����.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//�... � ��� ����������� � ����������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//� ������ ������� �� '������ ������' � '�������� �������'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//� ����� � ���������� ���������� � ��������������� �������� ���� �������� ����� ����� � ������� �������.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//� ���������, ��� �������� ������� ����, ����� ��� ������� ������� � ��� �������� ���������.
	B_LogEntry(Topic_Crew,"����� - ������ ����� ������������ �����.");
};


instance DIA_None_101_Mario_WhyHere(C_Info)
{
	npc = NONE_101_Mario;
	nr = 7;
	condition = DIA_None_101_Mario_WhyHere_Condition;
	information = DIA_None_101_Mario_WhyHere_Info;
	permanent = FALSE;
	description = "� ��� �� ������� �����?";
};


func int DIA_None_101_Mario_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//� ��� �� ������� �����?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//����� �������� ������, � �� �������� ���������.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//����� ����� �������� �� ����� � ������� � ���� ����, � ��� ������ ��� ����� �����.
};


instance DIA_None_101_Mario_Abilities(C_Info)
{
	npc = NONE_101_Mario;
	nr = 8;
	condition = DIA_None_101_Mario_Abilities_Condition;
	information = DIA_None_101_Mario_Abilities_Info;
	permanent = FALSE;
	description = "��� �� ������ ������?";
};


func int DIA_None_101_Mario_Abilities_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_WhyNeedYou) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//��� �� ������ ������?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//� ������ �������� � �������� ���, � ���� �� � ����� ������� �� ����������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//� ������, ��� � ����� ������� ���� ����-������ �� ����� �����������.
	B_LogEntry(Topic_Crew,"�����, ������, ������ ���� � ���, ��� �������� ������� ����. ��������, �� ������ ������� ���� ���-����.");
};


instance DIA_None_101_Mario_YourPrice(C_Info)
{
	npc = NONE_101_Mario;
	nr = 9;
	condition = DIA_None_101_Mario_YourPrice_Condition;
	information = DIA_None_101_Mario_YourPrice_Info;
	permanent = FALSE;
	description = "��� �� �� ��� ������?";
};


func int DIA_None_101_Mario_YourPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//��� �� �� ��� ������?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//��� � ����? �� � ���� ��� ������ �������� ������.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//� ������ ����, � �� �������� ��� ��������� �� ���� ����.
};


instance DIA_None_101_Mario_CouldBeDangerous(C_Info)
{
	npc = NONE_101_Mario;
	nr = 10;
	condition = DIA_None_101_Mario_CouldBeDangerous_Condition;
	information = DIA_None_101_Mario_CouldBeDangerous_Info;
	permanent = FALSE;
	description = "����������� ����� ���� �������.";
};


func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YourPrice) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//����������� ����� ���� �������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//� ������ � ���������. ����� �� ����� �� ����, ������ ���� ��� ���� ����� ����������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//����� ����� ����� ����� ��� ���� ���������, � ������� � ������ ����� ���������� ���� ������� �������.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//�� ������ ��� � ������� �����. ������ ���, � ������ �� �����. ������, ������� ������, ������� �� ������.
};


instance DIA_None_101_Mario_DontNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 13;
	condition = DIA_None_101_Mario_DontNeedYou_Condition;
	information = DIA_None_101_Mario_DontNeedYou_Info;
	permanent = FALSE;
	description = "�� �� ����� ���.";
};


func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//�� �� ����� ���.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//� ������ ������, �������� ����� ����� �����.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//��� �������, �� �� �����-�� ������������ � ���������.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//��� ��� ������ �������, ������ ��� ���������� ����-������.
};


instance DIA_None_101_Mario_NeedGoodMen(C_Info)
{
	npc = NONE_101_Mario;
	nr = 2;
	condition = DIA_None_101_Mario_NeedGoodMen_Condition;
	information = DIA_None_101_Mario_NeedGoodMen_Info;
	permanent = FALSE;
	description = "� ������ ����� ����� ��� ������� �����.";
};


func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_None_101_Mario_YouNeedMe) && (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//� ������ ����� ����� ��� ������� �����.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//�������, �������� �� �������.
	B_JoinShip(self);
};


instance DIA_Mario_LeaveMyShip(C_Info)
{
	npc = NONE_101_Mario;
	nr = 11;
	condition = DIA_Mario_LeaveMyShip_Condition;
	information = DIA_Mario_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� �����, ��� �� ��� �� �����!";
};


func int DIA_Mario_LeaveMyShip_Condition()
{
	if((Mario_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//� �����, ��� �� ��� �� �����!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//��� �������. �� ������, ��� ������ ����!
	Mario_IsOnBoard = LOG_OBSOLETE;
	CrewmemberFree_Count -= 1;
	AI_StopProcessInfos(self);
	Mario_Nerver += 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Mario_StillNeedYou(C_Info)
{
	npc = NONE_101_Mario;
	nr = 11;
	condition = DIA_Mario_StillNeedYou_Condition;
	information = DIA_Mario_StillNeedYou_Info;
	permanent = TRUE;
	description = "�� ��� ���-���� �����!";
};


func int DIA_Mario_StillNeedYou_Condition()
{
	if((Mario_IsOnBoard == LOG_OBSOLETE) || (Mario_IsOnBoard == LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//�� ��� ���-���� �����!
	if((Mario_IsOnBoard == LOG_OBSOLETE) && (Mario_Nerver <= 2))
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//� ����! �������� �� �������!
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//�� �� ������ ��� ���������� �� ����. ������� � �� ���� �����!
		AI_StopProcessInfos(self);
		Mario_IsOnBoard = LOG_FAILED;
		self.flags = 0;
		B_Attack(self,other,AR_NONE,1);
	};
};

