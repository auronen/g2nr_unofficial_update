
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	if(MIS_Addon_Saturas_BringRiordian2Me == LOG_Running)
	{
		MIS_Addon_Saturas_BringRiordian2Me = LOG_FAILED;
		B_CheckLog();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "�� ������ ������� ����� �����?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//�� ������ ������� ����� �����?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//���, ����� ���. � ������� ���, ����� ������� ������ ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//����������� ������ ��������� ��� ������ � ������, �� �� �����, ��� �������� ���� ������, ���������� �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//�����, ������ ����, ���� ������ �������.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "��� �� ����� ��� ����������?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//��� �� ����� ��� ����������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//�� �������, �������� ������, �� ����� ���� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//���� ����� �� ���� ���������.
	if(!Npc_HasItems(William,ItWr_Addon_William_01))
	{
		DIA_Common_IFoundHim();
		AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//��������� ����.
		if(FoundDeadWilliam == FALSE)
		{
			if(Sklaven_Flucht == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
			};
			B_LogEntry(TOPIC_Addon_MissingPeople,"����� �� �������� ������ �����. � ����� ��� ���� � ���������.");
		};
		FoundDeadWilliam = TRUE;
	}
	else if(!Npc_KnowsInfo(other,DIA_Addon_Saturas_MissingPeople))
	{
		if(Sklaven_Flucht == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		};
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//�� ������� ����������� �������� ������, �� ������� ��������� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//��������� �� ������, � ��� ������������ �������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//�� ����� ����� � �� ���� �� �����. ��� ������� ���������� ����� � ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//������� �� ������ ��������, ���� �� ���������� �����... ��� �� ������� ������ �������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//�� ������ ������������� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//� ����� �� ������, �� ��-�����, ������ ��� ���� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//�������, ��, ������, �� �����-�� ��������� ���� �����������.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "�������� ��� �� ���� ��������� ��������.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//�������� ��� �� ���� ��������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//��� �� ������ ������?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && !Npc_HasItems(other,ItWr_Map_AddonWorld))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"���������� �� ����� ���� ���������?",DIA_Addon_Riordian_Gegend_map);
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� �� �������� �������?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"�������, ��� ������������ �������?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"�� ��� �������� �� ������?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� � ����� �� �������?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� ����������� �� ���?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"��� ��������� �� ������?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//���������� �� ����� ���� ���������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//��, ������ ��� ��������� �����. �������� � ����.
	DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//�������, ��� ������������ �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//�� �������� � ���������� ����� ��������� �� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//����� ��������� �� ��������, ���� �������� �������� ������.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//��� �� �������� �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//�� ������. ��������� ������ ��������� � ����� ����� �������� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//�����, ��� ���������.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//��� ��������� �� ������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//���� ������ ������� ������, ��� ����������� ������� ������, ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//�������� ��� ���������� ����� � ��������������� �� ������ �����.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//��� ����������� �� ���?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//��������� �� ��� ����� ����������������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//�� ������� ��� ��������-����������, �������� � ����� ����������� ����.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//��� � ����� �� �������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//�������� ������. ��� ��������� ����� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//��� ����� ��������� �� ������ ��������, �� � ����������� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//���� ����������.
};

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//�� ��� �������� �� ������?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//��� ���. �� �� �����, ��� ��� ��������� ����� ����.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//������, �� ���� ������ �������� ���� ������ ������.
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "���� ������ �������. � ������ ����������� ���� ������� ���������.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(SaturasSendsToRiordian == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//���� ������ �������. � ������ ����������� ���� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//�� ��, ����� ����� �������� �� �� ��������������� � ������� ������, ��� ������������ ��������� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//�� ���� ������ � ���� ���� ���� ������ ����������.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


var int B_WhereAreHousesOfRulersOneTime;

func void B_WhereAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//������ ������ - ��� �������� ����������. ��� ��������� ������ �� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//������ ������ ���������� �� �������. �� ������������ �� ���� ��������, ���������� �������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//������ ������ � ������� ������� ����������� �������� ���� �� �����. �� ������� �� �� ���-������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//� ������-��������� ��������� ������ ���� ���-�� �� ���-�������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//���� ��� ������ ��� �����������, �� ������� �� �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//��� ������ ��������� �� �����������. � ����������� ��������� ����� � ������ �� ��� ���� ������ ��������.
	if(B_WhereAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//�������, ���� ��� �������.
		B_LogEntry(TOPIC_Addon_HousesOfRulers,"����� ������ - ��� �������� ����������. ��� ��������� ���-�� �� ������.");
		Log_AddEntry(TOPIC_Addon_HousesOfRulers,"����� ������ - ��� ���������� ������� �������� �� �������.");
		Log_AddEntry(TOPIC_Addon_HousesOfRulers,"����� ������ � ������� ������� ��������� �������� ���� �� �����. � ����� ����� �� �� ���-������.");
		Log_AddEntry(TOPIC_Addon_HousesOfRulers,"������-��������� ��������� ��������� �� ���-�������.");
		B_WhereAreHousesOfRulersOneTime = TRUE;
	};
};

instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "��� ��������� ���� �������?";
};


func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if(MIS_Riordian_HousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//��� ��������� ���� �������?
	B_WhereAreHousesOfRulers();
};


var int FOUNDHOUSEINFO[6];
const int Scientists = 1;
const int Healers = 2;
const int Warriors = 3;
const int Priests = 4;
const int Guardians = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "������ �������...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//������ �������...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//��?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[Scientists] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//����������� ������, ������, ���������������� ����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//�� ���������, ��� ��� �������� ��������� ������ �� ������� �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//���, � ��� �� �����, �� ��� �����...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//�����, � ����� ������, ���� ����� �� ��� ����������.
		FOUNDHOUSEINFO[Scientists] = TRUE;
		RiordianHouseNeuigkeit += 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"�������� ����� �������, ���� � ����� ������ �� �����.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[Healers] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//������ ��������� ��������� � ������ ������. ��� �������� �������� ������.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//������, �� ��� ��� �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//��, �� ����������, ������� ��� ��� ���������...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//��� ������ ������ ���������� ������� ��������, ���������� ��������...
		FOUNDHOUSEINFO[Healers] = TRUE;
		RiordianHouseNeuigkeit += 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[Warriors] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//�� ������ ������ ��������� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(�������) �� ������ ������� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//��� ����� ������������ �������� �� ���� ������.
		FOUNDHOUSEINFO[Warriors] = TRUE;
		RiordianHouseNeuigkeit += 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[Priests] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//�� ������ ������ ���� ��������� ���������...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//�� ���� ��� �������� ����������� ����� ����� �����, �����?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//��, �� ����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//�������� ���� ����� ��������...
		FOUNDHOUSEINFO[Priests] = TRUE;
		RiordianHouseNeuigkeit += 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[Guardians] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//��� ������� ������� �������� ���� ���.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//� ������ ������� �� �������� ����� ���������� ����� � ����� �����.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//����� ��������� ������! ������ ������� ���� ������� ����� �� ������������.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//�� ������ ����� � ����� ������� ��������� �� ���� ������. �������, �� ��������� �� �� ���������.
		FOUNDHOUSEINFO[Guardians] = TRUE;
		RiordianHouseNeuigkeit += 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount += RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//������� ���, ��� ��� ���������?
		B_WhereAreHousesOfRulers();
	};
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "� ����� ��� ������.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//� ����� ��� ������.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//��� ��� ���������� ���, ��� � ������?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//��... �����-�����.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//�������! ������, ��� ������ ���� �� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//��������� ����.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};


instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 3;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "����� ���� �������� ������� � ���� ���������.";
};


func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(FOUNDHOUSEINFO[Scientists] == TRUE)
	{
		if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//����� ���� �������� ������� � ���� ���������.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//������ �� ��� ��������?
	if(OrcShaman_CanyonLibrary_KilledByPlayer == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//� ���� �� ���������.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//�� ������������ �����.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//����� ���������, �� ����.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//��� ������ �� ����� ������ ������.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 4;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//�� ������ ���� ����-������ �������?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//��, � ���� ������� ���� ��������� �������.
	if((Riordian_Addon_TeachWisp == TRUE) && (Riordian_Addon_TeachWisp_NoPerm == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//� ��� � ���� �������� ����, ��� ������� ���� ������ ������ ��������� ��������.
	};
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
	Riordian_Addon_TeachAlchemy = TRUE;
};

instance DIA_Addon_RiordianADW_TeachPre(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = DIA_Addon_RiordianADW_TeachPre_Condition;
	information = DIA_Addon_Riordian_TeachPre_Info;
	description = "������ ��� ��� ���� ������ ������� �������...";
};


func int DIA_Addon_RiordianADW_TeachPre_Condition()
{
	if((Riordian_Addon_TeachWisp == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

instance DIA_Addon_Riordian_ADW_Teach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = DIA_Addon_Riordian_ADW_Teach_Condition;
	information = DIA_Addon_Riordian_ADW_Teach_Info;
	permanent = TRUE;
	description = "������ ���, ��� ����������� ����� ����������� �������.";
};


func int DIA_Addon_Riordian_ADW_Teach_Condition()
{
	if((Riordian_Addon_TeachWisp == TRUE) && (Riordian_Addon_TeachWisp_NoPerm == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,Dialog_Back,DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FF,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach,B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS,B_GetLearnCostTalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		Riordian_Addon_TeachWisp_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS()
{
	if(B_TeachPlayerTalentWispDetector(self,other,WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};


instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 4;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "����� ���� ��������� �����.";
};


func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((Riordian_Addon_TeachAlchemy == TRUE) && (Riordian_Addon_TeachAlchemy_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//����� ���� ��������� �����.
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_HP_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_HP_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente += 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_Mana_Essenz,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_Mana_Extrakt,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_Mana_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_ManaMax_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente += 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && C_ShowAlchemySTRDEXDialog())
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,B_BuildLearnString(NAME_DEX_Elixier,B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente += 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain_Riordian == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//���������� ����� ��������������� �� ������������ �����. �� ���������� ����� ���� � ����� �� ������ �������.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//���� ����������� ������ �����, ����������� �, �������, ������ ������� �����.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//�������� �� ������ ��������� � ����. ��� ��������� ���� �������� ������ ������.
			Alchemy_Explain_Riordian = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//����� ������ �� ������ �������?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//� ��� ������ ���� �����, ��� ���� ���.
		Riordian_Addon_TeachAlchemy_NoPerm = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

