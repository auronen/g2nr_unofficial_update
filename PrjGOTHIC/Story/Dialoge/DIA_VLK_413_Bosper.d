
instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Bosper_HALLO(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HALLO_Condition;
	information = DIA_Bosper_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bosper_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//����� ���������� � ��� �����, ���������!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//� ������. � ����� ���� � ������ �������.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//��� ������� ���� � �������?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"������ ������ ���� � ������� �������. ��� ����� ��������� � ����� �����, � ������ ����� ������.");
};


instance DIA_Bosper_IntoOV(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = "��� ����� ������� � ������� �������...";
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//��� ����� ������� � ������� �������...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//��� ����� ��������? ������ �� ����.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//���� ����� ���� ��������� ����������� ���, ���� ��, ����� ��������� ������.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//� ������ ����� ���� �� �� ��� ���� �� �������.
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//� ��� �������...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"����� ������� � ������� �������, � ���� ������ ����� ��������� �����������, ���� �������� ������.");
};


instance DIA_Bosper_SeekWork(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = "� ��� ������!";
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//� ��� ������!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//���... ��� �� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//���������, ��� � ���� ���, ������ ���� ������ ���� ���� �����.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//�� ���-������ ������ �� �����, �?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//�����...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//� ��� �� ������� ���� ������� ����� � ��������.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//� ���� ������ ������� ���� �� ������ �����, ��� �� ��������� ���.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//� ���� ���� ���� ��������� ����, ���� �� ��� ���� � ����.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//�����������! ������� ��� ��� �����, ��� ���� ������� ������ - � ����� �� � ���� �� ����� ������� ����.
	};
	if(Player_IsApprentice == APP_NONE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"������ ���� ������ �������. � ���� ������ �������� � ����.");
	};
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = "� ���� ����� ����� ��������!";
};


func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//� ���� ����� ����� ��������!
	if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(����������) �������! ������, �� ��� ������ ������.
		stimmen += 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//����� �������, ��� �� ������� �������.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//�� ����� ���� �� ������ � ����� ������������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//�� ����� �������, ��� ������� �� ����� ����.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//������ ���� ���� ���� �������������. � �� ��� �������, ��� ��, �� ��� �� ��� ������.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//������ ���� ���� ���� ��������� ������ � ������������� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//������ ������� �� �����, ��� �� �����.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//����������� �������, ��� �� ������ ����� �������� ���� ��������.
				stimmen += 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//����������� �������, ��� �� ����������� � ������������ � ������ - �������, ��� �����-������ ������?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//����������, ����� ���� ������ ��� ������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//����������� ������� ���� �� ������ � ����.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//������ �������, ��� �� ������ ������� ��, ������� ������ ������ ������ ����.
				stimmen += 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//������ �������� � �����-�� ������ - � �� ����, ��� �� ����� � ����, �� ���� ����� ���������� � ���.
			}
			else if(MIS_Matteo_Gold == LOG_FAILED)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//������ �������, ��� ������� �� ����� ����.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//������ �������, ��� ��� �� ������� � ����� �� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//������ �������, ��� ������� �� ����� ����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//�� ������� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//�� ������ ������ �������� �� ����, ����� ������ ��������.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING,"������ - � ������� ��� ����.",DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING,"� ����� ����� ����� ��������!",DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//���� ����� �������� ��������� ���� �� ������� ��������. ��� ����� �� �� ������� ����� �������� � ������ ����� ������.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//��� ��������, ��� �� ������ ���������� �� �����, ��� ��� ����������� � ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//������ ��� ����� ���� � ����, � ������ ������� ������, ����� �� �� ������ ���� �� ���-��.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//�� ������ ����� ��� ���, �� ��� ������ �� ������� � ����� ������� ��������.
		};
		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//� ����� ����� ����� ��������!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//�� �� ��������� �� ����! �����, �� �����������.
	Player_IsApprentice = APP_Bosper;
	B_StartOtherRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		B_LogEntry(Topic_Bonus,"������ ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	}
	else
	{
		B_LogEntry(Topic_Bonus,"������ ������ ���� � �������.");
	};
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//������ - � ������� ��� ����.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//������, �� ����� ���������� �������! �� ����� ����� ��������� ������ ��� ���� ������.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};


instance DIA_Bosper_OtherMasters(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = "� ���, ���� � ������ ��������� � ������� � ������� �������?";
};


func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//� ���, ���� � ������ ��������� � ������� � ������� �������?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(�����������) ����!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//����� � ������ ��� ����� ��������.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//������� ����������� - �������� ����. � ���� �� ���� ������� ��� ������ ����.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//� ��� �������� ������� - ��� �����, ��� �� ������������. ��, ��������, ���� �� ������ ������� ����.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//� ��� ���, ��������, ����� ����� ������. � ����� � ������.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//�� �� �����, ���� �������� �� ������ ����� - ���� ����������� ��������� ���� �������� �� ������ ����� ������...
};


instance DIA_Bosper_Bartok(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = "� ������ ���� ������ ������ ������?";
};


func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//� ������ ���� ������ ������ ������?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//��� �� ������, ��������� ����� ��������� ����� ������� ������.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//���� ���� ��� ������������� ���������, �� ������ �������� ��� �� ���� ���.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//��� ����� ������. ��, ��������, ��������� ���-�� � ������� ��������.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//������ ����� ��������� ������ � ������� � ��������� ����� ����� ���.
};


instance DIA_Bosper_ZUSTIMMUNG(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "� ������ ���� ��������� �� ������ � ������ ��������?";
};


func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};


var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//� ������ ���� ��������� �� ������ � ������ ��������?
	if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(�������������) � ��������, ��� �� �������� ����.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//�� ���� �� ����� ���...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//��� ��������, ��� �� ������������ �� ����?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//���� ����� ������ �� �������� �� ����� ��������� - �� ��.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//�� ���� ��� �� ������ ����� ��� ���.
		};
		if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//�� �� ���� �� ��������� ����� ������� �������!
		};
		if(Bosper_Zustimmung_Once == FALSE)
		{
			B_LogEntry(TOPIC_Lehrling,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(��������) ������! �� �������� ��� ��������� - �� ��� ����� �������.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//��������� �� ����, ���� �� �������.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//����� �������, �� ������� ������, �������� ���� ��� ������� ��� ���.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//� ��� ����� - ����� ��� ���� ��� ����������, ��� �� ���������� �� ����.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//���� �� ���������� �����, ����� ����� ���� ��������, �� �� ����� ��������� � ������ ��������.
		Bosper_HintToJob = TRUE;
	};
};


instance DIA_Bosper_Job(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = "��� �� ������, ����� � ������ ��� ����?";
};


func int DIA_Bosper_Job_Condition()
{
	if(Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//��� �� ������, ����� � ������ ��� ����?
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//� ����� ���� ������� ����� � ��������, � �� ��������� ��� - ������, ��������� ������� ����.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntries(TOPIC_CityTeacher,"������ ����� ������� ���� ������� ����� � ��������.");
		B_LogNextEntry(TOPIC_BosperWolf,"� ������ �������� ������� ����� ������� ����. ����� � ����� ���� �������� �� ����, ���� ������ ��� ��������� �� ������ � ������� ���������. �� ������� � ������ ��������� ��� ������� ���� ������� ����� � ��������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//������� ��� ��������� ������� ����.
		B_LogEntry(TOPIC_BosperWolf,"� ������ �������� ������� ����� ������� ����. ����� � ����� ���� �������� �� ����, ���� ������ ��� ��������� �� ������ � ������� ���������.");
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//����� � �����, ��� �� ������ ��� �������.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//���� ������ � ���� �� ����� �� ��� ����� ��������, � ���� ����� ����� � ���������� ���������. � ����� � ������ ���� � ����, ���� �� ��������.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//��� (��������) �� ������� ����� �������� ������� ������� - ���� �� ����� ������������� ������.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
};


instance DIA_Bosper_BringFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = "������ ������� ����...";
};


func int DIA_Bosper_BringFur_Condition()
{
	if(MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//������ ������� ����...
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//�� ��� ���� �������� ������� �������. � ���� �������� � ���� ����� �� ������� ����.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		//return;
	}
	else if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//� ������ �� - ���.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//�������! � ����, ��� �� ��������� ��� ���� ������.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//��� ������, ��� � � ������ ����.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 6);
		BosperFurCounter += 6;
		ApprenticeGoldCounter += Value_WolfFur * 6;
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//�? ��� �������? ����� ��� �� �����, ��� ������� ��� ������ ���� �������� ��� ��������� ��������� � ������� �������?
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(TOPIC_Lehrling,"������ ������ ���� � �������, ���� ������ ������� �� ����� ������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//�� ������������ �� ��������� - �� � ���� ��� ���� �����. ��� � ������ ��� �����.
	};
};


instance DIA_Bosper_TeachFUR(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ������� ����� � ��������!",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur));
	description = B_BuildLearnString(NAME_TROPHY_Fur,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur));
};


func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//����� ���� ������� ����� � ��������!
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//������. ������. ��� �������� ������.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//������ ������ ��� � ���������� ����� ���������. ����� ������� ��������� ��������� �������� �� ���������� ������� ���, � �������� �����.
		if(MIS_Bosper_WolfFurs == LOG_Running)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//������� ��� ������ �����, � ��� ���������...
			Log_AddEntry(TOPIC_BosperWolf,"������ ������ ���� ������� ����� � ��������.");
		};
	};
};


instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
};


func int DIA_Bosper_Trade_Condition()
{
	if(MIS_Bosper_WolfFurs != LOG_Running)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//������ ��� ���� ������.
	if(DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv(self);
		Trade_IsActive = TRUE;
		B_RefreshTraderAmmo(self,50);
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			BosperMinenAnteil = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//�� ����� �� ��� ����, ����� ������������ ��� ������, �� ������ �������� ��� �����!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//��� ��� ������ �� ����!
	};
};


instance DIA_Bosper_BogenRunning(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = "� ������, ��� � ���� ���-�� ������.";
};


func int DIA_Bosper_BogenRunning_Condition()
{
	if(MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//� ������, ��� � ���� ���-�� ������.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//��� ������ ���� ���? �������� ������, ��? ��� ���, ������ ������ ���� ������� ����? ��, �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//�� ���� � �������� �� ����� �������, ������� ������� ��� �� �������!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//� ��������� �� ����� ����� ����� �� ������. � ����� ��������, � ������ ������, ��� �� ������� - � ���� ����� �� �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//� ��� �� ������ ������, �� ���� ������� ������� � ������. � ��� �������� ��� ���!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//� ������� �� ��� ���� ����� �� ���, � ��������� �������� ���� �������� �������. �� ������ �� �����.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//���������!
	};
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//����� ����������, ��� ��� ��� ��� ��� ��������� ���-�� � ������. � ��������� �� ������� � ����� ��������� �����, �� ��� �� ������, ����� ���-������ ������� �� ������ � �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//����� � �������� �� ����� �������...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen,"� ������� ��� ������� ���. ��� ������� � ������, � ������� ���. ��������� �������� �������� �������, �� ��� ������ �� �����, ���� ��� ��� ��� ������ ���� � ������.");
};


instance DIA_Bosper_BogenSuccess(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = "� �����, ��� ���� ���...";
};


func int DIA_Bosper_BogenSuccess_Condition()
{
	if(Npc_HasItems(other,ItRw_Bow_L_03_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//� �����, ��� ���� ���...
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//��� ���! ��� �� ����� ���?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//� ������ ����, ������ ����.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//�������, � ���� �� �������� ������� ��-�� �����...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//��� - ��� ����������� ������ ����� � ������.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//��, �� ��� �� �������. � ���� �������!
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
};


var int Bosper_Island;

instance DIA_Bosper_PERM(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int DIA_Bosper_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//��� ���������� � ������?
	if(Bosper_Island == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//���� ���� ������������� ������� ������� �� ���, ����� ������ ������ �������.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//� ������ ����� ������ ���� ������� - � ��� �������� ��������. � �� �����, ��� ��� ���������� ��� ��� �������� �������.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//� ��� ������� ������� ��������� ������?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//���, ������ �� ��� �� �������� ���� ������ ��� �������.
		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//���� ��� ������� ��������. ���� ������, ����� �����.
	};
};


var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;

instance DIA_Bosper_AlsLehrling(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk) && (Bosper_Lehrling_Day != Wld_GetDay()))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Bosper_StartGuild != GIL_MIL) && (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//�� ���, ������� � ���������, ��?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//���, � �����-��, ��� �����. ���� �� ��, ������ ����� � ��������, �������� ����� � �� ������. (����������)
		Bosper_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Bosper_StartGuild != GIL_PAL) && (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//������, ���� ������� ���������� ������������� �����. ������� ������!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//�� ���� �� �� ������� ����, �����, �� ������� ������ ������� �������...
		Bosper_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Bosper_StartGuild != GIL_NOV) && (Bosper_StartGuild != GIL_KDF) && (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//�� ��������� � ���������, ��? �������, ��� ����� ��������� ���� ���� ������, � �� ������� ��������� ��� �����...
		Bosper_INNOSKommentar = TRUE;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//��� �� ���������� ��� �����?
		if(Npc_KnowsInfo(other,DIA_Bosper_Aufgaben))
		{
			AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//��� ����� ��� �����. �� ������ ��?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//������, �������...
	};
	Bosper_Lehrling_Day = Wld_GetDay();
};


instance DIA_Bosper_Aufgaben(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Aufgaben_Condition;
	information = DIA_Bosper_Aufgaben_Info;
	permanent = FALSE;
	description = "��� ������ ������ ������?";
};


func int DIA_Bosper_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//��� ������ ������ ������?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//��� ������. ������� ��� ��� �����, ��� ������� ������.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//� ��� ���� �� ��� ����� ������� ����, ��� ����� ������ �� ������� ���������.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//��, � � ��������� �����, ���� �� ����������� ���������� � ���� �����. � � ���� ��� ������� ����������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//� ��� � ���� �����?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//� ���� ����� ��� ����� ��� ����. �� �� ������ ������� ��������� ����� � ����� �� �������� �������.
	};
	B_LogEntry(Topic_Bonus,"������ ����� ������� ����� ������� ���� �� ����� ��������.");
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = "� ������ ��������� ���� ��� ����...";
};


func int DIA_Bosper_SellFur_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_KnowsInfo(other,DIA_Bosper_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	var int furs;
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//� ������ ��������� ���� ��� ����...
	furs = Npc_HasItems(other,ItAt_Addon_KeilerFur) + Npc_HasItems(other,ItAt_SheepFur) + Npc_HasItems(other,ItAt_WolfFur) + Npc_HasItems(other,ItAt_IceWolfFur) + Npc_HasItems(other,ItAt_WargFur) + Npc_HasItems(other,ItAt_ShadowFur) + Npc_HasItems(other,ItAt_TrollFur) + Npc_HasItems(other,ItAt_TrollBlackFur);
	if(furs > 0)
	{
		BosperFurCounter += furs;
		ApprenticeGoldCounter += (Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur) + (Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur) + (Npc_HasItems(other,ItAt_WolfFur) * Value_WolfFur) + (Npc_HasItems(other,ItAt_IceWolfFur) * Value_IceWolfFur) + (Npc_HasItems(other,ItAt_WargFur) * Value_WargFur) + (Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur) + (Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur) + (Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur))
		{
			B_Say(self,other,"$ABS_GOOD");
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			B_GiveInvItems(other,self,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur))
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//������ �����? �� ���� �� ������ ���� �������� �� ���������, ���?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//� ���� � �� ����� ���������� ����...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			B_GiveInvItems(other,self,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if(Npc_HasItems(other,ItAt_WolfFur))
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//������ ����� - ��� ������...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WolfFur) * Value_WolfFur);
			B_GiveInvItems(other,self,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
		};
		if(Npc_HasItems(other,ItAt_IceWolfFur))
		{
			B_Say(self,other,"$NOTBAD");
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_IceWolfFur) * Value_IceWolfFur);
			B_GiveInvItems(other,self,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		};
		if(Npc_HasItems(other,ItAt_WargFur))
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//����� �����? ��� ������� �����...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_WargFur) * Value_WargFur);
			B_GiveInvItems(other,self,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur))
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//��, � ���� ����� ��������� - ��� �������� �����.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			B_GiveInvItems(other,self,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if(Npc_HasItems(other,ItAt_TrollFur) || Npc_HasItems(other,ItAt_TrollBlackFur))
		{
			if(Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//� ��� ��� �� �����, ���� ������?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//� ���� �� � ������.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//���... ��� ����� ����� ���������.
				Bosper_TrollFurSold = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//��� ���� ����� ��������� ������... �� ���, ��������� �� ���?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//����� � ��������� �� ������ �� ���, � �� ������� ����� �����������...
			};
			if(Npc_HasItems(other,ItAt_TrollFur))
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				B_GiveInvItems(other,self,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur))
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//� ����� ������� ������, ���� ��!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				B_GiveInvItems(other,self,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//�������� ������. ������ �� ��� ���, ����� � ���� ����� �����...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//��, ������ - ���� ���������� ������ ����� ������, ���������� � �� ��������...
	};
};


instance DIA_Bosper_Minenanteil(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_Minenanteil_Info;
	description = "� ����, �� �������� ����� ����.";
};


func int DIA_Bosper_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (BosperMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//� ����, �� �������� ����� ����.
	if(Npc_HasItems(self,ItWr_MinenAnteil_MIS) && (Player_IsApprentice == APP_Bosper))
	{
		AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//��-�, � ������ �� ���� �� ����. �� ������ ������� ��, ���� ������.
		B_GiveInvItems(self,other,ItWr_MinenAnteil_MIS,Npc_HasItems(self,ItWr_MinenAnteil_MIS));
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01_add");	//��-�, � ������ �� ���� �� ����.
	};
	B_GivePlayerXP(XP_Ambient);
};

