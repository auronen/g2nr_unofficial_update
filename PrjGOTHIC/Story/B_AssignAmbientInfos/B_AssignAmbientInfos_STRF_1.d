
instance DIA_STRF_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_STRF_1_EXIT_Condition;
	information = DIA_STRF_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_STRF_1_STANDARD_Condition;
	information = DIA_STRF_1_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_STRF_1_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_00");	//���� �� ��� ������� ��������� ������, ����� � ���� ��� ����, ��� �� ������ �� �������� ����� ����� �� ��� ������!
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_01");	//��� ��� ��-�� ���� ����. ������ ��� ���� � �� ��. ���� ������� ����� ��� ��������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1_STANDARD_01_02");	//���� �� �� ���������� ��� ������, ������� ��� ��������, �� �� ���� ���� ���������� � �����!
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_STRF_1(var C_Npc slf)
{
	DIA_STRF_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_STRF_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};

