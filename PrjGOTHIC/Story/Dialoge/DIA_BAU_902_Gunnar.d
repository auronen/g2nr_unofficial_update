
instance DIA_Gunnar_EXIT(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 999;
	condition = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gunnar_GuildComment(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 1;
	condition = DIA_Gunnar_GuildComment_Condition;
	information = DIA_Gunnar_GuildComment_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gunnar_GuildComment_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_GuildComment_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//��� �� ������ ���� �������, ��?
	}
	else if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//�� �������� � ����� �����!
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//����� �� ������ ����� �� ������.
	};
};


var int Gunnar_HalloGesagt;
var int Gunnar_ToldAboutSLD;

instance DIA_Gunnar_Hallo(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 1;
	condition = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//��� ����?
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG) && (Gunnar_ToldAboutSLD == FALSE))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//� ��� ���, ��� ���� �������, ��� �������� ���������, ����� ��� ����� ���������.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//���� �����, � �������� ������ �� ������� �������� ����� �� ����, ������ �������� �����.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//��� ������� �������� ��������...
		Gunnar_ToldAboutSLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03_add");	//������� ������� �������...
	};
	Gunnar_HalloGesagt = TRUE;
};


instance DIA_Gunnar_Everywhere(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 2;
	condition = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent = FALSE;
	description = "�������� �������� ��������?";
};


func int DIA_Gunnar_Everywhere_Condition()
{
	if(Gunnar_HalloGesagt == TRUE)
	{
		if(Gunnar_ToldAboutSLD == TRUE)
		{
			DIA_Gunnar_Everywhere.description = "�������� �������� ��������?";
		}
		else
		{
			DIA_Gunnar_Everywhere.description = "��� �� ������ � ���������?";
		};
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	if(Gunnar_ToldAboutSLD == TRUE)
	{
		AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//�������� �������� ��������?
	}
	else
	{
		DIA_Common_TellMeAboutSLD();
	};
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//����������� �� ��� ������ �� �������.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//� ��� ���� ������ ��������� ������ � ���. ��� ���, ��������, ��������� �� �����.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//� � ����� ����������, ��� ��������� �������� � ��� ���� ������ ����, ����� �������� ���������� ���!
};


instance DIA_Gunnar_South(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 3;
	condition = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent = FALSE;
	description = "��� �� ������ � ��������� � ���?";
};


func int DIA_Gunnar_South_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//��� �� ������ � ��������� � ���?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//��������. ��������� ��� ��������, ��� ��������� ��� �� �����.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//�� ���� - �������. ������, ��������, ����� � ��� ��������� ������ �������� �� ����...
};


instance DIA_Gunnar_Colony(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 4;
	condition = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent = FALSE;
	description = "� ��� ������ �� �������?";
};


func int DIA_Gunnar_Colony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//� ��� ������ �� �������?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//�� � ��� ����. ������, ����, �������, ����� � ���-��� ���.
};


instance DIA_Gunnar_Bandits(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 5;
	condition = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent = FALSE;
	description = "� ��� ��� �� �������, � ������� �� ��������?";
};


func int DIA_Gunnar_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//� ��� ��� �� �������, � ������� �� ��������?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//�, ��� � ������ ���. ���� ������, � �� ������ ������ � ����.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//� ��� �� ���� ������ ��������� ���� � ������������ �������. ��� �������� �����-�� �������.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//��� ���� ���������� �� �������, ��� � ����������� ��������� �����.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//������������ ������� - ��� ��� ������ ����������� ����������. ��� ������� ����, ��� �������� ������� ������.
};

