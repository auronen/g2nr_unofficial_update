
instance DIA_Parlaf_EXIT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 999;
	condition = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parlaf_HALLO(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_HALLO_Condition;
	information = DIA_Parlaf_HALLO_Info;
	description = "������, ��� ����?";
};


func int DIA_Parlaf_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//������, ��� ����?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//��, � ���, ��-������? � ������ ����� ���� �� ��������� ������, ��������� ������.
	if(!Npc_IsDead(Engor))
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//� ����� ����� ����� ������ ��� ����. ���� �� ����� ���������� � ��� �� ����, �� ��� ������ � ������.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//��� ��� ���� �������� ����. �� ����� �������� �����������.
	};
};


instance DIA_Parlaf_ENGOR(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_ENGOR_Condition;
	information = DIA_Parlaf_ENGOR_Info;
	description = "��� ����� �����?";
};


func int DIA_Parlaf_ENGOR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && !Npc_IsDead(Engor))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//��� ����� �����?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//����� �������� ��������� � ������ �����. � ��� ���������� ��� ������ � ������ �������.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//�������, � ��� ����� ������������, �� ������ �� ������ � ������ ��������.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//� �� �� ������ ��������� ���� ���?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//�� �� �����, ��� ��� ������, � ���� ������ ������ ���� ���!
	B_EngorTradeLog();
};


instance DIA_Parlaf_Wo(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_Wo_Condition;
	information = DIA_Parlaf_Wo_Info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ������?";
};


func int DIA_Parlaf_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parlaf_ENGOR) && !Npc_IsDead(Engor))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//��� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//� ���� �������. ������ ����� �������� ���� ����� � ��������.
};


instance DIA_Parlaf_HUNGRIG(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_HUNGRIG_Condition;
	information = DIA_Parlaf_HUNGRIG_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Parlaf_HUNGRIG_Condition()
{
	if((MIS_Engor_BringMeat != LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && !Npc_IsDead(Engor))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//��� ����������?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//���� ������ ����� ������ ��������� �����!
};


instance DIA_Parlaf_SATT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_SATT_Condition;
	information = DIA_Parlaf_SATT_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Parlaf_SATT_Condition()
{
	if(((MIS_Engor_BringMeat == LOG_SUCCESS) || Npc_IsDead(Engor)) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO))
	{
		return TRUE;
	};
};


var int DIA_Parlaf_SATT_OneTime;

func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//��� ����������?
	if((DIA_Parlaf_SATT_OneTime == FALSE) && !Npc_IsDead(Engor))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//����� ������ ������ �����. ��, ��� ����� � ����� ����.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//���� �������� - ��� ������������ ������������� ������ �������.
	};
};

