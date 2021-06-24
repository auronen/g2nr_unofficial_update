
func void B_UpdateBennetItemsCount()
{
	if((Bennet_ItemsGiven_Chapter_1 == TRUE) && (Kapitel == 1))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
	};
	if((Bennet_ItemsGiven_Chapter_2 == TRUE) && (Kapitel == 2))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
	};
	if((Bennet_ItemsGiven_Chapter_3 == TRUE) && (Kapitel == 3))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
	if((Bennet_ItemsGiven_Chapter_4 == TRUE) && (Kapitel == 4))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
	if((Bennet_ItemsGiven_Chapter_5 == TRUE) && (Kapitel == 5))
	{
		Bennet_NW_ItMi_Swordraw_Count = Npc_HasItems(self,ItMiSwordraw);
		Bennet_NW_ItMi_Nugget_Count = Npc_HasItems(self,ItMi_Nugget);
	};
};

var int Bennet_Kap1Smith_Alt;
var int Bennet_Kap2Smith_Alt;
var int Bennet_Kap3Smith_Alt;
var int Bennet_Kap4Smith_Alt;
var int Bennet_Kap5Smith_Alt;

var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;

func int C_Bennet_HaveNewWeapons()
{
	if(Bennet_TeachSmith == TRUE)
	{
		if(AlternativeSmithing == FALSE)
		{
			if((Kapitel == 2) && (Bennet_Kap2Smith == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Bennet_Kap3Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel < 5) && (MIS_ReadyforChapter4 == TRUE) && (Bennet_Kap4Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel >= 5) && (Bennet_Kap5Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			};
		}
		else
		{
			if((Kapitel == 1) && (Bennet_Kap1Smith_Alt == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel == 2) && (Bennet_Kap2Smith_Alt == FALSE))
			{
				return TRUE;
			}
			else if((Kapitel < 5) && (Bennet_Kap3Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			}
			else if((Kapitel >= 5) && (Bennet_Kap5Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
			{
				return TRUE;
			};
		};
	};
	return FALSE;
};

func void DIA_Bennet_SmithComment1()
{
	AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//� ���� ������� ���� ������ ���������� ���� � ���� ��������� ������.
};

func void DIA_Bennet_SmithComment2()
{
	AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//� ������� ��������������, � ������ � ���� ������� ����, ��� ������ ���������� � ������� ��������� ���������� ����.
};

func void DIA_Bennet_SmithComment3()
{
	AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03_add");	//��� ����� ���������� ������! ��� ������, ��� � ���� ������ ������.
};

func void DIA_Bennet_SmithComment4()
{
	AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//��������. �� ���� ������ ��� �������� �����������. ���������� ������, �������� ������ �������. � � ����� ����, ��� ���������� ���!
	AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(����������) � �� ������ ������?
};

instance DIA_Bennet_AnnounceNewWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 10;
	condition = DIA_Bennet_AnnounceNewWeapons_Condition;
	information = DIA_Bennet_AnnounceNewWeapons_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bennet_AnnounceNewWeapons_Condition()
{
	if(C_Bennet_HaveNewWeapons())
	{
		return TRUE;
	};
};

func void DIA_Bennet_AnnounceNewWeapons_Info()
{
	if(AlternativeSmithing == FALSE)
	{
		if((Kapitel == 2) && (Bennet_Kap2Smith == FALSE))
		{
			DIA_Bennet_SmithComment1();
			Bennet_Kap2Smith = TRUE;
		}
		else if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Bennet_Kap3Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			DIA_Bennet_SmithComment2();
			Bennet_Kap3Smith = TRUE;
		}
		else if((Kapitel < 5) && (MIS_ReadyforChapter4 == TRUE) && (Bennet_Kap4Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			DIA_Bennet_SmithComment3();
			Bennet_Kap4Smith = TRUE;
		}
		else if((Kapitel >= 5) && (Bennet_Kap5Smith == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			DIA_Bennet_SmithComment4();
			Bennet_Kap5Smith = TRUE;
		};
	}
	else
	{
		if((Kapitel == 1) && (Bennet_Kap1Smith_Alt == FALSE))
		{
			DIA_Bennet_SmithComment1();
			Bennet_Kap1Smith_Alt = TRUE;
		}
		else if((Kapitel == 2) && (Bennet_Kap2Smith_Alt == FALSE))
		{
			DIA_Bennet_SmithComment2();
			Bennet_Kap2Smith_Alt = TRUE;
		}
		else if((Kapitel < 5) && (Bennet_Kap3Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			DIA_Bennet_SmithComment3();
			Bennet_Kap3Smith_Alt = TRUE;
		}
		else if((Kapitel >= 5) && (Bennet_Kap5Smith_Alt == FALSE) && Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
		{
			DIA_Bennet_SmithComment4();
			Bennet_Kap5Smith_Alt = TRUE;
		};
	};
};


instance DIA_Bennet_EXIT(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 999;
	condition = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bennet_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_EXIT_Info()
{
	B_EquipTrader(self);
	B_UpdateBennetItemsCount();
	if(C_Bennet_HaveNewWeapons())
	{
		DIA_Bennet_AnnounceNewWeapons_Info();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Bennet_HALLO(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 1;
	condition = DIA_Bennet_HALLO_Condition;
	information = DIA_Bennet_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_HALLO_Condition()
{
	if((Kapitel < 3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bennet_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//� �� ������ ������. ����� �������. �� ��������� � ���� �����.
	if(Khaled_weiter == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTrader,"����� - �������� �������.");
	};
};


instance DIA_Bennet_TRADE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 700;
	condition = DIA_Bennet_TRADE_Condition;
	information = DIA_Bennet_TRADE_Info;
	permanent = TRUE;
	description = "� ��� ������ ���������� �����������?";
	trade = TRUE;
};


func int DIA_Bennet_TRADE_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info()
{
	if(Bennet_flag == TRUE)
	{
		B_ClearSmithInv(self);
		if(Bennet_swordraws > 0)
		{
			CreateInvItems(self,ItMiSwordraw,Bennet_swordraws);
		};
		Bennet_flag = FALSE;
	};
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//� ��� ������ ���������� �����������?
	B_GiveTradeInv(self);
	if(TradersHaveLimitedAmmo == TRUE)
	{
		if(Bennet_Ammo_Day <= Wld_GetDay())
		{
			B_RefreshAmmo(self,50);
	 		Bennet_Ammo_Day = Wld_GetDay() + 1;
		};
	}
	else
	{
		B_RefreshAmmo(self,50);
	};
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//��� ���� �����?
	if(BennetLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTrader,"������ ������� ��������� ����������.");
		BennetLOG = TRUE;
	};
	if(!Npc_HasItems(self,ItMw_1H_Mace_L_04) && !Npc_HasItems(other,ItMw_1H_Mace_L_04) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		CreateInvItems(self,ItMw_1H_Mace_L_04,1);
	};
	Trade_IsActive = TRUE;
};


instance DIA_Bennet_WhichWeapons(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 2;
	condition = DIA_Bennet_WhichWeapons_Condition;
	information = DIA_Bennet_WhichWeapons_Info;
	permanent = FALSE;
	description = "����� ������ �� �������?";
};


func int DIA_Bennet_WhichWeapons_Condition()
{
	if(((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)) && (MIS_Bennet_BringOre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhichWeapons_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//����� ������ �� �������?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//������ - ������� ����. ������ ������.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//�� ���� �� � ���� ���� ���������� ����, � ��� �� �������� ������, ������������� ����� ��� �� ������� �����.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//�� �������� �� ������, ��� ����� ��������� ����? (�������) ����� ��� � ������ ��������, � ���� � ����.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//���.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//������� ��, �� ������.
};


instance DIA_Bennet_BauOrSld(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 3;
	condition = DIA_Bennet_BauOrSld_Condition;
	information = DIA_Bennet_BauOrSld_Info;
	permanent = FALSE;
	description = "�� � ��������� ��� � ����������?";
};


func int DIA_Bennet_BauOrSld_Condition()
{
	if((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BauOrSld_Info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//�� � ��������� ��� � ����������?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//�� �������� ���� ����, ��?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//��� ������ ���������.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//�� �����-������ ����� �������, ������� ����� �� ������?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//���.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//����� ����� �� ������� ����� ����� �������?
};


instance DIA_Bennet_WannaJoin(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 4;
	condition = DIA_Bennet_WannaJoin_Condition;
	information = DIA_Bennet_WannaJoin_Info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int DIA_Bennet_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_BauOrSld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//����� ��������� ������� � ��� � �������. ����� �� ���� ���� ���������.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//� ������ ���������.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//������, ����� � ���������� �� ����.
		SCKnowsSLDVotes = TRUE;
	};
};


instance DIA_Bennet_WannaSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_WannaSmith_Condition;
	information = DIA_Bennet_WannaSmith_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ������ ����?";
};


func int DIA_Bennet_WannaSmith_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//�� ������ ������� ���� ������ ����?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//�������.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//�������, ��� ��������� ���� � ��������� �����. ������, 30 �������.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
	Info_AddChoice(DIA_Bennet_WannaSmith,"��, ����� ����, �����.",DIA_Bennet_WannaSmith_Later);
	Info_AddChoice(DIA_Bennet_WannaSmith,"�������. ��� ���� 30 �������.",DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//�������. ��� ���� 30 �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//������ �������, ��� ����� ������� ����! � ����� ���������� � ��������, ��� ������ �� ������ �����.
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_SoldierTeacher,"������ ����� ������� ���� ���������� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//�� ���� ������� ���� �� ������. 30 ������� � �� ����� ������� ������.
	};
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//��, ����� ����, �����.
	Info_ClearChoices(DIA_Bennet_WannaSmith);
};


instance DIA_Bennet_TeachCOMMON(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 6;
	condition = DIA_Bennet_TeachCOMMON_Condition;
	information = DIA_Bennet_TeachCOMMON_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("��������� ���������� ����",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common));
	description = B_BuildLearnString(NAME_Skill_Smith,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common));
};


func int DIA_Bennet_TeachCOMMON_Condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (Bennet_TeachCommon == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//����� ���� ������ ����!
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//��� �������� ������: ������ ����� ����� ����� � ������� ��� ��� �����, ���� �� �� ����������.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//����� ������� ��� �� ���������� � �������� ���� �����.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//����� ������ - �����, ����� ����� �� ����� ������� ��������. � ���� ���� ����� ��������� ����� ��� ��������� ������...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//� ���������� �� ��������� ��� - ��� ����� ���� ������ ��������.
	};
};


instance DIA_Bennet_WannaSmithORE(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 7;
	condition = DIA_Bennet_WannaSmithORE_Condition;
	information = DIA_Bennet_WannaSmithORE_Info;
	permanent = TRUE;
	description = "����� ���� ������ ���������� ������!";
};


func int DIA_Bennet_WannaSmithORE_Condition()
{
	if((Bennet_TeachSmith == FALSE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//����� ���� ������ ���������� ������!
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//���� �� �� ���� �� ���, ���� � �������, ���� ����� ���� �������� ������������ ����������� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03_add");	//�� �� ���� �� ��� - ���� � �������, ���� ����� ���� �������� ������������ ����������� ������.
		};
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//������ �������� ������� ������� ���� ����������, � � �����, ���� ������� � ������ ������ �� ����� �� ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//� ��� ������. ����� ��� ��� ������� �� ��������� ������ ��������� �� ����������� ������.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//������ �������. (����������) ������ ���� � ������ �� ����.
		};
	}
	else if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//�� �� ���� �� ������ ����� ���������� ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//������� �� ������ ��������� ������ ������� ����. � ��� ���������.
	}
	else if(MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		if(MIS_Bennet_BringOre == FALSE)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//���� �� � ���� ���� ���������� ����, � ��, ��������, ����������.
			AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//��, �� �����. � � ����������, � � ���� ��������� ����. ��� ��� ���� �����?
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//����� ���, ���, ���������, � ������ ������ ���������� ������, �� ���� ���������� ����?
			AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//����...
			MIS_Bennet_BringOre = LOG_Running;
			Log_CreateTopic(TOPIC_BennetOre,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BennetOre,LOG_Running);
			B_LogEntry(TOPIC_BennetOre,"������� ��������� ������� ����� ���� ������ ���������� ����.");
		};
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//��� ��� �����. ��� ����� ��� ������� 5 ������ ���� - ��� �� ������ ������ �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//�������, �� ������ ��� ����, � �� ����� ������, ��� ������ ������� ���.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//��� ����� ��, ������ ����!
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//����� �������: �� �����, ������� ������ ���� ��� �� ���������� ����, ��� �� ������ ������ ������� ��� �� ������ �����. ����������� - ������ ��� ����� ��������.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//� ��� ��� ��� ������� ���� ����� �������, ������ ������ �������� ��������� � ��������� ������ ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//�����������, ������ ������ ������� ������� ��� ���������� �����. ������ ����� ��������� � ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//� ��� ��������� ������� �� ������, ������� �� ������ ��������.
		Bennet_TeachSmith = TRUE;
	};
};


instance DIA_Bennet_WhereOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhereOre_Condition;
	information = DIA_Bennet_WhereOre_Info;
	permanent = FALSE;
	description = "��� ��� ����� ���������� ����?";
};


func int DIA_Bennet_WhereOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//��� ��� ����� ���������� ����?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//��, ���� �� � ������ ���� ���. � �����, � ��������������� ������� �� ��������� ������� ���-������.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//��, ����� ����, ���� ������� � �� ������� ��������� ������ �������� ���-������ ����� � ������� ������� �� ��� ��������� ����� ����.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//��������� � ����, � ����� � ��� ������ ���� ����������� �����. �������� �������� ������� ���.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//�� ���� ���������: � ������, ��� �������� ������ �������.
};


instance DIA_Bennet_BringOre(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 9;
	condition = DIA_Bennet_BringOre_Condition;
	information = DIA_Bennet_BringOre_Info;
	permanent = FALSE;
	description = "���, �����. (������ 5 ������ ����)";
};


func int DIA_Bennet_BringOre_Condition()
{
	if((MIS_Bennet_BringOre == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 5) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//���, �����.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(�������) ������!
	B_GiveInvItems(other,self,ItMi_Nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//�� �� ���! � ��������!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//������ ���� ��� �����. ��� ���� �����������, ����� ������� ���� ����������� ������.
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Bennet_NW_ItMi_Nugget_Count += 3;
	B_LogEntry(TOPIC_BennetOre,"������ ������� ���� � ������ ��� ��������� �� �����.");
	MIS_Bennet_BringOre = LOG_SUCCESS;
	B_GivePlayerXP(100);
};


instance DIA_Bennet_TeachSmith(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 30;
	condition = DIA_Bennet_TeachSmith_Condition;
	information = DIA_Bennet_TeachSmith_Info;
	permanent = TRUE;
	description = "� ���� ������ ������ � ���������� ������.";
};


func int DIA_Bennet_TeachSmith_Condition()
{
	if((Bennet_TeachSmith == TRUE) && ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//� ���� ������ ������ � ���������� ������.
	if(AlternativeSmithing == FALSE)
	{
		if(Kapitel == 1)
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06_add");	//���� ��� ������ ����� ����.
		}
		else if(!C_Bennet_HaveNewWeapons())
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//����� ������ �� ����� �� ��������� ������?
		}
		else
		{
			DIA_Bennet_AnnounceNewWeapons_Info();
		};
		if(Kapitel > 1)
		{
			Info_ClearChoices(DIA_Bennet_TeachSmith);
			Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 2))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 2))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 3))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 3))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (MIS_ReadyforChapter4 == TRUE))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 5))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
			};
			if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 5))
			{
				Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
			};
		};
	}
	else
	{
		if(!C_Bennet_HaveNewWeapons())
		{
			AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//����� ������ �� ����� �� ��������� ������?
		}
		else
		{
			DIA_Bennet_AnnounceNewWeapons_Info();
		};
		Info_ClearChoices(DIA_Bennet_TeachSmith);
		Info_AddChoice(DIA_Bennet_TeachSmith,Dialog_Back,DIA_Bennet_TeachSmith_BACK);
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),DIA_Bennet_TeachSmith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && (Kapitel >= 1))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),DIA_Bennet_TeachSmith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),DIA_Bennet_TeachSmith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && (Kapitel >= 2))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),DIA_Bennet_TeachSmith_2hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_03)),DIA_Bennet_TeachSmith_1hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE) && (Kapitel >= 3))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_03)),DIA_Bennet_TeachSmith_2hSpecial3);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE) && (Kapitel >= 5))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_1H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_04)),DIA_Bennet_TeachSmith_1hSpecial4);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE) && (Kapitel >= 5))
		{
			Info_AddChoice(DIA_Bennet_TeachSmith,B_BuildLearnString(NAME_ItMw_2H_Special_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_04)),DIA_Bennet_TeachSmith_2hSpecial4);
		};
	};
};

func void DIA_Bennet_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Bennet_TeachSmith);
};

func void DIA_Bennet_TeachSmith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void DIA_Bennet_TeachSmith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void DIA_Bennet_TeachSmith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void DIA_Bennet_TeachSmith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};

func void DIA_Bennet_TeachSmith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_03);
};

func void DIA_Bennet_TeachSmith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_03);
};

func void DIA_Bennet_TeachSmith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_04);
};

func void DIA_Bennet_TeachSmith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_04);
};

instance DIA_Bennet_WhyPrison(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhyPrison_Condition;
	information = DIA_Bennet_WhyPrison_Info;
	permanent = FALSE;
	description = "��� �� ����� �� �������?";
};


func int DIA_Bennet_WhyPrison_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhyPrison_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//��� �� ����� �� �������?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//��� ������ �������� ���� � ������� ����. �������, ��� � ���� ��������.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//�� � �� ����� �����, ��� ����� ���������� ����.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//����� �� �� ���?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//������ ��� �����? �� ������ �������� ���� ������.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//�������� � ������ �������, ������� �����... ��, � �� ����... ������ �� ���-������!
	if(MIS_RescueBennet != LOG_Running)
	{
		MIS_RescueBennet = LOG_Running;
		Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
		B_LogEntry(TOPIC_RescueBennet,"� ������� ��������� ��������. �� �� ��� �����, ����� ������ ��������� �� ������.");
	};
};


instance DIA_Bennet_WhatHappened(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_WhatHappened_Condition;
	information = DIA_Bennet_WhatHappened_Info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int DIA_Bennet_WhatHappened_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//��� ���������?
	if(Hodges_isAlive_Kap3 == TRUE)
	{
		AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//� ����� � ������ ����� ������ � ��������, ����� ������ ���-��� ��� ����� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01_add");	//� ����� � ������ ����� ������, ����� ������ ���-��� ��� ����� ������.
	};
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//���������� �� �������� ������� ���� � ���� ������ ��������� ���.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//����� � ����.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//�� ����� ������ - ���-�� ���������, � ��� ��� �� �������, ���� �������� ���.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//� �� ��������. � �����, ����� �� ��������� ����� ���������� ��� ������ �������, � ���������� � �������� ������.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//� ������ ��� ������. ��������� ��� �� ���������� �� ���� � ������� �� �������.
};


instance DIA_Bennet_Victim(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Victim_Condition;
	information = DIA_Bennet_Victim_Info;
	permanent = FALSE;
	description = "��� ��� ����?";
};


func int DIA_Bennet_Victim_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Victim_Info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//��� ��� ����?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//������� �� ���� - ���� �� ���������, � �� ����, ���.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//�� ������ ���?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//�����-�� �����, ��-�����. ��, ��-�, � �� ����, � �� ������.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//���� ����� �������� ����� ������, ��� �������� ��� ������.
	B_LogEntry(TOPIC_RescueBennet,"�����, ���� �� ���������, ��� ����. ���� �����, ��������, ������ ���������� ��� ��������� �� ���� ����, ���� ������ �� ����� �������������.");
};


instance DIA_Bennet_Evidence(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Evidence_Condition;
	information = DIA_Bennet_Evidence_Info;
	permanent = FALSE;
	description = "� ��� ���� �������������� ������ ����?";
};


func int DIA_Bennet_Evidence_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Evidence_Info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//� ��� ���� �������������� ������ ����?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//�������, ���� ���������, ������� ������� ����.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//�� ������, ��� ���� ���������?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//���. � ���� ������, ��� �� ����.
	B_LogEntry(TOPIC_RescueBennet,"���� ���������, ������������, ��� �����, ��� ��� ������ ������. � ������ ����� ����� ���������, ���� � ���� �������� ������.");
//	RescueBennet_KnowsWitness = TRUE;
};


instance DIA_Bennet_Investigation(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Investigation_Condition;
	information = DIA_Bennet_Investigation_Info;
	permanent = FALSE;
	description = "��� ����� �������������?";
};


func int DIA_Bennet_Investigation_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Investigation_Info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//��� ����� �������������?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//��� ���� �����. ��� ��� ��� ���� ���� �� ���������, ��� ���� ��������� ��� ����� � ������� ���������.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//��� ��� ��������?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//��� ����� ������������. ���� ���� �� �������� ������, �� � ���� ������� ��� ������ ����������.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//�� ������ ������ ���, ��� �������� �����. �� �� ������� ��� ������ ���.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//�� ��� ���������, ��� ��� ������.
};


instance DIA_Bennet_ThankYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ThankYou_Condition;
	information = DIA_Bennet_ThankYou_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bennet_ThankYou_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bennet_ThankYou_Info()
{
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//��, � �� �����, ��� ���� ��������� �������!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//��� �, � ����� ������, ��� ���������� ������.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//�� ��. �� �� ����� ��������� ���� �������, ������� �������� ����!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(�������) �� ��� ��� �������, ��� ���� �� ������� � �����.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//��, ���� �� �����. � ���� ���� ���-��� ��� ����.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//��� �� ������ � ����?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(����������) �������.
	self.npcType = NPCTYPE_FRIEND;
};


instance DIA_Bennet_Present(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_Present_Condition;
	information = DIA_Bennet_Present_Info;
	permanent = FALSE;
	description = "����� �������?";
};


func int DIA_Bennet_Present_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};
};

func void DIA_Bennet_Present_Info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//����� �������?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//�� ��� ������� � ��������, ������� ����� �� ��������� � ������.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//��� ������������� ���!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//������, � ���� ����.
	if(hero.guild == GIL_SLD)
	{
		B_SetGuild(hero,GIL_DJG);
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//��� �� ��� �� ����, ��������� �� ������ ������ ����������� � ������.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(����������) ��� ���������� ������� ��� �������.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//� ����� ��� ����� ��������� �� ���?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(�����) � ���������� ����� ��� ��������. ������� �������� �� ��������!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//��� ������� � �����, ��� ������������ �������.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//��� ��� �� ���� ����, � ����, ����� �� ������� ������ ���������. ��� �������!
		B_GiveArmor(ITAR_DJG_L);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//� �������, ���, ��������, ���� ���� ��������� ������������ ���. ���� ����������� ������� ����������, ����� �� ����������� � ��� ������.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//����� ��� ��������� �������� �������. ��������� �������� �������. � ������ ������� ���� �� ���.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//������� � ������ �� �������?
		B_Say_Gold(self,other,Value_DragonScale);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//�����, � �����, �� ��������� �������� ������������� � ����������� ����� �� ��������.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//�?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//���, ������ ���� ������. ���� �� ������, ��� ���.
		CreateInvItems(self,ItAm_Hp_01,1);
		B_GiveInvItems(self,other,ItAm_Hp_01,1);
	};
};


var int Bennet_DragonScale_Counter;
var int Show_DJG_Armor_M;

instance DIA_Bennet_DragonScale(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DragonScale_Condition;
	information = DIA_Bennet_DragonScale_Info;
	permanent = TRUE;
	description = "� ������ ���� ��������� ��������� ������.";
};


func int DIA_Bennet_DragonScale_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonScale) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DragonScale_Info()
{
	var int dragonscalecount;
	var string concatText;
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//� ������ ���� ��������� ��������� ������.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//��������� ����� �������!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//��� ���� ������!
	dragonscalecount = Npc_HasItems(other,ItAt_DragonScale);
	Bennet_DragonScale_Counter += dragonscalecount;
	B_GiveInvItems(self,other,ItMi_Gold,dragonscalecount * Value_DragonScale);
	Npc_RemoveInvItems(other,ItAt_DragonScale,dragonscalecount);
	concatText = ConcatStrings(IntToString(dragonscalecount),PRINT_ItemsGiven);
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	if((Bennet_DragonScale_Counter >= 20) && (Show_DJG_Armor_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//������, ����� ������ ���� ����������. � ���� ������� ���� �����, ���������� �������, ����, �������, ���� ��� ���������.
		Show_DJG_Armor_M = TRUE;
	};
};


var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;

instance DIA_Bennet_DJG_ARMOR_M(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_M_Condition;
	information = DIA_Bennet_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "������� ������� �������� �� �������� (120/120/75/35, 12000 �������)";
};


func int DIA_Bennet_DJG_ARMOR_M_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (Show_DJG_Armor_M == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//� ���� ������ �������.
	if(Npc_HasItems(other,ItMi_Gold) >= VALUE_ITAR_DJG_M)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//����� ������. ������, ��� ���� �� ����������.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//�� ��, �� �����-�� ����...
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//�� �������, ��� ��� ����� ���� �����.
		B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_DJG_M);
		if(Helmets_Enabled == TRUE)
		{
			B_GiveArmor(ITAR_DJGN_M);
			CreateInvItem(hero,ITHE_DJG_M);
		}
		else
		{
			B_GiveArmor(ITAR_DJG_M);
		};
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//� ���� ������������ ������.
	};
};


instance DIA_Bennet_BetterArmor(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_BetterArmor_Condition;
	information = DIA_Bennet_BetterArmor_Info;
	permanent = FALSE;
	description = "� ����, ��� ����� ��� �������� �������.";
};


func int DIA_Bennet_BetterArmor_Condition()
{
	if((PlayergetsFinalDJGArmor == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Bennet_BetterArmor_Info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//� ����, ��� ����� ��� �������� �������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(���������� ��� ����) ��, �������� ���.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//����� ������� �������� ������� ���������� �����.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(�������) ��� ����� ��������� � �� ���. ��, �� ����.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//��� ����� ������� ����������� ���, ��� �� �����-���� �����. ��� ����� ������ � ����� �������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//��� ����������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//�� ������ ������ ��, ���� ������. � �� ��������� �� �� ��� ����, � ���� ������-������ ��������� ��������� ������������.
};


//var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;

instance DIA_Bennet_DJG_ARMOR_H(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_DJG_ARMOR_H_Condition;
	information = DIA_Bennet_DJG_ARMOR_H_Info;
	permanent = TRUE;
	description = "������� ������� �������� �� �������� (150/150/100/50, 20000 �������)";
};


func int DIA_Bennet_DJG_ARMOR_H_Condition()
{
	if((Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE) && (hero.guild == GIL_DJG) && (Npc_KnowsInfo(other,DIA_Bennet_BetterArmor) || Npc_KnowsInfo(other,DIA_Bennet_DI_BetterArmor)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DJG_ARMOR_H_Info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//��� ��� �������.
	if(Npc_HasItems(other,ItMi_Gold) >= VALUE_ITAR_DJG_H)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//��� ������ ������� �� ����, ��� � �����-���� �����.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//��������� ������������ ���������.
		B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_DJG_H);
		if(Helmets_Enabled == TRUE)
		{
			B_GiveArmor(ITAR_DJGN_H);
			CreateInvItem(hero,ITHE_DJG_H);
		}
		else
		{
			B_GiveArmor(ITAR_DJG_H);
		};
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//� ���� ������������ ������.
	};
};


instance DIA_Bennet_RepairNecklace(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_RepairNecklace_Condition;
	information = DIA_Bennet_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������������� ��������� �������?";
};


func int DIA_Bennet_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bennet_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//�� ������ ������������� ��������� �������?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//����� ����. �� ������ ������� �������� ��� ��.
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//����� ��� ������� ����� ��������� ������.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//��� ����� � �� ����� ������ �������, ��� ��������.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_ShowInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_ShowInnosEye_Condition;
	information = DIA_Bennet_ShowInnosEye_Info;
	permanent = FALSE;
	description = "�� ������ ��������� �� ���� ������?";
};


func int DIA_Bennet_ShowInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bennet_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Bennet_ShowInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//�� ������ ��������� �� ���� ������?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//�������, ����� ���������.
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//����, ������������ ������. ������ �������. ��, �����, � ����� �������� ��, �������.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//������� ��� ������ �������?
	if(MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//��, � ������� ����� ����. ��� �� ���-�� ����� ������ �������?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//���� �� � ��� � ����� �������, � ��� �� ������� ��� �� ���� ����. ��, ������� ��, ������� ��� ����� ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//���� �� �������� ��� ���, � ����������� ���� �� ����� ��� ���������.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//� � ���� �� ������ � ���� ����� �� ��� ������. ���� ��� �� ������� ���� �� ������.
	};
	AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	B_LogEntry(TOPIC_INNOSEYE,"������ - ������, ������� ����� ���, ����� �������� ������.");
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Bennet_GiveInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GiveInnosEye_Condition;
	information = DIA_Bennet_GiveInnosEye_Info;
	permanent = FALSE;
	description = "��� ������, ����������, ������ ���.";
};


func int DIA_Bennet_GiveInnosEye_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_SCKnowsInnosEyeIsBroken == TRUE) && (MIS_RescueBennet == LOG_SUCCESS) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GiveInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//��� ������, ����������, ������ ���.
	Npc_RemoveInvItems(other,ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//������. � ������� ������ � ����������� ����.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//������ ������, � �������� ���.
	Bennet_RepairDay = Wld_GetDay();
	B_UpdateBennetItemsCount();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WORK");
};


instance DIA_Bennet_GetInnosEye(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 8;
	condition = DIA_Bennet_GetInnosEye_Condition;
	information = DIA_Bennet_GetInnosEye_Info;
	permanent = TRUE;
	description = "������ �����?";
};


func int DIA_Bennet_GetInnosEye_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bennet_GiveInnosEye) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_GetInnosEye_Info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//������ �����?
	B_UpdateBennetItemsCount();
	if(((Bennet_RepairDay < Wld_GetDay()) && Wld_IsTime(5,0,23,59)) || (Bennet_RepairDay + 1 < Wld_GetDay()))
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//��, �����.
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems(other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//��� �������� ������� ����� ������ ��� �����.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//� ������� ��� ����, � ������ �� ��� ���������.
		B_LogEntry(TOPIC_INNOSEYE,"������ ����� ��� ���������. ������ �������� �������� ������.");
		MIS_Bennet_InnosEyeRepairedSetting = LOG_SUCCESS;
		B_GivePlayerXP(XP_InnosEyeIsRepaired);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//����� ������������. ������ �������.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//���� �� ������ ���������� ������ ���, ��� ������ �������� ������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Bennet_DRACHENEIER(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_DRACHENEIER_Condition;
	information = DIA_Bennet_DRACHENEIER_Info;
	permanent = TRUE;
	description = "�� ������ ���-������ ������� � ���������� ������?";
};


func int DIA_Bennet_DRACHENEIER_Condition()
{
	if((Kapitel >= 4) && (BennetsDragonEggOffer == 0) && Npc_HasItems(other,ItAt_DragonEgg_MIS) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;

func void DIA_Bennet_DRACHENEIER_Info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//�� ������ ���-������ ������� � ���������� ������?
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//�������� ����? ���, ���� ������, ���� ������� ������ ��?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//� ������ �� � �����-������.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//����� ���������.
	};
	Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("�������� ���� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//���. ����� ������� ��������. �������� �������� ��� ��������. ���� ������ ������� ������� ��.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//�� � ���? ��� ����� ����?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//�������! ����� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//�� � ������� ��� �� ����������� ������� �� � ���� ����� �����? �� ������� �� ��� ���?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//� ������� ����, ���, ��... ������, 300 ������� �� ������ ����, ��� �� ��������� ���.
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"����� ������ �������� ������ ����. � ���� ���������� ��� ����.",DIA_Bennet_DRACHENEIER_nein);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"��� ���� �������, � �� �����-������ �������.",DIA_Bennet_DRACHENEIER_mehr);
	Info_AddChoice(DIA_Bennet_DRACHENEIER,"������������.",DIA_Bennet_DRACHENEIER_ok);
	if(DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_DRACHENEIER,"������ ����� ���� ������� ���� �� �������� ����, ������� � �����.");
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
		DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Bennet_DRACHENEIER_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//������������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//�������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//���� ������� ���, ���� �� ����.
	if(BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;
	};
	CreateInvItems(self,ItMi_Gold,BennetsDragonEggOffer);
	B_GiveInvItems(self,other,ItMi_Gold,BennetsDragonEggOffer);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//���. �� ������, ��� ������ �� � �����-������?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//�����.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//��������� � ����, ����-����� ������ ������� � �������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//� �� ��������, ���� ���� ������� ����� ��� ���� � ������� ����������.
	B_LogEntry(TOPIC_DRACHENEIER,"������ ��������, ��� ��� ����� �������� ���� � ������� ��������. �� ������ �� ���, �� ������, ������ ��������������.");
	if(!Npc_HasItems(other,ItWr_Map_Caves_MIS))
	{
		if(!Npc_IsDead(Brahim))
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//�� ������� �� ������ ����� ����� ����� � ���������� � ������. ����� ����, ���� �� ������� �� ��� ����.
			Log_AddEntry(TOPIC_DRACHENEIER,"� ������ ������ ����� ����� � ���������� � ������, ����� ���� ���������, ��� � �� ������� ����� ���.");
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//���. ������ ��� �����. ��� ������� ���� ����� ������.
			CreateInvItems(self,ItWr_Map_Caves_MIS,1);
			B_GiveInvItems(self,other,ItWr_Map_Caves_MIS,1);
			Log_AddEntry(TOPIC_DRACHENEIER,"�� ��� ��� ����� �����, ��������, ��� ������� ���.");
		};
	};
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//��� ���� �������, � �� �����-������ �������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(�������) ������. 350 � �����. � �� ���� ���� ���� ������ - ����� ��� ���� �� ��������.
	BennetsDragonEggOffer = 350;
};

func void DIA_Bennet_DRACHENEIER_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//����� ������ �������� ������ ����. � ���� ���������� ��� ����.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//��� ��� �����, ���� �����������.
	CreateInvItems(other,ItAt_DragonEgg_MIS,1);
	AI_PrintScreen("�������� ���� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	BennetsDragonEggOffer = 0;
	Info_ClearChoices(DIA_Bennet_DRACHENEIER);
};


instance DIA_Bennet_EierBringen(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 5;
	condition = DIA_Bennet_EierBringen_Condition;
	information = DIA_Bennet_EierBringen_Info;
	permanent = TRUE;
	description = "����� ��� �������� ����?";
};


func int DIA_Bennet_EierBringen_Condition()
{
	if((BennetsDragonEggOffer > 0) && (Kapitel >= 4) && Npc_HasItems(other,ItAt_DragonEgg_MIS) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info()
{
	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//����� ��� �������� ����?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//�������!
	DragonEggCount = Npc_HasItems(other,ItAt_DragonEgg_MIS);
	if(DragonEggCount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//���. � ������ ��� ����.
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,1);
		AI_PrintScreen("�������� ���� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		DragonEggCounter += 1;
		B_GivePlayerXP(XP_DJG_BringDragonEgg);
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//� ������ ��� ���������.
		Npc_RemoveInvItems(other,ItAt_DragonEgg_MIS,DragonEggCount);
		concatText = ConcatStrings(IntToString(DragonEggCount),PRINT_ItemsGiven);
		AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		XP_DJG_BringDragonEggs = DragonEggCount * XP_DJG_BringDragonEgg;
		DragonEggCounter += DragonEggCount;
		B_GivePlayerXP(XP_DJG_BringDragonEggs);
	};
	if(DragonEggCounter <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//�������. ����� ����. �� ����� ���������, �? ��������� ���-�� ������ ���� ���.
	}
	else if(DragonEggCounter <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//��� �� �������� ��? ���� �� ���-������ ��� �������� ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//� �� �����, ��� �� ������� ��� ����. � ���� ��, ��� � ���� ����������. � ���� �� ����, ��� � ���� ������ �� ����� ����.
		TOPIC_END_DRACHENEIER = TRUE;
		B_CheckLog();
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//��, ������. ��� ���� ������.
	DragonEggGeld = DragonEggCount * BennetsDragonEggOffer;
	CreateInvItems(self,ItMi_Gold,DragonEggGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonEggGeld);
};


func void B_Bennet_BeMySmith()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//���� ���� ��������. �������� � ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//������. �������� �����.
};

instance DIA_Bennet_KnowWhereEnemy(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_KnowWhereEnemy_Condition;
	information = DIA_Bennet_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "��� ����� ����� �� ������ ������. ��� �� ���������� ������.";
};


func int DIA_Bennet_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Bennet_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//��� ����� ����� �� ������ ������. ��� �� ���������� ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//� �� ������� ��� ���?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//��. ��� �������? �� ������� ����, �� ������� ��������� ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//��� �����, ��� �������� �� ����� �����. ������, ���� �� �����, ��� �����. �� ������ ������������ �� ����.
	if(SCToldBennetHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"������ ����� ������������ ����������. ������ �� ���������������. � ������, ��� ����� ������� ��������� � ����.");
		SCToldBennetHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//��� ������� ������ ��������� ��������������.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//����� ����� ����-������ �� ���.
	}
	else
	{
		Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"� ��� ���� �����, ����� �� ��� ������������.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Bennet_KnowWhereEnemy,"���� ���� ��������. �������� � ������.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

func void DIA_Bennet_KnowWhereEnemy_Yes()
{
	B_Bennet_BeMySmith();
	B_UpdateBennetItemsCount();
	B_JoinShip(self);
};

func void DIA_Bennet_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ����� �� ��� ������������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//�������. � ���� �����.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Bennet_KnowWhereEnemy);
};


instance DIA_Bennet_LeaveMyShip(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_LeaveMyShip_Condition;
	information = DIA_Bennet_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� ���� ����� ���� ������� �������.";
};


func int DIA_Bennet_LeaveMyShip_Condition()
{
	if((Bennet_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//� ���� ����� ���� ������� �������.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//������ �� ������� ����, ����� ������ - ������. �� �� ��� �� ������������, �? ����� ������ ������ ������ � ���, ���� �� ������, ��� ��� �����.
	Bennet_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Bennet_StillNeedYou(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 55;
	condition = DIA_Bennet_StillNeedYou_Condition;
	information = DIA_Bennet_StillNeedYou_Info;
	permanent = TRUE;
	description = "�����������, � �� ���� ����� ������� �������.";
};


func int DIA_Bennet_StillNeedYou_Condition()
{
	if(((Bennet_IsOnBoard == LOG_OBSOLETE) || (Bennet_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		if(Bennet_WasOnBoard == TRUE)
		{
			DIA_Bennet_StillNeedYou.description = "�����������, � �� ���� ����� ������� �������.";
		}
		else
		{
			DIA_Bennet_StillNeedYou.description = "���� ���� ��������. �������� � ������.";
		};
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info()
{
	if(Bennet_WasOnBoard == TRUE)
	{
		AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//�����������, � �� ���� ����� ������� �������.
		AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(�������) ������! ������ ����� ���������� ��� ������� ��������! �������� � ������.
	}
	else
	{
		B_Bennet_BeMySmith();
	};
	B_UpdateBennetItemsCount();
	B_JoinShip(self);
};


instance DIA_Bennet_PICKPOCKET(C_Info)
{
	npc = SLD_809_Bennet;
	nr = 900;
	condition = DIA_Bennet_PICKPOCKET_Condition;
	information = DIA_Bennet_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Bennet_PICKPOCKET_Condition()
{
	return C_Beklauen(35,45);
};

func void DIA_Bennet_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,Dialog_Back,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_PICKPOCKET);
};

