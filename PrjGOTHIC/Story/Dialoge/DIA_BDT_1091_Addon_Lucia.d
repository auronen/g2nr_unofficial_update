
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_Hi(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//��������. ���� ���� ����� ���, ������ � �����. � ���� �� ������ ������, �� �� ��������� � ������� ��������.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = "� ��� �� �� ����� �����?";
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//� ��� �� �� ����� �����?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//��, ���� � ��� �������. ���� �� ������ �������� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//� �������, ��� ������������ ������� ����, ������� ��� ��������...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//��� ��� ������ �� ���� ������� �������. � ���� ���� �������, ���� � ����� ���.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//��-�... ���� ����� ����������� ��� ���. � ����� ������ � �������. ���� ��������, �� ������������� ����� ���� ����.
	CreateInvItems(self,ItFo_Addon_Liquor,1);
	B_GiveInvItems(self,other,ItFo_Addon_Liquor,1);
	if(!Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken))
	{
		Log_CreateTopic(TOPIC_Addon_BDT_Trader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_BDT_Trader,"� ����� � ���� ������ �������.");
	};
};


instance DIA_Addon_Lucia_Khorinis(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = "�� �� ��������, �����?";
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if((MIS_LookingForLucia == LOG_Running) || (LuciaMentionedInKhorinis == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//�� �� ��������, �����?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//��, �� ���������. ����� � ���� ��� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//���� � ����� ��������� ������� � ������������, ��� ��� ����� ���� ���-�� �������.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//�� �����... (�������) ���, �������. ����� ����, ��� ��-�� ����, ��� �� �� �������... �����, � ����� ������, � ��� ������ ���������.
	if(MIS_LookingForLucia == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Lucia,"������, ��� ����� � ������ �������. ��� ���� ���� � �������� � �������� ����� ����� ������.");
	};
	MIS_LookingForLucia = LOG_SUCCESS;
	B_CheckLog();
};


instance DIA_Addon_Lucia_SadElvrich(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_SadElvrich_Condition;
	information = DIA_Addon_Lucia_SadElvrich_Info;
	permanent = FALSE;
	description = "� ��� �� ������?";
};


func int DIA_Addon_Lucia_SadElvrich_Condition()
{
	if((MIS_LookingForLucia == LOG_SUCCESS) && (MIS_LuciasLetter == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_SadElvrich_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04_add");	//� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//� �������� � �������!
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//������?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//�� ����! ����� ������� ������� ����, �� ���� �� ��������� ��� ������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Lucia_Jetzt(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent = FALSE;
	description = "��� �� ����������� ������?";
};


func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//��� �� ����������� ������?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//���������. ���� � ������� �����, �� ������, ������ � ����������.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//�� ��� ����� ������? � �����, ��� ��� �������!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(�������) ������... ����� �������� � ������ �������... ���� � ���� ���� ���. ������ ����� �� �������.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = "�� �� �����-�� ������ ���������, �����?";
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//�� �� �����-�� ������ ���������, �����?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//���� ���������-�����, ������� ������ ���� ����? ���, �� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//���� ����� � ��� ������� ������ �����, � ��� ������� ����� ���� �� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//� ��� ��� �� �� ����. � �� ���������� �����, ���� ��� ������� ������� ����� � ������� ���� �� �������.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"(����������)",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� �������� ��������� �� ��� ������, ������� �������� ����� ������.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"�������� - ��� ����� ������. ��� �� ������.",DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//�� �������� ��������� �� ��� ������, ������� �������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//� ����, ��� ���� ���� �������� ���� ����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//� ���� ����� �������� ����. �� ��������, ��� ���� �� ���.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� �����-������ ����-������ �������?",DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//�� �����-������ ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//���, � ����� ����� ����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//����� ��������� �������� � ����� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//����� ������ � ����� ������������ ������ �������� �����, ������ ��� ������.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//�� ���������� ������, ������ ������?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//���, ��� ��! ������ ��������� ���� �������������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//�� � �� �� ������� �� ����������� � ������������ ����������� ������.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//�������� - ��� ����� ������. ��� �� ������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//� ��� � ����? �� �� ����� ����� - ��� ��, ��� � �� ����� �������� � �������.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//������������ ������� � ���, ��� ��� ������� ������ ������, ������ ��� ����� ������.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"�� ���������� ������, ������ ������?",DIA_Addon_Lucia_Paladine_WEIB);
};

func void B_Lucia_SoWhat()
{
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01_add");	//� ��� � ����?
};

instance DIA_Addon_Lucia_Attentat(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//������.
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"(����������)",DIA_Addon_Lucia_Attentat_BACK);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"� ��� ���� �����, ����� ��������� ������ ��������.",DIA_Addon_Lucia_Attentat_CONTRA);
	Info_AddChoice(DIA_Addon_Lucia_Attentat,"� ���� ���� ����������.",DIA_Addon_Lucia_Attentat_PRO);
};

func void DIA_Addon_Lucia_Attentat_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

func void DIA_Addon_Lucia_Attentat_CONTRA()
{
	B_Say(other,self,"$ATTENTAT_ADDON_CONTRA");
	B_Lucia_SoWhat();
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

func void DIA_Addon_Lucia_Attentat_PRO()
{
	B_Say(other,self,"$ATTENTAT_ADDON_PRO");
	B_Lucia_SoWhat();
	Info_ClearChoices(DIA_Addon_Lucia_Attentat);
};

instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ��� ���-������ ������.";
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//��� ��� ���-������ ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Lucia_lernen(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(�������) � ��������. � ���� ������ ���� ��������� ��������.
	Log_CreateTopic(TOPIC_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_BDT_Teacher,"����� ����� ������ ��� ����� ����� ������.");
};


func void B_BuildLearnDialog_Lucia()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Addon_Lucia_TEACH_5);
};

instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = "� ���� ����� ����� ������.";
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//� ���� ����� ����� ������.
	B_BuildLearnDialog_Lucia();
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_BuildLearnDialog_Lucia();
	};
};

func void DIA_Addon_Lucia_TEACH_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_BuildLearnDialog_Lucia();
	};
};

