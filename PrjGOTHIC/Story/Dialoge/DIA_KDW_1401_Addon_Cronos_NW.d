
instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	B_EquipTrader(self);
	if(Cronos_NW_ItemsGiven_Chapter_1 == TRUE)
	{
		Cronos_NW_ItMi_Flask_Count = Npc_HasItems(self,ItMi_Flask);
		Cronos_NW_ItMi_Sulfur_Count = Npc_HasItems(self,ItMi_Sulfur);
		Cronos_NW_ItMi_Pitch_Count = Npc_HasItems(self,ItMi_Pitch);
		Cronos_NW_ItPo_Mana_01_Count = Npc_HasItems(self,ItPo_Mana_01);
		Cronos_NW_ItPo_Health_01_Count = Npc_HasItems(self,ItPo_Health_01);
		Cronos_NW_ItSc_Light_Count = Npc_HasItems(self,ItSc_Light);
		Cronos_NW_ItSc_Firebolt_Count = Npc_HasItems(self,ItSc_Firebolt);
		Cronos_NW_ItSc_Zap_Count = Npc_HasItems(self,ItSc_Zap);
		Cronos_NW_ItSc_LightHeal_Count = Npc_HasItems(self,ItSc_LightHeal);
		Cronos_NW_ItSc_SumGobSkel_Count = Npc_HasItems(self,ItSc_SumGobSkel);
		Cronos_NW_ItSc_Icelance_Count = Npc_HasItems(self,ItSc_Icelance);
		Cronos_NW_ItSc_Whirlwind_Count = Npc_HasItems(self,ItSc_Whirlwind);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cronos_Hallo(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = "� ���� ���� ������������?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//� ���� ���� ������������?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//(��������) ��� ��? �� �����, ��� ��� ��� �����-������ ��������� ������� ���� ����.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//�� �������, ���� ����� ����� ����������. ��������� ����� ����� �� ���� ������ ������ ������� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//� ������� ��� ����, � ���� ������� ������ ��� ��������� ������, ��� ��� �� ������� �����������.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//��� ������ - �������� ��� ����� ������ �� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//��������� ������, ����� � ����. �������� ���� �������� ������� ��� ���������� ���������.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//��� ����� ������, ���������� �� ������� ��������� �����, � ����� ������� ��� �������� �� ����, ��� ���������.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//� ��� �� ��������� ����, ������� �������� �� � ��������, �� � ����� � ���� �������� ���: ������� ���� ���� ����������.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "�������� ��� � �������� �������.";
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//�������� ��� � �������� �������.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//������� � ������� ���� �� ����. � ���������, ��� �������� �� ����������. ������ ��� �� ������.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//����� �� ������ ������ ����, ��� ������ �� ���.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//���� ������������� ������ ��� ������� �� ��������. �����, �� �������� ��� ���� ����� ������.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//������ ���� ������ ������� �������� �� ����, ����� ��� ���������� ���� ������������� ��������.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "�� ������ ������� ��� �����-������ �������?";
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//�� ������ ������� ��� �����-������ �������?
	if(CronosTraded == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//������ �� � ���? ���� � ��������� �����, �� � ����� ��� ���� ����.
		Log_CreateTopic(TOPIC_Addon_KDWTrader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTrader,LogText_Addon_CronosTrade);
		CronosTraded = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//����, ��� ���� �����?
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

