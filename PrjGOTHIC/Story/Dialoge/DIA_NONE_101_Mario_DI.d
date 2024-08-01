
instance DIA_NONE_101_MARIO_DI_EXIT(C_Info)
{
	npc = NONE_101_Mario_DI;
	nr = 999;
	condition = DIA_NONE_101_MARIO_DI_EXIT_Condition;
	information = DIA_NONE_101_MARIO_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_101_MARIO_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_101_MARIO_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_DI_Job(C_Info)
{
	npc = NONE_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_Job_Condition;
	information = DIA_NONE_101_MARIO_DI_Job_Info;
	permanent = TRUE;
	description = "����� � ���� ���� ���� �������� ���� ������ �����������.";
};


func int DIA_NONE_101_MARIO_DI_Job_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (OrkSturmDI == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_Job_Info()
{
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_00");	//����� � ���� ���� ���� �������� ���� ������ �����������.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_01");	//�����������. ����� ���� �����.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_02");	//���. � ������ ����� � ������ �� ����.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_03");	//�������.
};


instance DIA_NONE_101_MARIO_DI_Ambush(C_Info)
{
	npc = NONE_101_Mario_DI;
	nr = 4;
	condition = DIA_NONE_101_MARIO_DI_Ambush_Condition;
	information = DIA_NONE_101_MARIO_DI_Ambush_Info;
	important = TRUE;
};


func int DIA_NONE_101_MARIO_DI_Ambush_Condition()
{
	if(OrkSturmDI == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_101_MARIO_DI_Ambush_Info()
{
	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Ambush_07_00");	//������� �������. ���, ��� ����. � ������ ������ ���, �� ��� �� ��������.
		AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Ambush_15_01");	//��� �� ������ � ����?
		AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Ambush_07_02");	//��� ������. ������ ��� ����� �� ����.
	};
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Ambush_07_03");	//��� ������ ����� ���� ������. �� ��� ������ � � ������ �������� ��� ������.
	B_GivePlayerXP(XP_Mario_Ambush);
	Info_ClearChoices(DIA_NONE_101_MARIO_DI_Ambush);
	Info_AddChoice(DIA_NONE_101_MARIO_DI_Ambush,Dialog_Ende,DIA_NONE_101_MARIO_DI_Ambush_Attack);
};

func void DIA_NONE_101_MARIO_DI_Ambush_Attack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	if(!Npc_IsDead(Skeleton_Mario1))
	{
		Skeleton_Mario1.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Skeleton_Mario2))
	{
		Skeleton_Mario2.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Skeleton_Mario3))
	{
		Skeleton_Mario3.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(!Npc_IsDead(Skeleton_Mario4))
	{
		Skeleton_Mario4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

