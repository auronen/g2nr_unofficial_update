
var int DIA_Kardif_Buerger_permanent;
var int DIA_Kardif_Lehmar_permanent;
var int DIA_Kardif_Arbeit_permanent;
var int DIA_Addon_Kardif_MissingPeople_permanent;
var int DIA_Kardif_Lernen_permanent;
var int DIA_Kardif_Diebeswerk_permanent;
var int DIA_Kardif_Diebeswerk2_permanent;
var int DIA_Kardif_DOPE_perm;
var int DIA_Kardif_Paket_perm;
var int DIA_Kardif_Kerl_permanent;

func int C_MartinIsNear()
{
	if(!Hlp_IsValidNpc(Martin))
	{
		return FALSE;
	};
	if(Npc_IsDead(Martin))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(self,Martin) >= PERC_DIST_DIALOG) //TODO ���������� ���������� �� ����� � �������
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Kardif_EXIT(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 999;
	condition = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kardif_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kardif_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Kardif_Hi(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hi_Condition;
	information = DIA_Kardif_Hi_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Kardif_Hi_Condition()
{
	return TRUE;
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//��� ����?
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//���� �� ������ ���-������ ������, ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//� ���� ����� �� ����� ����?
	};
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"������ ������� ��������� � ������� � ������.");
};


instance DIA_Kardif_Hallo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_Hallo_Condition;
	information = DIA_Kardif_Hallo_Info;
	permanent = FALSE;
	description = "����� �������� �� ������, �� ������ ����� �������...";
};


func int DIA_Kardif_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi) && (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//����� �������� �� ������, �� ������ ����� �������...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//� ���� ����� �� ����� ����?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//��� ��� ������ ������� ��� ��������.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//� ������� � ���� ���� ������?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
	if(!Npc_KnowsInfo(other,DIA_Meldor_Interessantes))
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������, �������� ������ � ������, �������������� �����������.");
	};
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"� �� ����� ������� �� ���������� ������ 5 �����.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo,"������ �� ���� - � ����� ������ ��� ���������� � ������ �����.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo,"������, ������������.",DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//������, ������������.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//�� �������� �������� ������. (����������) � ������ � ����� �������.
	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//� �� ����� ������� �� ���������� ������ 5 �����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//���, 5 ������� �����? �� ������ �������� ����? (������ ���������� ���) ����� �������� �� 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"���, ��� �� ������. ����� ����� 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo,"������������, 7 ������� ����� - �������� ����.",DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//������ �� ���� - � ����� ������ ��� ���������� � ������ �����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//������, ������... � �������� � �� 7.
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"������������, 7 ������� ����� - �������� ����.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo,"���, ��� �� ��� �� ������ ����� ���� ����������.",DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//������������, 7 ������� ����� - �������� ����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(����������) ������ �������. ��, ���� ���� ����� ����� ���-�� ������, ��������� �� ���.
	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//���, ��� �� ��� �� ������ ����� ���� ����������.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//��, �������... (��������) - ������, 5 ������� �����. �� ��� ��� ��������� ����!
	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo,"� ������ ������ ���� ����� ������� �� ����?",DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//� ������ ������ ���� ����� ������� �� ����?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//��, � ������ ������ �� � ������ �����. ��, ��� �� �� �� ���� - ������ ���� ������.
	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//���, ��� �� ������. ����� ����� 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//�� ����������� �������, ����� � ����. ��, ���� �� ��� �����������, ���������� ���� ��������� � 6 ������� �����.
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};


instance DIA_Kardif_TRADE(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TRADE_Condition;
	information = DIA_Kardif_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ��� ���-������ ������.";
};


func int DIA_Kardif_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kardif_Hi))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//��� ��� ���-������ ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


func void B_BuildInfoDialog_Kardif()
{
	Info_ClearChoices(DIA_Kardif_TradeInfo);
	Info_AddChoice(DIA_Kardif_TradeInfo,Dialog_Back,DIA_Kardif_TradeInfo_Back);
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE) && (DIA_Kardif_DOPE_perm == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"��� ��� ����� ������ ������?",DIA_Kardif_DOPE_Info);
	};
	if((MIS_Andre_WAREHOUSE == LOG_Running) && (DIA_Kardif_Paket_perm == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"�� ���-������ ������ � ���� �������� �����?",DIA_Kardif_Paket_Info);
	};
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"� � ���� ����� ����� ��������� ����-������?",DIA_Kardif_Lernen_Info);
	};
	if(DIA_Kardif_Arbeit_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"��� � ���� ����� ������?",DIA_Kardif_Arbeit_Info);
	}
	else if(DIA_Kardif_Diebeswerk_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"� ��� �� ����� �����-������ '������' ������?",DIA_Kardif_Diebeswerk_Info);
	}
	else if(DIA_Kardif_Diebeswerk2_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"���� ���-������ '���������' ��� ����?",DIA_Kardif_Diebeswerk2_Info);
	};
	if(DIA_Kardif_Buerger_permanent == FALSE)
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"���� ������� ������������ ������ � ���� ������?",DIA_Kardif_Buerger_Info);
	}
	else if((DIA_Kardif_Lehmar_permanent == FALSE) && (SchuldBuchNamesKnown == FALSE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"��� ������ ������?",DIA_Kardif_Lehmar_Info);
	};
	if((DIA_Addon_Kardif_MissingPeople_permanent == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		Info_AddChoice(DIA_Kardif_TradeInfo,"��� �� ������ � ��������� ���������?",DIA_Addon_Kardif_MissingPeople_Info);
	};
	if(Npc_KnowsInfo(other,DIA_Kardif_SENDATTILA) && !Npc_IsDead(Attila) && (DIA_Kardif_Kerl_permanent == FALSE))
	{
		if(Attila.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			Info_AddChoice(DIA_Kardif_TradeInfo,"��� �������� ���� ������?",DIA_Kardif_Kerl_Info);
		};
	};
};

func void B_SayKardifZuwenigGold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//�����������, ����� � ���� ����� ���������� ������.
	Info_ClearChoices(DIA_Kardif_TradeInfo);
};

instance DIA_Kardif_TradeInfo(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_TradeInfo_Condition;
	information = DIA_Kardif_TradeInfo_Info;
	permanent = TRUE;
	description = "��� ����� ����������.";
};


func int DIA_Kardif_TradeInfo_Condition()
{
	if(Kardif_Deal > 0)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//��� ����� ����������.
	B_BuildInfoDialog_Kardif();
};

func void DIA_Kardif_Buerger_Info()
{
	AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//���� ������� ������������ ������ � ���� ������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//�����, � �����, �� ������ �� ��� �� �������. ������������ ����������� ������� ����� - ��� �����.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//���� ��������� �� ����� ���������, �� � ���� ���� ������, � ������ ����������� �������� ������ ��� ������.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//�������� � ������� ���� ����� ����������� ���� - � ���� �������, ���� ���� ��������� ��� ������.
		DIA_Kardif_Buerger_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	AI_Output(other,self,"DIA_Kardif_Add_15_00");	//��� ������ ������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(�������) ���� �� ������ ������ ���, ���� ����� ��������� � ��� ��������.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//������ ��� ����� ����� �������� ������� ���������.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//��������� ��� ��������, �� ������ ����� ��� � �����...
		DIA_Kardif_Lehmar_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//��� � ���� ����� ������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//�� ���� �� ������� ������ �����, � �����. ���� ����� ���������� � �������� � ������ ����� ������.
		if(!Npc_IsDead(VLK_438_Alrik))
		{
			AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//�� ���� � ���� ���� ��������� ���, �� ������ ������� ������� �� ��������. �� ������� ��� �� �������, �� ��������� �� ������.
		};
		DIA_Kardif_Arbeit_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//��� �� ������ � ��������� ���������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//���, ��� � ���� - ��� ��, ��� �� ��������� ��� ������� ��������� �����.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//�������, ��� ������ ����� ��������� �����, � �����. �����, ���� ����� ����������� �������.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//� ������ ����� ������ ���� ������� ����.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//���� ������ ����� ������, �������� � ���������.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//� ���� ������ � ������ ����� ������, � �����, ��� �� ��� ��� �� ���������� ����� �������.
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		if((Halvor_Ausgeliefert == FALSE) && !Npc_IsDead(Halvor))
		{
			AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//������, �������� ����� �� ����� �� ��������, ���� ����� ���-��� ����� - � ���� ������� ����� �����.
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"������ �������, ��� ��� ����� ���������� � ��������� ����� � ���������, ���������� �������� � ������ ����� ������, � ����� � ��������, ��������� ����� � ������.");
		}
		else
		{
			B_LogEntry(TOPIC_Addon_WhoStolePeople,"������ �������, ��� ��� ����� ���������� � ��������� ����� � ���������, ���������� �������� � ������ ����� ������.");
		};
		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Lernen_Info()
{
	var int Kardif_Log_Carl;
	var int Kardif_Log_Alrik;
	var int Kardif_Log_Lares;
	var int Kardif_Log_Ignaz;
	var int Kardif_Log_Brahim;
	AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//� � ���� ����� ����� ��������� ����-������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//�����, � �������� ������, ���� ��������� ������� �����.
		if(!Npc_IsDead(VLK_461_Carl))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//����, ������ - ������� ������. �������, �� ������ ������ ���� ����� �������.
			if(!Npc_KnowsInfo(other,DIA_Carl_Lernen))
			{
				Kardif_Log_Carl = TRUE;
			};
		};
		if(!Npc_IsDead(VLK_438_Alrik))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//������ ������ � ������ ����������. � ����� - ��������, ����� ���� �� �������. �� ���� ������� ������ � ����.
			if(Alrik_Teach1H == FALSE)
			{
				Kardif_Log_Alrik = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_03_add");	//� ����� - ��������, ����� ���� �� �������. �� ���� ������� ������ � ����.
		};
		if(Lares_TeachDEX == FALSE)
		{
			Kardif_Log_Lares = TRUE;
		};
		if(!Npc_IsDead(Ignaz))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//� ���� �� ��������� ����� �� ���, ���� ����� � ������� ������ - �� ����� ���� � �����... �����... ��, ��� ���... ������.
			if(Ignaz_TeachAlchemy == FALSE)
			{
				Kardif_Log_Ignaz = TRUE;
			};
		};
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//� ��� ��� ����� ���� ���� �����?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(������) ����, ������ ������ �������� ����� ������ �����, ������ ��� � ���� ������� ��� ���.
		if(!Npc_IsDead(Brahim))
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//������ ��������� � �������� ������, �� ����������� ������� ��. � ���� �� ������ ����� ��������������� �����, ����� � �������� � ���� � ���� �����.
			AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//��� ������ ����� �����. �� ����� � �������� ���� ������� �� ����� ��������. (��������) � ������ ��� ����� � ��� ���� ������ �� ��� ����������.
			if(Brahim_Trade == FALSE)
			{
				Kardif_Log_Brahim = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Kardif_Lernen_14_07_add");	//������ ��������� � �������� ������, �� ����������� ������� ��.
		};
		if((Kardif_Log_Carl == TRUE) || (Kardif_Log_Alrik == TRUE) || (Kardif_Log_Lares == TRUE) || (Kardif_Log_Ignaz == TRUE))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			if(Kardif_Log_Carl == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"����, ������ � �������� ��������, ����� ������� ���� �������.");
			};
			if(Kardif_Log_Alrik == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"������ �� ��������� �������� ������ � ������ ����������.");
			};
			if(Kardif_Log_Lares == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"����� ����� ������ ��� �������� ��� �������� � ����.");
			};
			if(Kardif_Log_Ignaz == TRUE)
			{
				B_LogEntries(TOPIC_CityTeacher,"����� ����� �������� ��� ������� ������������� �����. �� ����� � �������� ��������.");
			};
			if(Kardif_Log_Brahim == TRUE)
			{
				Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
				B_LogNextEntry(TOPIC_CityTrader,"������� ������ ����� � ������� �� � ������.");
				Brahim_Trade = TRUE;
			};
		}
		else if(Kardif_Log_Brahim == TRUE)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"������� ������ ����� � ������� �� � ������.");
			Brahim_Trade = TRUE;
		};
		DIA_Kardif_Lernen_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//� ��� �� ����� �����-������ '������' ������? ��� �� �������� ��������� ���������� �����.
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//���-������ �������, ��������? ���...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//... �������� ���������� � �������. ��������, �� ������ ������ ����.
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void B_Kardif_AboutDaronChest()
{
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//��, � ������, �������� ������� �� �����, ������ ������ �����, ��� ����.
	AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//�?
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//��� ��� ���� ����� ��������, ��������� ���������� ��� ���� ��������, ���������.
	AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//�������, ��� ���� ����� ����� � ����� ��������� ���������. �� �� ������ �� ������ �� ����, �������?
	DIA_Kardif_Diebeswerk2_permanent = TRUE;
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//���� ���-������ '���������' ��� ����?
	if(Kardif_Busted == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//�� ����������� �� �� ������. � ������� ����������.
	}
	else if(C_MartinIsNear())
	{
		AI_WaitTillEnd(self,other);
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//�� ����������� �� �� ������. � ������� ����������.
	}
	else if(Npc_KnowsInfo(other,DIA_Kardif_Zeichen) || B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		if(!Npc_KnowsInfo(other,DIA_Kardif_Zeichen))
		{
			AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//��, ���� ���-��� - �� ��� ������������ ����, ������ ���� �� ������� ��������������� ���������.
			AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//����������, ��� ��� � ����?
		};
		B_Kardif_AboutDaronChest();
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Kerl_Info()
{
	AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//��� �������� ���� ������?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//��, �� �������� �������, ���������� � �������. �� �� ����� ��������. �����-�� ��... ��������.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//� ��� ����?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//��� ����? ����� �� ������ �� ����, � ��� ���, ��� �� ������ �� �� ����.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//� ��� ������ ���� ���-�� ��������. ��, ��� �� �� �� ����, � �����... �� ������ �����, ���������� � ���. ��� ������ ���� ���������.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//��... ���� ������ � ���, ��� ����...
		DIA_Kardif_Kerl_permanent = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_DOPE_Info()
{
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//��� ��� ����� ������ ������?
	if(Kardif_Busted == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//������ �� ����� - � �� ���� ���� � ��������� ������.
		Undercover_Failed_Kardif = TRUE;
		B_CheckRedLightUndercover();
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//������ �� �����.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//�����, ����� ���?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//� �� �� ����� ����� ��������� � �������� - �� ����� ��� ����� ��������.
		DIA_Kardif_DOPE_perm = TRUE;
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_Paket_Info()
{
	AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//�� ���-������ ������ � ���� �������� �����?
	if(B_GiveInvItems(other,self,ItMi_Gold,Kardif_Deal))
	{
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//���, ��� ������� ���� ����� - ������� �������. �, ��������, ������ ������������� ����!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//�� ������� �������� ����. �� ���-�� ������. �����, ����������!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//������, ������ - ���� ������ ������� ������� � ��� �������. �� �� ���������.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//�� ������, ��� ������ ��� �������� ����� � ������, ��, ������� ��, �� ��� ���������� � ����. ��� ���, ��� � ����.
		DIA_Kardif_Paket_perm = TRUE;
		B_LogEntry(TOPIC_Warehouse,"������ ������� � ���������. � ����� ����� ��� ��� �������� �����, ������� �� ����� �������.");
		B_BuildInfoDialog_Kardif();
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

func void DIA_Kardif_TradeInfo_Back()
{
	Info_ClearChoices(DIA_Kardif_TradeInfo);
};

instance DIA_Kardif_SENDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_SENDATTILA_Condition;
	information = DIA_Kardif_SENDATTILA_Info;
	important = TRUE;
};


func int DIA_Kardif_SENDATTILA_Condition()
{
	if((MIS_ThiefGuild_sucked == TRUE) || (Diebesgilde_Okay >= 3) || (MIS_Nagur_Bote == LOG_FAILED) || ((Diebesgilde_Okay == 2) && (NagurHack == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//��, ��, ��� ����. � ���� ���� ���-��� ��� ����.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01_add");	//���� ������ ����� ����� ���������� � �����. �� ������ ������ �������.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//���� ������ ����� ����� ���������� � �����.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//��� ��� �� �� ����� ���� �����, �� �������� ���� �������� ���� �������.
//	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//�� ����� ����������� � �����. �� ������ ������ �������.
	if(Kardif_Deal > 0)
	{
		AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//��� ���������� ��������� - �� ��� ����������! ���� �� ��� ��������� �������� �������.
	};
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//��� �������� ���� ������?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//� ��� �� ������� ���� - �� ���� �������� ��������� �� ���, ��� ����. (����������)
	if(Kardif_Deal == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc(VLK_494_Attila,"NW_CITY_HABOUR_POOR_AREA_BACK_ALLEY_02");
	B_InitNpcGlobals();
	if((NagurHack == TRUE) || (MIS_Nagur_Bote == LOG_FAILED))
	{
		MIS_ThiefGuild_sucked = TRUE;
	};
};


instance DIA_Kardif_DEFEATEDATTILA(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 2;
	condition = DIA_Kardif_DEFEATEDATTILA_Condition;
	information = DIA_Kardif_DEFEATEDATTILA_Info;
	permanent = FALSE;
	description = "���� ������� ������� ����� ����!";
};


func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Hallo))
	{
		if(Npc_IsDead(Attila))
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(Attila,"NW_CITY_KARDIF") > 2000)
		{
			return TRUE;
		};
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//���� ������� ������� ����� ����!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//��, ������ ��� ���� �����? � ������ ������� ����������.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//���� ���-�� ����� �������� ����, � �����, � ���� ���� ������ �������.
	B_GivePlayerXP(XP_Kardif_Blame4Attila);
};


instance DIA_Kardif_Zeichen(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 800;
	condition = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Kardif_Zeichen_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//��, �� ������ ���� � ������. ������. � ����� ������, � ���� ���-��� ���� ��� ����.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(���������) ���� ���� ����������� �������, �������. � ������ ��������� �� ������ ������. ������ ������� ���� ������ ���� �������.
	if(DIA_Kardif_Diebeswerk2_permanent == FALSE)
	{
		if(!C_MartinIsNear())
		{
			AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//���� ���-������ '���������' ��� ����?
			B_Kardif_AboutDaronChest();
		};
	};
	CreateInvItems(self,ItKe_Lockpick,20);
	Kardif_Busted = FALSE;
};


instance DIA_Kardif_Crew(C_Info)
{
	npc = VLK_431_Kardif;
	nr = 51;
	condition = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent = FALSE;
	description = "��� ��� ��� ����� �������.";
};


func int DIA_Kardif_Crew_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//��� ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//������� ������ �������, �������. �� �� ������� �������� �� ���� ��������. ����������� �� ��� ����� �������� �����.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//�� � ������� ��������� ����� �������� ������� ��������� ��������� ������ � �������� ������ ������� �� ��� �������� �������.
	if(SCGotCaptain == FALSE)
	{
		AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//��� � ���� ����� ��������?
		AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//�� ����������� �� �� ������. � ������� ����������.
		if(!Npc_IsDead(Jack))
		{
			AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//���, �������� �� ������ ������. �� ��������� � ���� �����, ������� � ���� �����. � ���, ��� �������� �������� ����, ��� ��� �������, ��� ���� �����.
			if(MIS_Jack_NewLighthouseOfficer == FALSE)
			{
				B_LogEntry(Topic_Captain,"������ �������� ���� � ������� �����. ��������, �� ������ ������ ���.");
			};
		};
	};
};

