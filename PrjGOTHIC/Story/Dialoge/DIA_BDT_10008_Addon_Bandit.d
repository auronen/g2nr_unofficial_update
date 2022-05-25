
instance Addon_10008_Bandit_EXIT(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 999;
	condition = Addon_10008_Bandit_EXIT_Condition;
	information = Addon_10008_Bandit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int Addon_10008_Bandit_EXIT_Condition()
{
	return TRUE;
};

func void Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10008_Bandit_Hi(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 2;
	condition = DIA_Addon_10008_Bandit_Hi_Condition;
	information = DIA_Addon_10008_Bandit_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10008_Bandit_Hi_Condition()
{
	if(!Npc_IsDead(Skinner) && !Npc_KnowsInfo(other,DIA_Addon_Skinner_Hi))
	{
		if((Npc_GetDistToNpc(other,Skinner) <= 700) && (Skinner.aivar[AIV_TalkedToPlayer] == FALSE) && !Npc_IsInState(Skinner,ZS_Attack))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_10008_Bandit_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_00");	//�� ���� ��� ������!
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Hi_15_01");	//���???
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_02");	//���� �� �� ������ ��������� ���� �������, �� ���������� �� ���������.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_03");	//��� ������ �������������. ������� ���, ����� ���� ������ �������� ��������, ��� ��� ����.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_Hi_01_04");	//����� �� ����, ��� ������ �����.
	EnteredBanditsCamp = TRUE;
};


instance DIA_Addon_10008_Bandit_soup(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 2;
	condition = DIA_Addon_10008_Bandit_soup_Condition;
	information = DIA_Addon_10008_Bandit_soup_Info;
	permanent = FALSE;
	description = "�� �������?";
};


func int DIA_Addon_10008_Bandit_soup_Condition()
{
	return TRUE;
};

func void DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_soup_15_00");	//�� �������?
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_01");	//�� �� ������ ��� �����? ���, � ���� �� ������ ������, ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_02");	//���, ��� � ����� ����� - ������� ������� ����. ���, �������� - ��� ������� ���� ���.
	B_GiveInvItems(self,other,ItFo_Addon_Meatsoup,1);
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_03");	//��� ����� ����� - ����������� ���� ����. ������ ������� ����������.
	AI_Output(self,other,"DIA_Addon_10008_Bandit_soup_01_04");	//���� ������, � ����� ������ ���� ����� �������.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"������ ����� ����� ������ ��� ����� �������.");
};


func void B_BuildLearnDialog_Marus()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,Dialog_Back,DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(ATR_STRENGTH,1)),DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(ATR_STRENGTH,5)),DIA_Addon_10008_Bandit_Teach_STR_5);
};

instance DIA_Addon_10008_Bandit_Teach(C_Info)
{
	npc = BDT_10008_Addon_Bandit;
	nr = 7;
	condition = DIA_Addon_10008_Bandit_Teach_Condition;
	information = DIA_Addon_10008_Bandit_Teach_Info;
	permanent = TRUE;
	description = "� ���� ���� �������.";
};


func int DIA_Addon_10008_Bandit_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_10008_Bandit_soup))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_10008_Bandit_Teach_15_00");	//� ���� ���� �������.
	B_BuildLearnDialog_Marus();
};

func void DIA_Addon_10008_Bandit_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
};

func void DIA_Addon_10008_Bandit_Teach_STR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED))
	{
		B_BuildLearnDialog_Marus();
	};
};

func void DIA_Addon_10008_Bandit_Teach_STR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED))
	{
		B_BuildLearnDialog_Marus();
	};
};

