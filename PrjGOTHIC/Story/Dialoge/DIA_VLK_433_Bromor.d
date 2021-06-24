
instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = FALSE;
	description = "�� ������ ����� ���������?";
};


func int DIA_Bromor_GIRLS_Condition()
{
	if(NpcObsessedByDMT_Bromor == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//�� ������ ����� ���������?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//� ������. ��� ��� ���, � ��� ��� �������. � ����� ���� �������.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//� ���� �� ������ ���� ������� ����, �� ������ ��������� �� ��� 50 ������� �����.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//������ ������, ����� ������� �������.
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = "� ������ ��������� ��� � �������?";
};


func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//� ������ ��������� ��� � �������?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//�������! ��� �� �������, ��� � ���� ����������� � ������?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//(�����������) �-�... � �� ��������� �� �� ��������. � ���� � ����, ��� ��� �� �����. ��� ����-�� ���?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//�-�. ��, ���� �� ���� ������� ������������� �������. �� ����� �����.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//� ���� ��������� � ����� �� ���������. �� ��� �� ����� ������� �� ������.
	LuciaMentionedInKhorinis = TRUE;
	if(MissingPeopleReturnedHome == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	};
	B_LogEntries(TOPIC_Addon_MissingPeople,"����� �� ����� ����� ������� �� ������� � ������.");
	if(MIS_LookingForLucia == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
		B_LogNextEntry(TOPIC_Addon_Lucia,"����� �� ����� ����� ������� �� ������� � ������.");
		MIS_LookingForLucia = LOG_Running;
	};
};


instance DIA_Addon_Bromor_Lucia(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = "��� ����� �� ���� �����?";
};


func int DIA_Addon_Bromor_Lucia_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Bromor_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//��� ����� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//��������� ����. �� ���� �����, �������.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//�������, ��� ������� � ����� �� ����� �����������.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//��� ����� ���-��� � ����� ����������. ��� ����������� ������� �����.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//���� ��� ������� �� ��� � ����, ��� ����������!
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//�� ����-�� ����� �� ����� ����? �� ���, ������ ���� ���� ����������?
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"����� ����� ������ ������� ����� � ������ �����, �������. ������ ����� ������� ��� ���� �����.");
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


var int DIA_Addon_Bromor_LuciaGold_Lucia_OneTime;

instance DIA_Addon_Bromor_LuciaGold(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = "� ����� �����, ������� ������ �����.";
};


func int DIA_Addon_Bromor_LuciaGold_Condition()
{
//	if((NpcObsessedByDMT_Bromor == FALSE) && (MIS_Bromor_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMi_BromorsGeld_Addon))
	if((MIS_Bromor_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMi_BromorsGeld_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//� ����� �����, ������� ������ �����.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//���������, ���� ��� �������� ��� �����.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"��� ������ �������?",DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"��� �����.",DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_Lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"���� �� ���������, ��� ��������� � ������?",DIA_Addon_Bromor_LuciaGold_Lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//��� �����.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//���������. ����� ����� � ����� �������. ���-������ ���?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


func void DIA_Addon_Bromor_LuciaGold_Lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_Lucia_15_00");	//���� �� ���������, ��� ��������� � ������?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_Lucia_07_01");	//���. � ����� ��� �����? �������, ��� ����� � ����.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_Lucia_07_02");	//� ��������� ��� ����� ��� ��� �����, �������� � ������. ������ � ������ �������� �� �������?
	DIA_Addon_Bromor_LuciaGold_Lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//��� ������ �������?
	if(!Npc_IsDead(Nadja))
	{
		AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//������ ��������� �������� ����� � ����� �� ���� �������. ��� �������?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01_add");	//50 ������� �����. ��� �������?
	};
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_Lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"���� �� ���������, ��� ��������� � ������?",DIA_Addon_Bromor_LuciaGold_Lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"����� ������������.",DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"��������. ��� �����.",DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//����� ������������.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//����������, ��� ������ ����� ������ �� ������������.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"������ �� ����.",DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//������ �� ����.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//����� �������� �� ����� ���������, �������.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//� �� �����, ��� ���� ����� �����-������ ��������.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//��������. ��� �����.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	if(!Npc_IsDead(Nadja))
	{
		AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//���������. ��� � ����. ��� �������� ���� �������� �������.
		Bromor_Pay = 1;
	}
	else
	{
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};

func void B_Bromor_NoServiceForYou()
{
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01_add");	//������ ����� ������ �� ������������!
};

var int DIA_Bromor_Pay_OneTime;

instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = "� ���� ����������. (��������� 50 �������)";
};


func int DIA_Bromor_Pay_Condition()
{
	if((Bromor_Pay == 0) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS) && (NpcObsessedByDMT_Bromor == FALSE) && !Npc_IsDead(Nadja))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//� ���� ����������.
	if(Bromor_Hausverbot == FALSE)
	{
		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Bromor_GIRLS_07_01");	//�� ��, ��� ���� �� ���� ��������.
			DIA_Bromor_Pay_OneTime = TRUE;
		};
		if(B_GiveInvItems(other,self,ItMi_Gold,50))
		{
			AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//�������. (����������) �� ����� �� �������� ��������� ��������� ����� ����� �����.
			AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//��� ������ � �����. �����.
			Bromor_Pay = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//� �� ������, ����� ���-������ �������� ������ ����. �������� ������, ���� �� ������ ���������.
		};
	}
	else
	{
		B_Bromor_NoServiceForYou();
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = "� ���� � ������������ �� '������' ������, �?";
};


func int DIA_Bromor_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE) && (NpcObsessedByDMT_Bromor == FALSE) && Npc_KnowsInfo(other,DIA_Bromor_GIRLS))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//� ���� � ������������ �� '������' ������, �?
	if(Bromor_Hausverbot == FALSE)
	{
		if(!C_LawArmorEquipped(other) && !Npc_IsDead(Nadja))
		{
			AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//�������, ��� ��� ������� ���������. (����������)
			AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//���� � ���� ���� ������, �� ������ ����� ������ � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Bromor_DOPE_07_01_add");	//(���������) ��� ��� ������� ���������...
		};
	}
	else
	{
		B_Bromor_NoServiceForYou();
	};
};


instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "��� � �������?";
};


func int DIA_Bromor_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Bromor == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Obsession_Info()
{
	DIA_Common_IsEverythingOk();
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Heilung(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Heilung_Info;
	permanent = TRUE;
	description = "�� �������.";
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//�� �������.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//���? � ��� ��� ��? �������� ������.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Key;
};


func int DIA_Bromor_PICKPOCKET_Condition()
{
//	return C_StealItems(50,Hlp_GetInstanceID(ItKe_Bromor),1);
	if(Npc_HasItems(self,ItKe_Bromor) && (NpcObsessedByDMT_Bromor == FALSE))
	{
		return C_StealItem(50);
	};
	return FALSE;
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
//	B_StealItems(50,Hlp_GetInstanceID(ItKe_Bromor),1);
	B_StealItem(50,Hlp_GetInstanceID(ItKe_Bromor));
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

