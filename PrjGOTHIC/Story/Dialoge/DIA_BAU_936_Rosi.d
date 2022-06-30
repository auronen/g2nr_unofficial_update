
var int RosiTradeInfo;
var int RosiLocation;
var int RosiToldAboutBarrier;
var int RosiToldAboutMilitia;
var int RosiToldAboutOnar;

func void B_RosiTradeInfo()
{
	if(RosiTradeInfo == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//�� ������ ������ �����-������ ��� ���, ��������, ���-�� ��� ����� � ����?
		if(RosiLocation == LOC_CITY)
		{
			Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
			B_LogEntry(TOPIC_CityTrader,"� ���� ����� ������ ��������� ������.");
		}
		else if(RosiLocation == LOC_MONASTERY)
		{
			Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
			B_LogEntry(Topic_KlosterTrader,"� ���� ����� ������ ��������� ������.");
		}
		else if(RosiLocation == LOC_FARM)
		{
			Log_CreateTopic(TOPIC_SoldierTrader,LOG_NOTE);
			B_LogEntry(TOPIC_SoldierTrader,"� ���� ����� ������ ��������� ������.");
		}
		else
		{
			Log_CreateTopic(TOPIC_OutTrader,LOG_NOTE);
			if(Rosi_FleeFromSekob_Kap5 == FALSE)
			{
				B_LogEntry(TOPIC_OutTrader,"� ���� �� ����� ������ ����� ������ ��������� ������.");
			}
			else
			{
				B_LogEntry(TOPIC_OutTrader,"� ���� ����� ������ ��������� ������.");
			};
		};
		RosiTradeInfo = TRUE;
	};
};

func void B_RosiAboutSekob()
{
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//�� �������� ���� � ������. � ��� �� ������ �������� �� ������� ����� � ������� �� � ������.
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//�� �������� ����� ��������� ������ ������� ���������.
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//�� �������� ����� ���������� ��������� �� ������� �����������. �� ��� ��� �� ����� �������� ���������.
	RosiToldAboutSekob = TRUE;
};

instance DIA_Rosi_EXIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 999;
	condition = DIA_Rosi_EXIT_Condition;
	information = DIA_Rosi_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rosi_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rosi_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_HALLO(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_HALLO_Condition;
	information = DIA_Rosi_HALLO_Info;
	description = "� ���� ��� � �������?";
};


func int DIA_Rosi_HALLO_Condition()
{
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//� ���� ��� � �������?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//��, �����-�����. ��� ����� ����� �� ���������� ������� ������. � ��� �� ������� �����? � ��� ������� ������ �����.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//������ �������� ���� ���������� � ���, ���� ��� ������� ������� ��������� �� ������.
		RosiToldAboutMilitia = TRUE;
		if(other.guild != GIL_NONE)
		{
			AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//��������� ����� ��� ������������ �� ���� ����� ����� �����. �� �� �� ����� �� �� ������ �� ���.
		};
	};
};


instance DIA_Rosi_WASMACHSTDU(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 4;
	condition = DIA_Rosi_WASMACHSTDU_Condition;
	information = DIA_Rosi_WASMACHSTDU_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Rosi_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_HALLO) && (Rosi_FleeFromSekob_Kap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//��� �� ������� �����?
	if(!Npc_IsDead(Sekob))
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//� ����� ���� ���� ������ ��� ��������� ���. �����, ��� ���, ��������� ������������� �� ����� ��������.
		B_RosiAboutSekob();
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//��� �� ����� ������� �������� ���� ����� ������, ������ ���. ������ ��� ���� �������, ����� ������ ��� ��� ����� �� �����.
		RosiToldAboutBarrier = TRUE;
	};
	B_RosiTradeInfo();
};


instance DIA_Rosi_WAREZ(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 2;
	condition = DIA_Rosi_WAREZ_Condition;
	information = DIA_Rosi_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� �� ������ ���������� ���?";
};


func int DIA_Rosi_WAREZ_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB)) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WAREZ_Info()
{
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//��� �� ������ ���������� ���?
	B_RosiTradeInfo();
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//�������.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		RosiMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Rosi_BARRIERE(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 6;
	condition = DIA_Rosi_BARRIERE_Condition;
	information = DIA_Rosi_BARRIERE_Info;
	description = "������?";
};


func int DIA_Rosi_BARRIERE_Condition()
{
	if((RosiToldAboutBarrier == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BARRIERE_Info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//������?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//��, �����, ������� �������� ������ ������ ��������.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//������ �������� ��� ������� ����������, ����������� ������������, ����� ������ ������� ����, � ��� ������� �� ������������ �����.
};


instance DIA_Rosi_DuInBarriere(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 10;
	condition = DIA_Rosi_DuInBarriere_Condition;
	information = DIA_Rosi_DuInBarriere_Info;
	description = "�� �����-������ ���� �� ��������?";
};


func int DIA_Rosi_DuInBarriere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_BARRIERE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_DuInBarriere_Info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//�� �����-������ ���� �� ��������?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//���. �� ������ ������� � ���. ������, ������ � ������������ �������, ��������� ������ ���������� ���� � ��� ������.
};


instance DIA_Rosi_BENGAR(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 11;
	condition = DIA_Rosi_BENGAR_Condition;
	information = DIA_Rosi_BENGAR_Info;
	description = "��� ��� ������� �� ����� �������?";
};


func int DIA_Rosi_BENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_DuInBarriere) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BENGAR_Info()
{
	DIA_Common_WhereBengarsFarm();
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//��� ����� ��������� ����� ������ �� �������, �������� � ������ ��������.
	if((BalthasarMovedToBengar == FALSE) && !Npc_IsDead(Balthasar))
	{
		AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//������ ����������. ��� ��� ������. ������ �� ����� ����� ���� �� �������� �������.
		AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//�� ��������� ����, ��� ��������� ����.
	};
};


instance DIA_Rosi_Miliz(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 7;
	condition = DIA_Rosi_Miliz_Condition;
	information = DIA_Rosi_Miliz_Info;
	description = "� ������ ��������� �������� �� ���� �����?";
};


func int DIA_Rosi_Miliz_Condition()
{
	if((RosiToldAboutMilitia == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_Miliz_Info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//� ������ ��������� �������� �� ���� �����?
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//������ ��� ����� ������ ���, ��� �� �������� �� ������ ������� ���� �����, ������ ����, ����� �������� ���� ��������.
		AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//������ ������, � ��� �������� ������ �������� �� �����, �������, ��� �� ������� ������, ����� ��� ������������� ����� ��� ����������.
		RosiToldAboutOnar = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_Miliz_17_02_add");	//������ ������...
	};
};


instance DIA_Rosi_ONAR(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 8;
	condition = DIA_Rosi_ONAR_Condition;
	information = DIA_Rosi_ONAR_Info;
	description = "� �� ��� ������ ������ �����?";
};


func int DIA_Rosi_ONAR_Condition()
{
	if((RosiToldAboutOnar == TRUE) && (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ONAR_Info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//� �� ��� ������ ������ �����?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//������ �� ������� ������, ��� ��������� ��������� ������� ��� �����.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//����� �� �������� ����-������ � ��������� � �������� � ������.
		AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//� �����, ������ ������, ���������� ��������, ������� �� ������, ����� �� ������ ���� � �������� ���������.
	};
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//��, ���������� ������, �������� �� ������ ����� ���������.
	};
};


instance DIA_Rosi_PERMKAP1(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 80;
	condition = DIA_Rosi_PERMKAP1_Condition;
	information = DIA_Rosi_PERMKAP1_Info;
	permanent = TRUE;
	description = "���� ���.";
};


func int DIA_Rosi_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU) || Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB))
	{
		return TRUE;
	};
};

func void DIA_Rosi_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//���� ���.
	if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//����������!
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//������ ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rosi_FLEEFROMSEKOB(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 50;
	condition = DIA_Rosi_FLEEFROMSEKOB_Condition;
	information = DIA_Rosi_FLEEFROMSEKOB_Info;
	description = "��� �� ������� �����, � �����?";
};


func int DIA_Rosi_FLEEFROMSEKOB_Condition()
{
	if(Rosi_FleeFromSekob_Kap5 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//��� �� ������� �����, � �����?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//� ������ �� � ����� ������� ��� ���. ����� ����� ���������� �������� �� ������ ������.
	if(RosiToldAboutSekob == FALSE)
	{
		B_RosiAboutSekob();
	};
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//� ����� ������, ��� ��������� � ��� �������������. �� � �� ���� �� ������� �� � ���.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//� ������ ���� ������ ������, �� ������ � �� ����, ���� ��� ����.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//�� �� ��� �� ������ ���?
	B_GivePlayerXP(XP_AmbientKap5);
	RosiFoundKap5 = TRUE;
};


instance DIA_Rosi_HILFE(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 51;
	condition = DIA_Rosi_HILFE_Condition;
	information = DIA_Rosi_HILFE_Info;
	description = "� ������ ���� ������.";
};


func int DIA_Rosi_HILFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rosi_FLEEFROMSEKOB))
	{
		return TRUE;
	};
};

func void DIA_Rosi_HILFE_Info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//� ������ ���� ������.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//� ���� ������� ���� � �����.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//� ������ ���� �� ����� ���������.
	}
	else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//������ � ���������. ���� ������ ������ ���.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//� ������� �� ������, ��� �� ������ ��� ����. � ������� ����, ������� ��.
	if(Npc_IsDead(Till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//�� ��� ������. � ����� �� �����.
	}
	else
	{
		Till.aivar[AIV_PARTYMEMBER] = TRUE;
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//�� ��� ������. �� ������ �� �����.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		B_StartOtherRoutine(Till,"FollowCity");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		B_StartOtherRoutine(Till,"FollowBigfarm");
	}
	else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		B_StartOtherRoutine(Till,"FollowKloster");
	};
	if(!Npc_KnowsInfo(other,DIA_Babera_Rosi))
	{
		Log_CreateTopic(TOPIC_RosisFlucht,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_Running);
		B_LogEntry(TOPIC_RosisFlucht,"���� ������ �� ����� �������� ����� �� ����� ������ � ������� � ���, �� ����������� � ������ �� �����, ���� ����. � ������ �� �� ������ �����.");
	};
	MIS_RosisFlucht = LOG_Running;
};


instance DIA_Rosi_ANGEKOMMEN(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_ANGEKOMMEN_Condition;
	information = DIA_Rosi_ANGEKOMMEN_Info;
	important = TRUE;
};


func int DIA_Rosi_ANGEKOMMEN_Condition()
{
	if((MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NONE))
		{
			if((Npc_GetDistToWP(self,"CITY1") < 6000) || (Npc_GetDistToWP(self,"CITY2") < 6000))
			{
				return TRUE;
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000)
			{
				return TRUE;
			};
		}
		else if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
		{
			if(Npc_GetDistToWP(self,"KLOSTER") < 6000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Rosi_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//������ � ���� ����� ������.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//�������. � ���� �� ����, ��� �� � ������ ��� ����.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
//	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//����������, ����� ���� �������� ���. �� �������� ���.
	AI_WaitTillEnd(other,self);
	CreateInvItems(self,ItMi_Gold,650);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	if(Npc_IsDead(Till))
	{
		B_GivePlayerXP(XP_SavedRosi);
	}
	else
	{
		Till.aivar[AIV_PARTYMEMBER] = FALSE;
		B_GivePlayerXP(XP_SavedRosi + XP_AmbientKap5);
	};
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"CITY1") < 8000) || (Npc_GetDistToWP(self,"CITY2") < 8000))
	{
		Npc_ExchangeRoutine(self,"CITY");
		B_StartOtherRoutine(Till,"CITY");
		RosiLocation = LOC_CITY;
	}
	else if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		B_StartOtherRoutine(Till,"BIGFARM");
		RosiLocation = LOC_FARM;
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		B_StartOtherRoutine(Till,"KLOSTER");
		RosiLocation = LOC_MONASTERY;
	};
};


instance DIA_Rosi_TRAIT(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 55;
	condition = DIA_Rosi_TRAIT_Condition;
	information = DIA_Rosi_TRAIT_Info;
	description = "������, ������ �� ����� ����.";
};


func int DIA_Rosi_TRAIT_Condition()
{
	if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Rosi_TRAIT_Info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//������, ������ �� ����� ����.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//�� ������ ����� ������, ��� � ��������� � ����� �����! �� ������� ������!
	AI_StopProcessInfos(self);
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Rosi_MinenAnteil(C_Info)
{
	npc = BAU_936_Rosi;
	nr = 3;
	condition = DIA_Rosi_MinenAnteil_Condition;
	information = DIA_Rosi_MinenAnteil_Info;
	description = "� ���� �� ������ ��������� ���������� �����?";
};


func int DIA_Rosi_MinenAnteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (RosiMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//� ���� �� ������ ��������� ���������� �����?
	if(MIS_bringRosiBackToSekob != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//���. ��� ����� �� ���-�� ����, �, � ���� ��, � ���� �� � ����-�� ������.
	}
	else
	{
		B_Say(self,other,"$GETOUTOFHERE");
		AI_StopProcessInfos(self);
	};
	B_GivePlayerXP(XP_Ambient);
};

