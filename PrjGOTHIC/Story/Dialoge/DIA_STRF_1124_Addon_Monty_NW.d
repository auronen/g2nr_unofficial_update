
instance DIA_Addon_Monty_NW_EXIT(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 999;
	condition = DIA_Addon_Monty_NW_EXIT_Condition;
	information = DIA_Addon_Monty_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Monty_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Monty_NW_Hi(C_Info)
{
	npc = STRF_1124_Addon_Monty_NW;
	nr = 2;
	condition = DIA_Addon_Monty_NW_Hi_Condition;
	information = DIA_Addon_Monty_NW_Hi_Info;
	permanent = FALSE;
	description = "�� ���, �� �������� � ����� ������?";
};


func int DIA_Addon_Monty_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Monty_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_00");	//�� ���, �� �������� � ����� ������?
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_01");	//�������������, ���� ���� �� ����, ��� ������ �� ������������ ������. ��� �������� ����� ������� �� �������.
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_02");	//��� �, �� ���� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_03");	//(�������) �������. �����!
};

