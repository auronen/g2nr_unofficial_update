
instance DIA_Addon_Cronos_ADW_EXIT(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 999;
	condition = DIA_Addon_Cronos_ADW_EXIT_Condition;
	information = DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_ADWHello(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 1;
	condition = DIA_Addon_Cronos_ADWHello_Condition;
	information = DIA_Addon_Cronos_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//��� ���� ������. �� ��� ������ ������� ������ �������.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//��, ��� ������ �� ��� �����. ��� ���� ����?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//��������� ����� ����� �������.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//��������� ��������, ������� �� ����� ���������, ������ ����� �� �����.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//������ ������ ��������� �������� ������, �������, ��-��������, ������������ ��� ��������� ����� ���.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//�� �������� �� ���, ����� �� ��� �� ����� �����-������ �����, ��������� � ����� ������.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//��� ��� ���� ����������.
};


instance DIA_Addon_Cronos_WaechterADW(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 5;
	condition = DIA_Addon_Cronos_WaechterADW_Condition;
	information = DIA_Addon_Cronos_WaechterADW_Info;
	description = "���� �����-������ ����� �������� � �������� �������?";
};


func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Addon_Cronos_Waechter))
	{
		DIA_Addon_Cronos_WaechterADW.description = "�������� ��� � �������� �������.";
	}
	else
	{
		DIA_Addon_Cronos_WaechterADW.description = "���� �����-������ ����� �������� � �������� �������?";
	};
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	if(!Npc_KnowsInfo(other,DIA_Addon_Cronos_Waechter))
	{
		AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//�������� ��� � �������� �������.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//���� �����-������ ����� �������� � �������� �������?
	};
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//��� ��� �������� ���������� ��������� ����.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//��� ����� ��� ������ � �� ���������.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//�� ������ ����������� ���������. ���� �� ��������� ������� ������, ��� ������� �� ����!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//��� �������� ��������, ��� �������� �� ���� ��������� ���-�� �����.
};


instance DIA_Addon_Cronos_ADW_Trade(C_Info)
{
	npc = KDW_14010_Addon_Cronos_ADW;
	nr = 99;
	condition = DIA_Addon_Cronos_ADW_Trade_Condition;
	information = DIA_Addon_Cronos_ADW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_v1;
};


func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	if(CronosTraded == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTrader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTrader,LogText_Addon_CronosTrade);
		CronosTraded = TRUE;
	};
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

