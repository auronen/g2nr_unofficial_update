
var int Fisk_Trade;

func void B_Fisk_Trade()
{
	if(Fisk_Trade == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//��� ����� ��������� �� ����� ��������. ���� ���� ���-������ �����������, ������.
		Log_CreateTopic(TOPIC_Addon_BDT_Trader,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_BDT_Trader,"���� ������� ����� ������ ������.");
		Fisk_Trade = TRUE;
	};
};

instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	B_Fisk_Trade();
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && !Npc_KnowsInfo(other,DIA_Addon_Snaf_HOCH))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//��, ���� ���� ����� ��������, �� �� ��� �����.
	B_Fisk_Trade();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v2;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(Fisk_Trade == TRUE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Meeting))
		{
			return TRUE;
		};
		if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	B_Say(other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	B_RefreshTraderAmmo(self,25);
};


var int Fisk_LostLockpicks;

func void B_Fisk_LostLockpicks()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//�� ��������� ������ ������ � �������� �������� ����� �������.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//�� ����� � ��� � �� �������! ���� ������� ����� ��� � ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//���� ��������, � ��� ������ ���-��� �� ���� �� �����!
	Fisk_LostLockpicks = TRUE;
};

instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && !Npc_KnowsInfo(other,DIA_Addon_Snaf_HOCH))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//������, � �� ���� � ����� ���� �������� ���������, �������?
	if(Fisk_LostLockpicks == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//� ���� ���� ������. � ���� ��, � ��� ���� ������� ���������.
		AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//����� �������?
		B_Fisk_LostLockpicks();
	};
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "��� �� ����� �� ������ ��� ��������?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if(Fisk_LostLockpicks == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//��� �� ����� �� ������ ��� ��������?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//����� � ���������. ���-�� ������ ��� �������� ��� ��� �� �������.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//�� ������ �� ����� ���� ����� � �������, � ������, ������� � ��������!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//���� ������� �������� ���-�� �� ������.
	MIS_Fisk_Lockpicks = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Fisk,LOG_Running);
	if(MIS_Addon_Bill_SearchAngusMurder == LOG_Running)
	{
		B_LogEntries(TOPIC_Addon_Fisk,"������� �� ����� ���� ����� � ����� ������� - ����� � ���������. �� �������� ���-�� �� ������.");
		if(SC_Knows_JuanMurderedAngus == TRUE)
		{
			B_LogNextEntry(TOPIC_Addon_KillJuan,"������ �� ����� ���� ����� ������� ��� �����, ������ ������ ������� � ��������. �� �������� ���-�� �� ������.");
		}
		else
		{
			B_LogNextEntry(TOPIC_Addon_KillJuan,"������ �� ����� ���� ����� ������� ��� �����, ������ ������ ������� � ��������. �� �������� ���-�� �� ������. ��������, �� ��������� � �������� ������ � �����.");
		};
	}
	else
	{
		B_LogEntry(TOPIC_Addon_Fisk,"������� �� ����� ���� ����� � ����� ������� - ����� � ���������. �� �������� ���-�� �� ������.");
	};
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//�� �����.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//������, ������, �� ������ �� ������ ���������� ��� ������������!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//�� ��� ��� ���...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//�� ������� ��� ����� � �����?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//�� ��� �� ����...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//�� �����. � ��� ��������� � ����� ������...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//�����, ��� ���� ��� ������������...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//� ���� ������� ��������� � ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//� �������� � ���, � �� ������� ���� ������ �� �������.
	Huno_ArmorCheap = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//��, � ������ ��� ���� ������. � �����-�� ������� ��� �� ��������.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//��� ������������ ����, ������� ����������� � ���� ����� ����������� ����� ������. � �����, �� ������� ��� ����������.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//� ��� � ��� ���� ��� ������.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//���� ���� ����. ������ �������, ������� �������� � �� ��� ����.
	MIS_Fisk_Lockpicks = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FiskPaket);
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "� ������ ���� ���� �����.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Fisk_Lockpicks == LOG_Running) && Npc_HasItems(other,ItMi_Addon_Fisk_Paket))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//� ������ ���� ���� �����.
	B_GiveInvItems(other,self,ItMi_Addon_Fisk_Paket,1);
	Npc_RemoveInvItems(self,ItMi_Addon_Fisk_Paket,1);
	CreateInvItems(self,ItKe_Lockpick,Fisk_Lockpicks_amount);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//������������! (�������������) � ��� � ������?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "� ������ ���� �����!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Fisk_Lockpicks == LOG_Running) && (FiskPaket_Open == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//� ������ ���� �����!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(�������) �� �������! ���� �� ��������� ������, ��� ������, �� ��� ��?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//�������-�� �� ���� �� ������?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//� ��� ��� ����� �����, ��� � ������?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "��� ���� ������ �������...";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if((MIS_Fisk_Lockpicks == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//��� ���� ������ �������...
	if(B_GiveInvItems(other,self,ItKe_Lockpick,Fisk_Lockpicks_amount))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//����� ������! ���������� �� ��� ���������.
		B_Addon_Fisk_Belohnung();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//����� ��� ������ �������! �� �� �� ��������� ���� ��������, �����?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "���� ������� �� ��������!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && !Npc_KnowsInfo(other,DIA_Addon_Snaf_HOCH))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//���� ������� �� ��������!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//���?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//�� ����� �� ���� � ���� ����! �� ���� �� ����!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(��������) ������. �� ����. �� � �������, ��� �� ���������, ������ � ���� �� ���� �� ������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//������ � ���� ������ �����, ��� �� ���� ��������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//� ���� ��� �������� ������� ���� �������� � ��� ������� ��-�� ������ ��������� ����������.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"����������, � � �� ������� �� ��������.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"� ���� �� ����!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"�������!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//�������!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//������! � ����� ������, ������� ���� ������. � �� ����, ����� ��� ����������!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//� ���� �� ����!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//�� ����, ���� ����! �� ������������ ����, ��������, ����������� �� ���� ������ �� ���� �������� - ���� �� ����!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//����������, � � �� ������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//���� �� ������ ��� ��������, �����? �� ����� ��� �� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//��� ���� �����: �� ����� ���������� �����.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//����� ���� ������� �� ��������, ������ �� �������. ���� ���.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//� ������ �� ����. �������, ���������� ���.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


var int Fisk_KillEsteban;

func void B_Fisk_EstebanIsDead()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//��������� � ����� ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//� �������, � ���� ��� �����������, �� � � ���� ������, ��� ��� ����� ������������.
	if(Fisk_Trade == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//� ���� ����� ����������� ����, �� ������, ��� ���� ������.
	}
	else
	{
		B_Fisk_Trade();
	};
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "������, �� ����������� ���������!";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_KnowsInfo(other,DIA_Addon_Snaf_HOCH) && (MIS_Judas == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//������, �� ����������� ���������!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//��. ������� ����� �� ���� ����. � ��� ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//�� �� ��������� ������ �� �������� �������� �� ���� �� �������. �� �����, ����� ��� �������� ������ �� ����.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//��� �� ����� �������� ���� ���� � ������ ������ � ������� ���� ������ �� �������.
	B_LogEntry(TOPIC_Addon_Esteban,"��������� �� �������� ������� ����.");
	MIS_Judas = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"� ��, � �������, ������ ��� �������������� ������.",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"������, � � ���� ���� ���� ������ ��������.",DIA_Addon_Fisk_Meeting_sell);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"�� �����.",DIA_Addon_Fisk_Meeting_now);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//� ��, � �������, ������ ��� �������������� ������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//���. � ���� ������� ��������. � ����� ���� ����, ����� ����� ���� ����� �� �����.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//������, � � ���� ���� ���� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//� ���? ��� � ����? �������, ��� �� ���� ���, ��� ���� �����? ��!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//������ � �������� ����. � ���� ���� ���� �������.
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"��� �� ����?",DIA_Addon_Fisk_Meeting_now);
};

func void DIA_Addon_Fisk_Meeting_now()
{
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//��� �� ����?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//�� ������ �������� � ������ ����. � ��� ������, �� ��� ������ � ������� ��� �����.
		if(!Npc_IsDead(Wache_01) || !Npc_IsDead(Wache_02))
		{
			AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//���� � ��� ��� ���������, �� ��� ���� ����������.
			AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//����� �� �� �������. �������.
			AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//�������?
			AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//�� ���� �������� ���� ������. �� �����, ��� �� ���������� ����� �.
			AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//����� ��� ��������, � �� �������� ����� ����� ����, ����� ��������� �� ����. ���-�� � �� � ���� �����.
			AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//����� ��� �����, �� ��������� ��������, � � - �����������.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"AMBUSH");
		}
		else
		{
			B_Fisk_Trade();
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"START");
		};
		Fisk_KillEsteban = TRUE;
	}
	else
	{
		DIA_Common_HeIsDead();
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//������� �����. �������-�� � ����� ����� �������� ����� �����.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//���, �����, ��� ��� ����.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		B_Fisk_EstebanIsDead();
	};
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "� ��������� ����� ������ �� ���������. �� �����.";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if(Fisk_KillEsteban == TRUE)
	{
		if(Npc_IsDead(Esteban))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//� ��������� ����� ������ �� ���������. �� �����.
	B_Fisk_EstebanIsDead();
};


instance DIA_Addon_Fisk_WhatsNew(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 9;
	condition = DIA_Addon_Fisk_WhatsNew_Condition;
	information = DIA_Addon_Fisk_WhatsNew_Info;
	permanent = FALSE;
	description = "���� �������?";
};


func int DIA_Addon_Fisk_WhatsNew_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && (Fisk_LostLockpicks == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_WhatsNew_Info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//���� �������?
	B_Fisk_LostLockpicks();
};

