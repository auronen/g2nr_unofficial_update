
instance DIA_Addon_Saturas_EXIT(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if((MIS_Addon_Saturas_BringRiordian2Me == FALSE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_STUDY_01") < 700))
	{
		if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Saturas_geheimbund) || (SaturasKnows_SC_IsRanger == TRUE))
		{
			if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE))
			{
				AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//��, ��� ������� ������ ������� ���� ������ ��������� �������� � ����� ������ �����, �������� ���� ���� �������.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//������ ���������, ��� � ��� ���.
			AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//�� ������� ��� � ������ ����� ���������.
			MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
			Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
			B_LogEntry(TOPIC_Addon_HolRiordian,"������� �����, ����� � ������� � ���� ���� ���������. �� ������ ���� � ����� �� ������� �����.");
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "� ������ ������ ��������� � ����� ���������� ����� ���������.";
};


func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//� ������ ������ ��������� � ����� ���������� ����� ���������.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//���? ���� ���� �� �����! �� ����� ������������?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//�� ���� ������������. ��� �������� ��� ����.
	if((Ornament_Switched_Forest == FALSE) && Npc_HasItems(other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(��������) �� ���� ������, ��� �� �����?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//��, �������� ��� ��� ��� �����...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//������ �� ���!
		AI_PrintScreen("����� ��������� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		B_UseFakeMap(2);
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//��. � ������� ���� ����������� ������. �� ������� ������������ ���� ������.
		if(Kapitel < 3)
		{
			AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//����� ����-������ � ��������, ��� ��� �� ����� � �����.
			B_LogEntry(TOPIC_Addon_Ornament,"������� ����������� ��� �� ������������ � �������� �� ������ ����� ���������, ������� ��������� � ����. � ������ ����� � �������� ����-������, ��� ������ �� ����.");
		}
		else
		{
			B_LogEntry(TOPIC_Addon_Ornament,"������� ����������� ����, ��� � ����, ��� ��� ��������� ������ ��������, ����� ���� �������� ������.");
		};
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//�� ��, ����� � � ���� ��������, �� ������� ����� ������ �������� ������ � �����.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//��� ���� �����...
		AI_PrintScreen("����� ��������� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	};
};


instance DIA_Addon_Saturas_Hallo(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);
	if(!Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Hallo_YouKnow()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei�tdu_14_00");	//�� ���� ������ ������������� � ���, ��� �� �������?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei�tdu_14_01");	//�� ��������� ������ �������� ������� ��������� ����������� ��������, ��� � �������� ��� ���� �� �������.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei�tdu_14_02");	//����� �������, ��� ������� ������ ���.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_wei�tdu_15_03");	//��� �� �� ���������, ������? ��� ���� ��������� ��� ����.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei�tdu_14_04");	//(�����������) ������� �� ������, �����!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_wei�tdu_14_05");	//(�����������) ���, �� ��� ���� ������, ���� ����� �����?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//�� ������? ���!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//��� ������� ����� ����� ������� ������ ��� ����������� �������� �����������.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(�����������) �� ������, ����� � ���� �� ����? ��, �������! ��������� �������...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//(�����������) �� ������� �� ��, ��� � �����, ��� �� ������ ��� ����� � ����� ������?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"(��������) �...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//(�����������) �� �����-�� ������� ������� ��� ���������� ������� �� ����� ���� ����, � ����� ������ �����!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(�����������) � ����� ������ ���� ��� ������������!
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"��� ������ ����� ����. � �� �����, ��� ������.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"��� ���� �� �������� ��, ��� �� �����.",DIA_Addon_Saturas_Hallo_Spott);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"������ �����. ��� ���� ����������� ���� ���� � �� �� ���� ������� �������.",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//������ �����. ��� ���� ����������� ���� ���� � �� �� ���� ������� �������.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//(������) ��� �� ���� �� ������?! ������? ������� �������?!
	DIA_Addon_Saturas_Hallo_YouKnow();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//��� ���� �� �������� ��, ��� �� �����. ��-��, �������� ���� ����, ����� ������ ������... ����, �� � ������.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//���, �� ��� �� ��� ������� �����, ��� ��� �������� �� ������ ������ � ����� ������� � ��� �������� � �������.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//(������) ��� ������� ��� ������� ������! ��� ��� ���� ����� ������ ��� � ���� ���������?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//���� �� � �� ����������� ���� ���������, ��� �������... ������, ���� �������.
	DIA_Addon_Saturas_Hallo_YouKnow();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//��� ������ ����� ����. � �� �����, ��� ������.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//�, � ��, �������, ���������, ��� ������ �� ���� ����� ������?
	DIA_Addon_Saturas_Hallo_YouKnow();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "������� �� ����. ������ ��������. ������?";
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//������� �� ����. ������ ��������. ������?
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//�� ������� ��� ����������� �����. ����� ����� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(��������) � ��������� � ����� �����.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"� ����� ����� ���� �� ����� ��������. ��� ����� ��������, ��� ��� ��� ����������. ������� ���� ������ ��� �� �������. �� ��� ����� �� ����� ������ �� ������� � �������.");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_raus(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Saturas_raus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_keineAhnung) && (MIS_Addon_Lares_Ornament2Saturas == FALSE) && Npc_IsInState(self,ZS_Talk) && !Npc_HasItems(other,ItMi_Ornament_Addon_Vatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//�����, ���� � ����� ������ �� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "� ������ ���� � �������.";
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if(Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//� ������ ���� � �������.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//(���������������) �����? ������? ��� ��?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//� ����. ����� �������� � �����.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//���? � �� �������� ���� � ��� ������? � ��� �� �����?
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "��� ��, ��� ��� �����. ��������.";
};


func int DIA_Addon_Saturas_Ornament_Condition()
{
	if(Npc_HasItems(other,ItMi_Ornament_Addon_Vatras))
	{
		if(Lares_Angekommen == FALSE)
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//��� ��, ��� ��� �����. ��������.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	Npc_RemoveInvItem(self,ItMi_Ornament_Addon_Vatras);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//�� ��� ���� ����� ������, ��� ��� ��� ������ �������?
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//��� ��� ���� ���? ������ �� ������, ��� ����� ������ ������ ��� ����.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//��, ������ ���, ������. � ���� ������ ��� ���, ���� �� ����?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//�������. ���� ������ �������, ��� �� ����� �������� � ����� ���� ������ ����.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//������ �� ��� ��� ��� ���������� ��-�� ��� ����?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//���� � ����� ��� ������� �� ���. �� ���� ����� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(��������) � � ���� ��� ��� �������, ������? ��-�, ���� �� �����, ��� � ���� �������...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Gobbo_Skeleton,"NW_FOREST_PATH_04_9");
	Wld_InsertNpc(Skeleton,"NW_FOREST_PATH_04_8");
	Wld_InsertNpc(Lesser_Skeleton,"FP_ROAM_MEDIUMFOREST_KAP2_23");
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_Addon_Saturas_geheimbund(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = "� ����� ����� ������ ������ ����.";
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//� ����� ����� ������ ������ ����.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(�������) ���? ��� �� ����� �� ����? ���?.. �����... � ���� ���!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//�� ������� ���� ������� �������. � ������ ���� �������� ���������!
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(���������� �������) �� ����, ��� ��� ��������� �� �������. ������ � ������� ����, ���� �� � ���� �� ������.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) || (Vatras_ToldAboutDuty == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//� ������ ��� ������ ������.
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(��������) ���? ������? (�������������) �������! �� ���� ����� ����, ������� ���� �� �������, �� ������������ ������ � ���, ������� ���� �� �����.
		if(Lares_Angekommen == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//�� ������� ���� ������� �������. � ������ ���� �������� ���������!
		};
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//������������, � ���� ��� �� ����� ���������.
		AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(����) ����������...
	};
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"������� �� ����� ������� ���� � ������ ����.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(�����������) � ���� �������� ������� ������� �����. ���������� �����.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//�� �������� � ������� �����, ��� ��� ����� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//��� �������, ������� �� ������, ������� �� ���������� ����������� ��� �����.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//�� ������ �������� ������� ��� � ������������ ���� ����� �����.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "��� ��� �� �������� ��������� ������?";
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//��� ��� �� �������� ��������� ������?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//��� ���� �� �������, ������� � ��� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//���-�� �������� ��������� ����� ���-�� ��� ����� ������.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//��������, ���-�� �������� ����� ������ ������ ��������� ������� �����.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//�����, ��� ���������� �� ����, ��� ���� ������ ����� ����������� �� ���� �������.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "������ ��� ���� ��� ����� ���� ��������?";
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
//	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (RitualRingRuns == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//������ ��� ���� ��� ����� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(�����������) ��� ���� � �������.
	if(SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//���� �������� ����, ������ ���������, ��� ������ � ���� ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//������ � ������ ���� �� �����.
	};
	if(SC_KnowsPortal == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Riordian_Atlantis))
		{
			Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
			B_LogEntry(TOPIC_Addon_KDW,"���� ���� �������, ��� �� �������� ��������� ������� ���������� �����.");
			SC_KnowsPortal = TRUE;
		};
	};
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "������ � ���������� � '������ ����'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if((SaturasKnows_SC_IsRanger == FALSE) && (SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//������ � ���������� � '������ ����'.
	if((RangerRingIsMyRing == TRUE) || ArmorEquipped(other,ITAR_RANGER_Addon))
	{
		if(ArmorEquipped(other,ITAR_RANGER_Addon))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//� ����, �� ������ ������� ����� �����.
		};
		if(RangerRingIsMyRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//� ����, �� ���� ��� ������ ����. ������������� ������.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//� ��� �� ����� ������ � ����, ��� �� �������� ������.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(�������) ������. � ����� ���� � ���� ����.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//�� �����, ��� ��� �������� �� ���� ������� ���������������.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//� � �������, ��� �� ������ ��������� �� ��������������. ���� ������������ �� �����.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"������� ���������� � ���� ����������� � ������ ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//� ��� � ���� �������, ��� ������ �� ���� �� ���?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//������������� ������, ������� �� ������, ����������� ������. � ����.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//�� ��������� ���� ��������? � �� ������ ������ �������.
		AI_StopProcessInfos(self);
	};
};


func void B_GiveVatrasLetterToSaturas()
{
	if(VatrasLetterGivenToSaturas == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//� ���� ���� ��� ���� �������� �� �������.
		AI_WaitTillEnd(self,other);
		if(Vatras2Saturas_FindRaven_Open == TRUE)
		{
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,1);
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(�����������) ����. �, ������� ��, �� �� ��������� � ��������� ������ ���?
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//��, �-�...
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(������) �������, ��� � ��� ������� ������� � ���� �� ���������� ������������. ���� ������ �� �����.
		}
		else
		{
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,1);
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(���������) ���������. ������.
			B_GivePlayerXP(XP_Ambient);
		};
		VatrasLetterGivenToSaturas = TRUE;
	};
};

func void B_GivePortalRingToSC()
{
	AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//���, ������ ������. �� ���������� � ������� � �������� ����.
	CreateInvItems(self,ItMi_PortalRing_Addon,1);
	B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
	AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//���� �������� ����, ������ ���������, ��� ������ � ���� ������� ������.
	DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
	B_LogEntry(TOPIC_Addon_Ornament,"������� ��� ��� ���������� ������. � ������ ������� ������, ������� ������ � ��������, � ����� ������ ����� ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"OpenPortal");
	B_StartOtherRoutine(Cronos_NW,"OpenPortal");
	B_StartOtherRoutine(Nefarius_NW,"OpenPortal");
	B_StartOtherRoutine(Myxir_NW,"OpenPortal");
	B_StartOtherRoutine(Riordian_NW,"OpenPortal");
	B_StartOtherRoutine(Merdarion_NW,"OpenPortal");
};

instance DIA_Addon_Saturas_GiveVatrasLetter(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_GiveVatrasLetter_Condition;
	information = DIA_Addon_Saturas_GiveVatrasLetter_Info;
	description = "� ���� ���� ��� ���� �������� �� �������.";
};

func int DIA_Addon_Saturas_GiveVatrasLetter_Condition()
{
	if((VatrasLetterGivenToSaturas == FALSE) && (RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_GiveVatrasLetter_Info()
{
	B_GiveVatrasLetterToSaturas();
};


instance DIA_Addon_Saturas_OpenPortal(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = "��� ��� ������. � ������ ������.";
};


func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if((RitualRingRuns == LOG_SUCCESS) && (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//��� ��� ������. � ������ ������.
	if(SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//(������) ������! ��� ���� �� ����� ����� �����, �� ������ ���� �������� ���� �����.
		if(VatrasLetterGivenToSaturas == TRUE)
		{
			B_GivePortalRingToSC();
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//������ � ��-�������� ��� ������ �� �������. �� ������ �� ������, ���� �� �������� ��.
			if((RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
			{
				B_GiveVatrasLetterToSaturas();
				B_GivePortalRingToSC();
			}
			else
			{
				AI_StopProcessInfos(self);
			};
		};
	}
	else
	{
		if(VatrasLetterGivenToSaturas == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//� ��� � ���� �������, ��� ������ �� ���� �� ���?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//���� ������ �� ��� ��� �����, ��� ���� ����� �������� ���������, ������ ������� � ����.
			if((RangerMeetingRunning == LOG_SUCCESS) && (Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened)))
			{
				B_GiveVatrasLetterToSaturas();
			}
			else
			{
				if(Saturas_WillVertrauensBeweis == FALSE)
				{
					B_LogEntry(TOPIC_Addon_Ornament,"������� �� ���� ��� ������, ���� �� �� ������� �� ������� ����, ����������������� � ���, ��� ��� ����� ��������.");
					Saturas_WillVertrauensBeweis = TRUE;
				};
				AI_StopProcessInfos(self);
			};
		};
	};
};


instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = TRUE;
	description = "�� ������ ������� ������� ���� �����?";
};


func int DIA_Addon_Saturas_PERM_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_Nefarius) || (VatrasLetterGivenToSaturas == TRUE) || (RitualRingRuns == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Addon_Saturas_geheimbund) || (SaturasKnows_SC_IsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//�� ������ ������� ������� ���� �����?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//����� �� ����� �������� ���?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//���. � ���� ��� ������� � �������� ������.
};

