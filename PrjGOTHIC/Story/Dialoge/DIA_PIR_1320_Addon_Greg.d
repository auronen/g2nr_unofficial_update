
instance DIA_Addon_Greg_EXIT(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 999;
	condition = DIA_Addon_Greg_EXIT_Condition;
	information = DIA_Addon_Greg_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_ImNew(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 1;
	condition = DIA_Addon_Greg_ImNew_Condition;
	information = DIA_Addon_Greg_ImNew_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(���������) ��, ��! ��� �� ������� � ���� ������?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//�...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(� ������) ����� ������ �� ��������� ����, � ��� ��� ������ ���������� ������� ������������� � ���� ������!
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//������ �����, ��� ����� ����������?!
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//�������� ��� �� ��������! ������ ������ ����� �������, � ��� ������ � ������, ��� ��������� ������!
	if(!Npc_IsDead(Francis))
	{
		if(Npc_GetDistToWP(Francis,"ADW_PIRATECAMP_HUT4_01") <= 1000)
		{
			AI_TurnToNPC(self,Francis);
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(������) � ��� ���, ��� �� ������, �������?
			if(C_BodyStateContains(Francis,BS_SIT))
			{
				AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(������) ���������� ����� � ���� ��������!
			};
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//� ��? ��� �� ������?
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew,"���� �� ��� �����.",DIA_Addon_Greg_ImNew_nich);
	if((C_NorthBeachMonstersDead() && (MIS_Addon_MorganLurker != FALSE)) || C_TowerBanditsDead())
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew,"� �������.",DIA_Addon_Greg_ImNew_turm);
	};
};

func void B_UseRakeBilanz()
{
	if(Greg_NoHelpInNW >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00_add");	//� �� �����, ��� � �����!
	}
	else if((MIS_Addon_Greg_RakeCave == LOG_Running) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//� �� �����, ��� � �����, ��� �� ��� �������.
		if(Greg_SuchWeiter == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//� ��������� ������ �������� � ����� ��������� ����� ������� �����.
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//�� �� �����������, �� ��� ��?
			AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//� �������� ���� ���������� ��� �� ���������� ������.
		};
		Greg_NoHelpInNW += 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//� ������ ����, ��� ������ ��������� ��-�������.
	};
	if(!Npc_IsDead(Francis))
	{
		if(Npc_HasItems(Francis,ItKe_Greg_Addon_MIS))
		{
			Npc_RemoveInvItem(Francis,ItKe_Greg_Addon_MIS);
			CreateInvItem(self,ItKe_Greg_Addon_MIS);
		};
		Npc_ExchangeRoutine(Francis,"GREGISBACK");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis_ausgeschissen = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//���� �� ��� �����.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//�������. � ���-������ ������� ����, �������.
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//� �������.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//������? � ���?
	if(C_TowerBanditsDead())
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//� ���������� � ��������� �� �����.
	};
	if(C_NorthBeachMonstersDead() && (MIS_Addon_MorganLurker != FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//�� ��������� � ������ ������ ��� ����� ������.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//�� ��� �. �������, ������� ������.
	B_UseRakeBilanz();
};


func int C_PiratesAvailableToFollow()
{
	if(!Npc_IsDead(Brandon))
	{
		return TRUE;
	};
	if(!Npc_IsDead(Matt))
	{
		return TRUE;
	};
	if(!Npc_IsDead(AlligatorJack))
	{
		return TRUE;
	};
	if(!Npc_IsDead(Skip))
	{
		return TRUE;
	};
	if(!Npc_IsDead(RoastPirate))
	{
		return TRUE;
	};
	if(!Npc_IsDead(BenchPirate))
	{
		return TRUE;
	};
	return FALSE;
};

var int GregHints_Followers;
var int GregHints_Razors;

func void B_GregHints_Followers()
{
	if(GregHints_Followers == FALSE)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"���� ������, ��� � ���� ����� � ����� ���������� �����.");
		GregHints_Followers = TRUE;
	};
};

func void B_GregHints_Razors()
{
	if(GregHints_Razors == FALSE)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"��������� � ������ �� �����������.");
		GregHints_Razors = TRUE;
	};
};

instance DIA_Addon_Greg_JoinPirates(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_JoinPirates_Condition;
	information = DIA_Addon_Greg_JoinPirates_Info;
	permanent = FALSE;
	description = "��� ����� �������?";
};


func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_ImNew))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//������ ����� ���������� ����������� � ������ �����.
	if(!Npc_IsDead(Morgan))
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//��� ������� ������ ������ ����� ������ ���������.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//� �� ��������� ������� ������� � �������� ������ �� ���� ��������� ������.
	MIS_Addon_Greg_ClearCanyon = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon,LOG_Running);
	if(Greg_NoHelpInNW < 2)
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"���� �����, ����� � ���� �� ���� ������ ������� � ������� ������ �� ������.");
	}
	else
	{
		B_LogEntry(TOPIC_Addon_ClearCanyon,"���� �����, ����� � ���� �� ���� ������ ������� � ������� ������ �� ������. ������, �� ��� ��� ������ �� ���� �� ��, ��� � �� ����� ��� � ��������.");
	};
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"� ����� ������ ��� ����.",DIA_Addon_Greg_JoinPirates_Leave);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"� ���, ������ ������ ��� � ��������?",DIA_Addon_Greg_JoinPirates_Compadres);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates,"��� ��� �� �����?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//� ����� ������ ��� ����.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//� ��� ���-���. ������ �� ���� �� ���.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//������� ������� ����� ���� ���������� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//���, ������ ���. �������, ���� ��� ���������� �������� �����.
	if(Greg_NoHelpInNW < 2)
	{
		B_GiveArmor(ITAR_PIR_M_Addon);
	}
	else
	{
		B_GiveArmor(ITAR_PIR_L_Addon);
		Greg_LightArmorGiven = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//� �� ������, ������ ���������� �� ����!
	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//� ���, ������ ������ ��� � ��������?
	if(C_PiratesAvailableToFollow())
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//������ ��������� � ����� ������.
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//����� ������������ ���� ��������.
		B_GregHints_Followers();
	}
	else
	{
		DIA_Common_01_AreYouTryingToPissMeOff();
	};
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//��� ��� �� �����?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//���������� � ������� ��� ����� ����������� � ������ ������.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//� �� ��������� �����, ���� ��� ������ ����-������ �� ���� �����.
	B_GregHints_Razors();
};


instance DIA_Addon_Greg_AboutCanyon(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_AboutCanyon_Condition;
	information = DIA_Addon_Greg_AboutCanyon_Info;
	permanent = TRUE;
	description = "������ �������...";
};


func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//������ �������...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//��, ��� ���?
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if(CanyonRazorBodyCount < 10)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"���� ������ �������.",DIA_Addon_Greg_AboutCanyon_Back);
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"��� ���-������ ����� ������?",DIA_Addon_Greg_AboutCanyon_Compadres);
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"� ��� ��� �� �����, ������� � ������ �����?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon,"� ��������� ���� �����������.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	DIA_Common_NothingImportantYet();
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//��� ���-������ ����� ������?
	if(C_PiratesAvailableToFollow())
	{
		AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//������� � ����� ���� �����.
		AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//��� ��� ����� ��������� ��� ����.
		B_GregHints_Followers();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07_add");	//�� ��� �� ��� � ������!
	};
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//� ��� ��� �� �����, ������� � ������ �����?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//�������� �� �����������! ������ �������� �� ������.
	B_GregHints_Razors();
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//� ��������� ���� �����������.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//������. ������, �� ���� ���� ������.
	B_LogEntry(TOPIC_Addon_ClearCanyon,"���� ��� ���������, ����� � ������� ���, ��� ���� ���� ����������� � �������.");
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_Addon_ClearCanyon);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};


instance DIA_Addon_Greg_BanditArmor(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditArmor_Condition;
	information = DIA_Addon_Greg_BanditArmor_Info;
	permanent = TRUE;
	description = "��� ����� ���������� �������.";
};


func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if((MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

var int Greg_BanditArmor_Once;

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//��� ����� ���������� �������.
	if(MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//������� ������, �� ��� �� ��������. ����� ����� ���������.
		if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//������� �� ������ ����� ���� �����������!
		};
		if(Greg_BanditArmor_Once == FALSE)
		{
			B_LogEntry(TOPIC_Addon_BDTRuestung,"���� �����, ����� � ����� ��� ������� ������� � ������. ����� ����� � ����� ���������� � ��� � ��������.");
			Greg_BanditArmor_Once = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//� �� �������!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//������� �� ��������� ������ ��� �����. ��� ���� � ��������������� ��� �������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//��, ���� �����, ��� ���� ������ ������ �������� ���� �����������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//��������, � ���� ���� ��������� ��������� ������ �����.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//�������� � �������, ����� �� ��� ���� �����. ����� ������� �� � ����������� � ������ ��������.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//� ���� ������, ������ ��� ������� ���������� � ���� ������.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//����� �������, �������!
		B_LogEntries(TOPIC_Addon_BDTRuestung,"� ���������� � ������������ ��� ����� � ������ ���� ������� ������� � ������.");
		Log_CreateTopic(TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits,LOG_Running);
		B_LogNextEntry(TOPIC_Addon_ScoutBandits,"� ������ ������, ��� ���� ������� ������ � ������, � �������� �����.");
		MIS_Greg_ScoutBandits = LOG_Running;
	};
};


instance DIA_Addon_Greg_Auftraege2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Auftraege2_Condition;
	information = DIA_Addon_Greg_Auftraege2_Info;
	description = "���� ��� ���� ��� ������?";
};


func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if(MIS_Greg_ScoutBandits != FALSE)
	{
		if(!C_TowerBanditsDead())
		{
			return TRUE;
		};
		if(!C_NorthBeachMonstersDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//���� ��� ���� ��� ������?
	if(!C_NorthBeachMonstersDead())
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//�������� ��������� ��� ��� �������� �����.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//������, ������ ������ �� ������.
		Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
		B_LogEntry(TOPIC_Addon_MorganBeach,"���� �����, ����� � ������� ������� ��������� ����.");
		MIS_Addon_MorganLurker = LOG_Running;
	};
	if(!C_TowerBanditsDead())
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//� ����� ����� ��� ��� ���� �������.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//������� ������ ��� ��� ����� � ���� �����������, �� ������ �� ������.
		Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
		B_LogEntry(TOPIC_Addon_BanditsTower,"���� �������� ���� ����������� � ���������, ��������� ����� � ��� �� ������.");
		MIS_Henry_FreeBDTTower = LOG_Running;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//�����, �� ������ ���� ��������.
};


instance DIA_Addon_Greg_Sauber2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_Sauber2_Condition;
	information = DIA_Addon_Greg_Sauber2_Info;
	description = "�� �������� ��������� ������ ���������.";
};


func int DIA_Addon_Greg_Sauber2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2))
	{
		if(C_NorthBeachMonstersDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//�� �������� ��������� ������ ���������.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//�������. ����� ���� �������.
	if(Greg_NoHelpInNW < 2)
	{
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	if(MIS_Addon_MorganLurker != LOG_SUCCESS)
	{
		B_LogEntry(TOPIC_Addon_MorganBeach,"� ������� �����, ��� ���� �� ������ ������ �� ��������.");
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	};
};


instance DIA_Addon_Greg_BanditPlatt2(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditPlatt2_Condition;
	information = DIA_Addon_Greg_BanditPlatt2_Info;
	description = "������� � ����� ����������.";
};


func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Greg_Auftraege2))
	{
		if(C_TowerBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//������� � ����� ����������.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//���������. ������� ������. ��� ���� �������.
	if(Greg_NoHelpInNW < 2)
	{
		CreateInvItems(self,ItMi_Gold,200);
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else
	{
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
	};
	B_ResetHenryPirates();
	if(MIS_Henry_FreeBDTTower != LOG_SUCCESS)
	{
		B_LogEntry(TOPIC_Addon_BanditsTower,"������� �� ����� ������. ���� ����� �������.");
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	};
};


instance DIA_Addon_Greg_BanditGoldmine(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_BanditGoldmine_Condition;
	information = DIA_Addon_Greg_BanditGoldmine_Info;
	permanent = TRUE;
	description = "������� ����� ����� � �������.";
};


func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if((SC_KnowsRavensGoldmine == TRUE) && (MIS_Greg_ScoutBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//������� ����� ����� � �������.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//� ��� � ����! ��� ������ ��� ���������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//����� �� ������� ���� � ���� ����.
	if(Greg_NoHelpInNW < 2)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//������� ������. ���, �����, � ���� ��� ���� �������.
		B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	}
	else
	{
		CreateInvItem(self,ItRi_Addon_STR_01);
	};
	B_LogEntry(TOPIC_Addon_ScoutBandits,"� ��������� ����� � ������� �����.");
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};


instance DIA_Addon_Greg_WhoAreYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_WhoAreYou_Condition;
	information = DIA_Addon_Greg_WhoAreYou_Info;
	permanent = FALSE;
	description = "��� ��?";
};


func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if(PlayerTalkedToGregNW == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//� ����, ������������ ���� ������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//���� ���������� ����� �����?
};


instance DIA_Addon_Greg_NiceToSeeYou(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 5;
	condition = DIA_Addon_Greg_NiceToSeeYou_Condition;
	information = DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent = FALSE;
	description = "� ��� �� ���� �����?";
};


func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if(PlayerTalkedToGregNW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//� ��� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//�� ������ ������� ���� �����, ��?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//����� ����� ��������� ����� ��� 'i'. � ����, � ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//���� ���������� ����� �����?
};


instance DIA_Addon_Greg_Story(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 99;
	condition = DIA_Addon_Greg_Story_Condition;
	information = DIA_Addon_Greg_Story_Info;
	permanent = TRUE;
	description = "� ����� �� ����� ��� ���-���.";
};


func int DIA_Addon_Greg_Story_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou) || Npc_KnowsInfo(other,DIA_Addon_Greg_NiceToSeeYou)) && (MIS_Greg_ScoutBandits != FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//� ����� �� ����� ��� ���-���.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//��� ������?
	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story,Dialog_Back,DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story,"��� �� ���� �����?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story,"� ��� ���� �������?",DIA_Addon_Greg_Story_Ship);
	if(RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story,"��� �� ������ � ������?",DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//��� �� ���� �����?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//� ��������� ���� � ������� ����� ������� ��������, ������� �������� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//��� ������� ��������� ������������� ���� ���� �������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//������� � ������ ��� ����� �� ������� ����� � ����� ���������, ��� ��� ����� ����������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//��������� ��� ���������, ����� � �������� � ���� �������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//� ��� ��������� ��� ��� � ��� ������, ����� � ��� �����, ��� ���� ������� ����� ��� �������� ���������� �� ���������.
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//� ��� ���� �������?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//(� ���������) � ��������� ��������� �������. ��� ��������� ������� ���� �� ���������� �������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//��������� �������! � ������ �������, ������� ��� ����� ����� �����������, ����������� ������ ��������, ������������� ������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//�� ��� ������ ����� ����������.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//�� ��, �� ������� ����.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//��� ������. ��� ��� �� �������� ���. � ������������, ��� �������� �� ������.
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//��� �� ������ � ������?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//�� �������� �����. �������� ������� ����� � �������.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//� �� ���� �� ��������� �������������, ��� �� ����� ���� ������ � ������ ���� ��� ��� ������� �� ���.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//�� �� ���� ���-�� ���������. ��-�� �� ����� �� ����� ������������ � �������� �����.
};


instance DIA_Addon_Greg_RavenDead(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 2;
	condition = DIA_Addon_Greg_RavenDead_Condition;
	information = DIA_Addon_Greg_RavenDead_Info;
	description = "� ������� ���������...";
};


func int DIA_Addon_Greg_RavenDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//� ������� ���������...
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//���� ����... �� ������ � �����... ������ ��� ��������, ��?
	if(Greg_NoHelpInNW < 2)
	{
		AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//��, �� ��� ������, ��� ����� ������� ������� �����.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//� �� ������. ��������� � ��� �� ����.
	B_GivePlayerXP(XP_Addon_GregRavenLohn);
	if(MIS_Henry_HolOwen == LOG_SUCCESS)
	{
		B_StartOtherRoutine(Owen,"POSTSTART");
	};
};


instance DIA_Addon_Greg_ItemsInADW(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 800;
	condition = DIA_Addon_Greg_ItemsInADW_Condition;
	information = DIA_Addon_Greg_ItemsInADW_Info;
	description = "��� ���� ����.";
};


func int DIA_Addon_Greg_ItemsInADW_Condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_Addon_Greg_RakeCave == LOG_Running) && (Greg_SuchWeiter == TRUE) && C_SCHasGregsItems())
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_ItemsInADW_Info()
{
	B_GiveGregsItems();
	B_GivePlayerXP(XP_Addon_Greg_RakeCave / 3);
};


instance DIA_Addon_Greg_BeMyCap(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 850;
	condition = DIA_Addon_Greg_BeMyCap_Condition;
	information = DIA_Addon_Greg_BeMyCap_Info;
	description = "����� ����, � ����� ���������� ���� ������ ��������.";
};


func int DIA_Addon_Greg_BeMyCap_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (SCGotCaptain == FALSE))
	{
		if((PlayerTalkedToGregNW == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Greg_WhoAreYou))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Greg_BeMyCap_Info()
{
	DIA_Common_MaybeICanOfferYouCaptainJob();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//��� ��� �� ����?
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//� ����, ��� ����� ������ ������� ��������.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//�-�, ���� ���� �� ����� �������� ���� �������.
	DIA_Common_SoWhatYouSay();
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//������� ��� ���������� �����.
	B_LogEntry(TOPIC_Captain,"����� �� �������������� ��� �����������.");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Greg_GiveFrancisBook(C_Info)
{
	npc = PIR_1320_Addon_Greg;
	nr = 700;
	condition = DIA_Addon_Greg_GiveFrancisBook_Condition;
	information = DIA_Addon_Greg_GiveFrancisBook_Info;
	permanent = FALSE;
	description = "������, ���� ������ ����������� ����� ������...";
};


func int DIA_Addon_Greg_GiveFrancisBook_Condition()
{
	if(Npc_HasItems(other,ItWr_Addon_FrancisAbrechnung_MIS) && (Francis_HasProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_GiveFrancisBook_Info()
{
	AI_Output(other,self,"DIA_Addon_Greg_GiveFrancisBook_15_00_add");	//������, ���� ������ ����������� ����� ������...
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItWr_Addon_FrancisAbrechnung_MIS,1);
	Npc_RemoveInvItem(self,ItWr_Addon_FrancisAbrechnung_MIS);
	B_ReadFakeItem(self,other,Openbook2,2);
	AI_Output(self,other,"DIA_Addon_Greg_GiveFrancisBook_01_01_add");	//�� ������ � �����...
	B_GivePlayerXP(200);
	Greg_NoHelpInNW = 0;
	if(!Npc_IsDead(Francis))
	{
		if(Npc_GetDistToNpc(self,Francis) > FIGHT_DIST_CANCEL)
		{
			self.aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL * 2;
		};
		AI_StopProcessInfos(self);
		other.aivar[AIV_INVINCIBLE] = FALSE;
		Npc_ExchangeRoutine(Francis,"EXILE");
		AI_StartState(Francis,ZS_Saw,1,"ADW_PIRATECAMP_BEACH_19");
		Francis.aivar[AIV_DropDeadAndKill] = TRUE;
		Francis.guild = GIL_NONE;
		B_Attack(self,Francis,AR_NONE,0);
	}
	else
	{
		DIA_Common_HeIsDead();
		B_Say(self,other,"$ABS_GOOD");
	};
};

