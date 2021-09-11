
instance DIA_Ulthar_EXIT(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 999;
	condition = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_GREET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_GREET_Condition;
	information = DIA_Ulthar_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulthar_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_GREET_Info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//��������, ����� ��������� ������ ��������� ����� ������ �������. �� �������� � ����� �����, ��� ���.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//� ������ ������ ������� ������?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//��� ��� ���� - ������������� ���� ������. �������� ��� ����, �� �������� ��������� �����������, ������� ������ ������ ��������� ������.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//���� �� ����� ���������� ����� �����, �� ������ �� ��������� � ����, ��� ��� ������� ������ ������������ ����� ������ ����� �� �����.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//��, ��� ��� ���������, ��� ���������� � ����...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//� ��� �� ������� �� ���� ��������, ��� ���������� ������ �������� �� ����� ������, ��� ������ ���� ��� ���?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//� �������, ��� ������ ���� ����� ������, �� �� ������ ������� �������� ���� �����, ������ ��� ����������� �����-������ ����.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//���� �� �������� ���� �������� � ������ ����������� ��������, �� ������ �� ��������. ������� �������� ���� ������, � �� ���� �������, ��� ����� �������.
};


instance DIA_Ulthar_MAGETEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_MAGETEST_Condition;
	information = DIA_Ulthar_MAGETEST_Info;
	description = "�������� ��� �� ��������� ������.";
};


func int DIA_Ulthar_MAGETEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_GREET))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_MAGETEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//�������� ��� �� ��������� ������.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//��� ���� ��� ���������� ���������� �������� � ������� �����. �� ������ ���� ����� ������ ��� ���������.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//� ����� ���� �������� ����������� ��� ����.
};


instance DIA_Ulthar_WHEN(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 3;
	condition = DIA_Ulthar_WHEN_Condition;
	information = DIA_Ulthar_WHEN_Info;
	permanent = TRUE;
	description = "����� ������� ��� ���������?";
};


func int DIA_Ulthar_WHEN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_MAGETEST) && (Knows_Fire_Contest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WHEN_Info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//����� ������� ��� ���������?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//��� ������ �� ������� ���� ������, �� ������� �� ���� ��������� ����������� � �������� ���������.
};


instance DIA_Ulthar_TEST(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_TEST_Condition;
	information = DIA_Ulthar_TEST_Info;
	permanent = FALSE;
	description = "� ����� ������ ���� ���������, ������.";
};


func int DIA_Ulthar_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_TEST_Info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//� ����� ������ ���� ���������, ������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//� �� �������, ��� �� ������ ���� ������ �����.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//�� � ����������, ��� �� �� ���������, ������ ����� �� ���� �����������. �����, ��� ������������ ��� �� �������� ��������� �����.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//��� ����� ����� ����� �� ����������� ����� ���������. � ������ ��� � �������� � ����� ������ ������� ������ ������ ��������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//����� ��� ��� ������� � ����������� ���������, � ������ ��� ������ � ���������� ���� ������� ������ - � ������ � ����������.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//������� ��� �������� ���� ������������, ��� ������ ��� ���������.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//����� � �� ���� ������ ���������� ���� ��������. ��� ��� ��������� ��� ����:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//������ ���� '�������� ������'. ��� ��� - �� ������� ���� �����.
	MIS_Rune = LOG_Running;
	Log_CreateTopic(TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rune,LOG_Running);
	B_LogEntry(TOPIC_Rune,"������ ��� ��� ���������. � ������ ������� ���� '�������� ������'.");
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_RUNNING(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 10;
	condition = DIA_Ulthar_RUNNING_Condition;
	information = DIA_Ulthar_RUNNING_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Ulthar_RUNNING_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_IsInState(self,ZS_Talk) && !Npc_HasItems(other,ItRu_FireBolt))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_RUNNING_Info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//�� ������ ���� ������. ��������� ��.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SUCCESS(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 2;
	condition = DIA_Ulthar_SUCCESS_Condition;
	information = DIA_Ulthar_SUCCESS_Info;
	permanent = FALSE;
	description = "� ������ ����!";
};


func int DIA_Ulthar_SUCCESS_Condition()
{
	if((MIS_Rune == LOG_Running) && Npc_HasItems(hero,ItRu_FireBolt))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//� ������ ����!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//�������, ���������. ����� �� - ���� ������ ����.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//����� �� ���������� ������� ����� ����, �� ������� ������������ ��.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//�� ������ ��� ���������, � ����� ������� ��������������.
	if((MIS_Golem == LOG_Running) && !Npc_IsDead(Magic_Golem))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//�� ������� ���������, ��� ���������� ���������, ��� ������� ����!
	};
	MIS_Rune = LOG_SUCCESS;
	B_GivePlayerXP(XP_RUNE);
};


instance DIA_Ulthar_PermAbKap3(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 99;
	condition = DIA_Ulthar_PermAbKap3_Condition;
	information = DIA_Ulthar_PermAbKap3_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Ulthar_PermAbKap3_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_PermAbKap3_Info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//���� �������?
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//���� ���. ��� � ��������� ������ ��������. ���� ��� ������ ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//���. ������ ������, ���� �� �� ��� �� ����, ����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SCHREINEVERGIFTET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information = DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important = TRUE;
};


func int DIA_Ulthar_SCHREINEVERGIFTET_Condition()
{
	if((Pedro_Traitor == TRUE) && (hero.guild == GIL_PAL) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info()
{
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//��� ����. ��������� ����������� ������, ����������� ������, ���� ���������� ������. ��� �������� ���� ���������� ��������.
	AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//�������, � ��� ������?
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//�� ������ �������� ��� ������, ����� �������� �� �����������.
	CreateInvItems(self,ItMi_UltharsHolyWater_Mis,1);
	B_GiveInvItems(self,other,ItMi_UltharsHolyWater_Mis,1);
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//������ ��� ������ ���� � ������ �� ��������� ������.
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//�� ������� ������� �������� � ������ �������� ��� ����� ����.
	MIS_Ulthar_HeileSchreine_PAL = LOG_Running;
	Log_CreateTopic(TOPIC_Ulthar_HeileSchreine_PAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL,LOG_Running);
	if(!Npc_HasItems(other,ItWr_Map_Shrine_MIS) && !Npc_IsDead(Gorax) && (Gorax_Trade == FALSE))
	{
		B_LogEntries(TOPIC_Ulthar_HeileSchreine_PAL,"������ ��� ��� ������� �������� ��� ������ ������ ���� ��� ������, ������������ ������.");
	}
	else
	{
		B_LogEntry(TOPIC_Ulthar_HeileSchreine_PAL,"������ ��� ��� ������� �������� ��� ������ ������ ���� ��� ������, ������������ ������.");
	};
	if(!Npc_HasItems(other,ItWr_Map_Shrine_MIS))
	{
		if(!Npc_IsDead(Gorax))
		{
			AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//������ ����� ������� ���� �����, �� ������� �������� ���� ������.
			if(!Npc_HasItems(Gorax,ItWr_Map_Shrine_MIS))
			{
				CreateInvItems(Gorax,ItWr_Map_Shrine_MIS,1);
			};
			if(Gorax_Trade == FALSE)
			{
				Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
				B_LogNextEntry(Topic_KlosterTrader,"������ ������ � ��������� ����� ������������ ��� ���, ��� ��� �����.");
				Gorax_Trade = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//��� �����. �� ��� �������� ������, ����������� ����.
			CreateInvItems(self,ItWr_Map_Shrine_MIS,1);
			B_GiveInvItems(self,other,ItWr_Map_Shrine_MIS,1);
		};
	};
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//������ ��� � �������� ���� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_WARN(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_WARN_Condition;
	information = DIA_Ulthar_WARN_Info;
	important = TRUE;
};


func int DIA_Ulthar_WARN_Condition()
{
	if((Pedro_Traitor == TRUE) && (hero.guild != GIL_PAL) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WARN_Info()
{
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//��� ����. ������� �������� �� ����������� �������. �� �������, ��� ��������� �� ��� ���� ����������.
	AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//����� �� �����, ��� ������ ��� ���������.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//���� �� ������ ��������� ��� ��������. � ��� ����������� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SchreineGeheilt(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheilt_Condition;
	information = DIA_Ulthar_SchreineGeheilt_Info;
	description = "� ������� ��� ������.";
};


func int DIA_Ulthar_SchreineGeheilt_Condition()
{
	if(MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheilt_Info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//� ������� ��� ������.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//�����������, ��� ���. � ������� �����. �� �� ������� ���� ��������� �����.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//������ ���� ������ ����, �� ����� ����������� ���� � ����� ��������� � ������.
	CreateInvItems(self,ItAm_Dex_Strg_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_Strg_01,1);
	B_GivePlayerXP(XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_SchreineGeheiltNoPAL(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 30;
	condition = DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information = DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important = TRUE;
};


func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//������� �������. ����������� ������ �������. ���� ������ ������� ��������� ����� ��� ��������.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//�� ����� ������ ��������� ���� ������ ��� �����-���� �������� ��� �����������.
	AI_StopProcessInfos(self);
};


instance DIA_Ulthar_PICKPOCKET(C_Info)
{
	npc = KDF_502_Ulthar;
	nr = 900;
	condition = DIA_Ulthar_PICKPOCKET_Condition;
	information = DIA_Ulthar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Ulthar_PICKPOCKET_Condition()
{
	return C_Beklauen(74,320);
};

func void DIA_Ulthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,Dialog_Back,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

