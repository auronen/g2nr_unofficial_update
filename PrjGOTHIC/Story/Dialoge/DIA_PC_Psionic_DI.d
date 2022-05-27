
instance DIA_Lester_DI_EXIT(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 999;
	condition = DIA_Lester_DI_EXIT_Condition;
	information = DIA_Lester_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_DI_Hello(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 1;
	condition = DIA_Lester_DI_Hello_Condition;
	information = DIA_Lester_DI_Hello_Info;
	permanent = TRUE;
	description = "�� ������ ���-�� ������� ���?";
};


func int DIA_Lester_DI_Hello_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;

func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//�� ������ ���-�� ������� ���?
	if(!Npc_IsDead(Mario_DI) && (OrkSturmDI == FALSE) && (DIA_Lester_DI_SCGotWarning1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//���� �������� ������, ������� �������� ���� �����, ��� �� ��������. � ���� ������� ����.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//���� ���������, ��� ����.
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if((Mario_DI_ReadyForAmbush == TRUE) && (DIA_Lester_DI_SCGotWarning2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//����� ������, ����� �� ��� ������ ����. �������� �� ���� ����, ��� �������� �� �������, � ���� ���������� �� ���.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//�� ������ ����� ����� ���� �����, � �� ��� ���� ������� �� �������.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//� � ������ ������ �� ������� ����� �����. �� ������ � ������.
		B_GivePlayerXP(XP_AmbientKap6);
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//���� ���. ����� ����, �����.
	};
};


instance DIA_Lester_DI_MarioArsch(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 2;
	condition = DIA_Lester_DI_MarioArsch_Condition;
	information = DIA_Lester_DI_MarioArsch_Info;
	description = "�� ��� ����. ����� ������ ���.";
};


func int DIA_Lester_DI_MarioArsch_Condition()
{
	if((DIA_Lester_DI_SCGotWarning1 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE))
	{
		if(Npc_KnowsInfo(other,DIA_NONE_101_MARIO_DI_ambush))
		{
			return TRUE;
		}
		else if((Mario_DI_ReadyForAmbush == TRUE) && Npc_IsDead(Mario_DI))
		{
			return TRUE;
		};
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//�� ��� ����. ����� ������ ���.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//��. ��������, � �� �����-�� ��������������, �� � ���� ������ ��� ���� ���� � ������ ������.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//���������� ���������� �������� ���� ����������� � �������.
	B_GivePlayerXP(XP_AmbientKap6);
};


instance DIA_PC_Lester_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Psionic_DI;
	nr = 5;
	condition = DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "�� ����� ����� �� ����������.";
};


func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};


var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;

func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//�� ����� ����� �� ����������.
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//������, ��� �������� ���� ����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//��� ���� ������� ���?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//� ��������� �����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//��, ������ ����, ��� ����� �����. ��� ��� ��� ���, ���-����?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//������-������.
		};
		if(SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//���� ������ ���� �� ��������� ������ �������� ��� ������ ������.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//��. ���� �������� ������� ����. ��� ���� ������. � ���������, ��� ������� �� ���� ����.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//��� ����������� ��������� �����, ����� �������� ��� ���.
		};
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//�� �������, ������ ������ ������ �� ����������. �� ���� ���� ��� ������� �������� �����, ������� � ����� ������ ��������.
	AI_StopProcessInfos(self);
	if(DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(MiltenNW_IsOnBoard != LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"SittingShipDI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
};

