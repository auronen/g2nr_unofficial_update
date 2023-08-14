
instance DIA_Gorn_DI_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 999;
	condition = DIA_Gorn_DI_KAP5_EXIT_Condition;
	information = DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorn_DI_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_DI_First(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 1;
	condition = DIA_Gorn_DI_First_Condition;
	information = DIA_Gorn_DI_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorn_DI_First_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && (OrkSturmDI == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_First_Info()
{
	AI_Output(self,other,"INTRO_DiegoGorn_12_04");	//�����!
};


instance DIA_Gorn_DI_Hallo(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_Hallo_Condition;
	information = DIA_Gorn_DI_Hallo_Info;
	permanent = TRUE;
	description = "��� ���-���?";
};


func int DIA_Gorn_DI_Hallo_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_15_00");	//��� ���-���?
	if(OrkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_01");	//���� ��. �����, � ���� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gorn_DI_Hallo_12_02");	//��� ��� ���� ����? ������ �� �� ���. � ��� ��� ������� ����������.
	};
};


var int DIA_Gorn_DI_Teacher_permanent;
var int DIA_Gorn_DI_Teacher_Comment;

func void B_BuildLearnDialog_Gorn_DI()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Gorn)
	{
		Info_ClearChoices(DIA_Gorn_DI_Teach);
		Info_AddChoice(DIA_Gorn_DI_Teach,Dialog_Back,DIA_Gorn_DI_Teach_Back);
		Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Gorn_DI_Teach_2H_1);
		Info_AddChoice(DIA_Gorn_DI_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Gorn_DI_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Gorn)
		{
			DIA_Gorn_DI_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Gorn_DI_Teach(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 10;
	condition = DIA_Gorn_DI_Teach_Condition;
	information = DIA_Gorn_DI_Teach_Info;
	permanent = TRUE;
	description = "� ���� ���������������.";
};


func int DIA_Gorn_DI_Teach_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && (DIA_Gorn_DI_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//� ���� ���������������.
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Gorn)
	{
		if(DIA_Gorn_DI_Teacher_Comment == 0)
		{
			AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//��� �� ��������.
			DIA_Gorn_DI_Teacher_Comment = 1;
		}
		else if(DIA_Gorn_DI_Teacher_Comment == 1)
		{
			AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//�� ��. �����-�� �� ��� �����.
			DIA_Gorn_DI_Teacher_Comment = 2;
		}
		else if(DIA_Gorn_DI_Teacher_Comment == 2)
		{
			AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//������ ����� ������� ����. ���� ������ ����� ������� ���� ������ ����� �������.
			DIA_Gorn_DI_Teacher_Comment = 0;
		};
	};
	B_BuildLearnDialog_Gorn_DI();
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Gorn))
	{
		B_BuildLearnDialog_Gorn_DI();
	};
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Gorn))
	{
		B_BuildLearnDialog_Gorn_DI();
	};
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};

var int DIA_Gorn_DI_UndeadDragonDead_OneTime;

instance DIA_Gorn_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Fighter_DI;
	nr = 2;
	condition = DIA_Gorn_DI_UndeadDragonDead_Condition;
	information = DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "�� ��� ��� ����� ��� �� �������?";
};


func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_00");	//�� ��� ��� ����� ��� �� �������?
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_01");	//�������. ������ ���������, ���� �� ������, ���� �� �� ������.
	if((hero.guild == GIL_DJG) && (DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_02");	//� ��� ���������?
		AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_03");	//������. � ��������� ������������ �����.
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_04");	//(�������) �����? � ��� ���? ��������� � ����, � ���� ��� ����.
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_05");	//������ �����������? �� �������� � ������ �� ���������� ������� � �������� �� ���������������� ���������.
		AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_06");	//���. ����� ����.
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_07");	//��, ����������, �������. ��� �������.
	};
	AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_10");	//����� ��� ������ ������ ������. ����� ��������, ����� �������� �����.
	if(Npc_KnowsInfo(other,DIA_Biff_DI_UNDEADDRGDEAD))
	{
		AI_Output(self,other,"DIA_Gorn_DI_UndeadDragonDead_12_08");	//���-�� ������ ������� �� ���� �����, ����� �� ������ �� ���� �������.
		if(!Npc_IsDead(Biff_DI))
		{
			AI_Output(other,self,"DIA_Gorn_DI_UndeadDragonDead_15_09");	//�� ����� ����� �������.
		};
	};
	AI_StopProcessInfos(self);
	if(DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
	};
	DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
};

