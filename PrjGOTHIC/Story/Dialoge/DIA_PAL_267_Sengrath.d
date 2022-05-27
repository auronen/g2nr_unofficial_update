
instance DIA_Sengrath_EXIT(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 999;
	condition = DIA_Sengrath_EXIT_Condition;
	information = DIA_Sengrath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Sengrath_Hello(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Hello_Condition;
	information = DIA_Sengrath_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sengrath_Hello_Condition()
{
//	return TRUE;
	if((Npc_GetDistToWP(hero,"OC_RAMP_17") < 380) || (Npc_IsInState(self,ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Hello_Info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//� ����! � ����, ��� ����-������ ��� �������!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//�� ������ ����� ������? ��� ��������� ���� ���������, ��?
	AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//���, ��� ��������� �� ���� �������� ������. � ������ �� ������� ����� ������.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//(�����) ��������� ����...
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//��, ����������� ������ ��������� ������� ���������� � �����. �� ������� ��� � ���� ������� ������, ���������� ����� ��������.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Sengrath_Equipment(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Equipment_Condition;
	information = DIA_Sengrath_Equipment_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ���������� �����?";
};


func int DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Equipment_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//��� � ���� ����� ���������� �����?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//������ ������������� �������. ����������� ����� �������� �� ��� ���������.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//� ��� ������ �����?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//� ��� ���� ������ � ������������. ���� ���� ����������� ���� �� ���, ��� ��� �����.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"������� ������� ������ � �����.");
};


instance DIA_Sengrath_Perm(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 2;
	condition = DIA_Sengrath_Perm_Condition;
	information = DIA_Sengrath_Perm_Info;
	permanent = FALSE;
	description = "��� ����� ����� ������� ���� ����-������?";
};


func int DIA_Sengrath_Perm_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Perm_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//��� ����� ����� ������� ���� ����-������?
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//�������� � �������� - �� ����� ������������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//������ ��������. �� ������� ������ ��������� � �����. �����, � ���� �� ������ ����-������ �������.
		if(!Npc_KnowsInfo(other,DIA_Keroloth_WantTeach))
		{
			Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
			B_LogEntry(TOPIC_Teacher_OC,"������� ��������� �������� � �����.");
		};
	};
};


instance DIA_Sengrath_Scrolls(C_Info)
{
	npc = PAL_267_Sengrath;
	nr = 9;
	condition = DIA_Sengrath_Scrolls_Condition;
	information = DIA_Sengrath_Scrolls_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int DIA_Sengrath_Scrolls_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sengrath_Equipment))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Scrolls_Info()
{
	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

