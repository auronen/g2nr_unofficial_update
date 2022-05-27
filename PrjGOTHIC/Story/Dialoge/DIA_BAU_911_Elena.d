
instance DIA_Elena_EXIT(C_Info)
{
	npc = BAU_911_Elena;
	nr = 999;
	condition = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Elena_HALLO(C_Info)
{
	npc = BAU_911_Elena;
	nr = 1;
	condition = DIA_Elena_HALLO_Condition;
	information = DIA_Elena_HALLO_Info;
	permanent = FALSE;
	description = "������, ���������.";
};


func int DIA_Elena_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//������, ���������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//��. ������ ��� �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//��� ���� �����?
	};
};


instance DIA_Elena_Aufstand(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_Aufstand_Condition;
	information = DIA_Elena_Aufstand_Info;
	permanent = FALSE;
	description = "�������, ��� �� �������� ������ ������?";
};


func int DIA_Elena_Aufstand_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//�������, ��� �� �������� ������ ������?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//��� ���� �����, ��� ������ ����� �������� ���� �����.
	if(VisibleGuild(other) != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//��������� ������� �� �������� ���. ��� ��������� ���� ������, ����� ������� ��������.
	};
};


instance DIA_Elena_Arbeit(C_Info)
{
	npc = BAU_911_Elena;
	nr = 3;
	condition = DIA_Elena_Arbeit_Condition;
	information = DIA_Elena_Arbeit_Info;
	permanent = FALSE;
	description = "�����, �� �����, ���� �����-������ ������?";
};


func int DIA_Elena_Arbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//�����, �� �����, ���� �����-������ ������?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//��� ���� ������ ������ ����, ��� �������� �������� �����.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//���� ��� ���������? �� �� ����� �� ��������, ���������� � ������ � ����.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//������� ������ ���� ����?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//���� ����� �������� ���� ������ � ���.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//� ���� ������, ��� ��������� ������ ���������.
};


instance DIA_Elena_Regeln(C_Info)
{
	npc = BAU_911_Elena;
	nr = 4;
	condition = DIA_Elena_Regeln_Condition;
	information = DIA_Elena_Regeln_Info;
	permanent = FALSE;
	description = "����� ���� �����-������ �������, ������� ��� ����� ��������������?";
};


func int DIA_Elena_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO) && ((other.guild == GIL_NONE) || (other.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//����� ���� �����-������ �������, ������� ��� ����� ��������������?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//�� ������ ����, ��� ���� �� �����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//�� ��� ���� ��� � ����� ����.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//���� ���� ������� ���������, ������ � ����������.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//���� �� ������� ����� � ��������, ��� ����� ����� ������ ����.
};


var int Elena_Trade;

func void B_Elena_Trade()
{
	if(Elena_Trade == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTrader,"����� ������� ������ �� ����� �����.");
		Elena_Trade = TRUE;
	};
};

instance DIA_Elena_AUFGABE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 5;
	condition = DIA_Elena_AUFGABE_Condition;
	information = DIA_Elena_AUFGABE_Info;
	permanent = FALSE;
	description = "� ��� �� �����������?";
};


func int DIA_Elena_AUFGABE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//� ��� �� �����������?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//� ������ ��, ��� �� ���������� �� �����. ���� �������� ������ ���-������, ��� ��� �����.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//�� � ���� ������������ ����. � �� ����� ����������� � �� �������� ���������. �������?
	B_Elena_Trade();
};


instance DIA_Elena_TRADE(C_Info)
{
	npc = BAU_911_Elena;
	nr = 7;
	condition = DIA_Elena_TRADE_Condition;
	information = DIA_Elena_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Elena_TRADE_Condition()
{
	if(Elena_Trade == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//�������.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		ElenaMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Elena_PERM(C_Info)
{
	npc = BAU_911_Elena;
	nr = 900;
	condition = DIA_Elena_PERM_Condition;
	information = DIA_Elena_PERM_Info;
	permanent = TRUE;
	description = "������ ����������� ��������� ����� �� ����?";
};


func int DIA_Elena_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Elena_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//������ ����������� ��������� ����� �� ����?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//��������� ���� ����� ��� ���� �������, ��� ��� ������ ������ ������ ��������� ������.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//������� � ������ ��� ����� �� ����� � ������ ������ ������ �����.
		B_Elena_Trade();
	}
	else if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//��������� ��������� �� �������� ����� ���������� ��� ���� � ����. ��� ������ ������ �������, ����� ��� ���� ���������.
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//����� ����� ����� ����� �������. ����� �� ������������ ������ �������� �� ������ ����. ��� ����� ����� �� ��� �� ��� � ������.
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//�������� ���������� ��� ����� � ����� ��������. �� � ��� ���, ��� ���� ������� �� ������ �������, ��� ����� ������� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//��� ������ � ������� � ������ ��������� �����. �� � �� �����-�� ���� � ���. � �����, ��� �����, �� �����, �� � ������������.
	};
};


instance DIA_Elena_MINENANTEIL(C_Info)
{
	npc = BAU_911_Elena;
	nr = 2;
	condition = DIA_Elena_MINENANTEIL_Condition;
	information = DIA_Elena_MINENANTEIL_Info;
	description = "�� �������� ����� ����?";
};


func int DIA_Elena_MINENANTEIL_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (ElenaMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//�� �������� ����� ����?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//�� � ���? � ���� �� ������ � ������� ��������.
	B_GivePlayerXP(XP_Ambient);
};

