
instance DIA_Marcos_EXIT(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 999;
	condition = DIA_Marcos_EXIT_Condition;
	information = DIA_Marcos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Marcos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Marcos_Hallo(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hallo_Condition;
	information = DIA_Marcos_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Marcos_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hallo_Info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//���� - �� ��� ������! � ������, ������� ������. ������, ��� ���� �����, � ������ ������!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//��������� ������ ������ ������� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//����� �������� ����, �, ����������� ���. � �� ����� �����, � ��� � ������.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//�� ������, ��� ���������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//���� ��� ����� ��������� �������� - ��� ������� ���� ����?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//����������, � ������ �� ������ � ����� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//�� ���� �� ��� �����. ����� ������ ������� ���� ����?
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//����������, �� �������� �� ������ ������� - ����� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//� ����� ��� ��� ���� ����� ���� �������� ���������? ������, ��� ���� ����� �����?
	};
};


instance DIA_Marcos_Hagen(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Hagen_Condition;
	information = DIA_Marcos_Hagen_Info;
	permanent = FALSE;
	description = "� ������ ��������� ����� ������ �������������� ������������� ��������.";
};


func int DIA_Marcos_Hagen_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Hagen_Info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//� ������ ��������� ����� ������ �������������� ������������� ��������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//����� �� �� ������ ������ ������� � ��������� ����� ������ ����������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//�� �������, �� ������� ����� ����� �������� ������� � ������� ���?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//�������� ��������� �� ����� � ���������� � ����������� ��������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//�� ������ ������, ��� �� ���������� ������� ����� ������! �� ������ ������ ������ ����.
};


instance DIA_Marcos_Garond(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 2;
	condition = DIA_Marcos_Garond_Condition;
	information = DIA_Marcos_Garond_Info;
	permanent = FALSE;
	description = "� ������ �� ������� - �� ����� �����, ����� ���������� ���� ������ � ���������������.";
};


func int DIA_Marcos_Garond_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Garond_Info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//� ������ �� ������� - �� ����� �����, ����� ���������� ���� ������ � ���������������.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//����� �������, ��� ��� �������� �������� �����, ��� ��� ��������� ����� ����� ������� �������.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//� ��������� ��������� �� ����� � ����������� ������, �� � ����� ������ � ������������ ������� � �����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//� ������� ���� � ���������� �����. ��� ������ �����. ��� � ������� � ������ ��� �� ����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//����� ���, ��� � ���� �������� ����, ���� ���. �� � �� ����, ������� ������� �������, ������ ��� ���� ������ ���� �����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//����� ���, ����� ������� ������������.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//� ��� ��� �����.
	B_LogEntries(TOPIC_ScoutMine,"������� ������ �������� ������ ����� � ��������� ������.");
	Log_CreateTopic(Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus(Topic_MarcosJungs,LOG_Running);
	B_LogNextEntry(Topic_MarcosJungs,"������ �����, ����� ������ ������ ��� �������.");
	MIS_Marcos_Jungs = LOG_Running;
	Marcos_Ore = TRUE;
	self.flags = 0;
};


instance DIA_Marcos_Perm(C_Info)
{
	npc = PAL_217_Marcos;
	nr = 9;
	condition = DIA_Marcos_Perm_Condition;
	information = DIA_Marcos_Perm_Info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int DIA_Marcos_Perm_Condition()
{
	if((Kapitel >= 2) && (Npc_KnowsInfo(other,DIA_Marcos_Hagen) || Npc_KnowsInfo(other,DIA_Marcos_Garond)))
	{
		return TRUE;
	};
};

func void DIA_Marcos_Perm_Info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//��� ����������?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//��� ����� ����� �������� �����!
		B_UseItem(self,ItPo_Health_03);
	}
	else if(MIS_Marcos_Jungs == LOG_Running)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//� �������, � � �������, ��� ������ ����� ������� ������������.
	}
	else if(MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//������� ���� �� ������. ����� ���� ��� ���� � ������� ��� ������������.
		if(Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//� �������, ������ ��� �� ���� �����!
	};
	AI_StopProcessInfos(self);
};

