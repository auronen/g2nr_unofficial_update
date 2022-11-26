
instance DIA_Addon_Myxir_ADW_EXIT(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 999;
	condition = DIA_Addon_Myxir_ADW_EXIT_Condition;
	information = DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_ADWHello(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_ADWHello_Condition;
	information = DIA_Addon_Myxir_ADWHello_Info;
	description = "���� ����� �������?";
};


func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//���� ����� �������?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//������ ������ �������� ����!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//����, ��� ��� ��� ������, ��� � �� ����.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(���������) ���� �� �������������� ������� � ���� ������� �� ����� ������ ��.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//���� �������?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//������ ���� � ������ ����� � ����� �����.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//���� � ��������� �����, ��� ������, ��� �� ������ ������������ � ���� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//��� ��������� ��������� �������, ����������� �����. ���� ������ �� ������ � �������� ������� �����������.
	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"��� �������� ��� �������?",DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello,"�� ������, ��� ��� ���������� ���������, ���� �� �����-�� �������������.",DIA_Addon_Myxir_ADWHello_Watt);
	if(Myxir_Addon_TeachPlayer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Myxir_ADWHello,"�� ������ ������� ���� ����� ������?",B_Myxir_WillYouTeachMe);
	};
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//��� �������� ��� �������?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//������� ������� ���� �������� ������ ����������, ������� �������������� ��� ������������� �����.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//�������, ��������, ������� � ����� ������, ������� ������ �����������. ����� ����� ��� ������� ����� ������ ����� �� ������������ ���� ������.
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//�� ������, ��� ��� ���������� ���������, ���� �� �����-�� �������������.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//�� ������ ��������� �� ������� ��������� ��������, �����, ��� ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//�� ��������� �������� ����� ������� ������, ������ � ����������.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//� �� ����������, ��� ��� �� ����� ���� ������������.
};


instance DIA_Addon_Myxir_PermADW(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 10;
	condition = DIA_Addon_Myxir_PermADW_Condition;
	information = DIA_Addon_Myxir_PermADW_Info;
	permanent = TRUE;
	description = "���� � ������� ����, �� ����������� ���� ������.";
};


func int DIA_Addon_Myxir_PermADW_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//���� � ������� ����, �� ����������� ���� ������.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(�������) ��, � �� ���� ���������.
};


instance DIA_Addon_Myxir_GeistTafel(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistTafel_Condition;
	information = DIA_Addon_Myxir_GeistTafel_Info;
	description = "���� ������ �������.";
};


func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if((Saturas_RiesenPlan == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Myxir_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//���� ������ �������.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//����� ������ � ���� � ������ ��� ����� �������.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//������� �������, ��� �� ����� � ���, ��� ������� � ����, � ����!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(���������) �, ������!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//������ ����, ����� ������, ��� ������� ������, �� ������� ���������� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//���� �� �������, ��� �������� ���� � ������� ��� ���������!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//�� ������ ��������� ��� ��.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//�� ��������� ���� ������� ��� �� �������...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//�� ������ ������ ��������� �������� �����������, ������������ ������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//�� ������ �������� ��... � ��������� �����������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//����� ��������, ��� ���, ��� ����� � �������, ����� ������� ����.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//�� �������, ��� ��� ���������?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//��� � ���� ���������� ��������� ������������� ������������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//��������, ������ �'�������, ������������ �������� �������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//�� ������ ���� ������� � ����.
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_Running;
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"�� ��������?",DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"������ ����������? ������ �� ��������� ���� ��������?",DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"�������� ������� �������������� �� ���� ���� ����.",DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//������ ����������? ������ �� ��������� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//����� �������� ����� ��������� �������� ���������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//��� ��� ���� �������� ����� ������� ����.
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//�������� ������� �������������� �� ���� ���� ����. ������ �� ����� ���� �����������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//�� ��, � ��� ��� ��������, ���������� ����������� � �� �����������, � �� �����, ������� ��� ������������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//���� ������ �������� ���� ��������� � ���������. �� ����� ��� ��������� �������� ������, ������� ��� ������ ��� ���������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//� ����� �� ���� �������� ������� ��������� � �������� ���������. ��� �������� ���� � ����������� ��� ����.
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//�� ��������?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//�� ������ ������������ ����� �����������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//���� ���� � ��� ���� ���� ���������� ���� ����������� � ����� �� ������, �� ������ ��� ������������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//� ����� ������, ������-�� ��� �������.
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel,"� ��� �� ��� ����� �������, ����� ������� ����� ����?",DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//� ��� �� ��� ����� �������, ����� ������� ����� ����?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//����� �������� �����������. ��� ��������� �� ������ ������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//���� ������� ����� ��� ������ ���������� ������� �������. ���, � ������� ���.
	CreateInvItems(self,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//��� ���. ������ ���� ����� ���� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//�����, ��� ���!
	B_LogEntry(TOPIC_Addon_Quarhodron,"������ �����, ����� � �������� ��� �������� ������ ������ ����������� � �������� � ���� ������. �� ��� ��� ������ � �����������, ������� � ������ ��������� � �������� �����������. ��� ��������� �� ������.");
	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};


instance DIA_Addon_Myxir_GeistPerm(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_GeistPerm_Condition;
	information = DIA_Addon_Myxir_GeistPerm_Info;
	permanent = TRUE;
	description = "�������� ��� ��� ��� � ���, ��� ������� ��� �����������.";
};


func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//�������� ��� ��� ��� � ���, ��� ������� ��� �����������.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//����� ��� �������� � �������� � ��� ���������� ������� �������.
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//� ��� ������ �� ���� � ����?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//� ������� �����. �� ������ ������ ��������� �� �����.
};


instance DIA_Addon_Myxir_TalkedToGhost(C_Info)
{
	npc = KDW_14030_Addon_Myxir_ADW;
	nr = 5;
	condition = DIA_Addon_Myxir_TalkedToGhost_Condition;
	information = DIA_Addon_Myxir_TalkedToGhost_Info;
	description = "� ������� � ������������.";
};


func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_Running) && (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//� ������� � ������������.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(����������) ���� ������������� ������� ��������� ��� �� ��������� ���?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//����������! ���� ��� ������ � ������ ��������� ��� ������.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//��� �����, ���� �� ��� ����� ��������, ���� �� �� ����������� �� �������...
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//� ��� �� ������ ���?
	if(Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//�� ��������� ��� � ���, ��� ������� � ���� �������.
		if(Saturas_KnowsHow2GetInTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//����� ������ ��� � ��������. ���, ����������, ������������ ��, ��� �� ��� ����������.
			B_LogEntry(TOPIC_Addon_Quarhodron,"� ������ ������� ��������, ��� �������� �����������.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//������ ������ �������� ����!
		};
	}
	else
	{
		DIA_Common_NothingImportantYet();
	};
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);
};

