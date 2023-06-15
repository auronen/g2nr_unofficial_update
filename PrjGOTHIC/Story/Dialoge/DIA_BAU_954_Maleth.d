
instance DIA_Maleth_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v2;
};


func int DIA_Maleth_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_EXIT_Info()
{
	DIA_Common_IHaveToGo_v2();
	AI_WaitTillEnd(self,other);
	AI_StopProcessInfos(self);
	B_InsertMalethWolf();
};


func void B_MalethArmorComment()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//�� �������� ��������� ����������, ����� ������ ��� �������� �����.
	AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//�� � ������ �� ����� �� ��������!
	MalethArmorComment = TRUE;
};

instance DIA_Maleth_Hallo(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_Hallo_Condition;
	information = DIA_Maleth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Maleth_Hallo_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//������, ���������!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//� �����, ��� �� ��������� � ���.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//���� �������, ��� �� �� ������ ��� ������ �����.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//�� �� ������� ���� �� ������� ����������. � � ���� � ��� �������� ��������!
	};
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//�� ��������� ��������� ����������.
		PlayerVisitedLobartFarmArmorless = TRUE;
	}
	else if(PlayerVisitedLobartFarmArmorless == TRUE)
	{
		B_MalethArmorComment();
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(�����������) ��� ���� ����� �����?
};


instance DIA_Maleth_BANDITS(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BANDITS_Condition;
	information = DIA_Maleth_BANDITS_Info;
	permanent = FALSE;
	description = "�� ���� ������ ������� � �����.";
};


func int DIA_Maleth_BANDITS_Condition()
{
	if((Kapitel < 3) && (Npc_KnowsInfo(other,DIA_BDT_1013_BANDIT_WHERE) || Npc_KnowsInfo(other,DIA_BDT_1014_BANDIT_KILLER) || Npc_KnowsInfo(other,DIA_1015_BANDIT_AMBUSH) || Npc_IsDead(Ambusher_1013) || Npc_IsDead(Ambusher_1014) || Npc_IsDead(Ambusher_1015) || Npc_KnowsInfo(other,DIA_Addon_Cavalorn_LETSKILLBANDITS) || (BragoBanditsAttacked == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//�� ���� ������ ������� � �����.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//��� ������� �������! ���, ��������, �� �� �������, ��� ����� � ��� ���� ������� �����!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//���� ��� ����� �������. ����� ���� ������� ���� �� ��� �����.
};


instance DIA_Maleth_BanditsDEAD(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsDEAD_Condition;
	information = DIA_Maleth_BanditsDEAD_Info;
	permanent = FALSE;
	description = "��� ������� ������ �� ����� ���������� ���...";
};


func int DIA_Maleth_BanditsDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_BANDITS))
	{
		if(C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Maleth_BanditsDEAD_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//��� ������� ������ �� ����� ���������� ���...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//������? ��� ������?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//��� �� �� ���� ������...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//����� ������! ��� - ����� �������, �� � ����, ����� �� ������ ���!
	B_GiveInvItems(self,other,ItFo_Wine,3);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//� �������� ��������� �� ����!
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_MalethKillBandits);
};


instance DIA_Maleth_BanditsALIVE(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsALIVE_Condition;
	information = DIA_Maleth_BanditsALIVE_Info;
	permanent = FALSE;
	description = "� ����, ��� �������� ��� �������...";
};


func int DIA_Maleth_BanditsALIVE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_BANDITS) && (MIS_Maleth_Bandits != LOG_SUCCESS))
	{
		if(!C_BragoBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Maleth_BanditsALIVE_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//� ����, ��� �������� ��� �������...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//�� ������ ������� �� ���? � � ����� ���� �� �����! ��� ������� ������!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//����� ����, ��� ����� ������������� �� ������!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//�� ���� �� �������, ��� ������ �������� ��� �� ���� ��������, ��� �� ���� ����� ����� ����� ���������� ����.
	MIS_Maleth_Bandits = LOG_Running;
	Log_CreateTopic(TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Maleth,LOG_Running);
	B_LogEntry(TOPIC_Maleth,"���� � �������� ��������, ������������ �� ������� �� ����� �������� � ����� �������, ��� ��������� ����� ����� ����� ���������� ���.");
};


instance DIA_Maleth_ToTheCity(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_ToTheCity_Condition;
	information = DIA_Maleth_ToTheCity_Info;
	permanent = FALSE;
	description = "� ��� � �����.";
};


func int DIA_Maleth_ToTheCity_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//� ��� � �����.
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//�������� ��, ��� �� ���������, ���� �������� ��������� ������, ����� ������� � �����.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//� �� ������ �����, ��� ��� ����� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//��� ����� �������� ���� - ���� �� ������� �� ��, ��� ��� ����� ��������...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//� ��� ���?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//��, ��������, ��� �� � ����� ������� � ����� � ���������� �������.
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE) && (PlayerEnteredCity == FALSE))
	{
		Log_CreateTopic(TOPIC_City,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_City,LOG_Running);
		B_LogEntry(TOPIC_City,"����� ������� � �����, � ���� ������� ���������� � �����, ��� � ��� � ����� ������� � ���� �������� �������.");
	};
	if(VisibleGuild(other) != GIL_BAU)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//�� ��� ���� �� �������. �� �� ����� �� �������.
		Log_AddEntry(TOPIC_City,"�������, � ������ ���� ����� �� �������.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//�������.
};


instance DIA_Maleth_Equipment(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_Equipment_Condition;
	information = DIA_Maleth_Equipment_Info;
	permanent = FALSE;
	description = "��� ����� ����������!";
};


func int DIA_Maleth_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//��� ����� ����������!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//���� �����������. �� � ������ ����� ����: � ��� ��� ������, ��� �� ����� �� ����������!
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//����, ���� �� ������ ���������, ������ ������� ���� ���-���.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//��, ��� �� ������ ����� � ���� � ��������, ��� �� � ���� �����-������ ������.
	};
};


instance DIA_Maleth_LOBART(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_LOBART_Condition;
	information = DIA_Maleth_LOBART_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int DIA_Maleth_LOBART_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Equipment) && !Npc_IsDead(Lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//�� �����, ������� ��! ��� ���� ��� �����!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//� �� ������� ������ ���! �� ����� � ��������� � ����� ��� ����� ������������.
};


instance DIA_Maleth_KAP3_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP3_EXIT_Condition;
	information = DIA_Maleth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP3_EXIT_Info()
{
	if((PlayerVisitedLobartFarmArmorless == TRUE) && (MalethArmorComment == FALSE))
	{
		B_MalethArmorComment();
	};
	B_InsertMalethWolf();
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PROBLEME(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 30;
	condition = DIA_Maleth_PROBLEME_Condition;
	information = DIA_Maleth_PROBLEME_Info;
	description = "������ ������ � ��������� �����?";
};


func int DIA_Maleth_PROBLEME_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_PROBLEME_Info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//������ ������ � ��������� �����?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//������ ��� �� ������ � �����.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//���� �� ������� �������� � ������ ����, �� �������, ��� ������.
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"��� ���� ����?",DIA_Maleth_PROBLEME_schafe);
	Info_AddChoice(DIA_Maleth_PROBLEME,"���� � ������ ����� � ��� ��� �� ������������?",DIA_Maleth_PROBLEME_beidir);
};

func void DIA_Maleth_PROBLEME_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//���� � ������ ����� � ��� ��� �� ������������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//��. ��� ���� ����� ��������� ���� �����. ��� �������� ���, ��� ����� �������� �� ���.
};

func void DIA_Maleth_PROBLEME_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(���) ��� ����� ��� ���� ����������. � ���� ���� ��������.
	Info_AddChoice(DIA_Maleth_PROBLEME,"��� ��������? �� ��� �� ������ �� ����?",DIA_Maleth_PROBLEME_schafe_probleme);
};

func void DIA_Maleth_PROBLEME_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//��� ��������? �� ��� �� ������ �� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(�����) �� ������� � ��������� ������ ��� ���? ����� ������ ���-������ � ����� ��������� � ������ �����.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(���) ��, ������� ��������, ������� ������ �� �����: ��� ���������� ������ ������ ����� � ���� �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//��, �������������� ���� �� ���������, ������ ���-������ ������� � ����� ������� � ������ �����.
	};
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"��, ������� �� ���������, ��������.",DIA_Maleth_PROBLEME_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Maleth_PROBLEME,"��� � ���� �� ��������?",DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag);
	};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//��� � ���� �� ��������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//����� ����� ��� ����������� �����, ��� ���� ������ ��� ��������� ������ �����.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//� ������ �� �����. � ���� ������, ��� ��� ����� � ��� ��� ������.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//� ��-�� ����� �� ��� ������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//���� ����� ��������, ��� �� �� ���� ����� ������.
	Log_CreateTopic(TOPIC_MalethsGehstock,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock,LOG_Running);
	B_LogEntry(TOPIC_MalethsGehstock,"����� ������� � ������� � ������� ���� �����. ��������� � ���� ���, �� ������� �� ������ ������ �� ����� �������. ��������, � ����� ���� ����� ���-������ ����������.");
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//��, ������� �� ���������, ��������.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//�� ������ � ������, ��� �������. ����� ����� ���� ����.
};

func void DIA_Maleth_PROBLEME_Back()
{
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};


instance DIA_Maleth_GEHSTOCK(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_GEHSTOCK_Condition;
	information = DIA_Maleth_GEHSTOCK_Info;
	description = "� �����, ��� ���� �����.";
};


func int DIA_Maleth_GEHSTOCK_Condition()
{
	if(Npc_HasItems(other,ItMw_MalethsGehstock_MIS) && Npc_KnowsInfo(other,DIA_Maleth_PROBLEME))
	{
		return TRUE;
	};
};

func void DIA_Maleth_GEHSTOCK_Info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//� �����, ��� ���� �����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//��� ����������! �...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//���������. ������� ������� �� ����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//��... � ���� ����� ������ ���.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//����� �������� ���-������ ���.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//������. ��� ������ �����? ����� � �����, ��� ���� ��������� ������� � ����������� ������� ������.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//���� � ����� ����, ��� ��� ������ ���� ���������, � ������ ��� ����� �����?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP(XP_FoundMalethsGehstock);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"������, ��� ��� �� ���������. � ���� �������� ������ �� ����.",DIA_Maleth_GEHSTOCK_gold);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"������.",DIA_Maleth_GEHSTOCK_ok);
};

func void DIA_Maleth_GEHSTOCK_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//������.
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//�����. ������ ��� �� �����, ��� � ���� ����. ��� �� ������� ������.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//� ������ ����� �� ��������� ������� ���-������.
	if(!Npc_IsDead(BDT_1024_MalethsBandit))
	{
		B_LogEntry(TOPIC_MalethsGehstock,"����� ��������� ���, ��� � ������ � ������ �� ����� ������� ��������� ������� ��������.");
		CreateInvItems(BDT_1024_MalethsBandit,ItMi_MalethsBanditGold,1);
	}
	else
	{
		B_LogEntry(TOPIC_MalethsGehstock,"����� ��������� ���, ��� � ������ � ������ �� ����� ������� ��������� ������� ��������. ����� ����������� �������� ���.");
		Wld_InsertItem(ItMi_MalethsBanditGold,"FP_ITEM_FARM1_02");
	};
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos(self);
};

func void DIA_Maleth_GEHSTOCK_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//������, ��� ��� �� ���������. � ���� �������� ������ �� ����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//��� ���, ��� � ���� ����. ����� ������ ���� ����������.
	CreateInvItems(self,ItMi_Gold,35);
	B_GiveInvItems(self,other,ItMi_Gold,35);
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
};


instance DIA_Maleth_PERM3(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_PERM3_Condition;
	information = DIA_Maleth_PERM3_Info;
	permanent = TRUE;
	description = "������, �� �����������.";
};


func int DIA_Maleth_PERM3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_PROBLEME) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Maleth_PERM3_Info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//������, �� �����������.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(�������) ����������.
	AI_StopProcessInfos(self);
};

