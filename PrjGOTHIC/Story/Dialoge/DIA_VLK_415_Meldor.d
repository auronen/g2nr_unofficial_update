
instance DIA_Meldor_EXIT(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 999;
	condition = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func int C_LehmarDebtIsOverdue()
{
	if(Lehmar_GeldGeliehen_Day > (Wld_GetDay() - 2))
	{
		return FALSE;
	};
	if(Lehmar_GeldGeliehen == 0)
	{
		return FALSE;
	};
	if(RangerHelp_LehmarKohle == TRUE)
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Meldor_Hallo(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Hallo_Condition;
	information = DIA_Meldor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && !C_LehmarDebtIsOverdue())
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//��� ���� �����?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//� ������ ������� �������������...
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//� ���� ������ �� �������������?
};


var int MeldorToldAboutLehmar;

instance DIA_Meldor_Interessantes(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Interessantes_Condition;
	information = DIA_Meldor_Interessantes_Info;
	permanent = FALSE;
	description = "��� ����� �����������?";
};


func int DIA_Meldor_Interessantes_Condition()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//��� ����� �����������?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//����� ���� ������� � �����. ������� ������ ����� ������. ���� ���� ����� ����������, � ������� ���������� ������ � ���.
	if(!Npc_KnowsInfo(other,DIA_Kardif_Hallo))
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"������, �������� ������ � ������, �������������� �����������.");
	};
	if(!Npc_IsDead(Lehmar) && (Lehmar_GeldGeliehen == 0))
	{
		AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//����, ������, �� ����� ������?
		AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//� �� ����� ��?
		AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(������) ���. �� ����� ����� ����� ��������� ��� ������, ����������.
		AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//� ������, ��� �� ������ �������� ���� ��������� �������.
		MeldorToldAboutLehmar = TRUE;
	};
};


instance DIA_Meldor_Arbeitest(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 4;
	condition = DIA_Meldor_Arbeitest_Condition;
	information = DIA_Meldor_Arbeitest_Info;
	permanent = FALSE;
	description = "�� ��������� �� ������?";
};


func int DIA_Meldor_Arbeitest_Condition()
{
	if((MeldorToldAboutLehmar == TRUE) && !Npc_IsDead(Lehmar) && !Npc_KnowsInfo(other,DIA_Meldor_VonLehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//�� ��������� �� ������?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//����� �������.
};


instance DIA_Meldor_InsOV(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_InsOV_Condition;
	information = DIA_Meldor_InsOV_Info;
	permanent = FALSE;
	description = "������-�� � ����������� � ������� �������...";
};


func int DIA_Meldor_InsOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_InsOV_Info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//������-�� � ����������� � ������� �������...
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(�����������) ��, �������. � � ��������� ����� �� ������� � ������� ����� ������.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//����� ����� ���� � ���� ������ � ������� ������� ������ � ��� ���, ��� � ����� ������� ��������.
};


instance DIA_Meldor_Citizen(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 6;
	condition = DIA_Meldor_Citizen_Condition;
	information = DIA_Meldor_Citizen_Info;
	permanent = FALSE;
	description = "�� ��������� ����� ������?";
};


func int DIA_Meldor_Citizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_InsOV) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//�� ��������� ����� ������?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//���� �� ������ � ����, ���� �� � �����, �� ��. �� ���� ��� ����� �� ������ � ������� �������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//���� ����� ������� ������ ������ ��������, ��, ��� �������� � ������������ �� ������ ����� ������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//������ ��������� �������� �� ����� ������� ���� � ��������. ���� ���� ������� ��������� ����� ������� �� �����������.
};


instance DIA_Meldor_Smoke(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_Smoke_Condition;
	information = DIA_Meldor_Smoke_Info;
	permanent = FALSE;
	description = "�� �� ������, ��� ��� ������ ������?";
};


func int DIA_Meldor_Smoke_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Smoke_Info()
{
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//�� �� ������, ��� ��� ������ ������?
	if(Meldor_Busted == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(����������) ���, ������� �� ����.
		Undercover_Failed_Meldor = TRUE;
		B_CheckRedLightUndercover();
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//�� ����� ����� � �� ������� ������� � '������� ������'.
	};
};


var int Meldor_ThievesNews1;
var int Meldor_ThievesNews2;
var int Meldor_DragonsNews1;
var int Meldor_DragonsNews2;

instance DIA_Meldor_PERM(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 7;
	condition = DIA_Meldor_PERM_Condition;
	information = DIA_Meldor_PERM_Info;
	permanent = TRUE;
	description = "������ ����������� �� ���� � ��������� �����?";
};


func int DIA_Meldor_PERM_Condition()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//������ ����������� �� ���� � ��������� �����?
	if((Andre_FoundThieves_KilledByMilitia == FALSE) && (Meldor_ThievesNews1 == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//������� ��������� ������ ����������� ����� ���� ���� �������� �������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//��� ������ ����������. � ��������� ����� ��������� �� ������ ����� �����. �������� � ���������� ���������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//��� �������� �� ���� �������� �������� �� ��������� ��������.
		Meldor_ThievesNews1 = TRUE;
	}
	else if((Andre_FoundThieves_KilledByMilitia == TRUE) && (Meldor_ThievesNews2 == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//� ������, � ����������� ������� ����� �����. ��� ���� ���� �����.
		Meldor_ThievesNews2 = TRUE;
	}
	else if(((Kapitel == 3) || (Kapitel == 4)) && (Meldor_DragonsNews1 == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//�������, ��� � ������ �������� ��������� �������. ���������, ����� �������� ����� ������, ����� ��������� � ���������?
		Meldor_DragonsNews1 = TRUE;
	}
	else if((Kapitel == 5) && (Meldor_DragonsNews2 == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//����������������, ��� ������� ������. ���-�� ����� �� �������� ������.
		Meldor_DragonsNews2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//���.
	};
};


instance DIA_Meldor_VonLehmar(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 1;
	condition = DIA_Meldor_VonLehmar_Condition;
	information = DIA_Meldor_VonLehmar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_VonLehmar_Condition()
{
	if(C_LehmarDebtIsOverdue())
	{
		return TRUE;
	};
};

func void DIA_Meldor_VonLehmar_Info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//��, �������...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//� ���� ���� ��� ���� ��������� �� ������...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Meldor_PICKPOCKET(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 900;
	condition = DIA_Meldor_PICKPOCKET_Condition;
	information = DIA_Meldor_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Meldor_PICKPOCKET_Condition()
{
	return C_Beklauen(34,55);
};

func void DIA_Meldor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,Dialog_Back,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

