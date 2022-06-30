
instance DIA_Addon_Skinner_EXIT(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 999;
	condition = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skinner_Attentat(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 9;
	condition = DIA_Addon_Skinner_Attentat_Condition;
	information = DIA_Addon_Skinner_Attentat_Info;
	permanent = FALSE;
	description = "�� ������ ���������...";
};


func int DIA_Addon_Skinner_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Skinner_Attentat_15_00");	//�� ������ ���������...
	AI_Output(self,other,"DIA_Addon_Skinner_Attentat_08_01");	//��� ���� �����?
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"� ���� ������ ��������.",DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice(DIA_Addon_Skinner_Attentat,"� ���� ����� ���������.",DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00");	//� ���� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01");	//�������.
//	Judas_Counter += 1;
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output(other,self,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00");	//� ���� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01");	//������.
	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};


instance DIA_Addon_Skinner_Hi(C_Info)
{
	npc = BDT_1082_Addon_Skinner;
	nr = 2;
	condition = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skinner_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Hi_Info()
{
	if(Wld_IsTime(12,0,20,0) && (MIS_Judas == LOG_Running) && !Npc_KnowsInfo(other,DIA_Addon_Skinner_Attentat))
	{
		B_Say(self,self,"$AWAKE");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_00");	//����� �� ���� ��������, �? � ������, ��� �� ������ � �� ������...
		AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_01");	//��� - �� ���� ������ ��������. ������������� ������� ������.
		AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_02");	//� ���� ������ ���� �����. �� ������ ��������� �� ���� � ���� �����. � ������ ����������� �������.
		AI_Output(self,other,"DIA_Addon_Skinner_Hi_08_03");	//� �� ����� ����� � �� ����� ������...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

