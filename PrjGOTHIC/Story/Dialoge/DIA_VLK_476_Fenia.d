
instance DIA_Fenia_EXIT(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 999;
	condition = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fenia_EXIT_Info()
{
	if((VisibleGuild(other) == GIL_KDF) || (VisibleGuild(other) == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//������� ���� ������, �, �������������� ���.
	};
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Fenia_PICKPOCKET(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 900;
	condition = DIA_Fenia_PICKPOCKET_Condition;
	information = DIA_Fenia_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Fenia_PICKPOCKET_Condition()
{
	return C_Beklauen(50,75);
};

func void DIA_Fenia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,Dialog_Back,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};

func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};


instance DIA_Fenia_Hallo(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 3;
	condition = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hallo_Info;
	important = TRUE;
};


func int DIA_Fenia_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Hallo_Info()
{
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//�� ��������� ��������. ����� �� ����, ��?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//������� �����, � �� ������.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//������� �������, �� �����. � ���� �� ������� ���, ��� ���� �����!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"���� ������� ���� �� ���� � ������.");
};


instance DIA_Fenia_Hallo_Pal(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 4;
	condition = DIA_Fenia_Hallo_Pal_Condition;
	information = DIA_Fenia_Hallo_Pal_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fenia_Hallo_Pal_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (VisibleGuild(other) == GIL_PAL) && Npc_KnowsInfo(other,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Hallo_Pal_Info()
{
	AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//�����������, ������ �������.
};


var int Fenia_ItemsGiven_Paket;

instance DIA_Fenia_HANDELN(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_HANDELN_Condition;
	information = DIA_Fenia_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Fenia_HANDELN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Fenia_HANDELN_Info()
{
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//������ ��� ���� ������.
	if((MIS_Baltram_ScoutAkil == LOG_FAILED) && (Fenia_ItemsGiven_Paket == FALSE))
	{
		CreateInvItems(self,ItFo_Cheese,5);
		CreateInvItems(self,ItFo_Apple,10);
		CreateInvItems(self,ItFo_Beer,5);
		CreateInvItems(self,ItFo_Bacon,5);
		CreateInvItems(self,ItFo_Sausage,5);
		Fenia_ItemsGiven_Paket = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Fenia_Infos(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_Infos_Condition;
	information = DIA_Fenia_Infos_Info;
	permanent = FALSE;
	description = "�� �������, ��� � ���� ���� ���, ��� ��� �����. ��� �������� ����������?";
};


func int DIA_Fenia_Infos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Infos_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//�� �������, ��� � ���� ���� ���, ��� ��� �����. ��� �������� ����������?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//�������. ��� �� ������ ������?
};


instance DIA_Fenia_MoreTraders(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 11;
	condition = DIA_Fenia_MoreTraders_Condition;
	information = DIA_Fenia_MoreTraders_Info;
	permanent = FALSE;
	description = "���� �����, � �����, ������ ��������?";
};


func int DIA_Fenia_MoreTraders_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_MoreTraders_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//���� �����, � �����, ������ ��������?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//���� �� ������� ������ ����� �������, �� ������� �������, ����� ����. �� ������� �����.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//� ���� �� ������� � ������ �������, ��� ����� �������, ���������.
	if(Brahim_Trade == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������� ������ ����� � ������� �� � ������.");
		Brahim_Trade = TRUE;
	};
};


instance DIA_Fenia_OV(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 13;
	condition = DIA_Fenia_OV_Condition;
	information = DIA_Fenia_OV_Info;
	permanent = FALSE;
	description = "�� ������ ����-������ �� �������� ��������?";
};


func int DIA_Fenia_OV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos) && (Mil_305_schonmalreingelassen == FALSE))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			return TRUE;
		};
	};
};

func void DIA_Fenia_OV_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//�� ������ ����-������ �� �������� ��������?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(�������) ���� �� � ����-������ ��� �����, � �� ����� �� ������, �����.
};


instance DIA_Fenia_Interesting(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 14;
	condition = DIA_Fenia_Interesting_Condition;
	information = DIA_Fenia_Interesting_Info;
	permanent = FALSE;
	description = "�� ��� ���������� ����� �������� �������� � �����?";
};


func int DIA_Fenia_Interesting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Interesting_Info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//�� ��� ���������� ����� �������� �������� � �����?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//��... ���� �� ����� �����������, ��� � ����� ������� � �������. ��� ������ ���-������ ����������.
	if(!Npc_IsDead(Moe))
	{
		AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//�� ���� �� ���������� ���. ������, ������� ����� ������ ����, ����������� ��������� ���� �������� � ����.
	};
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//����� ����, � ����� ����� ������� ������� ���������. ����������� ������� ������. �� ��� ������������� ����� ����������.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//�� ������� ��, ���� ������� ����� ����� �������, � ����� �������� ��� ������� ������.
};


instance DIA_Fenia_Aufregend(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 15;
	condition = DIA_Fenia_Aufregend_Condition;
	information = DIA_Fenia_Aufregend_Info;
	permanent = FALSE;
	description = "������ ����������� �� ����?";
};


func int DIA_Fenia_Aufregend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Aufregend_Info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//������ ����������� �� ����?
	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Fenia_Add_17_01");	//����. � ������ �������.
	};
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//����� �������� ���. ��, ������, ����� ��� ���-�� � ������ ����� ������.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//�������, ��� ������ ��������� ������� ������� ������.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//��� ������� ������� �� ��� - �� ������� � ���� � ��� �����.
};

