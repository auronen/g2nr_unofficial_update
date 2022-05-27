
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "�� �����?";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//�� �����?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//���������, ��� �� ���������?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//�� ��� �� �� �������� ���� � �����?
	if(VisibleGuild(other) == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//�� �������� ��� �� ���� ����, �� � ��������� ����� �� ��������� � ���� ���� ������������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//�� �������� �� ���� ����. ������ � ��������� ����� � ���� ������������ � ����������.
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "������������ � ����������?";
};


func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//������������ � ����������?
	if((VisibleGuild(other) != GIL_MIL) && (VisibleGuild(other) != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//��� ������� �������� �� ��� � �������� ���, ��� �� ����������.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//�� ������� ������ ��� ������� ���� ��� ����. �������, ��� �� ������ �� ������ ����.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//�, �������, �������, ��� ����� ����, ��� ������� ���������� ��������� � �������, ��� �������������, ��� �����.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//������ �� �� ������� ���. �������������, ��� ��� �������� ��� ����.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//�� ���� ��� ��������� ��� ���������, ��� ������ ������ ����� ����.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"����� ��� ��� ���� ����.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"����� ����, � ����� ���� ������.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"�� ����������� �� ���� ���������?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//�� ����������� �� ���� ���������?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//�� ������? �� ������������� �������, ��� �� ������������, ��� � ������-�� ������� �������� �������� � ����������?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//����� ��� ��� ���� ����.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(�������) � ��� � ����! �� ������ ��������� �������.
	if((VisibleGuild(other) == GIL_MIL) || (VisibleGuild(other) == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//�����, �� �������. ����� ��� �������� ���� ������, ������� ��� �������.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//�����, ���� ����� ����.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//����� ����, � ����� ���� ������.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//�� ����... �������, ��� ����� ���-������, ������� ������� �� ��������� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//���� ���� �� �������� ����� �������� � ���� ����.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//� ��������, ��� ����� �������.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"� ������ ������ �������� � ����������. ��� �������� � ���� ������� ����, ��� ��� �� ������� �� �����. ����� ������ ���, � ������ ���������� � ���-������, ������� ������� ����� ��������� ��� ���������.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "� ����, ��� ������ ���� �������� � ����������.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//� ����, ��� ������ ���� �������� � ����������.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//� ��� ��?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//� ����� ����� ������� �����, ����� ��������� ������������� �� ����� �����.
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//�� � ���� ���-����, ��� ����� ���� ������.
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//������, ��������� ���������, ����� ��������� ���� ������� �� ��������� � ����.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//�������, �� ������ ������� ���, ����� ���� �� ��������� �������� ���� � �����?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//�� ��� ������.
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	if(Npc_HasItems(self,ItMi_Aquamarine))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//�������! ������� ����. ��� ����� ���� ���������... ���� ������...
		AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//� ����� ���� �������� ������ �� ����� �� �������� � ��������� ��������.
		AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//�� �����, ��� �� ����� ������, �� ����� �������, ��� ��, ��������� ������ ��� ����������.
		B_GiveInvItems(self,other,ItMi_Aquamarine,1);
		B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07_add");	//�������! ��� ����� ���� ���������... ������� ����...
		B_GivePlayerXP(XP_Addon_Farim_PaladinFisch / 2);
	};
};


instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "�� ������ ���-������ � ��������� �����?";
};


func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//�� ������ ���-������ � ��������� �����?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//��� ���� ������ ���������� � ������-�� ��������������� ������. � � ���� ��� ��� �������?
	if(ToldFarimAboutDeadWilliam == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//������� �� ������ �� ������ �� ������. ������ � ��� �� �����.
	};
	SCKnowsFarimAsWilliamsFriend = TRUE;
};

var int ToldFarimAboutDeadWilliam;
var int Farim_Day;

instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "������ ���� �������� ������?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//������ ���� �������� ������?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//������ ���. �� ��� �������, �� �� ��� ������ �� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//��� ��������� ��������� �������� �� ���� �����.
	self.flags = 0;
	Farim_Day = B_GetDayPlus();
	if(!Npc_KnowsInfo(other,DIA_Addon_Garvell_MissingPeopleMore))
	{
		if(MissingPeopleReturnedHome == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		};
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	};
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"�� ��� ��� ���� �� ����?",DIA_Addon_Farim_William_typen);
	if(!Npc_HasItems(other,ITWr_Addon_William_01) && (FoundDeadWilliam == FALSE))
	{
		Info_AddChoice(DIA_Addon_Farim_William,"�����, �� ��� ��������.",DIA_Addon_Farim_William_auftauchen);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Farim_William,"�� �����.",DIA_Addon_Farim_WilliamReport_Dead);
		FoundDeadWilliam = TRUE;
	};
	Info_AddChoice(DIA_Addon_Farim_William,"��� �� ���������?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"����� �� ����� ������� � ��������� ���?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//��� �� ���������?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//� ���� ���� �����-�� ������ ������� � ����� ��������.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//�����, �� �������� �� �����������.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//�� ��� ��� ���� �� ����?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//� �� ���� �� ��� ���, �� ��� �� ���� ����� � ��������.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//���� ������ ������� ����, ��� ��� ����������� � ��������.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//� ���� ��� ������ ���, ����� ������� � ������.
	Info_AddChoice(DIA_Addon_Farim_William,"��� ������ ��������� ��� �����?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//��� ������ ��������� ��� �����?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//� ������ ������ ���� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//���� ����� �������� ������ ��� �� �����.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//�� ������ ���� ����� ���������� ��������� �������� ������. ���-�� � �� � �����.
	if(MIS_Addon_Vatras_WhereAreMissingPeople != LOG_SUCCESS)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	};
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"����� ����� ����������� ���, ��� ������ ��� �������� ������. ����� ���������, ��� ������ ���������� � ������-�� ������������ �� ����� � ������ �� ������.");
	Info_AddChoice(DIA_Addon_Farim_William,"� ������� ���, ��� ����� �����.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//����� �� ����� ������� � ��������� ���?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//��������� ���� �����.
	if(!Npc_HasItems(other,ITWr_Addon_William_01) && (FoundDeadWilliam == FALSE))
	{
		Info_AddChoice(DIA_Addon_Farim_William,"����� ����, �� ������ ���� � ���� ��������?",DIA_Addon_Farim_William_Fischen);
	};
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//����� ����, �� ������ ���� � ���� ��������?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//�� ������. ��� ����� ����� �� ����� � ������.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//�����, �� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//���� ��. ��� �� ���� ������� �����.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//�����, ����� ��������� ����� ��� ���� ������� � ������ �������.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//� ������� ���, ��� ����� �����.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//���� �� ����� ������������. �� �����, ��� �� ��� �������.
	Info_ClearChoices(DIA_Addon_Farim_William);
};

func void DIA_Addon_Farim_WilliamReport_Dead()
{
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//�� �����.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(��������) ��� � � �����.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//��� �, �������, ��� ���������.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//(��������) �����-�� � � ����� � ������ ��� ���� �� ������ ���������� �����. �� �� �����, ����� � ��� ��������...
	FoundDeadWilliam = TRUE;
	ToldFarimAboutDeadWilliam = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Rest");
};

instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "��� �����?";
};


func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//��� �����?
	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//�������� ���������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//������ � �������. ������ ������ ������, � ��� ��������� - ����� ��������.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William) && (ToldFarimAboutDeadWilliam == FALSE) && (Farim_Day < Wld_GetDay()))
	{
		if(Npc_HasItems(other,ITWr_Addon_William_01) || (FoundDeadWilliam == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//�, ��� ����� ��!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//���� �����-������ ������� � �������?
	DIA_Addon_Farim_WilliamReport_Dead();
};

