
instance DIA_Ingmar_EXIT(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 999;
	condition = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ingmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ingmar_Hallo(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 2;
	condition = DIA_Ingmar_Hallo_Condition;
	information = DIA_Ingmar_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};


var int DIA_Ingmar_Hallo_permanent;

func int DIA_Ingmar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Ingmar_Hallo_permanent == FALSE) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if(MIS_OLDWORLD == FALSE)
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//� �����, �� ������ ���������� � ������ �������. ��� ��� �� � ����.
	}
	else if(MIS_OLDWORLD == LOG_Running)
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//�������� ���������� ���� ����������, ������ �������� - ������� �����.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//���������� � ����� ����������, ������ ��� ������������ ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//���������� � ������ �������� ����� �������� ����. �� �� ����������� ����, ����� ���������� ��� ��������� � �������� ����� ������ ������ ������ � �����.
		DIA_Ingmar_Hallo_permanent = TRUE;
	};
};


instance DIA_Ingmar_Krieg(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 99;
	condition = DIA_Ingmar_Krieg_Condition;
	information = DIA_Ingmar_Krieg_Info;
	permanent = FALSE;
	description = "��� ���� �� ��������?";
};


func int DIA_Ingmar_Krieg_Condition()
{
	return TRUE;
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//��� ���� �� ��������?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//����� ��� �� ��������, ���� ����������� ������ ��� ������ �����.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//�� ������ ������ ����� ���������� �� �����, �� ���, ������� �������������� ���� �����.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//��� ��������� ��� �������� � ��� ����, � ������� � ����� ������ �� ����������� �������.
};


instance DIA_Ingmar_CanTeach(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 100;
	condition = DIA_Ingmar_CanTeach_Condition;
	information = DIA_Ingmar_CanTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Ingmar_CanTeach_Condition()
{
	if(Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//�� ������ ������� ���� ����-������?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//� ���� ������� ���� ��� ����� �������, ����� �� ��� ����������� ����������� ����� �������.
		Ingmar_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������� ������ ����� ������ ��� ����� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//� ������ ������ �������������� ������ ������.
	};
};


func void B_BuildLearnDialog_Ingmar()
{
	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach,Dialog_Back,DIA_Ingmar_Teach_BACK);
	if(RealAttributeValue(ATR_STRENGTH) >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//�� � ��� ����� ��� ������. ��� ������ ����� ����.
	}
	else
	{
		Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(ATR_STRENGTH,1)),DIA_Ingmar_Teach_1);
		Info_AddChoice(DIA_Ingmar_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(ATR_STRENGTH,5)),DIA_Ingmar_Teach_5);
	};
};

instance DIA_Ingmar_Teach(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 6;
	condition = DIA_Ingmar_Teach_Condition;
	information = DIA_Ingmar_Teach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Ingmar_Teach_Condition()
{
	if(Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//� ���� ����� �������.
	B_BuildLearnDialog_Ingmar();
};

func void DIA_Ingmar_Teach_BACK()
{
	Info_ClearChoices(DIA_Ingmar_Teach);
};

func void DIA_Ingmar_Teach_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX))
	{
		B_BuildLearnDialog_Ingmar();
	};
};

func void DIA_Ingmar_Teach_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX))
	{
		B_BuildLearnDialog_Ingmar();
	};
};

instance DIA_Ingmar_ORKELITE(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 40;
	condition = DIA_Ingmar_ORKELITE_Condition;
	information = DIA_Ingmar_ORKELITE_Info;
	description = "���� ������� ������������� �����������.";
};


func int DIA_Ingmar_ORKELITE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing) || (Hagen_SawOrcRing == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//���� ������� ������������� �����������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//�� ��? �� ��� �, ��� ����� ���������. � ������ ���� ��� ��������?
	if(TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//� ������� � ����.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//�� ������ ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//���. ��� �� ������ �� �������� ��������� �����.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"���� ����� ����� ������ �������� ��� �� ���.",DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"��� ��� ������ ������?",DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE,"��� ��� ������?",DIA_Ingmar_ORKELITE_wieso);
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"������ ��� ����� ������������� �������� � ��������� �����.");
	MIS_KillOrkOberst = LOG_Running;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//���� ����� ����� ������ �������� ��� �� ���.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//���� �� �������, ���� �� � ��� ���� ����� ��������� ����������. � ����� ����-������ ��������� �����������.
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//���� ��, ��� �� ��������, ������, ��� ��������, ��� ��� �������� �������� ��� �������, ������ ���� ������ ������� �������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//������ ������ ���� ����� ����������� ���� ������������. ������ ����� ����� ��������� ����� ��� ������ ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//�� ��� ���� �������. �� ������ - ���� �� ��������� ���������, � ������ �������� �������� �������-������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//������� ����� ������ ����������� � ����-������ �� ���, �� ���������� ����� ���� �� ����� ��� �� 30 ������.
	B_LogEntry(TOPIC_OrcElite,"������ ������, ��� � ������������� ����� ����� ������ �����������. ��� ������� ���� ��������� ����������.");
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//��� ��� ������ ������?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//����� ��� ����������� � ����� ����������, ��� ������ ������������ ������, ������������� ������� �� ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//���� ������������������ ������������ ���������� ���� ����-�������� � ����� �� �����, ������ ���������� ���� ������ � ���.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//���� �� �� ������ ��������� �� ����� ������������� �����, �� �������� �� �������� ������������.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//�����, � ���� ������ ���� ��� �����.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//������������ ����� ������ ������������ ���������� � ���������������� �������� �� ����� ������. � �� ����������� �������� ��� ������ ���-������ ���������� �� ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//��������� ����� ���� �������� � ����� �������. ����� ����, ���� ����������� ������ ������ ������ ������?
	B_LogEntry(TOPIC_OrcElite,"�������� �������, � ������ ����� ���������� ����� � ������ ���-�� ���������� �� ����� �������. ������ �����, ����� � ���� ���.");
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};


instance DIA_Ingmar_HAUPTQUARTIER(C_Info)
{
	npc = PAL_201_Ingmar;
	nr = 41;
	condition = DIA_Ingmar_HAUPTQUARTIER_Condition;
	information = DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent = FALSE;
	description = "� ���� ����� ����-�������� �����. �� ������������ ���.";
};


func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if(Npc_IsDead(AntiPaladin_NW) && Npc_KnowsInfo(other,DIA_Ingmar_ORKELITE))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//� ���� ����� ����-�������� �����. �� ������������ ���.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//��� �������� �������. ������ ���� ��������� ����� ����� ��������� � �������������.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//��� �������. ���� �� � ��� ���� �������� ������� ����� ����, �� ����� �������� ����� ����� ���� �� �� �����������.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//���. ������ ��� ������. �������, ��� ������� ���� ������ ������� ����������.
	CreateInvItems(self,ItMi_Gold,300);
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_KillOrkOberst = LOG_SUCCESS;
	B_GivePlayerXP(XP_KilledOrkOberst);
};

