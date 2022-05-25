
instance DIA_Addon_Patrick_NW_EXIT(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 999;
	condition = DIA_Addon_Patrick_NW_EXIT_Condition;
	information = DIA_Addon_Patrick_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_NW_Hi(C_Info)
{
	npc = STRF_1123_Addon_Patrick_NW;
	nr = 2;
	condition = DIA_Addon_Patrick_NW_Hi_Condition;
	information = DIA_Addon_Patrick_NW_Hi_Info;
	permanent = FALSE;
	description = "����, � ���� ��� � �������?";
};


func int DIA_Addon_Patrick_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_00");	//����, � ���� ��� � �������?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_01");	//��� ������. ���� ���� ������ ��� �� ���� ��������� ������.
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_02");	//� ��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_03");	//� �������� �������� �� ��. � � ���� ���������� ���� �� ������� ���� ������...
	AI_Output(other,self,"DIA_Addon_Patrick_NW_Hi_15_04");	//� ��� ����� �����?
	AI_Output(self,other,"DIA_Addon_Patrick_NW_Hi_07_05");	//������. ���� ����� ��� ��� ����, �� ����� ��������� � ������. �� ��� ������ ���� �������.
};

