
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v1;
};


func int DIA_Akil_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//� ������ ����!
	if(!Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//�� ���� ����������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//����! ������ ��� ���� ������ ���-������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo(C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hallo_Info;
	permanent = FALSE;
	description = "� ���� �����-�� ��������?";
};


func int DIA_Akil_Hallo_Condition()
{
	if(!C_AkilFarmIsFree())
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//� ���� �����-�� ��������?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(� ����) ...�-�... ���, ���... ��� � �������. (������) �-�... ���� ����� ���� ������.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//�� � ���� ������?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//�-�... ��, ��, ��... ��� � �������. ��... �-�... �... � ������ �� ���� �������� � �����.
	if(Akils_SLDStillthere == FALSE)
	{
		Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
		B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
		Akils_SLDStillthere = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Nichtjetzt(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Nichtjetzt_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_Nichtjetzt_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !C_AkilFarmIsFree() && Npc_KnowsInfo(other,DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//�-�... �� ������, � ������ �� ���� �������� � �����.
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_NachKampf_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_NachKampf_Condition()
{
	if(C_AkilFarmIsFree() && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//����� ������. � �� �����, ��� �����.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//���� ����� ����. � ������ �� ���� ��������� ������ �����.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//��� ��� ����?
	if((VisibleGuild(other) == GIL_SLD) || (VisibleGuild(other) == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//�� ������ ����� ��. ��� �������� � ����� �����. ��� � ��.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//��� �������� � ����� �����. ��� ������� ������ � �����, ��� ������� � �������.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//� ������ �������...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(������� ��������) ...����� ������, �� ����� �� �����. ����� ���, ��� � ���� ������� ��� ����?
	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf,"������. � ������ ���, ��� � ���� ������ ��� � �������.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf,"��� ������ ���������� �������?",DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Kati,"START");
	if(DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE)
	{
		B_StartOtherRoutine(Randolph,"START");
	};
	B_SetMortal(Randolph);
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//������. � ������ ���, ��� � ���� ������ ��� � �������.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//�� ��������� ����. �� ������ ���� ����� �� ����� ����.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//��� ������ ���������� �������?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//�����, ��� �������� ������������ ���� - �� ������ �������. ��� ��� �� ����� �������.
	if(!Npc_IsDead(Kati))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//���, ��� � ���� ���������� ���� - ��� ���. ��� � ����, ����� ��� �������� ����.
		Kati_Mahlzeit = TRUE;
	};
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
};


instance DIA_Akil_Soeldner(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = "��� ��� �������� ������ �� ����?";
};


func int DIA_Akil_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//��� ��� �������� ������ �� ����?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//�� ����������� ���� ����? ��� �������� ������ ������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//�� ����� �� ������? �� ����� ����, ��������. ��� �������� ��� ����� � �������� ����� ��� ����.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//��� ��������, ��� ��� ����� � ����� �� ����� � �������� ��, ��� �� ������ ��������. � ��, ��� �� ����� �������, ������� ���������� � ������.
	};
};


instance DIA_Addon_Akil_MissingPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_MissingPeople_Condition;
	information = DIA_Addon_Akil_MissingPeople_Info;
	description = "�� ������ ���-������ � ��������� ���������?";
};


func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//�� ������ ���-������ � ��������� ���������?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//������? �� ����� ����. � ���� � ������ ������� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//� ���� �� ����� �������� ����� � ������. �� ��� ��� ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//� ����� ����, ��� ��� �� ����� �� ������ ��� ������� � �����, �� ������ ��� �� ����.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//������ ��� �������, � ����� �� �����, ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//���� �� ������� ���-������ �� �� ������, ����������� ��� ��� �����.
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"������ ���� ����������� � ���� ��������� ���������� - ������ � �������.");
	MIS_Akil_BringMissPeopleBack = LOG_Running;
};


instance DIA_Addon_Akil_ReturnPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_ReturnPeople_Condition;
	information = DIA_Addon_Akil_ReturnPeople_Info;
	permanent = FALSE;
	description = "������ ����� ����������...";
};


func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if((MIS_Akil_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE))
	{
		if(!Npc_IsDead(Tonak_NW))
		{
			return TRUE;
		};
		if(!Npc_IsDead(Telbor_NW))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//������ ����� ����������...
	if(!Npc_IsDead(Tonak_NW) && !Npc_IsDead(Telbor_NW))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//�� ������ �� �����! �� ����� ������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//���� ���� �� ��� �����.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//������ � �������� ������� ��� ������.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};


func void B_GetBaltramPaket()
{
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	B_LogEntries(TOPIC_Baltram,"� ������� �������. ������ � ���� ������� �� ���������...");
	B_LogNextEntry(TOPIC_Nagur,"� ������� �������. ������ � ���� ������� �� ������...");
	Lieferung_Geholt = TRUE;
};

instance DIA_Akil_Lieferung(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Lieferung_Condition;
	information = DIA_Akil_Lieferung_Info;
	permanent = FALSE;
	description = "���� ������� ��������. � ������ ������� ������� ��� ����.";
};


func int DIA_Akil_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (MIS_Baltram_ScoutAkil == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//���� ������� ��������. � ������ ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//��� �� ��� ����� ���������. ������, � ��� ���������� ��.
	B_GetBaltramPaket();
};


instance DIA_Akil_Gegend(C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Gegend_Condition;
	information = DIA_Akil_Gegend_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����?";
};


func int DIA_Akil_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner))
	{
		return TRUE;
	};
};


func void DIA_Akil_Gegend_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//�� ������ ������� �����?
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//�������, ��� �� ������ ������?
};


instance DIA_Akil_Hof(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = "��� ��� ����� ����� �����?";
};


func int DIA_Akil_Hof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//��� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//�������� �� �������� �������� ��� ���, � ������ ��� �� ������ �� ������.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//�� ���� ���� ���������� �������. �� ��� ��� ������ �� ������, ���� �� ������� �� ������� ����. ��� ���-�� ��� �������� � �����.
	Knows_Taverne = TRUE;
};


instance DIA_Akil_Taverne(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = "��� ��� �� ������� � ������� ������?";
};


func int DIA_Akil_Taverne_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend) && (Knows_Taverne == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//��� ��� �� ������� � ������� ������?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//������ �� ���� ���������. �� ����� � ��� ����� ����. �� ����� ��� ��������� ���.
};


instance DIA_Akil_Wald(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = "� ��� ���, � ���� �� ����� ������?";
};


func int DIA_Akil_Wald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//� ��� ���, � ���� �� ����� ������?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//��� ������ �������. � ����� ��� ����� ���������� �� ���.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//����� �������, ��� ��� �������� ���� ������ �������. �� - ���� �� ��� �� ������� ��� �����.
	};
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = "���� ���-������ ����������?";
};


func int DIA_Akil_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//���� ���-������ ����������?
	if(Kapitel == 3)
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//���. � �������, ������ ��� ���� ������ �� ����� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//��� ���� ��������� ���������. ����� ��� ������ ����� ����.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//���� ������ �������. ������� ����, ��� � ��� ����� ���-�� ���� ����-��������. ��������� �� ���� ������� �������.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//�������, ��� � ������ ��������� ����-�����. �� ����� ����� � �� �� ����� � ������.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//���� � ������ ����� ���� ����.
		};
		AI_Output(other,self,"DIA_Akil_Perm_15_06");	//��� �� �������.
		AI_Output(self,other,"DIA_Akil_Perm_13_07");	//�� � �����. � ������ �������, ��� ���� ����� ����� ���.
	};
};


instance DIA_Akil_SCHAFDIEB(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = "���� ��� �������?";
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//���� ��� �������?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//���-�� ��������� ������ ���� ����. � ������ �� ���� �������� ����� �� �����.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"��� �� ��� ��������.",DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"������� ���� � ���� �������?",DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"��� ����� ������ ���?",DIA_Akil_SCHAFDIEB_wer);
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//��� ����� ������ ���?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//� ���� ���� ����������.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//�����-�� ������ �������� ������������ � ������ ��� � ��� ����.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//��� ������ ��������, ��� ��� �������� ������ �������. � ����� ������, ��� ������ ��� ������� � ������������ ���� ����.
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe,"���� ����� ���������� ���������. �� �����������, ��� � ����� ��������� �������, ������� � ������ � �������� ����.");
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//������� ���� � ���� �������?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//�� ������� ����, ���.
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//��� �� ��� ��������.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//�������. � ���� ������ ����� �����.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = "� ����� ���, ��� ������� � ���� ����.";
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe == LOG_Running))
	{
		if(C_AkilBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//� ����� ���, ��� ������� � ���� ����.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//�� ��� ����. ��� ���� ������� �� ������ � ����. �� ������ ��� � ���� ������ �� �������.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//������� ����, �, ����������� ��������� ������.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//�������. ������ � ����, ��� ��������� ������ �������� ���, ������ ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//�������. �� ����� �������� �������. �� �����, ��� ������.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//������ ��� � �������� ������������� �� ������������ ������, ��� �� ������ ���.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instance DIA_Akil_AkilsSchaf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	important = TRUE;
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe != FALSE))
	{
		if(!Npc_IsDead(Follow_Sheep_AKIL))
		{
			if(Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//����� ������. ��� ��������� �������. �������, ����� ����������.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.aivar[AIV_TAPOSITION] = NOTINPOS;
	B_StartOtherRoutine(Follow_Sheep_AKIL,"FARM");
	B_GivePlayerXP(XP_AkilsSchaf);
};

