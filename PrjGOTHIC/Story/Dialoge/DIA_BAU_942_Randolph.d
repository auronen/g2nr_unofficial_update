
instance DIA_Randolph_EXIT(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 999;
	condition = DIA_Randolph_EXIT_Condition;
	information = DIA_Randolph_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_SchwereLuft(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_SchwereLuft_Condition;
	information = DIA_Randolph_SchwereLuft_Info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int DIA_Randolph_SchwereLuft_Condition()
{
	if(Kapitel < 4)
	{
		if(!C_AkilFarmIsFree())
		{
			return TRUE;
		};
	};
};

func void DIA_Randolph_SchwereLuft_Info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//����... ��� ������ ���-������ ����� ������ �������� �����, �������� ����� ������... ��� ��� ���� ���������� - ��� ����� �� ��������.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//�� ������ ����������� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//� �� �������� � �������, ����� �������� �����. �� � ����� �� ��������� ������������� ��.
	if(Akils_SLDStillthere == FALSE)
	{
		Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
		B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
		Akils_SLDStillthere = TRUE;
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_HALLO(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 4;
	condition = DIA_Randolph_HALLO_Condition;
	information = DIA_Randolph_HALLO_Info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int DIA_Randolph_HALLO_Condition()
{
	if(C_AkilFarmIsFree() && (Kapitel < 4))
	{
		return TRUE;
	};
	if((Kapitel >= 4) && (other.guild == GIL_KDF) && (NpcObsessedByDMT_Randolph == TRUE) && Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//��� � �������?
	if(Npc_IsDead(Akil) && Npc_IsDead(Kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//������, ����� ���� � ���� ����������� � ������� ������, � ���� ��������� ���� ������.
		TOPIC_END_AkilsSLDStillthere = TRUE;
		B_CheckLog();
	}
	else if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//��, � � �������. ���� �������� ���������� ��� ������ � ������ � ������ ����. ������, ��� ��� ���������.
	};
	if(Kapitel < 4)
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//�� ���� � �� ��������� �� ������ - ��� ��� �� ���������� �������� ���� � �������.
	};
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	B_StartOtherRoutine(Akil,"Start");
	B_StartOtherRoutine(Kati,"Start");
};


instance DIA_Randolph_Baltram(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Baltram_Condition;
	information = DIA_Randolph_Baltram_Info;
	permanent = FALSE;
	description = "���� ������� ��������. � ������ ������� ����� ��� ����.";
};


func int DIA_Randolph_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (MIS_Baltram_ScoutAkil == LOG_Running) && Npc_IsDead(Akil) && Npc_IsDead(Kati) && (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//���� ������� ��������. � ������ ������� ����� ��� ����.
	if((Kapitel >= 4) && (hero.guild == GIL_KDF) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		CreateInvItems(self,ItMi_BaltramPaket,1);
		Lieferung_Geholt = TRUE;
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//������. � ��� ��� ����������. ��� ���� �����.
		B_GetBaltramPaket();
	};
};


instance DIA_Randolph_Geschichte(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_Geschichte_Condition;
	information = DIA_Randolph_Geschichte_Info;
	permanent = FALSE;
	description = "�� ���� ���������, ��?";
};


func int DIA_Randolph_Geschichte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//�� ���� ���������, ��?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//� ������ � ����� ��������. �����-�� ������ �������� � ���������, ��� �� �������� ����� ����, ����� �������� ���������� ����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//�� ����� � ������� ����, ��� ������� ���� �������� ������. � ��� ����������� ���� ����. ������� � ����� �������� � �����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//����� ���� ��������� ��������� �������, � � ����� �������� �� �����. � ���� ���� ������ � ������, ������ ��� ������.
};


instance DIA_Randolph_TAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 5;
	condition = DIA_Randolph_TAVERNE_Condition;
	information = DIA_Randolph_TAVERNE_Info;
	description = "�� ������� � �������?";
};


func int DIA_Randolph_TAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_HALLO) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//�� ������� � �������?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//�����.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//�� ������ � �� ���� ��������� ���� ������ ����.
};


instance DIA_Randolph_WASISTINTAVERNE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 6;
	condition = DIA_Randolph_WASISTINTAVERNE_Condition;
	information = DIA_Randolph_WASISTINTAVERNE_Info;
	description = "� ��� ��� ����������, � �������?";
};


func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_TAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//� ��� ��� ����������, � �������?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//��� �������� �������� ����.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//���� ����������� ���� � ������. ���, ��� ����� ������ ������ ���� - ���������.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//� ��������� ����� � ������ ����������, � ������ � ���� ������ �� �������� �����.
	if(TaverneTopicStarted == FALSE)
	{
		Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
		B_LogEntry(TOPIC_Wettsaufen,"� ������� ����� ��������� ����.");
		TaverneTopicStarted = TRUE;
	};
};


instance DIA_Randolph_GEGENWEN(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 7;
	condition = DIA_Randolph_GEGENWEN_Condition;
	information = DIA_Randolph_GEGENWEN_Info;
	description = "� ��� �� ������������?";
};


func int DIA_Randolph_GEGENWEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASISTINTAVERNE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_GEGENWEN_Info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//� ��� �� ������������?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//� �������, ���� ������ ������������. �� ������ �������� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//�� � ���� ���� ����������, ��� ��� ������� ������ ��� ����� ����������� � ��� ���� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//� �����, �� ������ ���� � ����� �������� �������. ��� ������!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//���-������ ������ ��������� ���� � ��� ������� �� ����. ����� �� ����� ��������� �� � ��� ���� ������� �����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//���� �� ������ � ���� ���� ������, ����� ��������� � ��� ��� ���.
	B_LogEntry(TOPIC_Wettsaufen,"�������� ��������� ��� � ������ � ���������� '��� ���� ��������'. � ��������� ������������ �����, ����� ��������� ���� � ������� ��� ���.");
	Log_AddEntry(TOPIC_Wettsaufen,"�������� ����������� ������ � ������������ � ���������� '��� ���� ��������'. �������� ����� �� ��������� ������� ����� � ������� ������ �� ������� � �����.");
};


instance DIA_Randolph_WASBRAUCHSTDU(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 8;
	condition = DIA_Randolph_WASBRAUCHSTDU_Condition;
	information = DIA_Randolph_WASBRAUCHSTDU_Info;
	description = "������� ����� ���� ����� ��� ����� ����������?";
};


func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && (MIS_Rukhar_Wettkampf == LOG_Running) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//������� ����� ���� ����� ��� ����� ����������?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 �������.
};


instance DIA_Randolph_ICHGEBEDIRGELD(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 9;
	condition = DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information = DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent = TRUE;
	description = "� ��� ���� ������, ����� �� �������� � �������.";
};


var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_WASBRAUCHSTDU) && (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE) && (Kapitel < 4) && !Npc_IsDead(Rukhar))
	{
		return TRUE;
	};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//� ��� ���� ������, ����� �� �������� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(�����������) ������? �������� �������. � ����� ����� �� ����.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//���� � ����� ��������, � ���� ����� ���� �� � ����������. ��� ��������.
		B_LogEntry(TOPIC_Wettsaufen,"���� ���������. ���������� ������� � ������� '������� ������'.");
		B_GivePlayerXP(XP_Randolph_WettkampfStart);
		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;
		B_NpcClearObsessionByDMT(self);
		MIS_Rukhar_Wettkampf_Day = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		B_StartOtherRoutine(Rukhar,"Wettkampf");
		if(RangerMeetingRunning != LOG_Running)
		{
			B_StartOtherRoutine(Orlan,"Wettkampf");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//�� �����. � ���� ���� �����-�� ���.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_WETTKAMPFZUENDE(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 10;
	condition = DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information = DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent = TRUE;
	description = "��������?";
};


func int DIA_Randolph_WETTKAMPFZUENDE_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Kapitel < 4))
	{
		return TRUE;
	};
};


var int DIA_Randolph_WETTKAMPFZUENDE_OneTime;

func void B_Randolph_SuccessPay()
{
	AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//���, �������, ����������. ������� ��� ��� �� ������. ���, ������ �� �����.
	CreateInvItems(self,ItMi_Gold,20);
	B_GiveInvItems(self,other,ItMi_Gold,20);
	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);
};

func void DIA_Randolph_WETTKAMPFZUENDE_Info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//��������?
	if(Rukhar_Won_Wettkampf == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//�� ��, ����� ������ �� ���������. � � �� ���� ���������� �� ����. � ������ ����� � ��� �� ������, �������!
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//���� ������ �������. ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//���. � �������� ���� �������, ������.
		if(DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
		{
			B_Randolph_SuccessPay();
			DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//������, ����� �� ����� ��� ��������� ����� �����.
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Randolph_PERM(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 30;
	condition = DIA_Randolph_PERM_Condition;
	information = DIA_Randolph_PERM_Info;
	permanent = TRUE;
	description = "�� � �������?";
};


func int DIA_Randolph_PERM_Condition()
{
	if((Kapitel >= 4) && (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Randolph_PERM_OneTime;
var int DIA_Randolph_SoberForever;

func void DIA_Randolph_PERM_Info()
{
	AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//�� � �������?
	if(hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(MIS_HealRandolph == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//� ��� ��� �������� �������� � �����, �� ��� ��� ����� �����.
		}
		else if(MIS_HealRandolph == LOG_Running)
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//��� �����. ������ ���, ����� � �������� ����, ��� �������� ������� ����. ��� ����� ����� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//��� �����. ������ ���, ����� � �������� ����, ��� �������� ������� ����. ��� ����� ����� ������.
			AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//�� ���� ���������, ������� ����� ������.
			AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//�������, ������-������������, ��� �������� ��� ��� ����. �� � �� �����, ��� ������ ����� ��������� �� ��� ���. ��� ������� ����.
			MIS_HealRandolph = LOG_Running;
			Log_CreateTopic(TOPIC_HealRandolph,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph,LOG_Running);
			B_LogEntry(TOPIC_HealRandolph,"��������, ������, ����� ������� ���� � ������ ���� � ������� �� ���������� �� ����������� ��������.");
		};
	}
	else if((DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE) && (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE))
	{
		if(Rukhar_Won_Wettkampf == TRUE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//���� ������ �������. ������.
		}
		else
		{
			B_Randolph_SuccessPay();
		};
		DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//� ������ ����� � ��� �� ������. ������ �� � ���� �����. �� ������ ��� ��������, ������.
		DIA_Randolph_SoberForever = TRUE;
	};
};


instance DIA_Randolph_PAYME(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_PAYME_Condition;
	information = DIA_Randolph_PAYME_Info;
	description = "�� ������ ����, �� ��� �����...";
};


func int DIA_Randolph_PAYME_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Randolph_PAYME_Info()
{
	AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//�� ������ ����, �� ��� �����, � �� �����������, ��� ��� ��������� ����� �������?!
	AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//������� ����� 300 ������� �� ����.
	AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//� ���� ���� ���� ������ 150 �������. ����������. �� ������ ������ ���. ����������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
};


instance DIA_Randolph_SAGITTAHEAL(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 56;
	condition = DIA_Randolph_SAGITTAHEAL_Condition;
	information = DIA_Randolph_SAGITTAHEAL_Info;
	description = "�����. ��� �������� ���� ��������.";
};


func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && Npc_HasItems(other,ItPo_HealRandolph_MIS))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//�����. ��� �������� ���� ��������.
	B_GiveInvItems(other,self,ItPo_HealRandolph_MIS,1);
	B_UseItem(self,ItPo_HealRandolph_MIS);
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//��! �������, ����. ������ � ����� ���� �� �������.
	MIS_HealRandolph = LOG_SUCCESS;
	if(!Npc_KnowsInfo(other,DIA_Randolph_PAYME))
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//� �����, ��� ��������� ����� ����� ������ ������ ��� ������ ����. �� �����, ��� ���, ��� � ���� ����.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_GivePlayerXP(XP_HealRandolph);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//��� � ���� ��������� ���� �� ���?
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//� �������� �� ���� ���� �����. ���� ������ ��������� ����� ����� �� ����� �������������� ��� �������.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//��, � ����� ������ ��� �������, ��� � �������� ������ ������������� ��������, ���� ��� �� �������?
		}
		else
		{
			AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//� ���� ��� �����. �� �� ������ ������������ �� ��� ��������� �������������.
		};
		B_GivePlayerXP(XP_HealRandolph / 2);
	};
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Randolph_Heilung(C_Info)
{
	npc = BAU_942_Randolph;
	nr = 55;
	condition = DIA_Randolph_Heilung_Condition;
	information = DIA_Randolph_Heilung_Info;
	permanent = TRUE;
	description = "�������� ������� ���� � ������, ��?";
};


func int DIA_Randolph_Heilung_Condition()
{
	if((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Heilung_Info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//�������� ������� ���� � ������, ��?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//� ������ ����� � ��� �� ������. ������ �� � ���� �����. �� ������ ��� ��������, ������.
	B_NpcClearObsessionByDMT(self);
	if(Randolph_ExchangeRoutine_Once == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		Randolph_ExchangeRoutine_Once = TRUE;
	};
};

