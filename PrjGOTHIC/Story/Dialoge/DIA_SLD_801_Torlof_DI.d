
instance DIA_Torlof_DI_EXIT(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 999;
	condition = DIA_Torlof_DI_EXIT_Condition;
	information = DIA_Torlof_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Torlof_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Torlof_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_DI_Hallo(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_Hallo_Condition;
	information = DIA_Torlof_DI_Hallo_Info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int DIA_Torlof_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Hallo_15_00");	//��� ��������?
	if(OrkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_01");	//���� ��. �� ��� ����� ���������� � ���� ���������. ���� ���������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_02");	//���� ��� ���������� ���� ����� ���������� ���, ��� ��� ���� ������, � �� ���� ������� ��������.
		AI_StopProcessInfos(self);
		if(CaptainIsBackToStartPosition == FALSE)
		{
			Npc_ExchangeRoutine(self,"START");
			CaptainIsBackToStartPosition = TRUE;
		};
	};
};


func void B_BuildLearnDialog_Torlof_DI()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
	Info_AddChoice(DIA_Torlof_DI_Teach,Dialog_Back,DIA_Torlof_DI_Teach_Back);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Torlof_DI_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Torlof_DI_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_Torlof_DI_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_DI_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_Torlof_DI_Teach_STR_5);
};

instance DIA_Torlof_DI_Teach(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 150;
	condition = DIA_Torlof_DI_Teach_Condition;
	information = DIA_Torlof_DI_Teach_Info;
	permanent = TRUE;
	description = "� ���� �������� ���� �����������!";
};


func int DIA_Torlof_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//� ���� �������� ���� �����������!
	B_BuildLearnDialog_Torlof_DI();
};

func void DIA_Torlof_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Torlof_DI_Teach);
};

func void DIA_Torlof_DI_Teach_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_BuildLearnDialog_Torlof_DI();
	};
};

func void DIA_Torlof_DI_Teach_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_BuildLearnDialog_Torlof_DI();
	};
};

func void DIA_Torlof_DI_Teach_STR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX))
	{
		B_BuildLearnDialog_Torlof_DI();
	};
};

func void DIA_Torlof_DI_Teach_STR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX))
	{
		B_BuildLearnDialog_Torlof_DI();
	};
};

instance DIA_Torlof_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_801_Torlof_DI;
	nr = 4;
	condition = DIA_Torlof_DI_UndeadDragonDead_Condition;
	information = DIA_Torlof_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "� ��������� ������.";
};


func int DIA_Torlof_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_15_00");	//� ��������� ������.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_01_01");	//� ������ ������� � �� ������. ��� ��� ������? �� ����� ������������ �����?
	Info_ClearChoices(DIA_Torlof_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"��� ����� ��� ���� �����.",DIA_Torlof_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Torlof_DI_UndeadDragonDead,"��. ��� �������.",DIA_Torlof_DI_UndeadDragonDead_over);
};

func void DIA_Torlof_DI_UndeadDragonDead_moment()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_moment_15_00");	//��� ����� ��� ���� �����.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//����������!
	AI_StopProcessInfos(self);
};

func void DIA_Torlof_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};

