
instance DIA_Addon_Nefarius_EXIT(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 999;
	condition = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_Hallo(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 1;
	condition = DIA_Addon_Nefarius_Hallo_Condition;
	information = DIA_Addon_Nefarius_Hallo_Info;
//	description = "��� ����?";
	important = TRUE;
};


func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
//	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//� ��� �� ����� �������? ��� ��� �������!
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//� �����, �� �����.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//�����.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//��-�� ���� �������� ������� ���, �� ������ �� ����? �������� ���� �� ������ - �� ������� ��������� ������ ��� �� ����.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "��� ��� �� ������?";
};


func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//�� �������, ��� �� ����� � ���������� ������, � ������� ��������� ����� ������� �����������.
	if(Portal_Activated == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//�� ���� �� �������� ��������� ���� ������������� ����� �����.
		AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//������� ������ ����� ������������ ��� ���������� �� �������. ����� ���������...
	};
	if(SC_KnowsPortal == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_KDW,"���� ���� �������, ��� �� �������� ��������� ������� ���������� �����.");
		SC_KnowsPortal = TRUE;
	};
};


func void B_Nefarius_PortalKeyTip()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//���� ������ ����� ����� � ������������ ���������� ����� � ��������.
};

instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "�� ������, ��� ������������ ������?";
};


func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_keineahnung) && (Portal_Activated == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//�� ������, ��� ������������ ������?
	if(RitualRingRuns != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//������, ��� ��������� ����� ��������� ������������ � ����.
		AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//��-�� � ����� ���, ����� ������� ������.
	};
	B_Nefarius_PortalKeyTip();
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "� ������ ����� ���������.";
};


func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//� ������ ����� ���������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//������? ��� ������������.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//�� ������, ��� ��������� �����?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//���� ������ ������� ���������, ���� ��� �������� �� ������ �����.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//��� ����� ��� ��� ��������� �� �������...
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//� ������� ���������� ��� ������� ������������ ��������� �������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//��� ��������� �� �����, ��� ���� �������� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//��� ����� � ������� ��� �� ���� �����.
	CreateInvItems(self,ItWr_Map_NewWorld_Ornaments_Addon,1);
	B_GiveInvItems(self,other,ItWr_Map_NewWorld_Ornaments_Addon,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"���� ���� ����� ������, ������� ����� � ����������� ����� ��������.");
	Log_AddEntry(TOPIC_Addon_Ornament,"�������� ����� ������������ ������ ��� ������ ����������� ������. ��� ��� ��� �� ������� ���� ������ ����� ������. � ������ ����� ��. �� ��� ��� �����, �� ������� �������� �����, ��� � ������ ������ ���������.");
	SC_KnowsPortal = TRUE;
	if((Kapitel >= 3) && (hero.guild == GIL_KDF) && (Vino_isAlive_Kap3 == TRUE) && !C_VinoDementorsDead())
	{
		B_StartOtherRoutine(Cavalorn,"OrnamentSteinringCh3KDF");
	}
	else
	{
		B_StartOtherRoutine(Cavalorn,"OrnamentSteinring");
	};
	if(!Npc_IsDead(Ambusher_1013) && (Bdt_1013_FromCavalorn == TRUE) && (Bdt_1013_ToCavalorn == FALSE))
	{
		Npc_ExchangeRoutine(Ambusher_1013,"AWAY");
		Bdt_1013_ToCavalorn = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//�� ������ ������ ����� ����� ������ ���.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//������� �������� �� ������� ���������. ��� ����� ���� ����������������, �� ��� �� ����� �����������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//��� ����� ���� ��� ������: �����, ���� ������, �������� ��� ���-������ ��������.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//�� � ���� ��� ��������? �� ��� ��� �������. �����!
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "��� ���� �������� ��� ������?";
};


func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//��� ���� �������� ��� ������?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//���, ��� ������ ���, �� �����, ����� ������ ������� �����.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//��� ������ � ������ ��� �������, ��� ������ ���������, ��� ����� ���� ����������� �� ���� ��������.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//� ��� ���� ������ ������� ������� ������ � ���� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//�� �� �����, ��� ��� ��� ����, �� ����� ������� ��� ����� �� ��������...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "������ ��������� ����������...";
};


func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};


var int MissingOrnamentsCounter;

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	var int amount;
	amount = Npc_HasItems(other,ItMi_Ornament_Addon);
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//������ ��������� ����������...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//��?
	if(amount > 0)
	{
		if(amount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//� ����� ��� ����.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//� ����� ��.
		};
		B_GiveInvItems(other,self,ItMi_Ornament_Addon,amount);
		B_RemoveEveryInvItem(self,ItMi_Ornament_Addon);
		MissingOrnamentsCounter += amount;
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//�������!
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//���, ������ � ������� ��� ������.
		B_GiveInvItems(self,other,ItMi_Gold,NefariusMissingOrnamentsOffer * amount);
		B_GivePlayerXP(XP_Addon_BringMissingOrnament * amount);
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//�������� ����� ��� ���. �����, �� ����������.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//����� ��� ����, � ��� ����� � ��� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//������ � ��� ���� ��� �����. �������� �� �������.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//�� ���������� ���� ������������ ����, ����� ������� �� ���������� ������.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//������ �� ����!
			B_LogEntry(TOPIC_Addon_Ornament,"� ������ ��� ����� ������ ���������. ������ ���� ���� ������ ������� ������.");
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//�������, ������� ����� ����������?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//������...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//�� ������� ���������� ��������� � ������, ������� � ������� �� �����.
	};
};


instance DIA_Addon_Nefarius_Ringritual(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Ringritual_Condition;
	information = DIA_Addon_Nefarius_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//� ������ ������ �����.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(Saturas_NW,"Ringritual");
	B_StartOtherRoutine(Cronos_NW,"Ringritual");
	B_StartOtherRoutine(Myxir_NW,"Ringritual");
	B_StartOtherRoutine(Riordian_NW,"Ringritual");
	B_StartOtherRoutine(Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarius_RingRitualEnds(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if(!Npc_RefuseTalk(self) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//�������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//�� ������ ��� ����������� ���������, ������� �� ����������� ���� ����� �������� ���� � ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//��� � �������� � ������ � ���� ������.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//�������, ������ ���������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(Saturas_NW,"Start");
	B_StartOtherRoutine(Cronos_NW,"Start");
	B_StartOtherRoutine(Myxir_NW,"Start");
	B_StartOtherRoutine(Riordian_NW,"Start");
	B_StartOtherRoutine(Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"���������� ������ �������������. � ������ ������� ��� � ��������.");
};


instance DIA_Addon_Nefarius_OpenedPortal(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_OpenedPortal_Condition;
	information = DIA_Addon_Nefarius_OpenedPortal_Info;
	description = "��� ������?";
};


func int DIA_Addon_Nefarius_OpenedPortal_Condition()
{
	if(RitualRingRuns == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_OpenedPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//��� ������?
	if(Portal_Activated == FALSE)
	{
		B_Nefarius_PortalKeyTip();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//���� �� �����? ������ � ������.
	};
};

