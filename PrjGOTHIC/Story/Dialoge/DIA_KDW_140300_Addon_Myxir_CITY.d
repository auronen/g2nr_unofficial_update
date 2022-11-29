
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = TRUE;
	description = "�� ���������� � ������?";
};


func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	return TRUE;
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//�� ���������� � ������?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//���-�� �� ��� ������ ���������� �����, ����� ������� � ������ ���.
	if((RavenIsDead == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//� ����� ���� ������� ��� ���� ����.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//� ��������� �� �������� �������� ����������� ������.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//� ���������, � ���� ��� ���� ������������� ���� � ��������.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//��� ���, �� � ������, ��� �� ���������� � ����, ���������.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//������.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Addon_Myxir_CITY_TalkedToGhost(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 4;
	condition = DIA_Addon_Myxir_CITY_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_CITY_TalkedToGhost_Info;
	description = "� ������� � ������������.";
};


func int DIA_Addon_Myxir_CITY_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//� ������� � ������������.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(����������) ���� ������������� ������� ��������� ��� �� ��������� ���?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//� ��� �� ������ ���?
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//�� ��������� ��� � ���, ��� ������� � ���� �������.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//����������! ���� ��� ������ � ������ ��������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//��� �����, ���� �� ��� ����� ��������, ���� �� �� ����������� �� �������...
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
};

