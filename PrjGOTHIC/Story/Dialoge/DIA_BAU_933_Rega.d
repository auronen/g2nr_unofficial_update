
instance DIA_Rega_EXIT(C_Info)
{
	npc = BAU_933_Rega;
	nr = 999;
	condition = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rega_HALLO(C_Info)
{
	npc = BAU_933_Rega;
	nr = 3;
	condition = DIA_Rega_HALLO_Condition;
	information = DIA_Rega_HALLO_Info;
	description = "��� ����?";
};


func int DIA_Rega_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//��� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//�� �� ������, ��?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//�� ���� �� ��������� �����, ��?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//�� ���, ��?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//�� ���������, ��?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//�� ����� �����, � �� ��������� ������ ���������.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//������?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//��� ����� � ������-�� �� ���� ����, �� �� ���� �� ���� � ���� � �����������, ���� �������� �� ������.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//�� ��������� ����� ���� ����� ����� ������ ����������.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//������� �������, ������� ������� ���������� ��� ������, � �������� ������ �������.
	};
};


instance DIA_Rega_ONAR(C_Info)
{
	npc = BAU_933_Rega;
	nr = 4;
	condition = DIA_Rega_ONAR_Condition;
	information = DIA_Rega_ONAR_Info;
	description = "�� ������� ���������?";
};


func int DIA_Rega_ONAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_ONAR_Info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//�� ������� ���������?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//�������. ���� ��������� ���-�� �� ����������, �� �������� ����� ���������, � ������ ����� �������� ����� �� �����.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//��� ��� �� ������������ �����������.
};


instance DIA_Rega_SLD(C_Info)
{
	npc = BAU_933_Rega;
	nr = 5;
	condition = DIA_Rega_SLD_Condition;
	information = DIA_Rega_SLD_Info;
	description = "����� �������� �� ������ ���������� ������� ��������?";
};


func int DIA_Rega_SLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Rega_SLD_Info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//����� �������� �� ������ ���������� ������� ��������?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//� �� ����, �� ��� ��� ������, �� �� ����� �� �� ��, ����� ��� �������� ������� �����.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//� �������� � �������� ��������� ������ ��������, ���������� � ���� �����, ���������� ������ �����.
};


instance DIA_Rega_BANDITEN(C_Info)
{
	npc = BAU_933_Rega;
	nr = 6;
	condition = DIA_Rega_BANDITEN_Condition;
	information = DIA_Rega_BANDITEN_Info;
	description = "��� �� ����������� �� ��������?";
};


func int DIA_Rega_BANDITEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_BANDITEN_Info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//��� �� ����������� �� ��������?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//�� �� ����������. �� �����. � ��� ��� ��� ��������?
};


instance DIA_Rega_BRONKO(C_Info)
{
	npc = BAU_933_Rega;
	nr = 7;
	condition = DIA_Rega_BRONKO_Condition;
	information = DIA_Rega_BRONKO_Info;
	description = "� ��� ���� ��������� ��� ��� ���?";
};


func int DIA_Rega_BRONKO_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (MIS_Sekob_Bronko_eingeschuechtert == LOG_Running))
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && Npc_KnowsInfo(other,DIA_Rega_HALLO) && !Npc_KnowsInfo(other,DIA_Babera_BRONKO) && !Npc_IsDead(Bronko))
	{
		return TRUE;
	};
};

func void DIA_Rega_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//� ��� ���� ��������� ��� ��� ���?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//�� ����� ���� �����������, �� ��� �� ����� ��������. ������ ����-������ ���.
	AI_StopProcessInfos(self);
};


instance DIA_Rega_PERMKAP1(C_Info)
{
	npc = BAU_933_Rega;
	nr = 7;
	condition = DIA_Rega_PERMKAP1_Condition;
	information = DIA_Rega_PERMKAP1_Info;
	permanent = TRUE;
	description = "���� ���.";
};


func int DIA_Rega_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rega_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rega_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//���� ���.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//���� ����� ��������. �� ���� ������ � ������.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//���� �� ��, ��������, �� ���������� ��� ������� �������, ����� ����� ���� �� �� ����� �� ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//����� ������ ���������� ��� ������ � ������. �������, �� �� ��������� �� ���. �� ����� ��� - � ������ ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//��� �� ���-�� �����, ������� �� ����� �������� ������.
	};
	AI_StopProcessInfos(self);
};

