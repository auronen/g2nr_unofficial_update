
instance DIA_Babera_EXIT(C_Info)
{
	npc = BAU_934_Babera;
	nr = 999;
	condition = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babera_HALLO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 1;
	condition = DIA_Babera_HALLO_Condition;
	information = DIA_Babera_HALLO_Info;
	description = "������, ���������.";
};


func int DIA_Babera_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//������, ���������.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//������ �������� �� ���. ����� ����� �����, ��� ���� �����. � ������.
};


instance DIA_Babera_WIESIEHTSAUS(C_Info)
{
	npc = BAU_934_Babera;
	nr = 2;
	condition = DIA_Babera_WIESIEHTSAUS_Condition;
	information = DIA_Babera_WIESIEHTSAUS_Info;
	description = "��� ���� ������ � ����?";
};


func int DIA_Babera_WIESIEHTSAUS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Babera_WIESIEHTSAUS_Info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//��� ���� ������ � ����?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//�������� �� ��� �������� ����, ������� ��� ����� ����������, � �� ��� ��� �������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//�� ������ �������� �� ����?
		Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"������-�� ���. � ���� ����� ���������.",DIA_Babera_WIESIEHTSAUS_Nein);
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"����� ����.",DIA_Babera_WIESIEHTSAUS_Vielleicht);
	};
};

func void DIA_Babera_WIESIEHTSAUS_Vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//����� ����.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//����� ���� ����� ���������� � ����� ��������, �������. �����, � ���� �������� ������ ��� ����.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//��, ��� �������� ����� ������ �� ����� �����. ��� ��������� � ����� ���� ������.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//�� ������ ���� ���������� � ����������. ��� �� ����� �������.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//������-�� ���. � ���� ����� ���������.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//����� �� ��� ���� ������. ��� �������� �� ����� �����.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};


instance DIA_Babera_BRONKO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_BRONKO_Condition;
	information = DIA_Babera_BRONKO_Info;
	description = "�����, ��� ��� ���, ��� ����� ���...";
};


func int DIA_Babera_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_HALLO) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && !Npc_IsDead(Bronko))
	{
		return TRUE;
	};
};

func void DIA_Babera_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//�����, ��� ��� ���, ��� ����� ���...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//��� ������. ����� �� ����?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//��� ��� ������?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(�������) ��� �� ������ ����? ��� ������ - �����. � ������ ������ ������ � ����������. �� ������� ��� ���.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//��� ������ ����� �� ���������� ������ ����, ��� �� �� ��������.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//�� ������ �� ������. ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//������ �������� ����� ��������� ��� ��������. �� ����� ������ ��.
	};
	Babera_BronkoKeinBauer = TRUE;
};


instance DIA_Babera_Rosi(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_Rosi_Condition;
	information = DIA_Babera_Rosi_Info;
	description = "� ��� ����?";
};


func int DIA_Babera_Rosi_Condition()
{
	if((MIS_BringRosiBackToSekob == LOG_Running) && (Kapitel >= 5) && (RosiFoundKap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babera_Rosi_Info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//� ��� ����?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//��� ������ �� ����� �������� ����� ����� � ���� �� �����, � ���.
	Log_CreateTopic(TOPIC_RosisFlucht,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RosisFlucht,LOG_Running);
	B_LogEntries(TOPIC_RosisFlucht,"���� ������� � ����� ������. ������ �������, ��� ��� ����������� �� �����, � ���.");
	B_LogNextEntry(TOPIC_BringRosiBackToSekob,"���� ������� � ����� ������. ������ �������, ��� ��� ����������� �� �����, � ���.");
};


instance DIA_Babera_DUSTOERST(C_Info)
{
	npc = BAU_934_Babera;
	nr = 10;
	condition = DIA_Babera_DUSTOERST_Condition;
	information = DIA_Babera_DUSTOERST_Info;
	permanent = TRUE;
	description = "���� ���-������ ���?";
};


func int DIA_Babera_DUSTOERST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_BRONKO) || Npc_KnowsInfo(other,DIA_Babera_Rosi))
	{
		return TRUE;
	};
};

func void DIA_Babera_DUSTOERST_Info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//���� ���-������ ���?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//� ������.
	AI_StopProcessInfos(self);
};

