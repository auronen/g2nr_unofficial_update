
instance DIA_Pyrokar_EXIT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 999;
	condition = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pyrokar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_WELCOME(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WELCOME_Condition;
	information = DIA_Pyrokar_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Pyrokar_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//����, � ��� ����� ���������. � �������, �� ��� ������� ������� � ������� �������.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(������ �����������) �� �� ������, ��� ��� � �������� ���� ������ ��������� ���� ����������� �������� ���� ������.
};


instance DIA_Pyrokar_Hagen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Hagen_Condition;
	information = DIA_Pyrokar_Hagen_Info;
	permanent = FALSE;
	description = "� ������ ���������� � ����������. ��� ������.";
};


func int DIA_Pyrokar_Hagen_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Hagen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//� ������ ���������� � ����������. ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//�� ������� ���, � ��� �� ����������� �������� � ����?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//� ���� ��� ��� ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//��� ��� �� ���������?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//����� ��� ���������� � ������ ��������. �� ����������� �������! �� ������ ���������� ��, ���� ��� ��� ��������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//��. �� ������ �������� ���� �����, ���������. ����� ������ �����, �� ����� ���� �����, ��� �� ����� ������ ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//� ���� ���� ����� ������� ����� ����������� �������� ����� ������������ ����������.
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//�� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_Auge(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_Auge_Condition;
	information = DIA_Pyrokar_Auge_Info;
	permanent = FALSE;
	description = "� ��� ���� ������.";
};


func int DIA_Pyrokar_Auge_Condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Auge_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//�����, ��� ��������, ��� �� ����� �� ������ ����� ���� ��������� ������, �� ����� � ������ ��� - �����.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//���� ������ ��� �������� ������ ������� - ������ ���, ��� ������� ������������ ��� �����, �������� ������ ���.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//� ��� �� ����� �� �����������.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//����������� ���������� ��������� �������� - �� �������.
	B_LogEntry(TOPIC_INNOSEYE,"� �� �����, ��� ��� ����� ��� ��������, �� ������� �� ������ ���� �����������, ����� �� �������� ��� ������ ���������.");
	if(Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//��� �, �� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Pyrokar_MissingPeople(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Addon_Pyrokar_MissingPeople_Condition;
	information = DIA_Addon_Pyrokar_MissingPeople_Info;
	description = "������ �������� ������������ ������� ��������.";
};


func int DIA_Addon_Pyrokar_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pyrokar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//������ �������� ������������ ������� ��������.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//��� ��� ��������, � � ������� �������� ����� ��������������. �� ���� ����� ���������� ���� ����.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//��� �� �������� �������� ������� �������� �������������, ������������ � ������-��������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//�� ��� ��� ��� �� ������ ��� ������, ��� �� ��������� ���� ������. ������� �� �� ������������� ������� ��������.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//��, ��...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//������� '��'! �� ����� ��������� ���, ��� ������� ������, � � �������, ��� �� ��� �������.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"���� ���� �������� �������������� �������. ������, ��� �������, ��� ���� ������ ���������� ���� ����. � ��������� ��� �� ������� ����� ������ �� ����� �������.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_Pyrokar_GOAWAY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_GOAWAY_Condition;
	information = DIA_Pyrokar_GOAWAY_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pyrokar_GOAWAY_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_Addon_Pyrokar_MissingPeople) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,DIA_Pyrokar_Hagen) && Npc_KnowsInfo(hero,DIA_Pyrokar_Auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(�����������) �������� - �����������, ������� ���� ��� ��������� ���������. ��� ��� �����.
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_FIRE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_FIRE_Condition;
	information = DIA_Pyrokar_FIRE_Info;
	permanent = FALSE;
	description = "� ���� ������ ��������� �����.";
};


func int DIA_Pyrokar_FIRE_Condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Pyrokar_Hagen))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FIRE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//� ���� ������ ��������� �����.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(���������) ��� �� ������ �... �� ������ ������ ��������� �����?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//��, � �������� �� ����� ����, ������� ������...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(����� ���������) �� ����� ����� ����. �� ����� ������, ��� ��������� ����������� ������� ��� ����������� ����� ���������. �� ������ ������������ ���� �������.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//� ���� ������ ��� ��������� - � � ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(��������������) ���� �� ������������� �����������, ������ ����� ���������� ���� ����� ���������.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//� ��������� �� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//� ����� ������ - ��� ���� � ����. ����� �� ������ �����, ������ �� ����� ������� ������ ���� ���� �������, ������� �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//�� �������� ����� ��� ����� �����.
	KDF_Aufnahme = LOG_Running;
	B_LogEntry(TOPIC_FireContest,"� ���������� � �������� ������ ��������� �����. ������ � ������ ��������� ��� ������� ������� ������.");
};


instance DIA_Pyrokar_TEST(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 10;
	condition = DIA_Pyrokar_TEST_Condition;
	information = DIA_Pyrokar_TEST_Info;
	permanent = FALSE;
	description = "� ����� ������ ���������, ������.";
};


func int DIA_Pyrokar_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEST_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//� ����� ������ ���������, ������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//� ������ ������ ������ ������, �������� �� �� ���. �� ������ ���������� ���� �� ���������, ��� � ��������� ����������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//��������� ������. (��������) ��, ��������, ������, ��� ������ ���� �� ����������� ������ ������ ��� ���������.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//�������. � ��� ��� ���������?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//����� � ����� �������� ������ ����� �����������, ������� ������ ������������� ����� ���������: ����, ������ � ����. ��� ��� ���������� � �������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(���������) �� ������ �� ����! ������ ����� ����� ���������: '������ ������ ������ � ������� ��, ��� �������� ������� � ����� ����'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//���� ����������� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//��� ���, ��� �� ����� ������� ����.
	Log_CreateTopic(TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Schnitzeljagd,LOG_Running);
	B_LogEntry(TOPIC_Schnitzeljagd,"������� ���� ��� ��������� ������. ��� �� �� ����� ���������, ��� ������ ������ ��������� ���������� ����, ������ � ����.");
	Log_AddEntry(TOPIC_Schnitzeljagd,"� ������ ��������� ������ ������ � '�������� ��, ��� �������� ������� � ����� ����'. ����� �� ��� ��� ����.");
	CreateInvItems(self,ItKe_MagicChest,1);
	B_GiveInvItems(self,other,ItKe_MagicChest,1);
	if(!Npc_IsDead(Igaraz))
	{
		Igaraz.aivar[AIV_DropDeadAndKill] = TRUE;
		Igaraz.aivar[AIV_NewsOverride] = TRUE;
		Igaraz.aivar[AIV_IgnoresArmor] = TRUE;
		Igaraz.aivar[AIV_IgnoresFakeGuild] = TRUE;
		Igaraz.aivar[AIV_CommentedPlayerCrime] = FALSE;
		CreateInvItems(Igaraz,ItKe_MagicChest,1);
		AI_Teleport(Igaraz,"NW_TAVERNE_BIGFARM_05");
		B_StartOtherRoutine(Igaraz,"CONTEST");
		B_StartOtherRoutine(Nov607,"EXCHANGE");
	};
	if(!Npc_IsDead(Agon))
	{
		Agon.aivar[AIV_DropDeadAndKill] = TRUE;
		Agon.aivar[AIV_NewsOverride] = TRUE;
		Agon.aivar[AIV_IgnoresArmor] = TRUE;
		Agon.aivar[AIV_IgnoresFakeGuild] = TRUE;
		Agon.aivar[AIV_CommentedPlayerCrime] = FALSE;
		CreateInvItems(Agon,ItKe_MagicChest,1);
		AI_Teleport(Agon,"NW_MAGECAVE_RUNE");
		B_StartOtherRoutine(Agon,"GOLEMDEAD");
	};
	if(!Npc_IsDead(Ulf))
	{
		Ulf.aivar[AIV_DropDeadAndKill] = TRUE;
		Ulf.aivar[AIV_NewsOverride] = TRUE;
		Ulf.aivar[AIV_IgnoresArmor] = TRUE;
		Ulf.aivar[AIV_IgnoresFakeGuild] = TRUE;
		Ulf.aivar[AIV_CommentedPlayerCrime] = FALSE;
		B_SetGuild(Ulf,GIL_NOV);
		CreateInvItems(Ulf,ItKe_MagicChest,1);
		AI_Teleport(Ulf,"NW_TROLLAREA_PATH_42");
		B_StartOtherRoutine(Ulf,"SUCHE");
	};
	MIS_Schnitzeljagd = LOG_Running;
	AI_StopProcessInfos(self);
};


func int C_FireContestRuneFound()
{
	if(C_WorldIsFixed(NEWWORLD_ZEN))
	{
		if(!Mob_HasItems("MAGICCHEST",ItMi_RuneBlank))
		{
			return TRUE;
		};
	}
	else if(Npc_HasItems(other,ItMi_RuneBlank) || Npc_HasItems(other,ItRu_FireBolt))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Pyrokar_RUNNING(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 20;
	condition = DIA_Pyrokar_RUNNING_Condition;
	information = DIA_Pyrokar_RUNNING_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Pyrokar_RUNNING_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		if(!C_FireContestRuneFound())
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_RUNNING_Info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//���� �� �� �������� ��� ���������, ��� ������ ������� ����.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//���� �� �����? ���, ������� ���������!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//������ ����� ����������� ���� ������� ����� ������. ���� ��� �� �������, ���������?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_SUCCESS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SUCCESS_Condition;
	information = DIA_Pyrokar_SUCCESS_Info;
	permanent = FALSE;
	description = "� ����� ������ ������.";
};


func int DIA_Pyrokar_SUCCESS_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (hero.guild == GIL_NOV))
	{
		if(Npc_HasItems(other,ItMi_RuneBlank) || Npc_HasItems(other,ItRu_FireBolt))
		{
			if(C_FireContestRuneFound())
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Pyrokar_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//� ����� ������ ������.
//	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(�����������) ��... ������ ���?! �� �������� ������ � ����� ������� ������...
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01_add");	//(�����������) ��... ������ ���?! �� �������� ������ � ����� ������� ������...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... � ����� ����� ������� ���� ��� ��������, ��� ��� ������� ���� ����� �������.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//� ������ ����������? ��� ������ �����? ��� �� ��������� ����?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//��� �� ������. � �����, �� ���� �� ������� ������ ��� ���������.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//��� �, � ����� ������ �� ���������, ��� �� ������ ��� ���������. � ���� ������ ������ ������ ����.
	MIS_Schnitzeljagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_SCHNITZELJAGD);
};


instance DIA_Pyrokar_Todo(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Todo_Condition;
	information = DIA_Pyrokar_Todo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pyrokar_Todo_Condition()
{
	if((MIS_Schnitzeljagd == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((MIS_Rune != LOG_SUCCESS) || (MIS_Golem != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Todo_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//�� ������ ���������, �������� ������� ���� �.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//��...
	if(MIS_Rune != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... ���� ��� ���������� ������ ��������� �������.
	};
	if(MIS_Golem != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... ���� ��� ���������� ��������� ������� ����������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Pyrokar_MAGICAN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_MAGICAN_Condition;
	information = DIA_Pyrokar_MAGICAN_Info;
	permanent = FALSE;
	description = "������ � ���� ������ � ������� �����?";
};


func int DIA_Pyrokar_MAGICAN_Condition()
{
	if((MIS_Schnitzeljagd == LOG_SUCCESS) && (MIS_Rune == LOG_SUCCESS) && (MIS_Golem == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAGICAN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//������ � ���� ������ � ������� �����?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//�� ������ ���. �� ������ ��������� �����. �� � ������ ������ ���� �������, ��� �� ���������� � ����.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(����������) �� ����� �������, ��� �� ���������� ��������� ��� ������, ����� ����� ��������� ������ ������.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//����, ���� �� ����� ������� ������ ����, �� ������ ������ � ���� ����.
};


instance DIA_Pyrokar_OATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 1;
	condition = DIA_Pyrokar_OATH_Condition;
	information = DIA_Pyrokar_OATH_Info;
	permanent = FALSE;
	description = "� ����� �������� � ���� ����.";
};


func int DIA_Pyrokar_OATH_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_MAGICAN) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_OATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//� ����� �������� � ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//������, ����� ������� ������ ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(������������) ��������� �� ��, ����� ����� ������ �����������, ��� ���� � ���������� ����...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... ��� � ����� ������� � �� ����� ���� ��� ����� ���� ����� ����� � �����...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... �� ��� ���, ���� ���� ���� � ���� �� ������ ����� � ���� ��������� �������� � ����� ����� ����� �� �������?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//��������� ����� ���� ������, �� ������������� � ���������� ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//���� ��� ���� � ���� ���� ������ ��.
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		MIS_NeorasPflanzen = LOG_OBSOLETE;
	};
	if(MIS_NeorasRezept == LOG_Running)
	{
		MIS_NeorasRezept = LOG_OBSOLETE;
	};
	if(MIS_IsgarothWolf == LOG_Running)
	{
		MIS_IsgarothWolf = LOG_OBSOLETE;
	};
	if(MIS_ParlanFegen == LOG_Running)
	{
		MIS_ParlanFegen = LOG_OBSOLETE;
	};
	if(MIS_GoraxEssen == LOG_Running)
	{
		MIS_GoraxEssen = LOG_OBSOLETE;
	};
	if(MIS_GoraxWein == LOG_Running)
	{
		MIS_GoraxWein = LOG_OBSOLETE;
	};
	if(MIS_MardukBeten == LOG_Running)
	{
		MIS_MardukBeten = LOG_OBSOLETE;
	};
	B_SetGuild(hero,GIL_KDF);
	B_GiveArmor(ITAR_KDF_L);
	Fire_Contest = TRUE;
	Snd_Play("LEVELUP");
	if(Hlp_IsValidNpc(Lothar) && !Npc_IsDead(Lothar))
	{
		Npc_ExchangeRoutine(Lothar,"START");
	};
	Wld_AssignRoomToGuild("zuris",GIL_PUBLIC);
	KDF_Aufnahme = LOG_SUCCESS;
	B_CancelBengarMilitiaProblem();
	B_GivePlayerXP(XP_BecomeMage);
	if(!Npc_IsDead(Gorax))
	{
		CreateInvItems(Gorax,ItMi_RuneBlank,2);
	};
	if(!Npc_IsDead(Karras))
	{
		CreateInvItems(Karras,ItMi_RuneBlank,1);
	};
	if(!Npc_IsDead(Igaraz))
	{
		if(Npc_KnowsInfo(other,DIA_Igaraz_Stein))
		{
			B_RemoveNpc(NOV_601_Igaraz);
		}
		else
		{
			B_StartOtherRoutine(Igaraz,"Start");
			Igaraz.aivar[AIV_DropDeadAndKill] = FALSE;
			Igaraz.aivar[AIV_NewsOverride] = FALSE;
			Igaraz.aivar[AIV_IgnoresArmor] = FALSE;
			Igaraz.aivar[AIV_IgnoresFakeGuild] = FALSE;
		};
	};
	if(!Npc_IsDead(Ulf))
	{
		if(Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
		{
			B_RemoveNpc(NOV_602_Ulf);
		}
		else
		{
			B_StartOtherRoutine(Ulf,"BackToMonastery");
			Ulf.aivar[AIV_DropDeadAndKill] = FALSE;
			Ulf.aivar[AIV_NewsOverride] = FALSE;
			Ulf.aivar[AIV_IgnoresArmor] = FALSE;
			Ulf.aivar[AIV_IgnoresFakeGuild] = FALSE;
		};
	};
	if(!Npc_IsDead(Agon))
	{
		if(Npc_KnowsInfo(other,DIA_Agon_GolemDead) || Npc_KnowsInfo(other,DIA_Agon_GolemLives))
		{
			B_RemoveNpc(NOV_603_Agon);
			Wld_InsertNpc(VLK_4007_Agon,"CITY2");
		}
		else
		{
			B_StartOtherRoutine(Nov607,"Start");
			B_StartOtherRoutine(Agon,"Start");
			Agon.aivar[AIV_DropDeadAndKill] = FALSE;
			Agon.aivar[AIV_NewsOverride] = FALSE;
			Agon.aivar[AIV_IgnoresArmor] = FALSE;
			Agon.aivar[AIV_IgnoresFakeGuild] = FALSE;
		};
	};
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//������, ����� �� ��� ������ � ���� ����, �� ������ ���������� � ������ �������, ����������������� ���������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//��� ����� ����� ��������� �����, ��� �� ��������� ��������. ��� ��� �� ������ ������ ������������ � �������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//�� �������, ��� �� ��������� ��� ����� ����������.
	Player_KnowsLordHagen = TRUE;
};


instance DIA_Pyrokar_Lernen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Lernen_Condition;
	information = DIA_Pyrokar_Lernen_Info;
	permanent = FALSE;
	description = "��� � ���� ������� ������?";
};


func int DIA_Pyrokar_Lernen_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Lernen_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//��� � ���� ������� ������?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//������ �����, ������ �� ������ ����� ������� ����� �����. ��� ����� ���� ������ ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//��� ���� �� ������ ����������� � ����� ������ �����, ��� ����� �������� ������������ �� ������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//�� ������� ������ ������� ���������� � ����� ������� � ���������. ������ �� ��� ���������������� � ������������ �������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//������, ��������, ������ ������, � ������ ������ ���� ����� ����.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//����� �� ����� ������ � ����� ����, ��� ������. ������ ����� ������� ���� ������ ��������� ����������� - � �� ������ ���� � ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//�� ������ �� ��� ����� ����� ���� ������ �������� - ���� �� ������ ������ ��������� ���.
	if(!Npc_KnowsInfo(other,DIA_Parlan_MAGE))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ������ �������� ���� � ������ ����� ����� � ������ ��������� ��������� ������.");
	};
	if(!Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ������ ������� �������� ������.");
	};
	if(!Npc_KnowsInfo(other,DIA_Hyglas_JOB))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ������ ����� ��������� ���� � ����� ����.");
	};
	if(!Npc_KnowsInfo(other,DIA_Marduk_BEFORETEACH))
	{
		Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher,"���� ������ ����� ��������� ���� � ����� ���� � �����.");
	};
};


instance DIA_Pyrokar_Wunsch(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Wunsch_Condition;
	information = DIA_Pyrokar_Wunsch_Info;
	permanent = FALSE;
	description = "� ����� �� ��������� ���������...";
};


func int DIA_Pyrokar_Wunsch_Condition()
{
	if(other.guild == GIL_KDF)
	{
		if(Kapitel < 2)
		{
			return TRUE;
		}
		else if(GuildlessMode == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_Wunsch_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//� ����� �� ��������� ���������...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//����� �������� � ���� ����, ������ ��� �������� ������ �� ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//����, ����� �� ����� ���� ������ ��� � �������� ����?
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
	Info_AddChoice(DIA_Pyrokar_Wunsch,"�������.",DIA_Pyrokar_Wunsch_Nothing);
	if((MIS_HelpBabo == LOG_Running) && !Npc_IsDead(Babo))
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"������� ���������� ���� ���������� ������������ ���.",DIA_Pyrokar_Wunsch_Babo);
	};
	if((MIS_HelpOpolos == LOG_Running) && !Npc_IsDead(Opolos))
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"������� ���������� ������� �������� ������ � ����������.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if((MIS_HelpDyrian == LOG_Running) && (Kapitel == 1) && !Npc_IsDead(Dyrian))
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch,"������� ���������� ������� �������� � ���������.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

func void DIA_Pyrokar_Wunsch_Nothing()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(���������) �� ����� ���. ����� ��� ������������ �� ������� ����.
	if(!Npc_IsDead(Dyrian))
	{
		B_SetGuild(Dyrian,GIL_NONE);
		Dyrian.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_Teleport(Dyrian,"TAVERNE");
		B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	B_CheckLog();
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//������� ���������� ������� �������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//����� ���������� ����� ��������� �������� � ���������, � �� ������ ����� ���������, ������� ������ ��������.
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	B_StartOtherRoutine(Dyrian,"FAVOUR");
	MIS_HelpDyrian = LOG_SUCCESS;
	B_GivePlayerXP(XP_HelpDyrian);
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Babo()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//������� ���������� ���� ���������� ������������ ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//� ���� ������� ��������� ���� ����� �������� �� ������������ ���.
	if(!Npc_IsDead(Dyrian))
	{
		B_SetGuild(Dyrian,GIL_NONE);
		Dyrian.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_Teleport(Dyrian,"TAVERNE");
		B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};
	if(MIS_HelpOpolos == LOG_Running)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	B_StartOtherRoutine(Babo,"FAVOUR");
	MIS_HelpBabo = LOG_SUCCESS;
	B_GivePlayerXP(XP_HelpBabo);
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Opolos()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//������� ���������� ������� �������� ������ � ����������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//� ���� ������� ���������� ������� ����� ��������� ������� ������� ������.
	if(!Npc_IsDead(Dyrian))
	{
		B_SetGuild(Dyrian,GIL_NONE);
		Dyrian.aivar[AIV_CommentedPlayerCrime] = FALSE;
		AI_Teleport(Dyrian,"TAVERNE");
		B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	};
	if(MIS_HelpDyrian == LOG_Running)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};
	if(MIS_HelpBabo == LOG_Running)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	B_StartOtherRoutine(Opolos,"FAVOUR");
	MIS_HelpOpolos = LOG_SUCCESS;
	B_GivePlayerXP(XP_HelpOpolos);
	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};


instance DIA_Pyrokar_Nachricht(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_Nachricht_Condition;
	information = DIA_Pyrokar_Nachricht_Info;
	permanent = FALSE;
	description = "� ������ ������� �� ����� ������.";
};


func int DIA_Pyrokar_Nachricht_Condition()
{
	if(MIS_OLDWORLD == LOG_Running)
	{
		if(other.guild == GIL_KDF)
		{
			return TRUE;
		}
		else if((other.guild == GIL_NOV) && (GuildlessMode == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_Nachricht_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//� ������ ������� �� ����� ������. �� ����� �������� �������������� ����������� �������� � ����� ���.
	if(EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport(Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//������� � ������ ����������� � ������ �������� � ��������� ��� ��� ��������������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//������. �� ��������� ���� ������. ������� ������ ���������� ���� � �������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//�� ������ ���� �����.
		Sergio_Follow = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//� ����������� � ������ ��������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//������. ��� ��� �� ��� ������ ���� � ������, ���� �� ����� ������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//������� ��� ������� ����� ������ - �� ������ ���� �����.
	};
};


instance DIA_Pyrokar_TEACH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 4;
	condition = DIA_Pyrokar_TEACH_Condition;
	information = DIA_Pyrokar_TEACH_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ���������� ����� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6));
	description = B_BuildLearnString("������ ���� �����",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6));
};


func int DIA_Pyrokar_TEACH_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//����� ���� ���������� ����� �����.
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if(B_TeachMagicCircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//����� ������� ������ � ��� ���, ��� �� ������ ���� � �����. ������ ��������� � ��� ���, �� ����� ��� ���.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//�� - ��������� ������. � ���� ����������� ��� ���� ����, ����� �������� � ���� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//� �������� ����, �, ���������. �� ������� � ������ ���� - �� ��������� �� � ����� ���� � �������� ����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//������ �� ������ ������ ������� ����� ���������� ����� �� ����, ���� �� ���� �������.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//�� - � ��� ����. ��� ������������ ��������� �����, ����� �������� ����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//�� ������� ��� ������ �� ����, ����� ��� �������� ���� �� ������.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//��, �� ����� ������� ������� ���� �� ������ �������� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//� �� ��������� ������.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//������ �� ������ ��� �������������, �, ���������!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//�����, ���� ������ � ����� ������, ���������� ����� ��������, ������ ���������� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//��� ��� ��������, ���� � �������� ��������� �� ����, ������� �� ������������ ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//����� ��� ����� ��� �� ������. ����� �� �������� ���� ������ �� ����, ������� ����� ������� ����, � ����� ����.
	};
};


instance DIA_Pyrokar_SPELLS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SPELLS_Condition;
	information = DIA_Pyrokar_SPELLS_Info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int DIA_Pyrokar_SPELLS_Condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPELLS_Info()
{
	var int abletolearn;
	abletolearn = 0;
	DIA_Common_WantToLearnNewRunes();
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
	Info_AddChoice(DIA_Pyrokar_SPELLS,Dialog_Back,DIA_Pyrokar_SPELLS_BACK);
	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Pyrokar_SPELLS_Firerain);
		abletolearn += 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,B_BuildLearnString(NAME_SPL_BreathOfDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BreathOfDeath)),DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn += 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn += 1;
	};
	/*if(PLAYER_TALENT_RUNES[SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS,B_BuildLearnString(NAME_SPL_Shrink,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Shrink)),DIA_Pyrokar_SPELLS_Shrink);
		abletolearn += 1;
	};*/
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//��� ������ ������ ����� ����.
	};
};

func void DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
};

func void DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_BreathOfDeath);
};

func void DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

/*func void DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Shrink);
};*/


instance DIA_Pyrokar_Parlan(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_Parlan_Condition;
	information = DIA_Pyrokar_Parlan_Info;
	permanent = FALSE;
	description = "���� ������� ������. � ���� �������� ��� ���������� �����������.";
};


func int DIA_Pyrokar_Parlan_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (Parlan_Sends == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Parlan_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//���� ������� ������. � ���� �������� ��� ���������� �����������.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//��� �, �� ������ �����, � ���� ���� �������. � ����� ������� �� ������ ������� � ����.
};


var int Pyrokar_TeachMANA_NoPerm;

func void B_BuildLearnDialog_Pyrokar()
{
	if(other.aivar[REAL_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//� ��������, ��� ���������� ������� ����� ����� ����, �� ���� �������. ���� � �� ���� �������� ����, ��� �������� �� ��� ������.
		Pyrokar_TeachMANA_NoPerm = TRUE;
	}
	else
	{
		Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
		Info_AddChoice(DIA_Pyrokar_TEACH_MANA,Dialog_Back,DIA_Pyrokar_TEACH_MANA_BACK);
		Info_AddChoice(DIA_Pyrokar_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice(DIA_Pyrokar_TEACH_MANA,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Pyrokar_TEACH_MANA_5);
	};
};

instance DIA_Pyrokar_TEACH_MANA(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 99;
	condition = DIA_Pyrokar_TEACH_MANA_Condition;
	information = DIA_Pyrokar_TEACH_MANA_Info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int DIA_Pyrokar_TEACH_MANA_Condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,DIA_Pyrokar_Parlan) && (Pyrokar_TeachMANA_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//� ���� �������� ��� ���������� �����������.
	B_BuildLearnDialog_Pyrokar();
};

func void DIA_Pyrokar_TEACH_MANA_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
};

func void DIA_Pyrokar_TEACH_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA))
	{
		B_BuildLearnDialog_Pyrokar();
	};
};

func void DIA_Pyrokar_TEACH_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA))
	{
		B_BuildLearnDialog_Pyrokar();
	};
};

func void B_Pyrokar_BLESSING()
{
	if((Kapitel == 5) && (MIS_PyrokarClearDemonTower == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//�� ���������� ������� ���� ��������� ����� ������ ������ ��������� �����. �� �������� � ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//�� ������� ����� ����� ����� � ����� �� ���� ���������� �����, �� ������� ���� ������� ������.
	};
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
};

instance DIA_Pyrokar_PERM(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PERM_Condition;
	information = DIA_Pyrokar_PERM_Info;
	permanent = TRUE;
	description = "���������� ����, ������.";
};


func int DIA_Pyrokar_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		if(hero.guild == GIL_KDF)
		{
			return TRUE;
		};
		if(hero.guild == GIL_NOV)
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_PERM_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//���������� ����, ������.
	B_Pyrokar_BLESSING();
};


instance DIA_Pyrokar_PERM_nonKDF(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PERM_nonKDF_Condition;
	information = DIA_Pyrokar_PERM_nonKDF_Info;
	permanent = TRUE;
	description = "��� ������ �������������? ��� ��� �� �������� ��.";
};


func int DIA_Pyrokar_PERM_nonKDF_Condition()
{
	if((Kapitel >= 2) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PERM_nonKDF_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//��� ������ �������������? ��� ��� �� �������� ��.
	B_Pyrokar_BLESSING();
};


instance DIA_Pyrokar_BACKFROMOW(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BACKFROMOW_Condition;
	information = DIA_Pyrokar_BACKFROMOW_Info;
	description = "� ������ �� ������ ������ ��������.";
};


func int DIA_Pyrokar_BACKFROMOW_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//� ������ �� ������ ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//��� �� ������ ��������?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//���� ����������� ��� ����� �� ����� � ��������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//�� ��� ������ ��� �� ������� - �� ��� ������ ������������ ����� ����?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//�����, � ������� ���� ������ � ������, �� ����� ������������� ����������� ������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//��� ���������� ������, � ���� ������ ��� �������.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//�� ���� ������ ���� � ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//� ����. ��� ������. ����������� ������� �� �����������. ����������� ��. ��� ���������� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//������ ���������, �� ������ �� ������ ����� �����. ������ �����, � ��������� ������� �� ����� ������. ��� ��� ���� ���������.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
		B_LogEntry(TOPIC_DEMENTOREN,"������� ��������� ��� �� ������, ����� � ������ �����. ��� ����������� �������. �� ����������� ����, ��� ��� ����� ������� ���� ���������. ���� ��� ����������, � ������ ���������� ������������ � ���������.");
		if(!Npc_IsDead(Karras))
		{
			AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//� �������� ������� �������� ���� ��������. ��� ��������� ����� ������� ����� ������ ��� ��������, ��� �������� ��� ������ �����.
			PyrokarToldKarrasToResearchDMT = TRUE;
			Log_AddEntry(TOPIC_DEMENTOREN,"������� �������� ������� ������������� ������, ��������� �� ������.");
		};
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//��� - ��� ���� ������ ��������� ���� ����� � ���������, ���� ���� ����������� ������.
	B_GiveInvItems(self,other,ItRu_TeleportMonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//�����, �� ������ ��������������, ����� ��� ���� �������� �����.
};


instance DIA_Pyrokar_GIVEINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 31;
	condition = DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information = DIA_Pyrokar_GIVEINNOSEYE_Info;
	description = "� ������, ����� ������� ���� ������.";
};


func int DIA_Pyrokar_GIVEINNOSEYE_Condition()
{
	if((Kapitel == 3) && Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//� ������, ����� ������� ���� ������.
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//���? ��� �� � ��� ����������� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//�����, ��� ��������, ��� �� ����� �� ������ ����� ���� ��������� ������, �� ����� � ������ ��� - �����.
	};
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//� ���� ��� ���� ������.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
		B_TurnToNpc(self,hero);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//� ����, �� ������� ���������� ����� �� ����� ������ ������ ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//�� �����, ��� �������� ������������ ����. �� ����� �������� ����������� ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//���� ������ ��� ����� ������� �� ���� ��������� ����.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		B_StartOtherRoutine(Gorax,"Wait");
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV))
	{
		Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"��� ��� ��������� ����� ������� ��������, ������?",DIA_Pyrokar_GIVEINNOSEYE_wer);
	}
	else
	{
		Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE,"��� ������ ���?",DIA_Pyrokar_GIVEINNOSEYE_wer);
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//��� ��� ��������� ����� ������� ��������, ������?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//��� ������ ���?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//��� �������, � ������ ��������� �����. ������ ����� ����� ������, ��� ��� ��������� �� ���� �����, ����� ������� ��������� � ����� ���� ���������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//�� � ��� ��� ��� ����� ��-�������. ���� ������ ��������� � ��������: �� ������ �����, � ������ ���� � �� ������ �������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//��� ����� �������� ������, ��� �� ������ �� ������ ������ ����������, � �� ���������� ��������� �� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//���� �� ����� ����� ������ ��������������, �������� �� ��������� ���� ���� ����, ���������� ������� ���� ���� � ������ ��� � ��������� ����������� ������. ��� �����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//���� ������� ��, ������ ��� ����� ������� ��������� ���� ���.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//����� ������ ���� ������ ����� � ���� ����� ��������� ����� � ����� ����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//� �����, ��� �� ������ ������� ����� ������� �������� �������, �� �������� � ��������� ������� ���������, �������� ��� ���������� ������� ����.
//	Pedro.flags = 0;
	Pedro_Traitor = TRUE;
	B_LogEntries(TOPIC_INNOSEYE,"����������. ���� � ������ ����-�� ���������. � �������, ��� ������ �� ��������� ��������� ������-�� ���������� ������� ����, � ������ ��� �������� ������� �� ���������� ����� � ���������, ��� �� ��� �� ������ ���� ����-������.");
	Log_CreateTopic(TOPIC_TraitorPedro,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_Running);
	B_LogNextEntry(TOPIC_TraitorPedro,"��������� ����� ����� ���� ������ �� ���������. ��� � �������, ���� ���� ������ �� ���� ��� �����, ����� ����� ����� ���������.");
};


instance DIA_Pyrokar_NOVIZENCHASE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 34;
	condition = DIA_Pyrokar_NOVIZENCHASE_Condition;
	information = DIA_Pyrokar_NOVIZENCHASE_Info;
	description = "���� ������� ���� ���?";
};


func int DIA_Pyrokar_NOVIZENCHASE_Condition()
{
	if((Kapitel == 3) && (Pedro_Traitor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//���� ������� ���� ���?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//����� ���� ��������� �����������, ���������� ���������� ���, � ����������� � �������� ������.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//������ ���������� ��������� �� ��� � ������, ����� ������� ���� �����, �� ��� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//���� �� ������ ������� ��, �� ����������, ���� ����� �� ���� ������������.
	MIS_NovizenChase = LOG_Running;
};


instance DIA_Pyrokar_FOUNDINNOSEYE(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 35;
	condition = DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information = DIA_Pyrokar_FOUNDINNOSEYE_Info;
	description = "� ����� ���� ������. �� ���������.";
};


func int DIA_Pyrokar_FOUNDINNOSEYE_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis))
		{
			DIA_Pyrokar_FOUNDINNOSEYE.description = "� ����� ���� ������. �� ���������.";
		}
		else
		{
			DIA_Pyrokar_FOUNDINNOSEYE.description = "���� ������ ���������.";
		};
		return TRUE;
	};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info()
{
	if(Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis))
	{
		AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//� ����� ���� ������. �� ���������.
	}
	else
	{
		DIA_Common_InnosEyeBroken();
	};
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//��... ����� �� ����� ����. ��� ���������?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//��� ���������� � ���� ���� ��������� ������ ��������������� ����. ��� ����������, ��� � ������ ������� ������.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//��� ��������� �������� ����� �� ���������� � ����� ���������� � ������� ����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//�� �������� � ���� �����! ��� ���������� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//���� � ����� ������ �������� �� ��� � �����������, ��� ��� �������� ����� �����.
	if(!Npc_IsDead(Gorax))
	{
		CreateInvItems(Gorax,ItRu_TeleportRitual,1);
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;
	B_GivePlayerXP(XP_AmbientKap3);
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"��� �� ������ ����� �������?",DIA_Pyrokar_FOUNDINNOSEYE_was);
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//��� �� ������ ����� �������?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//���� ���� ����� ������. �� ��� ��, ���� ������� �������� ����������� ��������� ������ ��� ����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//�� ������ �������� ���� � ������������ ��� ����� ����. �� ����� �������� ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//� ���� ����������� ���� �� ����, ��� ������ ���� ���� ���. ��� ������ �����, �� ���������� � ��������� ��������� � ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//��� � �����, � �������, ���� ����. � ���� ������� ��������, ������ �� �����, ��� ����� ������. ������ ���� ���, � ����������.
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,Dialog_Back,DIA_Pyrokar_FOUNDINNOSEYE_weiter);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"������ ������?",DIA_Pyrokar_FOUNDINNOSEYE_was_vatras);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE,"��� ����� ���� ������?",DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis);
	B_LogEntry(TOPIC_INNOSEYE,"������� �����, ����� � ������� � ���� ���� �������, ������������ � ������, ������ � ���, ��� ����� ������� � ������������ ������.");
	MIS_Pyrokar_GoToVatrasInnoseye = LOG_Running;
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//������ ������?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//���������� ������� ���� ���� �� ���� ���� ����� ��������� ��� �������, ����.
	};
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//������ - ����� �������. ������ ������ ����� ���� ����� �������� ��� ���������� � ���� ������� ���.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//��� ���, ��� ���� ����� �����.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//��� ����� ���� ������?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//������ ��� ��� ���� � ���������� ��������� ������������ � ����� ����� �� ����� �������������, ����� �������� ������ ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//��� ����� ����������� ��������� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//� ���� ������� ���� ����� ����� �� ����������, ��� ��� ���� ����� ��������. � ��� �� ��� ���������.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter()
{
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
};


instance DIA_Pyrokar_SPOKETOVATRAS(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information = DIA_Pyrokar_SPOKETOVATRAS_Info;
	description = "� ������� � ��������.";
};


func int DIA_Pyrokar_SPOKETOVATRAS_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//� ������� � ��������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//��, ������. ��� ��?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//�� ������� ������ � ����� ������, ����� �������� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//���� ��� ������, ��, ����� ����, � ��� ��� �� ���� �������.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//������ �����, ����� ������� � �� ������� ��� � ����.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//���? ������� ���� ����� ���? �� ���� ��� �� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//��������. ��� �� ��� �������. ������ ����������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//������ � ����� ���� �������. � ����� �� �����. ������ �� ����� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//������ ��� �����, ��� ���� ������� �� � ����� � ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//� �� ���� �������� ��������. � �� �����, ��� �� ��� ��������� � ���.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//������, �� � �� ���� ������ ������� ��� ����� ��������.
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Pyrokar_XARDASVERTRAUEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information = DIA_Pyrokar_XARDASVERTRAUEN_Info;
	description = "��� ���� ������ �� ���������. ������ �� ������ �������� ���� ������.";
};


func int DIA_Pyrokar_XARDASVERTRAUEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SPOKETOVATRAS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//��� ���� ������ �� ���������. ������ �� ������ �������� ���� ������.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//�� ������ ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//� ������ �� ���� ��������, �� �������? � ���� ��� �� ��������� ��������������, ��� ������� �� �������� ������ ���. � �� ���� ������� ���.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//� ���, ���� � ������� ���� ��������������?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//�����, ��� ����������. ��� ������ ���� ���-��, ��� ������������� �������� ����.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//��� �������� ��������, �� � ���� ������� �������� ������ ����, ��� �� ������ ����� ���������� �� ���� �����������.
	B_LogEntry(TOPIC_INNOSEYE,"�������� ����� � ����� �������, ����� �� ������ � ��������. � ������ �������� � ���������, ��� ��������� �������� ������� ������� � ������� � ����� ������.");
	Pyrokar_DeniesInnosEyeRitual = TRUE;
};


instance DIA_Pyrokar_BUCHZURUECK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_BUCHZURUECK_Condition;
	information = DIA_Pyrokar_BUCHZURUECK_Info;
	description = "� ������ ��� ����� �� ��������.";
};


func int DIA_Pyrokar_BUCHZURUECK_Condition()
{
	if(Npc_HasItems(other,ItWr_XardasBookForPyrokar_Mis) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHZURUECK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//� ������ ��� ����� �� ��������.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//��� ���� ��� �������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//������.
	B_GiveInvItems(other,self,ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItem(self,ItWr_XardasBookForPyrokar_Mis);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(���������) �� ��� ����������! �� ������ ���� �������� ������������� � ���, ��� �� ������ ��� ��� ���?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//����. ���.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(�������) ��� �������, ����� ���������� ��� �� ����� ��������� ����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//�� ��� ������, ��� �� ������ ��������, � ������ � �����, ��� ������� ��� ��� ����� ����, ��� ������� � ���.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//��� �� ������ �������������� �� �������?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//��, � ����������� � ���� ������, ��, �������, �� ������, ��� � �������� � ������ ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//�� ����� ����, � ��������� ��������� ����� ������ ���������, ��� �� ������ ��� ����� ������� ������ ���. �� ���� ��� ��, �����������, ����� ������� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//�������� � ����� ������.
	AI_StopProcessInfos(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
	};
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	B_LogEntry(TOPIC_INNOSEYE,"������� ������� ���������� ����������� � ����� ������.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};


instance DIA_Pyrokar_PRERITUAL(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_PRERITUAL_Condition;
	information = DIA_Pyrokar_PRERITUAL_Info;
	permanent = TRUE;
	description = "�� �������, �� ������� ������������ ����?";
};


func int DIA_Pyrokar_PRERITUAL_Condition()
{
	if((Pyrokar_GoesToRitualInnosEye == TRUE) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PRERITUAL_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//�� �������, �� ������� ������������ ����?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//������ �������. ������� - ������.
};


instance DIA_Pyrokar_AUGEGEHEILT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_AUGEGEHEILT_Condition;
	information = DIA_Pyrokar_AUGEGEHEILT_Info;
	description = "�� ������� ���. ���� ������ �������.";
};


func int DIA_Pyrokar_AUGEGEHEILT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AUGEGEHEILT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//�� ������� ���. ���� ������ �������.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//� ����� �� �����, ��� ��� ��������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//��, ������.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//�� ��� ������������ �������, ��� ����� � ���������� � ������ ����� ����� ����.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//� ����� ��� �� ��������� ������ ������ � ������ ������������ ��� ����� �� ����� �����. ������ �� ���� �� ������ ����� ����.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//���� ��� ��������� ���� � ������������ � ���� � ��� �������, ����� � �����, ���� ���.
		B_GiveArmor(ITAR_KDF_H);
//		heroGIL_KDF2 = TRUE;
	};
};


instance DIA_Pyrokar_KAP3_READY(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 30;
	condition = DIA_Pyrokar_KAP3_READY_Condition;
	information = DIA_Pyrokar_KAP3_READY_Info;
	description = "��� ��� �������� ������� �����?";
};


func int DIA_Pyrokar_KAP3_READY_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Pyrokar_AUGEGEHEILT))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_READY_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//��� ��� �������� ������� �����?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//�� ����� ���� ����� �� ����������� ����. ��� � �������� ��������. ���, ������ ����.
	CreateInvItems(self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//�����, ��� ���� ����� ������� ���������� � ��������, ������ ��� �� ������� ��������� ���.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//���� ����� �������� �������� �������� � �����, � �������� ������.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//����� ����, �� ���� ������ �� �� ����.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//������, ��� ���� �� �����. ���� �������� ����� ��������� ��� ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//��� ����� ���� ����������� �������� �� ������ �������, ������� ����� ���������� � ������ �� ������������ �����.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//������ ����� �� ������� ������������ � ���������� �������.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//�������. � ������� ���.
	PLAYER_TALENT_ALCHEMY[CHARGE_Innoseye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye,-1,-1,FONT_Screen,2);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//������ � ���� ���� ��� �����������. ��� ��. � ���� �� ��� ����� �������.
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
	if(!Npc_IsDead(Gorax))
	{
		CreateInvItems(Gorax,ItMi_RuneBlank,1);
	};
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_Running);
	B_LogEntry(TOPIC_DRACHENJAGD,"������ � ����� � ������� � ���������. ���� ������ ������� ��� ���������� ��. �� ������ ��� �������� � ����� � ���������, � ������ �� ������ ������ ���. � ������ ���������� � ���������, ������ ��� �������� ��������. �������� ������� � ���, ��� ���� ������ ���� ���� ������ ���, ����� � ������������ � ����� �� ���. ����� ������������ ���� ����� �������, ��� ���������� ������ ������� � ������ ��������. � ������ ���������� ����������� ������ � �������� �� ���������� ������ �� ������������ �����, ������ ��� ������������� ������� �������.");
	MIS_ReadyforChapter4 = TRUE;
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Pyrokar_BUCHDERBESSENEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 39;
	condition = DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information = DIA_Pyrokar_BUCHDERBESSENEN_Info;
	description = "� ����� �������� ��������.";
};


func int DIA_Pyrokar_BUCHDERBESSENEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_BACKFROMOW) && Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

var int AlmanachCounter;

func void DIA_Pyrokar_BUCHDERBESSENEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//� ����� �������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//��? ��� ��� �� ��������?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//� �� ������. � �����, �� ������ �����, ��� ������ � ���.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//��������, ��� ����� ��������� ����. � ���, ��� �� ������ ��� ���. ��� ���� �����.
	B_GivePlayerXP(XP_Ambient);
	if(hero.guild == GIL_KDF)
	{
		AlmanachCounter += 1;
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//� �������, ��� ��� �� ������������. ��� � ����� ��� ��� ����� ���������.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//� ����������, ��� ��� ���������� ������.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//��� ���������� ���, ����� �������������� ���������� ���� ����� �����.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//���, ��������, ���������� ����� ���, ��� ��� ��������� ��������, � ��� �����.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//��������. � ��� ���� ��� ���������� ������. ��� ������� ���� �����, ���������� � ���� ������.
		CreateInvItems(self,ItWr_PyrokarsObsessionList,1);
		B_GiveInvItems(self,other,ItWr_PyrokarsObsessionList,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//����� ���� ����� � ������� ��� �� �����. � ��������� �� ���.
		if(!Npc_IsDead(Karras))
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//�� ������� �� ������ �������� ���� �� ���� �� ��� �������. �����, ��� ������� ��� � ��� �������������.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//� �� ������ ������, ����������� ���������� �� ��������������. �� ��� �� ����� ��������� �� ����.
		B_LogEntry(TOPIC_DEMENTOREN,"������� �����, ����� �������� ��������� �� ������ �����. �� ��� ��� ������ ����, ���� ������ ��������� ������� ����������. � ���� ������ �������� ������� ����� ��������� ����� �����.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//�� ����������� � ������, ����� ��� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//���� �� �� ��� �� �������, ��� �� � ��������� �������������� �� ����, ����������� �� ��� ��� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//������ �����, � ���������, ���� ���� ����� ���� �������.
	if(!Npc_IsDead(Karras) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//� �� �� ���������� ���� ��� ������� ������?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//������ ��������. ������ ����� ����� ���-������ �� ����.
		Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
		Log_AddEntry(TOPIC_DEMENTOREN,"������ ������ ������ ��� ����� ������ �� ���������� ���� ������.");
	};
};


instance DIA_Pyrokar_SCOBSESSED_KDF(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 70;
	condition = DIA_Pyrokar_SCOBSESSED_KDF_Condition;
	information = DIA_Pyrokar_SCOBSESSED_KDF_Info;
	permanent = TRUE;
	description = "������ ����, ������, ��� � �������.";
};


func int DIA_Pyrokar_SCOBSESSED_KDF_Condition()
{
	if(SC_IsObsessed == TRUE)
	{
		if(hero.guild == GIL_KDF)
		{
			return TRUE;
		};
		if(hero.guild == GIL_NOV)
		{
			return TRUE;
		};
	};
};


func void DIA_Pyrokar_SCOBSESSED_KDF_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//������ ����, ������, ��� � �������.
	if(((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0)) && !Npc_HasItems(other,ItPo_HealObsession_MIS))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//�� ����� ���! ������ ��� �����. ��� ������� ���� �� ������ ��������.
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//�� ������� ���� ����� �� ���� �������.
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//�������� �� ��� ����� � ����������� ������� ������� �����.
		if(SC_ObsessionTimes > 3)
		{
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//�� � ������������� ���� - ���� �� ������ �������� � �� ���� ������� �����, ����� ������� ���, ��� �������� ��� �� �����. ������ ����� �� ����.
		};
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,2);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//�� �� ������ ��� ������� ���������� �����. �������� �� ���, ������ ���� ���� ������������� ����������� ������.
	};
};

instance DIA_Pyrokar_SCOBSESSED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 70;
	condition = DIA_Pyrokar_SCOBSESSED_Condition;
	information = DIA_Pyrokar_SCOBSESSED_Info;
	permanent = TRUE;
	description = "� �����, � �������. �� ������ �������� ����?";
};


func int DIA_Pyrokar_SCOBSESSED_Condition()
{
	if((SC_IsObsessed == TRUE) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};


func void DIA_Pyrokar_SCOBSESSED_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//� �����, � �������. �� ������ �������� ����?
	if(((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0)) && !Npc_HasItems(other,ItPo_HealObsession_MIS))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//��� ������� ���������� ������ �������� � ����� ���������, ��� ���. 300 �������.
		Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
		Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"��� ������� �����.",DIA_Pyrokar_SCOBSESSED_nein);
		Info_AddChoice(DIA_Pyrokar_SCOBSESSED,"�������. ��� ������.",DIA_Pyrokar_SCOBSESSED_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//�� �� ������ ��� ������� ���������� �����. �������� �� ���, ������ ���� ���� ������������� ����������� ������.
	};
};

func void DIA_Pyrokar_SCOBSESSED_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//�������. ��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//���, ����� ���. �� ������� ���� ����� �� ���� �������.
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		B_GiveInvItems(self,other,ItPo_HealObsession_MIS,2);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//������� ��� ������, � � ����� ������ ����.
	};
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//��� ������� �����.
	AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//�� � ������������� ���� - ���� �� ������ �������� � �� ���� ������� �����, ����� ������� ���, ��� �������� ��� �� �����. ������ ����� �� ����.
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};


var int DIA_Pyrokar_AlmanachBringen_OneTime;

instance DIA_Pyrokar_AlmanachBringen(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 5;
	condition = DIA_Pyrokar_AlmanachBringen_Condition;
	information = DIA_Pyrokar_AlmanachBringen_Info;
	permanent = TRUE;
	description = "� ���� ���������� ��� ���-��� �� ���� ���������.";
};


func int DIA_Pyrokar_AlmanachBringen_Condition()
{
	if((Kapitel >= 3) && Npc_HasItems(other,ITWR_DementorObsessionBook_MIS) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pyrokar_BUCHDERBESSENEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AlmanachBringen_Info()
{
	var int AlmanachCount;
	var int AlmanachGeld;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//� ���� ���������� ��� ���-��� �� ���� ���������.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//������, ����.
	AlmanachCount = Npc_HasItems(other,ITWR_DementorObsessionBook_MIS);
	if(AlmanachCount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//� ����� ��� ���� ��������.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//� ����� ��� ��������� ���� ������.
	};
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,AlmanachCount);
	B_GivePlayerXP(AlmanachCount * XP_KDF_BringAlmanach);
	AlmanachCounter += AlmanachCount;
	if(AlmanachCounter <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//��� ������. �����, �������, ��� ��� ������ �� ���. ��������� ������.
	}
	else if(AlmanachCounter <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//������ �� ��� ��� �������. �� � �� �����, ��� �� ������ �� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//�� ��� ������ ����� ���� ���� ��������� ����.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//� ���� �������, ���� ���� ������� ����� ���.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//���, ������. ��� ��� �� ���������, ������� ������� ���� ������������� ���.
	if(DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//� �� ������� ����� �� ������� ����������� � ��� ���������� ������.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//��������, ��� ���������� ��������� ��� � �������, ��� ����� ���� ��� �� ������� � ���������.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE;
	};
	AlmanachGeld = AlmanachCount * PyrokarsAlmanachOffer;
	CreateInvItems(self,ItMi_Gold,AlmanachGeld);
	B_GiveInvItems(self,other,ItMi_Gold,AlmanachGeld);
};


instance DIA_Pyrokar_DRACHENTOT(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DRACHENTOT_Condition;
	information = DIA_Pyrokar_DRACHENTOT_Info;
	description = "��� ������� ������.";
};


func int DIA_Pyrokar_DRACHENTOT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//��� �������� ������� �������. �� ��� ���������� �� ������ ���� ���������, ������� ������� �����������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//������ ��� ��� �� ����. ������ ��������. � ����� ��� ������ � ������ ��������� � ���, ��� �� ��������� ��������� ���� �� ����������� ���� �����������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//����������� �������� ������� ����� ��������� ����, �� ����� ������������. ��� ����� ������� ��� ��� � ������.
};


instance DIA_Pyrokar_DERMEISTER(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_DERMEISTER_Condition;
	information = DIA_Pyrokar_DERMEISTER_Info;
	description = "� ������� � ���������.";
};


func int DIA_Pyrokar_DERMEISTER_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//� ������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//��� ��� �������?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//��� ��� ����� �������� � ���� �� ������� � � ���, ��� �� ��������� � �������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//�� �������� � ���� �����. ������ ���� ����������� ���� ���� � ������ ���������� ����� ������������ � ��� ���.
};


instance DIA_Pyrokar_WASISTIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_WASISTIRDORATH_Condition;
	information = DIA_Pyrokar_WASISTIRDORATH_Info;
	description = "��� ����� ��� ������� ��������?";
};


func int DIA_Pyrokar_WASISTIRDORATH_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(other,DIA_Pyrokar_DERMEISTER))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//��� ����� ��� ������� ��������?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//��������� ���� ������ ���� �������. ����� �� ����� ������� �� ������. �� ����, ��������, ����� ������� ���� �� ����.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//����� 40 ��� ����� �������� � �������� ����� ����� �������� �������� ���� ����������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//������������ ������ ���� ������� ������ ���, ����� �������� ��� �������������� ���������� � ������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//����� ������ ���� ����� ���� ��������� ������ ������������� �� ��������� � ������ ������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//���� �� �������� ���������� � ���������� ��� �����, ����� �������� ����� �� ��� ��������...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... �� ����� ����, ��� ��� ������ ����, ��� ������ ������������.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(����������) �����������. ����� ����. ��, �����.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//�� ������. �������� ���������. ������� �������� ������������� ������������ ���� ����, � ������ ����� ����� �������� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//������� ������� �� ������ ����� ���� ����, � � �����, ��� ����� ���� ��������� � ����� ������� ������.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//���������.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"�������� ��������, ������� �������� - ��� ������� ���� ������ ���� �������. � ������ ����� ���� ����.");
};


instance DIA_Pyrokar_BUCHIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 54;
	condition = DIA_Pyrokar_BUCHIRDORATH_Condition;
	information = DIA_Pyrokar_BUCHIRDORATH_Info;
	description = "����� ��������, ������� ������� ���������� - ��� ���?";
};


func int DIA_Pyrokar_BUCHIRDORATH_Condition()
{
	if((Kapitel == 5) && (ItWr_HallsofIrdorathIsOpen == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//����� ��������, ������� ������� ���������� - ��� ���?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//� ������, ��� �� �������� ���. ��, �����, ��� ����� ����������� ��� ����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//��� ������� ��� ������ �����. � ����� �� � ���� �� ����� ��������, �� ������� �� �� �������� ������� �� - ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//���� ��������� ������� ������ � ���� ������� �����.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//���� � ������� ��� �����?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//���� ���� ������. �� � ����������� ���� �� ����, ��� ���� ������� ��������� ���, ��� ��������� ��������� ���������� ���� ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//�� ��� �� �� ������ ����������, ������� �� ����� �������������� ����.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"����� �������� '������� ��������' ��������� � ������ �������� ���������. �� �������� �������. ���� �� ������ ������� ��� �����. ��� ������� �� ��� ������ ����� � ��� �������� � ���� ��������.");
	Pyrokar_LetYouPassTalamon = TRUE;
};


instance DIA_Pyrokar_IRDORATHBOOKOPEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information = DIA_Pyrokar_IRDORATHBOOKOPEN_Info;
	description = "� ���� ������� ����� ��������.";
};


func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition()
{
	if((ItWr_HallsofIrdorathIsOpen == TRUE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//� ���� ������� ����� ��������.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//���?! ��� � ���� ��� ����������? ��� ��� ������ ���� � ���!
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"������� ��������� ��� ������.",DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN,"������ ������ �����, � �����.",DIA_Pyrokar_IRDORATHBOOKOPEN_glueck);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//������ ������ �����, � �����.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//�� ������ ������. �����!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//���� ���� � �� ���� ������� ��� �����, � ����� �������� ���-�� ����� ���� � ������� ��������� ��...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... ��� ������� ���� �� �������� �����������...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//�����. ��� ��� ��, ��������, ������������, ��� ���� ������� ��� �����, �� �, �������, ������� ���� ������� �� � ����. �� ������� ����, ���� �� �� ��������� ���� ������.
	B_GivePlayerXP(XP_AmbientKap5);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//������� ��������� ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//��, ��� ��� ���. ��� ���������. ��� �������� ������ ���������, ��� �������� ������� �������� �� ������� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//� ������������� ����. �� ���������� �� ������ ����� ������� �������. �� ������ �������� �� ����.
	B_GivePlayerXP(XP_AmbientKap5);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};


instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 3;
	condition = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information = DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;
	description = "� ���� ����� ����������� ��������� ����������.";
};


func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == FALSE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//� ���� ����� ����������� ��������� ����������.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//� ��� ��� ��?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//� ����������, ����������� ��� ����� �������. ���� ��� �� � ��� �� �������?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//���. ��� ��� ���������� ������ ����, �� ������?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//�������. �� ������ �� ������ � ���. ���.
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"������� ������ �� ����� � ������ ����������. ������, ������ ������� ����� � ���.");
};


instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 2;
	condition = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information = DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;
	description = "� ����, ��� ����� ������ ������� ��������.";
};


func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,DIA_Pyrokar_IRDORATHBOOKOPEN))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//� ����, ��� ����� ������ ������� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//���� ���� ��������� �� �������. � ����� ������� �����, ������� ������� ����.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//��� �����������. ����� ���� ����������� ������� � �������, ����� ��������� �� ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//�� �����, ��� �� ������ ������ �������������, ���� ������ ���������� ���������� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//���� ������� ������ �������� �� �����, ������� �� ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//�������� �� ������ �������� � ������� � ���, ��� ����� ���� ������� ���� �� ���� �������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//���� ���, ���������, ����������� ���. ��, � ���������, � �� ���� �������� �� ������ �������� �� ���������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//���� �������� �������� ���� �� ��������� ����� ����.
};


instance DIA_Pyrokar_SCWILLJORGEN(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_SCWILLJORGEN_Condition;
	information = DIA_Pyrokar_SCWILLJORGEN_Info;
	description = "������ - ������� �����. �� ��� �� ������ ��� ��������� �� ������� �������.";
};


func int DIA_Pyrokar_SCWILLJORGEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jorgen_Home) && Npc_KnowsInfo(other,DIA_Pyrokar_SCKNOWSWAYTOIRDORATH) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//������ - ������� �����. �� ��� �� ������ ��� ��������� �� ������� �������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//�����, ��� ����� �� ��� �� ������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//�� ���������� �������� � ����� ���������. �� �� �� ������ �������������� ������ � �� ������ ����.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//������ ������ ������� ��������� ���� ������, � ����� �� ������ ������� ���, ���� ���������.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//������� ������� ��� ������?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//�� � ������ �� ���� ���� ����� ���� ���������. ���� �������� �������� ���������� ������� �� �� ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//������� � �� ���� ��������� ���, ���� �� �� ���������� ��� ������ � ����� �����.
};


instance DIA_Pyrokar_MACHDTFREI(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_MACHDTFREI_Condition;
	information = DIA_Pyrokar_MACHDTFREI_Info;
	description = "� ��� ����� �������, ����� � ��� ������� ������� � ����� ����� ������?";
};


func int DIA_Pyrokar_MACHDTFREI_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_SCWILLJORGEN) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MACHDTFREI_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//� ��� ����� �������, ����� � ��� ������� ������� � ����� ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//���. �������������, ���� ���-���, ��� �� ��� �� ������� ��� ����. ���� ������� ��������� � ��������� ����� �� ������ ���� � ����.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//��� �������� ��������� ��, ��� ��������� ��������� ���� � ��� ����� �������� �������� ����.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//����� ����� ������� ������� ����� � ����, ��������� ������, � ������ �������� ����, �������� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//������ ����� ��� ��� �� �������! ���, ������� ��� ��� ���������� � �������� ��� ����������!
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//����� �� ������� ������� �������.
	MIS_PyrokarClearDemonTower = LOG_Running;
	Log_CreateTopic(TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PyrokarClearDemonTower,LOG_Running);
	B_LogEntry(TOPIC_PyrokarClearDemonTower,"�������� ���� �������� � ������ ��������. ���� � �������� ��������, ��� ��� ����������, � ���� ����� � ����� �������.");
};


instance DIA_Pyrokar_DTCLEARED(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 59;
	condition = DIA_Pyrokar_DTCLEARED_Condition;
	information = DIA_Pyrokar_DTCLEARED_Info;
	description = "����� �������� ������ ������ �� ����� ����������.";
};


func int DIA_Pyrokar_DTCLEARED_Condition()
{
	if(MIS_PyrokarClearDemonTower == LOG_Running)
	{
		if(Npc_IsDead(Xardas_DT_Demon1) && Npc_IsDead(Xardas_DT_Demon2) && Npc_IsDead(Xardas_DT_Demon3) && Npc_IsDead(Xardas_DT_Demon4) && Npc_IsDead(Xardas_DT_Demon5) && Npc_IsDead(Xardas_DT_DemonLord))
		{
			return TRUE;
		};
	};
};

func void DIA_Pyrokar_DTCLEARED_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//����� �������� ������ ������ �� ����� ����������.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//���... ��� ��� ����? ���, �������, � �� ���� ���� �����.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//���� ������ ���� ��� ��� �����, ������ ������� ��� �� ���������.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//�� ������ ���� �����.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_PyrokarClearDemonTower);
};


var int Pyro_Gives_Aura;

instance DIA_Pyrokar_AmulettofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_AmulettofDeath_Condition;
	information = DIA_Pyrokar_AmulettofDeath_Info;
	permanent = TRUE;
	description = "� ����������� ����������� ��������� ���� ������.";
};


func int DIA_Pyrokar_AmulettofDeath_Condition()
{
	if((PlayerGetsAmulettOfDeath == TRUE) && (Pyro_Gives_Aura == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//� ����������� ����������� ��������� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//���� ������ - ��� ������, ������� ����� ������ ������ ���������� ���� ���� ������ � �������.
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,Dialog_Back,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"���� � ����� ���?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath,"��� ������ ���� ������?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

func void DIA_Pyrokar_AmulettofDeath_BAck()
{
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
};

func void DIA_Pyrokar_AmulettofDeath_CanHaveIt()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//���� � ����� ���?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//���? ��� �� � ��� ����������� ������?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//��������� ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//��, �������. � ��� ���� ���� ������, �� ��������� � ��� �������.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//��, �������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//� �� ����, ����� ��� ����� �������� �������� ��� ����� � ������-������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//��������� ��� �������, � �� ������ ���� �����.
	CreateInvItems(self,ItAm_AmulettOfDeath_Mis,1);
	B_GiveInvItems(self,other,ItAm_AmulettOfDeath_Mis,1);
	Pyro_Gives_Aura = TRUE;
};

func void DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//��� ������ ���� ������?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//�������, ��� ����� ��������� ������� ��� � ������� ������������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//�� �������� ������ ��������� �� ���� ����� �����.
};


instance DIA_Pyrokar_PotionofDeath(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 57;
	condition = DIA_Pyrokar_PotionofDeath_Condition;
	information = DIA_Pyrokar_PotionofDeath_Info;
	permanent = TRUE;
	description = "��� ����� ����� ������?";
};


func int DIA_Pyrokar_PotionofDeath_Condition()
{
	if(Npc_HasItems(other,ItPo_PotionOfDeath_01_Mis))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//��� ����� ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//����� ������ - ��� �� ����� ��� ������ ������� ������. � ��� ���������, ��� � ������ ������ ����������� ����� ����� ������� � ��������.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"�������.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"� ����� ��� �����.",DIA_Pyrokar_PotionofDeath_Potion);
};

func void DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//� �� ����, ��������� �� �� ��� ����������� ����� ��������, �� � ����� ����������, ��� ������ ����� ����� �������� ��� ������ ������� ������.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//� ����� ��� �����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//����� �� ����� ����! �� ���� �������� � ���!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//� ��� ����?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//���� ��� ������������� ��������� ����� ������, ��...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(���������) ���� ��.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//�� �������� ����. ���� ��� ������������� ��������� ����� ������, �� �� �������� ������� ������ ������ �����.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,Dialog_Back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"��� ��� ����� ��� ����� ������?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath,"��� �� ������ � ���� ��� �������?",DIA_Pyrokar_PotionofDeath_Weapon);
};

func void DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//��� ��� ����� ��� ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//����� ����� �������, ��� ��� �������� ��������� � ��������, ����� ����������� ������, ����� ��������� ���������, ��� ������ ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//����� ������� �� ���� ��� � ����� � ��� ���. �� ���� �����, ��� ������ ��� ���� ����������� �������, � ������ �� 13 ���.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//����� � ����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//����, �������� ��� ����� � ������������� ��, �������� ������������������ ���� � ������� ���. ��� ���������� �������� ������, ���������, � �������� ������� ���.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//��� ����� ������� ������� �������� ����. ��� ����� ������ �� ����, �������� � ��������. �� ��� ���� ������-�����, � ������ ��� ����� 250 ��� � ��� ���, ��� ��������� ��� ������ ����� ������.
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//��� �� ������ � ���� ��� �������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//������� ������, ��� ��� ������������ ���� ����������, ����� ������ ����� ������� ����� ������������������ ����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//�� ���� �������� ���������, � ��� �������� ����� ���� ��������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//���������� ����������� ������� ������� ���� ����� �������� ������ ��������� ������ ������.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//�� ��� ����� ����� ����� ��������� ��������� � ������. ������ ����� ������ ������ ����� ���� ��.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//������ ������� - ���� �������� ������ ������� - ������� ����������� ������.
	Npc_RemoveInvItems(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems(hero,ItPo_PotionOfDeath_02_Mis,1);
};


instance DIA_Pyrokar_PICKPOCKET(C_Info)
{
	npc = KDF_500_Pyrokar;
	nr = 900;
	condition = DIA_Pyrokar_PICKPOCKET_Condition;
	information = DIA_Pyrokar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Pyrokar_PICKPOCKET_Condition()
{
	return C_Beklauen(108,550);
};

func void DIA_Pyrokar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,Dialog_Back,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

