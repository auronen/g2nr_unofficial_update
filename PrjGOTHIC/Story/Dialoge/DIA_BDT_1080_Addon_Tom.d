
instance DIA_Addon_Tom_EXIT(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tom_HI(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 1;
	condition = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent = FALSE;
	description = "������ �� ������� �����?";
};


func int DIA_Addon_Tom_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//������ �� ������� �����?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//� ���� ��������. � ������ ������ ��� ����� �� ������������ � ������.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//��� �� ���?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//� ���� ���� ������� ��������� � ��������, ���������?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//� ������ �������� ����� ����� ������ � �������� � ����.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//� ���������� �������� ������! '���, ������� ��� ��, ���, ������� ��� ���'.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//� ����� �������� ���� ������� �������.
};


instance DIA_Addon_Tom_Juan(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 2;
	condition = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int DIA_Addon_Tom_Juan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//������� ������ ������ �� ����� ����� - �����. ���� �������� ������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//� ��� ��� ��������� ��������� ������ � ��������, ����� �� �������� �� ������� � ���� ���� � ��� ����� �������!
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//���� ������ ����� �����! �� ������������ �����. ��� ������� ������� �� ����.
	SC_Knows_JuanMurderedAngus = TRUE;
	if(MIS_Addon_Bill_SearchAngusMurder == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_KillJuan,"����� � ������ ��������� � ���� ����.");
	};
};


instance DIA_Addon_Tom_Esteban(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 3;
	condition = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent = FALSE;
	description = "� � ��� ��� �� ������ �����?";
};


func int DIA_Addon_Tom_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//� � ��� ��� �� ������ �����?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//������� � ����� � ������ � ������ �����, ���� � ������, ��� ��� ����� ������ ��� ���� ������.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//� ��� ������� �������.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//� ���� ������� ������, ��� ��� � ������ ����, ��� �� �������, � ���� ��������� � ������.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//������� � � �� ���� ��������� � ������.
	Tom_Tells = TRUE;
};


instance DIA_Addon_Tom_Dead(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 4;
	condition = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent = FALSE;
	description = "������� �����.";
};


func int DIA_Addon_Tom_Dead_Condition()
{
	if(Npc_IsDead(Esteban) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//������� �����.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//������? ��������, ��� ��� �����!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//��� ������ ���?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(������) ��, ������, �����, ���� �� ������...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//�������, ��� ������ �� ���. ������ � ���� ��������� � ������...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_Addon_Tom_PERM(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent = TRUE;
	description = "��� ���?";
};


func int DIA_Addon_Tom_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//��� ���?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//������ � ���� �������� ���� ������ �����.
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Tom_Dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//������ �, �������, ���� ���������� � ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//� ����� �� � �� ����� ��� � ������ �����...
	};
};

