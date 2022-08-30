
instance DIA_Addon_Elvrich_EXIT(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 999;
	condition = DIA_Addon_Elvrich_EXIT_Condition;
	information = DIA_Addon_Elvrich_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_BanditsThere(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_BanditsThere_Condition;
	information = DIA_Addon_Elvrich_BanditsThere_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Addon_Elvrich_BanditsThere_NoPerm;

func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if(C_ElvrichBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//����� �����! � ��������� ���������. �� ���� ��� �����.
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Elvrich_Wer(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Wer_Condition;
	information = DIA_Addon_Elvrich_Wer_Info;
	description = "��� �� �����?";
};


func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//��� �� �����?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//���� ����� ������. � �� ������.
	if(MIS_Thorben_BringElvrichBack == LOG_Running)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//������ ������ �������, ��� �� ������.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//��� ������� ��������� ���� ���� � ������� � �����.
};


instance DIA_Addon_Elvrich_MissingPeople(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_MissingPeople_Condition;
	information = DIA_Addon_Elvrich_MissingPeople_Info;
	description = "� ������ ��������� � ������ ����.";
};


func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer) && (SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//� ������ ��������� � ������ ����.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//�� ���� ������ � ������ �����. ���� ���������� ������, ��� ��������� �� ����.
};


var int Elvrich_AskedLucia;
var int Elvrich_AskedPirates;

instance DIA_Addon_Elvrich_WhatExactly(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhatExactly_Condition;
	information = DIA_Addon_Elvrich_WhatExactly_Info;
	description = "� ��� �� � ����� ���������?";
};


func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//� ��� �� � ����� ���������?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//� ��� �� ��������. � ������ ��� ����������� �� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//�� ����� �����. �� ���������� ����������� � �����, �������� �� ������ � ����, ��� ��� �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//� ����� �� �����, ��� ����� ���� �����, � ����� ��������� ������� � �������� ��� �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//�������, � �������������, �� �� ���� ������� �����. ��, ������, �� �� ��������?
	LuciaMentionedInKhorinis = TRUE;
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"�������� ��� � �����.",DIA_Addon_Elvrich_WhatExactly_Lucia);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"��� ������ �� ���� �������?",DIA_Addon_Elvrich_WhatExactly_Want);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//��� ������ �� ���� �������?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//��������� ��� ��� ��������� ���������� �� ������. �� ��� � �����, ��� ��� ���������� ������� � �������.
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"���� ��� ���������� ������?",DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//���� ��� ���������� ������?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//��� ����� ��������� ���-�� �����, �� �������. �� ������, ��� ��� ������� ���� �� ���������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//���� ������� �� ���������. �� ��� ������������ ��������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//���� �� �������� ������� � ������� � ����� ����������. � ��� ���������� �������� ����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//� �����, ��� ������ �����, ����� ������ ����-�� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//�� ������ ����������, � �������� �������� ����. � ��� ��� �� ����� � �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//��-�����, ������� ������ �� �����, ��� �� ������ ������. � ����� ������ ��.
	Elvrich_SCKnowsPirats = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"������, ������ �������� �� �������� �������, ��� ������� ���������. ������, ��� ������ � ������� � �������.");
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"������ � ��������?",DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"��� ��������� ������ �������?",DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//������ � ��������?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//�������� ��� � ��� �������. ������ ������, � ����� ������ ��� ������ �������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//��� ��������� ���������� � ����. ����������� ������ �� ��� - ����������� � ������� ����������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//� ������� ���� �������� - ��� ������ �������, ��� ��� � ������ �� �� ���������.
	Elvrich_AskedPirates = TRUE;
};

func void DIA_Addon_Elvrich_WhatExactly_Lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Lucia_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Lucia_04_01");	//��� ������� �� ��������� ������. ����� ��������. ��� �������� �� ����� �������� �������.
	Elvrich_AskedLucia = TRUE;
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//��� ��������� ������ �������?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//�������� �� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//���� �� �������� �� ���������� ����� � ����, �� �� ����� ������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//������ ��������� �����, ������� ���������� ���� �� ����, � ����� ������ ���� ������.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"����� ����� ����� ������� � ��������, ����� ����� � ���� �������� � ������ �� ���������� ����� � ����. ����� ����� ��������� � ���� � ������� ����� ������ �������.");
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,Dialog_Back,DIA_Addon_Elvrich_WhatExactly_Back);
	if(Elvrich_AskedLucia == FALSE)
	{
		Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"�������� ��� � �����.",DIA_Addon_Elvrich_WhatExactly_Lucia);
	};
	if(Elvrich_AskedPirates == FALSE)
	{
		Info_AddChoice(DIA_Addon_Elvrich_WhatExactly,"������ � ��������?",DIA_Addon_Elvrich_WhatExactly_Here);
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};


instance DIA_Addon_Elvrich_Bromor(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_Bromor_Condition;
	information = DIA_Addon_Elvrich_Bromor_Info;
	description = "������ ������, ��� ����� ������ � ���� ������� �����...";
};


func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Bromor_LuciaStoleGold == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//������ ������, ��� ����� ������ � ���� ������� �����...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//��, ���� ����� ���-�� � ������ � �������, � ��� �������� ��� �������.
//	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
//	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"������� ����� �������, �� ���� ���������, ��������� � ��������, ������� � ������ ������ � ������ �� ����� ������.");
};


instance DIA_Addon_Elvrich_WhereIsLucia(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information = DIA_Addon_Elvrich_WhereIsLucia_Info;
	description = "��� ������ �����?";
};


func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_LuciasLetter != LOG_SUCCESS) && (MIS_LookingForLucia != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//��� ������ �����?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//�� ����������� �� ������� ����������� ����� ������ �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//����� ������� ������� � ��� �� ������ ������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//�� ������� �� �����.
	if(MIS_LookingForLucia == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		MIS_LookingForLucia = LOG_Running;
	};
	if(MIS_LookingForLucia == LOG_Running)
	{
		B_LogEntry(TOPIC_Addon_Lucia,"����� ����� �������. ��� ����������� � ���, ������� ��������� � ������ �� ����� ������.");
	};
	SC_KnowsLuciaCaughtByBandits = TRUE;
};


instance DIA_Addon_Elvrich_FernandosWaffen(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information = DIA_Addon_Elvrich_FernandosWaffen_Info;
	description = "�������, ������� ������� ���� � �����, �������� ���� ������?";
};


func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//�������, ������� ������� ���� � �����, �������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//� ��. ������ ���� �������, ��� ��� ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//��� ��� ������ ��� ������� � ����������� ����� ������.
	B_GivePlayerXP(XP_Ambient);
//	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
//	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"���� ����� ���� � ���, ������� ��������� � ������ �� ����� ������. ��� ������������ �������, ���������� ������� ������� ������ ������.");
};


instance DIA_Addon_Elvrich_LuciaLetter(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 4;
	condition = DIA_Addon_Elvrich_LuciaLetter_Condition;
	information = DIA_Addon_Elvrich_LuciaLetter_Info;
	description = "� ����� ������ �� �����.";
};


func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly) && Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//� ����� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(�����������) ���? ��� ��� ����!
	AI_PrintScreen("���������� ������ ����� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(� ��������) ���! � �� ����! � ������ �� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(� ��������) ��� �� ����� ���� ��� ��� ��� �������.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//������ ��� ������! � �� ���� ��� ������. � ����, ��� �����-������ ��� �� ��� ��������.
	AI_PrintScreen("���������� ������ ����� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	MIS_LuciasLetter = LOG_SUCCESS;
	if(MIS_LookingForLucia == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		MIS_LookingForLucia = LOG_Running;
	};
	if((MIS_LookingForLucia == LOG_Running) || (MIS_LookingForLucia == LOG_SUCCESS))
	{
		B_LogEntry(TOPIC_Addon_Lucia,"������ �� ����� ������, ��� ����� ���� � ��������� �����������. �������� �� ������, ������� ��� ��� ��������, �� ��� ��� �������� �� �� �����������.");
	};
	B_GivePlayerXP(XP_Addon_LuciasLetter);
};


instance DIA_Addon_Elvrich_WasNun(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_WasNun_Condition;
	information = DIA_Addon_Elvrich_WasNun_Info;
	permanent = FALSE;
	description = "�� ������ ��������� � �����!";
};


func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhereIsLucia) || (MIS_LuciasLetter == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//�� ������ ��������� � �����!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//������ ��� � � ��������� �������! � ����������� � ������� �������.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//�� ������� ������ ��������?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//�����, ��� ��...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//���� ������� �����, ������ �� � �����, ������?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//� ��������, ��� ����� �������.
	AI_Output(self,other,"OUTRO_Xardas_04_00");	//�� �������!
	CreateInvItem(self,ItMw_1h_Vlk_Axe);
	AI_EquipBestMeleeWeapon(self);
	if(MissingPeopleReturnedHome == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	};
	B_LogEntry(TOPIC_Addon_MissingPeople,"������ ���������� ������� � ������� �������.");
	Elvrich_GoesBack2Thorben = TRUE;
	AI_EquipBestMeleeWeapon(self);
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Elvrich_PERM(C_Info)
{
	npc = VLK_4302_Addon_Elvrich;
	nr = 5;
	condition = DIA_Addon_Elvrich_PERM_Condition;
	information = DIA_Addon_Elvrich_PERM_Info;
	permanent = TRUE;
//	important = TRUE;
	description = "��� � �������?";
};


func int DIA_Addon_Elvrich_PERM_Condition()
{
	if((Elvrich_GoesBack2Thorben == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_LuciasLetter != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	DIA_Common_IsEverythingOk();
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//�������, ��� ���� ����!
	AI_StopProcessInfos(self);
};

