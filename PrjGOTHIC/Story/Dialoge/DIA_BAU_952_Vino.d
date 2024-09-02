
instance DIA_Vino_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vino_EXIT_Info()
{
	if((Kapitel < 3) && !Npc_HasEquippedArmor(other))
	{
		PlayerVisitedLobartFarmArmorless = TRUE;
	};
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_HALLO(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_HALLO_Condition;
	information = DIA_Vino_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vino_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//��� ��, ��� � ������. ������ �����, ����� ����, � ���� ��� ������ �� �������, �� ������ ������ ���� � ������ ���� ����� �����.
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//����������� �������� ������ ���� �����. �� � ����� ���������� � ���, ��� ��� �������� ���� ������� � ������ ����, ���� ���� ������� �� ���.
	};
};


instance DIA_Vino_SeekWork(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_SeekWork_Condition;
	information = DIA_Vino_SeekWork_Info;
	permanent = FALSE;
	description = "���� � ���-������ ������? � ��� ������.";
};


func int DIA_Vino_SeekWork_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lobart_WorkNOW) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG)) && !Npc_IsDead(Lobart) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//���� � ���-������ ������? � ��� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//� �� ������ ���-������ ������ � ������� �������?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//� ��� ��� ������ �����-��?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//��! � ����� ������... � �����, �� � ���� ���������, �������.
		AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//�� ���� �� ������ �������� �� ������� � �������� ��������� ��������, � ���� ������ ������������ ����. �� ������ ����� ����� ���� ����� �����!
		AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//�� �� �� ������ ����� �� ����, �������?
		if((Lobart_Kleidung_Verkauft == FALSE) && (Lobart_Kleidung_gestohlen == FALSE))
		{
			AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//�� ��������� ������ � ���� ������ ������ �������, ���� � ���� �������� �� �����.
			AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//���. � ���� ��� ��� ���� ������� ������, �� �� ������ �������� ��� � ������ ���-������ ������.
			AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//������� ��� ������� ����, � � ����� �������, ��� �� ����� ����� ���. (������� �������������)
			MIS_Vino_Wein = LOG_Running;
			Log_CreateTopic(TOPIC_Vino,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Vino,LOG_Running);
			B_LogEntry(TOPIC_Vino,"���� � ������� ���� ������� ����, �� ������ �������, ��� � ����� ���.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//� �� �����, ��� ���� ��� ����������. ������� ������ ��������� ���� �� ������� ������ ����� ������� ������, ��� � ���� ����������.
	};
};


instance DIA_Vino_BringWine(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_BringWine_Condition;
	information = DIA_Vino_BringWine_Info;
	permanent = FALSE;
	description = "��� ���� ����.";
};


func int DIA_Vino_BringWine_Condition()
{
	if((MIS_Vino_Wein == LOG_Running) && (Kapitel < 3))
	{
		if(Npc_HasItems(other,ItFo_Wine) || Npc_HasItems(other,ItFo_DarkWine))
		{
			return TRUE;
		};
	};
};

func void DIA_Vino_BringWine_Info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//��� ���� ����.
	MIS_Vino_Wein = LOG_SUCCESS;
	if(B_GiveInvItems(other,self,ItFo_Wine,1))
	{
		B_GivePlayerXP(XP_VinoWein);
	}
	else if(B_GiveInvItems(other,self,ItFo_DarkWine,1))
	{
		B_GivePlayerXP(XP_VinoWein * 2);
	};
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//�, �������, �� ���� ����������, ��� �� ���� ���, ������? (�������) ���� ��� �������?
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//�� ��� �����, �������.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//������ ������� ������ ������� � ����.
		};
	};
};


instance DIA_Vino_ToTheCity(C_Info)
{
	npc = BAU_952_Vino;
	nr = 3;
	condition = DIA_Vino_ToTheCity_Condition;
	information = DIA_Vino_ToTheCity_Info;
	permanent = FALSE;
	description = "� ����������� � �����.";
};


func int DIA_Vino_ToTheCity_Condition()
{
	if(PlayerEnteredCity == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vino_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//� ����������� � �����.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//�?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//�� ������ ���������� � ������ ���-������ ����������?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//���. �� ����� ��������� ����� � �����. ��������, �� ���-������ �����... ��, ���-������, ��� ����� �������������� ����.
};


var int Vino_Gossip_Orks;
var int Vino_Gossip_Bugs;

instance DIA_Vino_PERM(C_Info)
{
	npc = BAU_952_Vino;
	nr = 10;
	condition = DIA_Vino_PERM_Condition;
	information = DIA_Vino_PERM_Info;
	permanent = TRUE;
	description = "���� �����-������ ���������� �������?";
};


func int DIA_Vino_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vino_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//���� �����-������ ���������� �������?
	if((Vino_Gossip_Orks == FALSE) && (CityOrc_Killed_Day >= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//� ���� ����������, ��� ����� ���� ��� ���, �� ���� ����, ��� ��� �����.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//� ��� ��� � ���� ���� �� � ����� �������� ������.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if((Vino_Gossip_Bugs == FALSE) && (MIS_AndreHelpLobart == LOG_Running))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//��� �������� �������������� ��������� ��� ���� �������. ��� �������. ��� ������ ���, ��� �� ���������, ���� �� �� ������� ���-������.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//��������� ���� ����� � ����� � �����, ��������� � �����, � ��������� ����������, ����� ���� �� ���� ������ ������� ��� �������!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//�� �� �����, ��� � ����������. � ��� ��� � �� ���� ����� ��������.
		Vino_Gossip_Bugs = TRUE;
	}
	else if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//� ���������, ��������� ����� ��� ������������ �������. �������, ��� ��� ���� �� ���� �� �������.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//����� ����, ��� � ��� ������ ����? ���.
	};
};


instance DIA_Vino_DMTAMSTART(C_Info)
{
	npc = BAU_952_Vino;
	nr = 31;
	condition = DIA_Vino_DMTAMSTART_Condition;
	information = DIA_Vino_DMTAMSTART_Info;
	permanent = TRUE;
	description = "� ��� � ���� ����?";
};


func int DIA_Vino_DMTAMSTART_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


func void DIA_Vino_DMTAMSTART_Info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//� ��� � ���� ����?
	if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//��������. ��������� ����� ��� ������ ������������ �������.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//�������� ���������, ��� ��� ������� �� ������, ��� �� ����������� ���.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//��� ������� � ������ ����� �������. ���-������ ������ �������� �� �������� �� � ������.
	};
};


instance DIA_Vino_Obesessed(C_Info)
{
	npc = BAU_952_Vino;
	nr = 32;
	condition = DIA_Vino_Obesessed_Condition;
	information = DIA_Vino_Obesessed_Info;
	permanent = TRUE;
	description = "��� � �����?";
};


func int DIA_Vino_Obesessed_Condition()
{
	if((NpcObsessedByDMT_Vino == FALSE) && (Kapitel >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Vino_Obesessed_Info()
{
	AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//��� � �����?
	if(C_VinoDementorsDead())
	{
		self.aivar[AIV_NoFightParker] = FALSE;
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(�����) ����, ���� ��. ����� ��� ����� ����.
		AI_EquipBestMeleeWeapon(self);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RunFromRitual");
		if(!Npc_IsDead(DMT_Vino1))
		{
			DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino2))
		{
			DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino3))
		{
			DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino4))
		{
			DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
			DMT_Vino4.start_aistate = ZS_Stand_Dementor;
		};
	};
};


instance DIA_Vino_Heilung(C_Info)
{
	npc = BAU_952_Vino;
	nr = 55;
	condition = DIA_Vino_Heilung_Condition;
	information = DIA_Vino_Heilung_Info;
	permanent = TRUE;
	description = "�� ��� �� ����.";
};


func int DIA_Vino_Heilung_Condition()
{
	if((NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") >= 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_Heilung_oneTime;

func void DIA_Vino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//�� ��� �� ����.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//��� ������... � �� ���� ������ �������� ���.
	if(DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//�� ������ ������� � ���������. �������, ������ ��� ����, ������ ������ ����.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//�� �������? ������. � ���������.
		if(MIS_DementorsOrigins == FALSE)
		{
			Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
			MIS_DementorsOrigins = LOG_Running;
		};
		B_LogEntry(TOPIC_DEMENTOREN,"���� �������. � �������� ��� � ��������� �� �������. �������, �� ������ ��������� ���� �����.");
		B_NpcClearObsessionByDMT(self);
		B_StartOtherRoutine(Vino,"Kloster");
		B_GivePlayerXP(XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
};


instance DIA_Vino_PERM4OBSESSED(C_Info)
{
	npc = BAU_952_Vino;
	nr = 41;
	condition = DIA_Vino_PERM4OBSESSED_Condition;
	information = DIA_Vino_PERM4OBSESSED_Info;
	permanent = TRUE;
	description = "��� ��?";
};


func int DIA_Vino_PERM4OBSESSED_Condition()
{
	if((hero.guild == GIL_KDF) && (NpcObsessedByDMT_Vino == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//��, ��, ��� ��� ������. � �����, ����� ������ ������ ���. �� � ��� ��� �������� ���� �������� �������.
	if(DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//�� ������ ��������, �� ���� - ������ �� ����, ��� � ��������.
		B_GivePlayerXP(XP_Ambient);
		DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE;
	};
};


instance DIA_Vino_PERM45UND6(C_Info)
{
	npc = BAU_952_Vino;
	nr = 42;
	condition = DIA_Vino_PERM45UND6_Condition;
	information = DIA_Vino_PERM45UND6_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Vino_PERM45UND6_Condition()
{
	if((Kapitel >= 4) && (hero.guild != GIL_KDF) && (NpcObsessedByDMT_Vino == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM45UND6_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//���� �������?
	if((FoundVinosKellerei == TRUE) && (Vino_Complain == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//� ���������, ��������� ����� ��� ������������ �������. �������, ��� ��� ���� �� ���� �� �������.
		B_GivePlayerXP(150);
		Vino_Complain = TRUE;
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//����� ��� ������ ����� ������.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//��, ��������, ���� ���������� ��, ��?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//�����, ��� ����� ��� �������� �������� ���� ����� � �������������� � ��������� �� ����� �����.
	};
};

