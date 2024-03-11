
instance DIA_Orlan_EXIT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 999;
	condition = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	Knows_Taverne = TRUE;
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Orlan_Wein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Wein_Condition;
	information = DIA_Orlan_Wein_Info;
	permanent = FALSE;
	description = "� ������ ���� �� ���������.";
};


func int DIA_Orlan_Wein_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) >= 12) && (Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//� ������ ���� �� ���������.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//�����������. ��� ������ ��, ��� ��� �����.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//� ��� ����������� � ���� � �������� ��������. � ��� ���� 100 ������� ����� ����� ������.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"������, ����� ��� ��� ������.",DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein,"�� ��������� ������ ����?",DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//������, ����� ��� ��� ������.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//�����. � ����� ������� ����� ����.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//�� ��������� ������ ����? ��� ����� 240 �����.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//���, ������ ����������� ����, ��? �� ������, ����� ����, �� ������ ������������. ��������, ����� �������� ��� - � ��� ���� 100 ����� �� ��� ����.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//�� ������� �������, ��� � ������� ����, � � ��� ���� � ������� ������ ������ � ������������.
	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein,"��, ����� ���� 240 �����.",DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein,"��, ������ ���������. ����� ���� ��� ������.",DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein,"� ��� ��� �� ������?",DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//��, ����� ���� 240 �����.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//(��������) �� ������, ������, ��� ���� ������.
	B_GiveInvItems(self,other,ItMi_Gold,240);
	B_GiveInvItems(other,self,ItFo_Wine,12);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//��, ������ ���������. ����� ���� ��� ������.
	B_GiveInvItems(other,self,ItFo_Wine,12);
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//��� ���� ������ � ������.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_PrintScreen("4 ������ ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	CreateInvItems(hero,ItSc_Light,2);
	CreateInvItems(hero,ItSc_LightHeal,1);
	CreateInvItems(hero,ItSc_SumGobSkel,1);
	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//� ��� ��� �� ������?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//������� �� ���� - � � ���� ������ �� �������. ��� ��������� ��� �� �����, �������... �-�... ����� �� �����, ��!
};


instance DIA_Orlan_WERBISTDU(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Orlan_WERBISTDU_Condition;
	information = DIA_Orlan_WERBISTDU_Info;
	description = "�� ���?";
};


func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//�� ���?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//� �����, ������ ���� �������� �������.
	if(VisibleGuild(other) == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//�� ���-������ �����, ���������? ����� ����, ��������� ��� ��� ������� �������?
	};
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//������ ����, ���, ����� ����, ���� ����� ����������?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//� ���� ���� ���� ��� ��� � ���� ������, ���� � ���� ���� ������� ������.
	Log_CreateTopic(TOPIC_OutTrader,LOG_NOTE);
	B_LogEntry(TOPIC_OutTrader,"����� - ���������� � ������� '������� ������'. � ���� ������ � ���� ������� � ���-����� ������.");
};


instance DIA_Addon_Orlan_Greg(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_Greg_Condition;
	information = DIA_Addon_Orlan_Greg_Info;
	description = "�� ������ �������� � �������� �� �����?";
};


func int DIA_Addon_Orlan_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && Npc_KnowsInfo(other,DIA_Addon_Greg_NW_MeetGregSecondTime) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//�� ������ �������� � �������� �� �����?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//� ����� ��� ����� ������. ���������� ���.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//��������� ����� ����� �� ���� � ���� ������� �������. ��� ��� ��� �������� ������.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//��� ����� ���� ��������� ���������� � ���, ��� ���� ������� �� �������. � �� ���������� �� ������� �� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//� � ���� ���������� ���� �� ������ ����� ������ �� ����� ������. �� ����� ����� �����.
};


instance DIA_Addon_Orlan_Ranger(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Ranger_Condition;
	information = DIA_Addon_Orlan_Ranger_Info;
	description = "� ���� ��������, ��� �� ������������� ��������� �������� �� ��� ������?";
};


func int DIA_Addon_Orlan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && AnyRangerRingEquipped())
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//� ���� ��������, ��� �� ������������� ��������� �������� �� ��� ������?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//� �� ������ ������, ��� ��� ��������...
	Orlan_KnowsSCAsRanger = TRUE;
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"� ���� ������ ������ ����!",DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger,"��� ���������. ����� �����-������ �����?",DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//��� ���������. ����� �����-������ �����?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//�����. ����� ���������� � ����-��������, ���� �� ������.
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//����, �������, ��������� �� �� �������� ���������...
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//��� � ���� ��� ���� �������?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//� ���� ������ ������ ����!
	if(Npc_KnowsInfo(other,DIA_Addon_Orlan_NoMeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//�������������? �� ���� ��������, ��� ������ ������� ������� � ��������.
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//����, ��� ���� �����?
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};


instance DIA_Addon_Orlan_Teleportstein(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_Teleportstein_Condition;
	information = DIA_Addon_Orlan_Teleportstein_Info;
	description = "�� �����-������ ����������� ���������?";
};


func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if(SCUsed_TELEPORTER == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//�� �����-������ ����������� ���������?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//�� ��������? ���� ���� ���� �� ������ ����, ��� ��� ���������, � � ������ ��������� � ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//���� ��������� �������� ���� �� ����������. ������ � �� ���� ����� � ����� ������� ������ ������.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"� � ���� ���������� �� ���� ��������?",DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein,"��� ��������� ��������?",DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//� � ���� ���������� �� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//������, ���� ������. ��� ���� - � ����� ����.
	CreateInvItems(self,ItKe_Orlan_TeleportStation,1);
	B_GiveInvItems(self,other,ItKe_Orlan_TeleportStation,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsNW,"����� ����� �������� � ������ � ���-������ �� ����� �������.");
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//��� ��������� ��������?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//�������� �� ���� �������, �� ���, ���� ������. � ��� ���� ���� ��� � ����������.
};


instance DIA_Addon_Orlan_NoMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 2;
	condition = DIA_Addon_Orlan_NoMeeting_Condition;
	information = DIA_Addon_Orlan_NoMeeting_Info;
	description = "� ���� �������������� � ������ ����!";
};


func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && !Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger) && !AnyRangerRingEquipped() && (MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//� ���� �������������� � ������ ����!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//����� ��� ������� �����. ������ ���� ������?
};


instance DIA_Addon_Orlan_WhenRangerMeeting(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information = DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description = "��� �������, ��� � ����� ������� ����� ������� ������ ����� ��������.";
};


func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if((MIS_Addon_Lares_ComeToRangerMeeting == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Orlan_Ranger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//��� �������, ��� � ����� ������� ����� ������� ������ ����� ��������.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//�����. ��� ���-��� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//��������� ������-�� �������������.
	B_GivePlayerXP(XP_Ambient);
	B_Addon_Orlan_RangersReadyForComing();
	self.flags = 0;
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"��������� ������ ���-��� ���������.",DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,"������� ����� �������?",DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//������� ����� �������?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//��, ��������� � �����.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//�������, �� ������ �� ������� ������.
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//��������� ������ ���-��� ���������.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//���������...
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting,Dialog_Ende,DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	Knows_Taverne = TRUE;
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};


instance DIA_Orlan_RUESTUNG(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 5;
	condition = DIA_Orlan_RUESTUNG_Condition;
	information = DIA_Orlan_RUESTUNG_Info;
	permanent = TRUE;
	description = "��� �� ������� �� ������ ����������?";
};


var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (DIA_Orlan_RUESTUNG_noPerm == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//��� �� ������� �� ������ ����������?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//� ���� ���� ����� ������� ���������, � ������, ��� ������������ ����.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
	Info_AddChoice(DIA_Orlan_RUESTUNG,Dialog_Back,DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG,B_BuildPriceString("������ ������� �������. ������: 25/20/5/0.",VALUE_ITAR_Leather_L),DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//� �� ����� ������ ������� �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Leather_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//������ �����.
		B_GiveArmor(ITAR_Leather_L);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//������. ������, ����� � ���� �������� ������.
	};
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//��� ������. ������ �� ����� ������� �����.
	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};


instance DIA_Orlan_TRADE(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 70;
	condition = DIA_Orlan_TRADE_Condition;
	information = DIA_Orlan_TRADE_Info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Orlan_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//������ ��� ���� ������.
	if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//�������, ���� �� ������.
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//�������. ��� ���� ������� ����� �������� ������ ������� �����.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//�������, ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//���� �� ������� ���������.
	};
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		OrlanMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Orlan_HotelZimmer(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 6;
	condition = DIA_Orlan_HotelZimmer_Condition;
	information = DIA_Orlan_HotelZimmer_Info;
	permanent = TRUE;
	description = "������� �� ������ �� �������?";
};


var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;

func int DIA_Orlan_HotelZimmer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU) && (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//������� �� ������ �� �������?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		if((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//������ �� ������ ����� � ���� ���������.
			Orlan_RangerHelpZimmer = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//��� ������ ������ � ���� ������ �������� ��������� �������. ���������� ���������, �����������.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//� �� ������� �� ������ ����� ������ �� ���� ������ � ������������� ������ �� �����.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//��� ���� �� ������� ������. �������, ������� ������ ����������.
		CreateInvItems(self,ItKe_Orlan_HotelZimmer,1);
		B_GiveInvItems(self,other,ItKe_Orlan_HotelZimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//�� ������� 50 ������� ����� � ������ - � ������� ����.
		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"���� ������, ��� ������-��!",DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer,"������. ��� ������.",DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//������. ��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//� ��� ����. ������� ��������� ����� �� ��������. �� �� ������ �� � �� ������� ������� ����� �������, �������?
		CreateInvItems(self,ItKe_Orlan_HotelZimmer,1);
		B_GiveInvItems(self,other,ItKe_Orlan_HotelZimmer,1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//� ���� ��� ����������. ������� ������, ����� ������������.
	};
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//���� ������, ��� ������-��!
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//����� �������� �������� ������ � ������ �����, ������.
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};


var int Orlan_AngriffWegenMiete;

instance DIA_Orlan_MieteFaellig(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 10;
	condition = DIA_Orlan_MieteFaellig_Condition;
	information = DIA_Orlan_MieteFaellig_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Orlan_MieteFaellig_NoMore;

func int DIA_Orlan_MieteFaellig_Condition()
{
	if((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || AnyRangerRingEquipped())
	{
		return FALSE;
	};
	if((Orlan_AngriffWegenMiete == TRUE) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	if((Orlan_SCGotHotelZimmer == TRUE) && (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7)) && (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(����������) � ����� ��� ������ ������ �����. ��������� �����, ������� ���������. ��� ����� ��� ����.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//����� �, �������, ������ ��� �����?
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"������ �� ����. � ������ �� ���� ������� ����.",DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig,"��� ���� 50 �����.",DIA_Orlan_MieteFaellig_ja);
	};
};


var int DIA_Orlan_MieteFaellig_OneTime;

func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//��� ���� 50 �����.
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//��� ��� �������.
		if(DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//��� �� ������ ���� ����?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//���� ����� �� �����.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//����. ��, ��. ���, � �����-��, �� ��� ����.
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//�� ���, ��������� ������ ����? � ���� ���� ��� �����, ����� ��������� �� ���. � ������ ����, �� ��...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//������ �� ����. � ������ �� ���� ������� ����.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//����� ��� �������� �������� ����. ���������� �����!
	Orlan_AngriffWegenMiete = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Orlan_WETTKAMPFLAEUFT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 7;
	condition = DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information = DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important = TRUE;
};


func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && ((MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2)) || (Kapitel >= 4)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//��� �� ���, �������. � ���� ����.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//��� ���������?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//���������� '��� ���� ��������' �������-�� �����������.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//��� �������?
	if(!Mob_HasItems("CHEST_RUKHAR",ItFo_Booze) && Mob_HasItems("CHEST_RUKHAR",ItFo_Water) && (Rukhar_Won_Wettkampf == FALSE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//�� ���� ��� ��������. ������ ����� �� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//��� ������ ����� ������ ��������� � �������. ����� ��������� �������.
		Rukhar_Won_Wettkampf = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//� �������, ��� ���� � ��������� ���. � �� ����, ����� �������� ����������� � ���� ����. ������ ��� � ���� �� ����.
	}
	else if((Rukhar_Won_Wettkampf == FALSE) && !Npc_KnowsInfo(other,DIA_Orlan_EINGEBROCKT))
	{
		AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//�� ��, �������� �� ��� �������. ������ ��� ����� ���� ������������ � �������.
	};
	AI_StopProcessInfos(self);
	if(RangerMeetingRunning != LOG_Running)
	{
		Npc_ExchangeRoutine(self,"START");
	};
	if(Hlp_IsValidNpc(Randolph))
	{
		if((Kapitel < 4) || ((Kapitel >= 4) && (other.guild != GIL_KDF)))
		{
			if(Rukhar_Won_Wettkampf == TRUE)
			{
				B_StartOtherRoutine(Randolph,"WETTKAMPFRANDOLPHLOST");
			}
			else
			{
				B_StartOtherRoutine(Randolph,"START");
			};
		};
	};
	if(Hlp_IsValidNpc(Rukhar))
	{
		if(Kapitel < 4)
		{
			if(Rukhar_Won_Wettkampf == TRUE)
			{
				B_StartOtherRoutine(Rukhar,"WETTKAMPFRUKHARWON");
			}
			else
			{
				B_StartOtherRoutine(Rukhar,"WETTKAMPFRUKHARLOST");
			};
		};
	};
	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Orlan_EINGEBROCKT(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 8;
	condition = DIA_Orlan_EINGEBROCKT_Condition;
	information = DIA_Orlan_EINGEBROCKT_Info;
	important = TRUE;
};


func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (MIS_Rukhar_Wettkampf == LOG_Running) && (MIS_Rukhar_Wettkampf_Day > (Wld_GetDay() - 2)) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//�� ��, �������� �� ��� �������. ������ ��� ����� ���� ������������ � �������.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//������?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//���� �� ���������� ����� ��� ���� ����������, �����, ����� ����� ����������� �� ���� � ���. ��� ����� ��� �������, ���������?
};


instance DIA_Orlan_Perm(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 99;
	condition = DIA_Orlan_Perm_Condition;
	information = DIA_Orlan_Perm_Info;
	permanent = TRUE;
	description = "��� ���� � �������?";
};


func int DIA_Orlan_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//��� ���� � �������?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//������ � �����.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//���� ����� �� ��� ������ ����������� ���� ��������, ��� ��� ���� ������.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//�������, ��� ������ ���� ����� �����, �����, �����, ��� �������� ������� �������.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//����� ����� �� ������������ ������ ����������� ����.
	};
};


instance DIA_Orlan_Minenanteil(C_Info)
{
	npc = BAU_970_Orlan;
	nr = 3;
	condition = DIA_Orlan_Minenanteil_Condition;
	information = DIA_Orlan_Minenanteil_Info;
	description = "�� �������� �����?";
};


func int DIA_Orlan_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (OrlanMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//�� �������� �����?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//�������. �� ���� ������ ������, ���� ���� ���� ����������.
	B_GivePlayerXP(XP_Ambient);
};

