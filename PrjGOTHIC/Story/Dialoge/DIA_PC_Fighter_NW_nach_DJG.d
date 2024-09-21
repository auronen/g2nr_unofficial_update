
instance DIA_GornNW_nach_DJG_EXIT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = "�� �������?";
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if(Gorn_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//�� �������?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//�������, � ������ ���? ������� ���� ������, ����� �� ���?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//��� ������� �������.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(�������) �����. ��� ��� ������. ��� ��� �����, ���� ���� ����������� ��� �����.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "��� ����� �� � ���� �����.";
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Gorn_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//��� ����� �� � ���� �����.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//������. � �� �������. ��� � ���� ������� ��� ����?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//�� ��������� �� ���� �� ������ ������? ����� ���-���� ������� �������.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(�������) �������. ������ �����. ������ �����, ��� ����� ������.
	if(SCToldGornHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(TOPIC_Crew,"���� ��� ����� �� ���, ����� � ��������� ��� �� �������. ���� ��� ����������� ��� �����, � ���� ����� ��� � �����.");
		SCToldGornHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//������ ��� ������� ����� ��������������, �� � �����, ��� ���� ���� ����� �� ������� ����� �� �����.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//���� ���� �������� ���������� ����-������ �� ����� ������� ���� ���� - ������ ������ �������.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//� ���� ������� ����� ������ �������������� ������, ���������� ������ ������� ������ � �����.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"� ��� ���� �����, ����� ������ �����.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"����� ���������� �� ����. ���������� � ������.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//����� ���������� �� ����. ���������� � ������.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//�������? ��! ���� ������� ����. � ����� ������� �� ������ ������! �� ������ �������!
	B_JoinShip(self);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ����� ������ �����.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//������!
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = "��������, ���� ����� �������� �����.";
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//��������, ���� ����� �������� �����.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//�� ������, ����� � �������� ���� ������? ���. ��� ������� ��� �������, �� ��� ���� �����. ����� ����, ���� ������, ��� � ��� �� ���� �����.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = "�����������. �� ����� ���.";
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if(((Gorn_IsOnBoard == LOG_OBSOLETE) || (Gorn_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Gorn_WasOnBoard == TRUE)
		{
			DIA_GornNW_nach_DJG_StillNeedYou.description = "�����������. �� ����� ���.";
		}
		else
		{
			DIA_GornNW_nach_DJG_StillNeedYou.description = "��� �� �������� �� ���� ������.";
		};
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	if(Gorn_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//�����������. �� ����� ���.
	}
	else
	{
		DIA_Common_INeedYourHelp();
	};
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//�������-��. � � �� �����, �� �������� ����� ���� �����, ���� ������ ������������ ���. �� ������ �������.
	B_JoinShip(self);
};

