
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if((Brahim_ShowedMaps == TRUE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST))
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//������ �������. � ������, ��� ����� ����������� ���-������ ���������� ��� ����.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Brahim_PICKPOCKET_Condition()
{
	return C_Beklauen(15,15);
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};


instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//���� ����� �������. � ����� ����� � ������ ��.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//��� ��� �� ������� �����, ��������, ���� ���������� ����� ������.
		AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//��� ����� �������� � ����� �������, ���� �� ����� �� ���������.
	};
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������� ������ ����� � ������� �� � ������.");
	};
};


instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "� ������, ��� ��������� ������ ������������ ������� �������?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//� ������, ��� ��������� ������ ������������ ������� �������?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//� ������ �� ����. �� � �� ������, ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//�������� ������. ������� �� ������ �������� � ���� ���� ���� ������� ����?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//�������������, ��� ���� ������� ������.
};


instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� �����.";
};


func int DIA_Brahim_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//������ ��� ���� �����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//�� �� ������� ����� ���� � ���������.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//������� ����� - ��� ����� �����, �������� ��� �����, ��������� � ��������, ������ �������.
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	Brahim_ShowedMaps = TRUE;
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || !Npc_HasItems(other,ItWr_ShatteredGolem_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		if(Npc_HasItems(other,ItWr_ShatteredGolem_MIS) || (MIS_HannaRetrieveLetter == LOG_SUCCESS))
		{
			return TRUE;
		};
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//� ����, ��� ���� ������ ������ ������������ ����.
		AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//����� ������?
		AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//��, �� ������ �����, ��� �� ������ ��� �����.
	};
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//� ���� ����� �����, ��� ��. �� ����������� ������ ����, ����� ����� ���������.
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
		Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
		Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"��� �� ���� ��� �����?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
		Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"��� ��� �� �����?",DIA_Brahim_Kap3_First_EXIT_Content);
		Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"������ �� �� ������� �� ����?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//��� �� ���� ��� �����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//��, � ����� �� � ������ ������ ����, ��� � ����� �������.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//��������, ������ ����, ��������� ��.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//��� ��� �� �����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//������, ��� ����� �������� ��� ���-�� �����.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//��, ������, �� �� ���, ��� �������� �������� ��� ��������������.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//������ �� �� ������� �� ����?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//� ������ �������, � �������, ����� � ��� ����� ���������, ����� ������.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//����� ���� ���������� ��, ��� ��������.
};

