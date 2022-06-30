
instance DIA_Engardo_EXIT(C_Info)
{
	npc = SLD_841_Engardo;
	nr = 999;
	condition = DIA_Engardo_EXIT_Condition;
	information = DIA_Engardo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engardo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engardo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Engardo_HALLO(C_Info)
{
	npc = SLD_841_Engardo;
	nr = 4;
	condition = DIA_Engardo_HALLO_Condition;
	information = DIA_Engardo_HALLO_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Engardo_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 4) && (ScaredEngardo == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engardo_HALLO_End()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

var int Chance;

func void DIA_Engardo_HALLO_Info()
{
	if(Chance == 0)
	{
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Engardo_HALLO_13_00");	//��, �����, �� ���, ����������? ����������� �� ���� ���� � ������ ����.
		}
		else
		{
			B_Say(self,other,"$GETOUTOFHERE");
		};
		if(Akils_SLDStillthere == FALSE)
		{
			Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
			B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
			Akils_SLDStillthere = TRUE;
		};
		Chance = 1;
		AI_StopProcessInfos_Pickpocket();
	}
	else if(Chance == 1)
	{
		AI_Output(self,other,"DIA_Engardo_HALLO_13_01");	//�� �������� �� � ��� ����� �� � �� �����...
		AI_Output(self,other,"DIA_Engardo_HALLO_13_02");	//... ��� ���, ���� ������ ����, ����� ����� ������. �����?
		Chance = 2;
		AI_StopProcessInfos_Pickpocket();
	}
	else if(Chance == 2)
	{
		AI_Output(self,other,"DIA_Engardo_HALLO_13_03");	//� ���� ���, �� ������ �� ��� � �������, ��� ���� ����� ������� �������? (�����) ����� - ��� ����� ��� ������� ������.
		Info_ClearChoices(DIA_Engardo_HALLO);
		Info_AddChoice(DIA_Engardo_HALLO,Dialog_Ende,DIA_Engardo_HALLO_End);
	};
};

