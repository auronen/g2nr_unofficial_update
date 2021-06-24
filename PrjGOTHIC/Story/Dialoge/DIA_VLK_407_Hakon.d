
var int HakonTalkedToPlayerChapter;

instance DIA_Hakon_EXIT(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 999;
	condition = DIA_Hakon_EXIT_Condition;
	information = DIA_Hakon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hakon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hakon_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Sperre(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Sperre_Condition;
	information = DIA_Hakon_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hakon_Sperre_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Sperre_Info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//����������, ���������! ������ ��������� ���, ����� �� ������� �������!
	AI_StopProcessInfos(self);
};


instance DIA_Hakon_Hallo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Hallo_Condition;
	information = DIA_Hakon_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Hakon_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//� �����, �������� �������.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//� ���� ��� ������ ������ ������ ������. ��������, ����� �������� �� ��������� �����.
	HakonTalkedToPlayerChapter = Kapitel;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"����� ������� ������� �� �������� �������.");
};


instance DIA_Hakon_Trade(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 99;
	condition = DIA_Hakon_Trade_Condition;
	information = DIA_Hakon_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Hakon_Trade_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Trade_Info()
{
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//��� ���� ������� �����, ��� ������������� ������ ������ ������� ������� � ���� �������.
	};
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		HakonMinenAnteil = TRUE;
	};
	Trade_IsActive = TRUE;
};


instance DIA_Addon_Hakon_MissingPeople(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Addon_Hakon_MissingPeople_Condition;
	information = DIA_Addon_Hakon_MissingPeople_Info;
	description = "��� �� ������ �� ������������� �����?";
};


func int DIA_Addon_Hakon_MissingPeople_Condition()
{
	if(SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Hakon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//��� �� ������ �� ������������� �����?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//� ���� ��������� �����, ���������� ����� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//��������� �� ���������� � ����� � ������ ������� �� �����, � ��������� �� �������� ������ �� ������������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//�� ������� ��������� ����� ������������� ��������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//� ����� ������ ���� �������... ����� �� ��� ����� ���. �� ���-�� ������ � ���, ��� ����� �� �����������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//�� ���������, ��� ����� ������ ���������� � ���� �� ��������� �����, ��� �������� ������ ���������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//� ��� ��� � ��� �� �����. ���� ������ � ���������� � ��� ������ ����.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//� ��������� �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//�� ���� ����� ������, ��� �� ��������, � ��� � ������. �� ���� �� ����, ��� ��� �� ������.
	Log_CreateTopic(TOPIC_Addon_Joe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Joe,LOG_Running);
	B_LogEntry(TOPIC_Addon_Joe,"�����, �������� �� ��������, �������, ��� ������� �� ����� ��� ��������� �����. ����� ����������, ��� ��� �����, ��� ���������� � ���� �� ����� ������, ��� ��������� ������ ������.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_OutOfTown(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_OutOfTown_Condition;
	information = DIA_Hakon_OutOfTown_Info;
	permanent = FALSE;
	description = "�������� ��� ��������� � ��������� ������ ������.";
};


func int DIA_Hakon_OutOfTown_Condition()
{
	return TRUE;
};

func void DIA_Hakon_OutOfTown_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//�������� ��� ��������� � ��������� ������ ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//������ ��� ����� ����� ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//��-�� ��������, � ����� �������, � ��-�� ��������� ����� ������ � ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//���� ������, ������, ������ ���� � ��� ������� �������.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//��� ����� ��������� ������ ������ � ������, ���� ������ �� ����.
};


instance DIA_Hakon_Paladine(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Paladine_Condition;
	information = DIA_Hakon_Paladine_Info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ���������?";
};


func int DIA_Hakon_Paladine_Condition()
{
	return TRUE;
};

func void DIA_Hakon_Paladine_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//�� ������ ���-������ � ���������?
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_08");	//��! ��� �������� ����!
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//������ ���, ��� ����� ������ � ���� ������ - ��� �������� ���, � �� � ������ ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//��� ������� ���� ���, ��� ������� ���� � ���������.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(� ���������) � ������, ������ � ���� ��������� ���� � ����� - ��-��!
	};
};


instance DIA_Hakon_WoWaffen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_WoWaffen_Condition;
	information = DIA_Hakon_WoWaffen_Info;
	permanent = FALSE;
	description = "��� �� ������ ������?";
};


func int DIA_Hakon_WoWaffen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Hakon_WoWaffen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//��� �� ������ ������?
	if((Kapitel > 1) && !Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_21_add");	//������ ������ �����.
	}
	else if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//�����! ������ ���� ����������� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//������ ���� ����������� ��� ������ �����.
	};
	if((Kapitel == 1) && !Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_15");	//� ������ ���, ��� �� ������, �������� ��������.
		AI_Output(self,other,"DIA_Hakon_Add_12_16");	//�� �������� �� ���� ������ ���� � ����� ��� ��������, ��� �����-���� ������. �� ������, ��� ��� ��� ����.
	};
	if((Kapitel == 1) || Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_17");	//���, ��� � ���� ���������� ���� ������ - ��� �������...
	};
};


instance DIA_Hakon_HaradBandits(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_HaradBandits_Condition;
	information = DIA_Hakon_HaradBandits_Info;
	permanent = FALSE;
	description = "����� ��������� ��� � ��������� ��������...";
};


func int DIA_Hakon_HaradBandits_Condition()
{
	if(Harad_HakonMission == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hakon_HaradBandits_Info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//����� ��������� ��� � ��������� ��������...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//��? �?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//�� ����������� �� ���� ��� ����������� � �������, ���� � �������� ���� ��������.
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(�������) ������ ������ �����. ��������, �� ��� ����� ������� ��� '������' �� ��, ��� �� �� ����� ������ ������ ������ ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_27_add");	//������?
	};
};


instance DIA_Hakon_Banditen(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Banditen_Condition;
	information = DIA_Hakon_Banditen_Info;
	permanent = FALSE;
	description = "��� �� ������ �� ���� ��������?";
};


func int DIA_Hakon_Banditen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_HaradBandits) || Npc_KnowsInfo(hero,DIA_Hakon_OutOfTown))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Banditen_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//��� �� ������ �� ���� ��������?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//��� � ���� � ���? ��� �������� ���� �� ���� � �����!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//� �� ������ ����. ��� ����� ��� ����� ������������.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//��������� �������� ��������� ��, �� ����������.
};


instance DIA_Hakon_Wieviel(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 6;
	condition = DIA_Hakon_Wieviel_Condition;
	information = DIA_Hakon_Wieviel_Info;
	permanent = FALSE;
	description = "� ��������� � ����...";
};


func int DIA_Hakon_Wieviel_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_Banditen))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//� ��������� � ����...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//���, �� ������ ������������ � ���������? � ��������? ��, ��������, ������� ����?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//������� �� ����� ���� �� ���?
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(������) �� ���� ������ ���� �� ������� ����� � ������, ��?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//� �� �����, ��� ������ ������� ���� �� ���...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//�� ��� ������� ����.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//�����, ��� ��� ���� �����. � ������� ���� 100 �������, ���� �� ���������� ���� ��������.
		MIS_HakonBanditsPay = TRUE;
	};
	MIS_HakonBandits = LOG_Running;
	Log_CreateTopic(TOPIC_HakonBanditen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HakonBanditen,LOG_Running);
	B_LogEntry(TOPIC_HakonBanditen,"�����, �������� �������, ��� �������� ��������� ���������� �� ������.");
};


instance DIA_Hakon_Miliz(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Miliz_Condition;
	information = DIA_Hakon_Miliz_Info;
	permanent = FALSE;
	description = "�� �� ������, ��� � ��������� ��������� �� �������?";
};


func int DIA_Hakon_Miliz_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Miliz_Info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//�� �� ������, ��� � ��������� ��������� �� �������?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//������ �� ����� �����. �� � ��� ��������� ������ ������ �� ������ ���� ��������. �� ��� �� ����� ��.
	B_LogEntry(TOPIC_HakonBanditen,"�����, ��������� ��������, ��������� ����������� �������� ��������.");
};


instance DIA_Hakon_Pablo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 4;
	condition = DIA_Hakon_Pablo_Condition;
	information = DIA_Hakon_Pablo_Info;
	permanent = FALSE;
	description = "�� ������, ��� ��� ����� �����?";
};


func int DIA_Hakon_Pablo_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && Npc_KnowsInfo(other,DIA_Hakon_Miliz))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Pablo_Info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//�� ������, ��� ��� ����� �����?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//�� ����������� �����. �� ������� ��� ���� �� �������� �������, ���� � ������ ����� ������.
};


instance DIA_Hakon_Wo(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Wo_Condition;
	information = DIA_Hakon_Wo_Info;
	permanent = FALSE;
	description = "��� ��� ������ �� ����?";
};


func int DIA_Hakon_Wo_Condition()
{
	if(MIS_HakonBandits == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hakon_Wo_Info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//��� ��� ������ �� ����?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//����� ����� �����. ������� �� ��� ���� ��������� ����� � ��� �� ������ �������.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//������ �� ������� �������� ��������. ��� ������� ������ ������. �������, � ��� ��� ������ ���-�� � ����.
};


instance DIA_Hakon_Success(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 2;
	condition = DIA_Hakon_Success_Condition;
	information = DIA_Hakon_Success_Info;
	permanent = FALSE;
	description = "� ����������� � ���������.";
};


func int DIA_Hakon_Success_Condition()
{
	if((MIS_HakonBandits == LOG_Running) && Npc_IsDead(Bandit_1) && Npc_IsDead(Bandit_2) && Npc_IsDead(Bandit_3) && Npc_KnowsInfo(hero,DIA_Hakon_Wo))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Success_Info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//� ����������� � ���������.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//������? ���-������ ����� ����������� ���? � ���� ���� ��������������?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(��������) ��� ���, ��������� ����� � �������� �� ������?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(��������) ��� - � �� �����, ��� ��� ����������. � ���� ����.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//�� ������ ����� ������� ������ ���� ��������� � ������.
	if(Npc_KnowsInfo(other,DIA_Hakon_HaradBandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//����� ����� ������� - � �������.
	};
	if(MIS_HakonBanditsPay == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//��� ������, ��� � � ������.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	MIS_HakonBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Hakon_Bandits);
};


instance DIA_Hakon_Minenanteil(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 3;
	condition = DIA_Hakon_Minenanteil_Condition;
	information = DIA_Hakon_Minenanteil_Info;
	permanent = FALSE;
	description = "��� �� ���� ��� �����, ��� �� �������� �����?";
};


func int DIA_Hakon_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (HakonMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//��� �� ���� ��� �����, ��� �� �������� �����?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//������, �� � �� ���� ������� ���� �����. ��� ������� ������ ��� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Hakon_PICKPOCKET(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 900;
	condition = DIA_Hakon_PICKPOCKET_Condition;
	information = DIA_Hakon_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Hakon_PICKPOCKET_Condition()
{
	return C_Beklauen(45,65);
};

func void DIA_Hakon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,Dialog_Back,DIA_Hakon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hakon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hakon_PICKPOCKET_DoIt);
};

func void DIA_Hakon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};

func void DIA_Hakon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hakon_PICKPOCKET);
};


instance DIA_Hakon_Kapitel2(C_Info)
{
	npc = VLK_407_Hakon;
	nr = 5;
	condition = DIA_Hakon_Kapitel2_Condition;
	information = DIA_Hakon_Kapitel2_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hakon_Kapitel2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hakon_Hallo) && (Kapitel > HakonTalkedToPlayerChapter) && (Canthar_Sperre == FALSE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Hakon_Kapitel2_Info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//����� ��!
	if(HakonTalkedToPlayerChapter == 1)
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_23");	//�����, �������, �������� ��� ���� ������� ������ ��� ���������.
		AI_Output(self,other,"DIA_Hakon_Add_12_24");	//��� ��������, ��� � ������ ���� ���������� ����� ������. ���� ��� ���������?
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_24_add");	//� ������ ���� ���������� ����� ������. ���� ��� ���������?
	};
};

