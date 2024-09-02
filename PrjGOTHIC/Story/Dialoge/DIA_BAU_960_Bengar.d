
instance DIA_Bengar_EXIT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 999;
	condition = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bengar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_HALLO(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 3;
	condition = DIA_Bengar_HALLO_Condition;
	information = DIA_Bengar_HALLO_Info;
	description = "�� ������� ������?";
};


func int DIA_Bengar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//�� ������� ������?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//����� ������� � ���, ���� �� ����� ����, � ������� ���������.
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//��� ����� ����� ����������� ������ �������� ��������������.
	};
};


instance DIA_Bengar_WOVONLEBTIHR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Bengar_WOVONLEBTIHR_Condition;
	information = DIA_Bengar_WOVONLEBTIHR_Info;
	description = "��� �� ������������� �� �����?";
};


func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//��� �� ������������� �� �����?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//� �������� ������ � ������ ����. �� �, ������� ��, �� ����� ���������� ���� � �������� � ����.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//���� ������� ��� ���� ���� ���������� � ��� ���������� ���-�� �������� ��. ����� ��������� �� ��� ������� ��������, ���������?
};


instance DIA_Bengar_TAGELOEHNER(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 6;
	condition = DIA_Bengar_TAGELOEHNER_Condition;
	information = DIA_Bengar_TAGELOEHNER_Info;
	description = "�� ��������� �������� �������?";
};


func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//�� ��������� �������� �������?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//���� ��������� ����������, ������� �� ����� �� ��� �����.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//����� �� �������� �� �� ���. � ������ ��, � ��� �������� �� ����.
};


instance DIA_Addon_Bengar_MissingPeople(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_MissingPeople_Condition;
	information = DIA_Addon_Bengar_MissingPeople_Info;
	description = "�� ��������� �� ����� � ��������� ����� ���-������ ���������?";
};


func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//�� ��������� �� ����� � ��������� ����� ���-������ ���������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//� ��������� ��� ���������� ����� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//�� ����� ��������� ���� ������������ �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//��� ���� �� ���� �������. ���������, �� �� �� ���, ��� �������� � ���� ���������� ������ ��� ������� � ������� � ����������� �����������.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"� ������� ������� ������ ��� �������� - ������.");
	MIS_Bengar_BringMissPeopleBack = LOG_Running;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,Dialog_Back,DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"���� �����-������ �����?",DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"����� ����, ��� ������ ��� �������.",DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"��� ������ � ��� ������������ ���������� ���� ��������?",DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//��� ������ � ��� ������������ ���������� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//������ �������� �������. ����� ������� ����������, �� ������� �� ������ �� ����� - ������� �������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//�� �������� �� ������ ���� ��� ���� ������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//� �������, �������� ��� �������� ���������, �� ������� �� ��������...
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(� �����������) � ��� �������, ���-�� �� ����. ��������.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//������� �� ����� ���������.
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//����� ����, ��� ������ ��� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//������ �� ����� ���� ���� ��� ������. � �� ���� ���� ����������� ����, ����� �� ���� �������� � ������� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//� ���� �� ������� ���, ��� �����.
};

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//���� �����-������ �����?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//�����, ��� �������� �������. � ��������� ����� ��� ���������� ����� �������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//������� � �����, ��� ��� ������ � ���� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//������, ��� ��� ���������� ������� ��� �����.
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople,"��� ��������� ������ ��������?",DIA_Addon_Bengar_MissingPeople_Lager);
};


var int Bengar_ToldAboutRangerBandits;

func void DIA_Addon_Bengar_MissingPeople_Lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//��� ��������� ������ ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//���, ��� ��������� ��� ����, ���� ��������, ������� � ��������� ������. ��� ��� � ������������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//� ����� �������� ��� �������, �� � ����� ������� ��� �� ����������.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//����, ������, ���� ����� ��������� �� ��� ��������. ������ ��� �� �����.
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};


func void B_BengarToldOnarFewDaysAgo()
{
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//� ������ �� ���� ����� ��� ���� ���� �����. � �� ��� � ����� ���� �����?!
};

instance DIA_Addon_Bengar_ReturnPardos(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_ReturnPardos_Condition;
	information = DIA_Addon_Bengar_ReturnPardos_Info;
	description = "������ ��������?";
};


func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if((MIS_Bengar_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE))
	{
		if(!Npc_IsDead(Pardos_NW))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//������ ��������?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//��, �� � ����, ��������. ������� �� ���...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//�� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//� ����� �� ��������� ����, �� � ���� ������ ���...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//������ �� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Bengar_FernandosWeapons(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 5;
	condition = DIA_Addon_Bengar_FernandosWeapons_Condition;
	information = DIA_Addon_Bengar_FernandosWeapons_Info;
	description = "����� ������� ����� ���������, � ��� ���� ������?";
};


func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if((Bengar_ToldAboutRangerBandits == TRUE) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//����� ������� ����� ���������, � ��� ���� ������?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//��� �� ������ ������? ����� ��� ������� ������ ��� ������?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//� ���� � ����, ����� ������. ������� ����.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//�, �������. ��, ����� ���� ��� �� �� ���� ������, � ���������, ��� ������ ������������� ���� �����.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//����� ���� � ������, ����� - � ������, � ��� ����� ��� ����� �� ������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_REBELLIEREN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 8;
	condition = DIA_Bengar_REBELLIEREN_Condition;
	information = DIA_Bengar_REBELLIEREN_Info;
	description = "��� �� ������� �� �����?";
};


func int DIA_Bengar_REBELLIEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//��� �� ������� �� �����?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//��� ������ �������. ��-�� ���� ��� ���� �������.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//������� ������ �������� �� ������ � �������� ���, ������ ��������, �������������� �� ���, ��� �� �������.
	};
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//�� � ���� ��� ������. ��������� �������� ���� ������ �����, ����� �������� ������, � �� �����, ����� �������� ��� �����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//���� � ���� ��������� ���������� � ������, � �������� ������ ����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//� ���, ���� ���� �� ������ ��������� ��������� ����������, ��� �� ��� �����.
};


instance DIA_Bengar_PALADINE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 9;
	condition = DIA_Bengar_PALADINE_Condition;
	information = DIA_Bengar_PALADINE_Info;
	description = "� ��� �� ������ ������ ����������� �����?";
};


func int DIA_Bengar_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_REBELLIEREN) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//� ��� �� ������ ������ ����������� �����?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//��� ��������. � ��� ���, ��� �������� ������� � �����, �� ����� ������� ���������. ������ ��������.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//������ ��� ������� ��������� ����� ���������� � ��� ���� ����. ��� ������ ���, ��� ������ �����, � �������� ������ �� ������ � ����.
	};
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//������������ ��������, ��� � ������ �����-���� �����, ��� ��� �� ��� ��������� � �������.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//��� �� �����������, ���� ���� ��������� ������� ��� ����.
	};
};


instance DIA_Bengar_PASS(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 10;
	condition = DIA_Bengar_PASS_Condition;
	information = DIA_Bengar_PASS_Info;
	description = "� �������?";
};


func int DIA_Bengar_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//� �������?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//��. ������ � ������ ������ �������� ��������� � �������� � ������ ����� ����� �����������.
	if(!Npc_IsDead(Malak) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//������ ������ � ���. �� ��� ������ ���� ��� � ������.
	};
};


func void B_BengarTooLate()
{
	B_BengarToldOnarFewDaysAgo();
	MIS_Torlof_BengarMilizKlatschen = LOG_FAILED;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

instance DIA_Bengar_MILIZ(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_MILIZ_Condition;
	information = DIA_Bengar_MILIZ_Info;
	permanent = FALSE;
	description = "� ������ ������ ���� �������� � ����������.";
};


func int DIA_Bengar_MILIZ_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//� ������ ������ ���� �������� � ����������.
	if(Kapitel < 3)
	{
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//���?! � ������ �����, ����� �� ������� ����� ���������.
			AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//��� ��� ���� �������� ����.
			AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//����! �� �� ������, ��� ��������� ������� �� ����, ���� � ���� ������ �� ���������?
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//� �� �����, ��� ����� �� ������.
			B_BengarToldOnarFewDaysAgo();
		};
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//��� ������� ���������� ���� ������ ������ � �������� ������ � ������ ������.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//�� ��� ��� ������� ������.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//��� ����� ��������� � ����� ������.
	}
	else
	{
		B_BengarTooLate();
	};
};


instance DIA_Bengar_Selber(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 11;
	condition = DIA_Bengar_Selber_Condition;
	information = DIA_Bengar_Selber_Info;
	permanent = FALSE;
	description = "������ �� �� ������ ���������� � ���������� ����?";
};


func int DIA_Bengar_Selber_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ))
	{
		if((other.guild == GIL_NONE) || (other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//��� ��� ��� �����. ������ �� �� ������ ���������� � ���������� ����?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//��, ��� �����. �� �� �� ������ ������������� ������ ��������� ������ ���������.
};


instance DIA_Bengar_MILIZKLATSCHEN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZKLATSCHEN_Condition;
	information = DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent = FALSE;
	description = "�� � ��� ���� ���������, � ����� ����������� � ����!";
};


func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Miliz_Flucht == FALSE))
	{
		if(!Npc_IsDead(Rick) && !Npc_IsDead(Rumbold))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//�� � ��� ���� ���������, � ����� ����������� � ����!
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//���, ��� ��� ����. ������, � �� ������� ����.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//������ �� �������!
		}
		else
		{
			AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//����� ����! ������ ��, ��� ���� ������.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"MILCOMING");
		B_StartOtherRoutine(Rick,"MILCOMING");
		B_StartOtherRoutine(Rumbold,"MILCOMING");
	}
	else
	{
		B_BengarTooLate();
	};
};


var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 12;
	condition = DIA_Bengar_MILIZWEG_Condition;
	information = DIA_Bengar_MILIZWEG_Info;
	permanent = TRUE;
	description = "���� �������� � ���������� ��� � �������.";
};


func int DIA_Bengar_MILIZWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_MILIZ) && (Bengar_MilSuccess == FALSE) && (MIS_Torlof_BengarMilizKlatschen != LOG_FAILED))
	{
		if((Npc_IsDead(Rick) && Npc_IsDead(Rumbold)) || (Rumbold_Bezahlt == TRUE) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//���� �������� � ���������� ��� � �������.
	if((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && (!Npc_IsDead(Rick) || !Npc_IsDead(Rumbold)) && (Miliz_Flucht == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//�� � ��� �����? �� �� ������, ��� ��� ������� �� ����, ����� �� ������?
		if(Kapitel < 3)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//��� ��� ��� ����� ��� ���. ����� ��, ����� ��� �������, ������!
		}
		else
		{
			MIS_Torlof_BengarMilizKlatschen = LOG_FAILED;
			B_CheckLog();
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//�������. ����� ����, ���� �� ���� ����� � ���� �� � ������. �������.
		if(Rumbold_Bezahlt == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//�� ���� ����� ��� ��������� �� ����. ��� ����� ���������� � ����� �������.
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
		};
		Bengar_MilSuccess = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_Bengar_BALTHASAR(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 13;
	condition = DIA_Bengar_BALTHASAR_Condition;
	information = DIA_Bengar_BALTHASAR_Info;
	description = "������� ���������� ��������� ���������� �� ����� ���������?";
};


func int DIA_Bengar_BALTHASAR_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_WOVONLEBTIHR))
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//������� ���������� ��������� ���������� �� ����� ���������?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//��, ��. ��� ������ �������. � ������ ���, ��� ����� ������ ������� ������, ���� ����� ����� ����� ���� �� ���� ���������.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//�� ������ ������, ��� ����� ���� ���������. � ������ �� ��� �� �������� ����������.
	B_LogEntry(TOPIC_BalthasarsSchafe,"����� ������� ������� ��������� ���������� ��������� �� ��� ��������, � ������ ������� ��� ������. � ������, ��� ����� ����������� ����������� �����������.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 14;
	condition = DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information = DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description = "��������� ����, � ��������� ����� ����� ������������ ���� ��������.";
};


func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if((MIS_Balthasar_BengarsWeide == LOG_Running) && Npc_KnowsInfo(other,DIA_Bengar_BALTHASAR))
	{
		if(Bengar_MilSuccess == TRUE)
		{
			DIA_Bengar_BALTHASARDARFAUFWEIDE.description = "��������� ����, � ��������� ����� ����� ������������ ���� ��������.";
			return TRUE;
		};
		if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) || Npc_KnowsInfo(other,DIA_Bengar_MALAKWIEDERDA) || Npc_KnowsInfo(other,DIA_Addon_Bengar_ReturnPardos))
		{
			DIA_Bengar_BALTHASARDARFAUFWEIDE.description = "��������� ����� ����� ������������ ���� ��������.";
			return TRUE;
		};
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	if(Bengar_MilSuccess == TRUE)
	{
		AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//��������� ����, � ��������� ����� ����� ������������ ���� ��������.
	}
	else
	{
		AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00_add");	//��������� ����� ����� ������������ ���� ��������.
	};
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//������?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(���������) ������ ��� � ��� ������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//���. ������, ��� �������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//������ ����� �� ����� ����� ���� ���-������ �� �����.
	B_LogEntry(TOPIC_BalthasarsSchafe,"� ������ ������� ��������� ���������� ����� ����� ���� �� ��� ���������.");
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bengar_PERMKAP1(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 15;
	condition = DIA_Bengar_PERMKAP1_Condition;
	information = DIA_Bengar_PERMKAP1_Info;
	permanent = TRUE;
	description = "������ ����.";
};


func int DIA_Bengar_PERMKAP1_Condition()
{
	if(((Bengar_MilSuccess == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Bengar_ReturnPardos)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//������ ����.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//�� ����.
	AI_StopProcessInfos(self);
};


instance DIA_Bengar_ALLEIN(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 30;
	condition = DIA_Bengar_ALLEIN_Condition;
	information = DIA_Bengar_ALLEIN_Info;
	description = "��� ����?";
};


func int DIA_Bengar_ALLEIN_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//��� ����?
	if((Malak_isAlive_Kap3 == TRUE) && (Npc_GetDistToWP(Malak,"FARM3") >= 3000))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//����� ���� �� ���� � ������ � ����� ����, ��� ������� �� ����. �� ������, ��� ������������ � ����.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//�� ������ �� ��� ���������� �����.
		if(MIS_GetMalakBack == FALSE)
		{
			MIS_GetMalakBack = LOG_Running;
			Log_CreateTopic(TOPIC_BengarMALAK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BengarMALAK,LOG_Running);
		};
		if(!Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS))
		{
			B_LogEntry(TOPIC_BengarMALAK,"������ ������� ���� �� ����� �����. ����� ���� � ���� � ����� ���� ���������. ������ ������, ��� ��� ����������� � ����.");
		}
		else
		{
			B_LogEntry(TOPIC_BengarMALAK,"������ ������� ������ ���� �� ����� �����. ����� ���� � ���� � ����� ���� ���������.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//������� ������� �������. � ���� �� ����, ������� � ��� ����� ������������.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//����� ���� �������� ������ ���� �������� ����� ������. ����� ��� ���� ��� ������.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//���� �� ������ ���� �������� ���� �� ��������� ���������...
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//���� �� ��� ���� ��� ����� �������� �� ����. �� �� ���������, �������. ��� �������, ��� ����� �����.
	if(!Npc_IsDead(SLD_Wolf))
	{
		MIS_BengarsHelpingSLD = LOG_Running;
		Log_CreateTopic(TOPIC_BengarALLEIN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BengarALLEIN,LOG_Running);
		B_LogEntry(TOPIC_BengarALLEIN,"����� ������� ��������� ����������. ��� ����� ������. �� ������� ���-�� � ��������, �������� ����� �����. ����� ����, � ���� ����� �����?!");
	};
};


instance DIA_Bengar_MALAKTOT(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_MALAKTOT_Condition;
	information = DIA_Bengar_MALAKTOT_Info;
	description = "����� �����.";
};


func int DIA_Bengar_MALAKTOT_Condition()
{
	if(Npc_IsDead(Malak) && (Malak_isAlive_Kap3 == TRUE) && Npc_KnowsInfo(other,DIA_Bengar_ALLEIN))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//����� �����.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//������ ��� ������ ��� ����.
};


instance DIA_Bengar_SLDDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 32;
	condition = DIA_Bengar_SLDDA_Condition;
	information = DIA_Bengar_SLDDA_Info;
	description = "� ����� ���� ��������, ��� �� � �����.";
};


func int DIA_Bengar_SLDDA_Condition()
{
	if((MIS_BengarsHelpingSLD == LOG_SUCCESS) && !Npc_IsDead(SLD_Wolf))
	{
		if(Npc_GetDistToWP(SLD_Wolf,"FARM3") < 3000)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//� ����� ���� ��������, ��� �� � �����.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//� ���� ����� ��� ������� �� ���� ����� ����������. �������, �� ������ ������ ���.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//���, ������. � �����, ��� ���� ����������.
	CreateInvItems(self,ItMi_Gold,400);
	B_GiveInvItems(self,other,ItMi_Gold,400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};


instance DIA_Bengar_MALAKWIEDERDA(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 35;
	condition = DIA_Bengar_MALAKWIEDERDA_Condition;
	information = DIA_Bengar_MALAKWIEDERDA_Info;
	description = "����� ��������.";
};


func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	if((MalakIsBackToBengar == TRUE) && !Npc_IsDead(Malak) && Npc_KnowsInfo(other,DIA_Bengar_ALLEIN))
	{
		if(Npc_GetDistToWP(Malak,"FARM3") < 3000)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//����� ������. � � �� ������, ��� ������ ������� �� ����� ���.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_GetMalakBack);
};


instance DIA_Bengar_PERM(C_Info)
{
	npc = BAU_960_Bengar;
	nr = 80;
	condition = DIA_Bengar_PERM_Condition;
	information = DIA_Bengar_PERM_Info;
	permanent = TRUE;
	description = "��� ����� � �������.";
};


func int DIA_Bengar_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bengar_ALLEIN))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	DIA_Common_EverythingWillBeAlright();
	if(Npc_KnowsInfo(other,DIA_Bengar_MALAKWIEDERDA) && !Npc_IsDead(Malak))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//����� ����� �����, �� �������� ����� �� ����������.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//���� ������ �� ���������� ����, ���� ��� ����� �������� �����.
	}
	else if(Npc_KnowsInfo(other,DIA_Bengar_SLDDA) && !Npc_IsDead(SLD_Wolf))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//����� �������� ������, �� � �������, �� ��� �� ������ ������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//��� ������ ���� ����� ����� ������ �����. ���� ������ �� ����������� � ��������� �����, �����, ��� �������� ������� ��.
		if((Malak_isAlive_Kap3 == TRUE) && !Npc_IsDead(Malak))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//�������, �� ����� ��������.
		};
	};
	AI_StopProcessInfos(self);
};

