
instance DIA_Raoul_EXIT(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 999;
	condition = DIA_Raoul_EXIT_Condition;
	information = DIA_Raoul_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Raoul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Raoul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_NoSentenza(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_NoSentenza_Condition;
	information = DIA_Raoul_NoSentenza_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Raoul_NoSentenza_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Sentenza_Hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_NoSentenza_Info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//�������, ��������!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//� �� �����, ����� �������� ��������� ����.
	if(Hlp_IsValidNpc(Sentenza) && !C_NpcIsDown(Sentenza))
	{
		AI_TurnToNPC(self,Sentenza);
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//��������! ��� ����!
		AI_TurnToNPC(self,other);
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(�������� �������) ������� ����������, ������ �� ��������!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//� ����� ���� ���� ���������� �������!
		B_Attack(Sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//��� �� ��? �, �����, �������, ���� �������...
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Raoul_Hello(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_Hello_Condition;
	information = DIA_Raoul_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Raoul_Hello_Condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Hello_Info()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(��������) ���� ���� �����?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(�����������) ��� ���� ����� �� ���� ���?
	};
	if(Npc_KnowsInfo(other,DIA_Sentenza_Hello))
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


var int Raoul_gesagt;

instance DIA_Raoul_PERMNone(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 1;
	condition = DIA_Raoul_PERMNone_Condition;
	information = DIA_Raoul_PERMNone_Info;
	permanent = TRUE;
	description = "� ���� ����������� �� ���� �����!";
};


func int DIA_Raoul_PERMNone_Condition()
{
	if(other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERMNone_Info()
{
	AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//� ���� ����������� �� ���� �����!
	if((Raoul_gesagt == FALSE) && (MIS_ReadyforChapter4 == FALSE))
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//�� ������ � ������ �����. ��� �������. �� ������ �� � ����� ������ ������������ ����.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//���� �� ������ �������, �� ����������� �� ���� �����, �� ����� ������ ��������� �� ��� ���� �����.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//�����!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Raoul_WannaJoin(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_WannaJoin_Condition;
	information = DIA_Raoul_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ��!";
};


func int DIA_Raoul_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//� ���� �������������� � ��!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//���� �� ����� ���������� � ��� �� ����, ��� ����� ����� ����� �����������!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//��� �� ������ ���� �������?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//�� �����, ����� �� ������ ����� � ���� �������. ������ ���������� �������� ������� �������� - � ��� ���.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//������� ������ �������, ��� ��������� - ��� ������ �������, �, ���� ������, �� ����.
};


instance DIA_Raoul_AboutSylvio(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_AboutSylvio_Condition;
	information = DIA_Raoul_AboutSylvio_Info;
	permanent = FALSE;
	description = "��� ����� �������?";
};


func int DIA_Raoul_AboutSylvio_Condition()
{
	if((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Raoul_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//��� ����� �������?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//��� ��������� ������������, ���� ���� ��������� ��� ������. ���� �� ����������� ������� ���, ����� �� �������� ���� �������������� � ����� �����, ������ �� ����!
		if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//���� �� ������ ����, �� �� ��������� ���� ��� ����, ����� ����� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01_add");	//��� ��������� ������������, ���� ���� ��������� ��� ������.
	};
};


func void B_Raoul_GetLost()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//�� ����������!
	AI_StopProcessInfos(self);
};

var int Raoul_Voted;

instance DIA_Raoul_Stimme(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Stimme_Condition;
	information = DIA_Raoul_Stimme_Info;
	permanent = TRUE;
	description = "� �� ����� ����� ���������. �� �� ����������?";
};


func int DIA_Raoul_Stimme_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Raoul_WannaJoin) && (other.guild == GIL_NONE) && (Raoul_Voted == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Stimme_Info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//� �� ����� ����� ���������. �� �� ����������?
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//���, �����, ��� ������...
		if(Torlof_GenugStimmen == FALSE)
		{
			Log_CreateTopic(TOPIC_SLDRespekt,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_Running);
		};
		B_LogEntry(TOPIC_SLDRespekt,"����� �� ��������� ������ ����� ���������� � ���� ���������.");
		Raoul_Voted = TRUE;
	}
	else
	{
		B_Raoul_GetLost();
	};
};


instance DIA_Raoul_Duell(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Duell_Condition;
	information = DIA_Raoul_Duell_Info;
	permanent = TRUE;
	description = "� �����, ���� ����� ���� �� �����...";
};


func int DIA_Raoul_Duell_Condition()
{
	if(((Raoul_gesagt == TRUE) || Npc_KnowsInfo(other,DIA_Raoul_AboutSylvio) || Npc_KnowsInfo(other,DIA_Jarvis_MissionKO)) && (MIS_ReadyforChapter4 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Duell_Info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//� �����, ���� ����� ���� �� �����...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//���?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//��� ������ ��, ��� ���� ������ �����...
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//��-�����, � ��� � ����� ������� ������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Raoul_PERM(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PERM_Condition;
	information = DIA_Raoul_PERM_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Raoul_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//��� � �������?
	if(MIS_Raoul_KillTrollBlack == LOG_Running)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//�� ������ �������. ��� � ������� ����� ������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//�� ��������� ����������� �� ���? ������ �� ����!
		if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//� �� �����, ��� �� ������ �� ����.
		};
	};
};


instance DIA_Raoul_TROLL(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_TROLL_Condition;
	information = DIA_Raoul_TROLL_Info;
	important = TRUE;
};


func int DIA_Raoul_TROLL_Condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(�������) ������ ���������� �� ���!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//���� ���� �����?
	if((VisibleGuild(other) == GIL_MIL) || (VisibleGuild(other) == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//�� ������������� � ��������� �����? ������ �� ��.
	};
	if((VisibleGuild(other) == GIL_SLD) || (VisibleGuild(other) == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//�� �����, ��� � ����� ������� ���� ������ �� ��, ��� �� ���� ����� �� ���.
	};
	if((VisibleGuild(other) == GIL_NOV) || (VisibleGuild(other) == GIL_KDF) || (VisibleGuild(other) == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//������������ �� ���� �������� ����, ��?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//� ����� ���� ���� ����. �� �����, ��� �� ������, � ���� ���� ��������.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//�� ���, ��� �� ������ ��������� ��������� ���������� � ������ ������.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"� ������ ����.",DIA_Raoul_TROLL_weg);
	Info_AddChoice(DIA_Raoul_TROLL,"� ��� ���� ��������?",DIA_Raoul_TROLL_rechnung);
};

func void DIA_Raoul_TROLL_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//� ������ ����.
	B_Raoul_GetLost();
};

func void DIA_Raoul_TROLL_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//� ��� ���� ��������?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//� ���� ����� �����, ��� ��, ��������. �������� ������ �� �����, � ����� ������� �� ���� - � �����.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//� �������� ���, ��� ��������� ��� �������� � ������� �������� ������ ������������ ������.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//�� ����� ��� ����� � ����� ����� ������ ������. �� ���������, ��� ����� �������� ������� ������ ����� �����.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//� ���?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(����������) ��� �� ������ ������� ���� '� ���'?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//�� ���� ��� � ����� ����� ����� ������� ������, ������? �� ���� �� ������������� ����, ��������� ������ ��� �������?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//���� �� ��������� � ��� ������� ������, ��� �������� ���� �� �����.
	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL,"��� ��� �� ���������.",DIA_Raoul_TROLL_rechnung_hastrecht);
	if(Npc_IsDead(Troll_Black))
	{
		Info_AddChoice(DIA_Raoul_TROLL,"� ��� ���� ������� ������.",DIA_Raoul_TROLL_rechnung_ich);
	}
	else
	{
		Info_AddChoice(DIA_Raoul_TROLL,"������� ������? ��� �������.",DIA_Raoul_TROLL_rechnung_noProb);
	};
};

func void B_Raoul_Blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//�� ��������������, ��? � ������ ��� ��� �������� ���� ������. �� � ���� ���� ���� �������.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//���� �� ����� ������� ����, ������ ���.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//� ��� ��� � ����� �����?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//������ ������. �����, � ���� ������� ��������� �� ���������.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//�� ��� �� �����.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//������, � ������� ���� ����� ���� �����, ���� �� ��������� ��� ����� ������� ������. ��� ����?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//��� �����.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//����� ���� �� �����?
	MIS_Raoul_KillTrollBlack = LOG_Running;
	Log_CreateTopic(TOPIC_KillTrollBlack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack,LOG_Running);
	B_LogEntry(TOPIC_KillTrollBlack,"����� �����, ����� � ������ ��� ����� ������� ������.");
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//��� ��� �� ���������.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//��, ��� ������.
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//� ��� ���� ������� ������.
	if(TrollBlackFurWasted == FALSE)
	{
		B_Raoul_Blame();
	}
	else
	{
		B_Raoul_GetLost();
	};
};

func void DIA_Raoul_TROLL_rechnung_noProb()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//������� ������? ��� �������.
	B_Raoul_Blame();
};


instance DIA_Raoul_TrophyFur(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TrophyFur_Condition;
	information = DIA_Raoul_TrophyFur_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("������� ����� ���, ��� ����� ����� � ������� ������.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur));
	description = B_BuildLearnString(NAME_TROPHY_Fur,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_Fur));
};


func int DIA_Raoul_TrophyFur_Condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) && (MIS_Raoul_KillTrollBlack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TrophyFur_Info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//������� ����� ���, ��� ����� ����� � ������� ������.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//����� �������� ���� ���. ���� ����� ����������.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//�� �������� ����� ����� � ������� ������ �� ������ �� ��� ���.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//����� �������� � ���� ����� ����� ������. ����� ��� ��� ������?
	};
};


instance DIA_Raoul_TROLLFELL(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_TROLLFELL_Condition;
	information = DIA_Raoul_TROLLFELL_Info;
	description = "� ������ ����� ������� ������.";
};


func int DIA_Raoul_TROLLFELL_Condition()
{
	if(Npc_HasItems(other,ItAt_TrollBlackFur) && Npc_KnowsInfo(other,DIA_Raoul_TROLL))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLLFELL_Info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//� ������ ����� ������� ������.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//����������. ������.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Raoul_KillTrollBlack);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//����������. ��� �� ������ �� ���?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//����� ��� ���, ��� � ���� ����.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//������. � ��� ���� 500 ������� ����� � ��� ������� �������� �����. ��� �������?
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"����� ������������.",DIA_Raoul_TROLLFELL_nein);
	Info_AddChoice(DIA_Raoul_TROLLFELL,"�������.",DIA_Raoul_TROLLFELL_ja);
};

func void DIA_Raoul_TROLLFELL_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//�������.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//�������� ������.
	CreateInvItems(other,ItPo_Health_03,3);
	CreateInvItems(other,ItMi_Gold,500);
	AI_PrintScreen("3 ��������� �������� (�������� �������)",-1,40,FONT_ScreenSmall,4);
	AI_PrintScreen("500 ������� ��������",-1,43,FONT_ScreenSmall,4);
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
};

func void DIA_Raoul_TROLLFELL_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//����� ������������.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//��� ������. � ��� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//� �� ����� ����, ���� ����� ����� �����������.
	MIS_Raoul_DoesntPayTrollFur = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_FELLZURUECK(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_FELLZURUECK_Condition;
	information = DIA_Raoul_FELLZURUECK_Info;
	permanent = TRUE;
	description = "����� ��� ��� ����� ������� ������!";
};


func int DIA_Raoul_FELLZURUECK_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && Npc_HasItems(self,ItAt_TrollBlackFur))
	{
		return TRUE;
	};
};

func void DIA_Raoul_FELLZURUECK_Info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//����� ��� ��� ����� ������� ������!
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//���.
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_GotTrollFurBack(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 3;
	condition = DIA_Raoul_GotTrollFurBack_Condition;
	information = DIA_Raoul_GotTrollFurBack_Info;
	description = "������� ������ �� ������� �������� ����, �������?";
};


func int DIA_Raoul_GotTrollFurBack_Condition()
{
	if((MIS_Raoul_DoesntPayTrollFur == LOG_Running) && !Npc_HasItems(self,ItAt_TrollBlackFur) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Raoul_GotTrollFurBack_Info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//������� ������ �� ������� �������� ����, �������?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//������. �� ������ ������� ������. ��� ��� ���������.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_Raoul_Ship(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 2;
	condition = DIA_Raoul_Ship_Condition;
	information = DIA_Raoul_Ship_Info;
	description = "�� �� ��������� �� �� ���������� ������?";
};


func int DIA_Raoul_Ship_Condition()
{
	if((Kapitel >= 5) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//�� �� ��������� �� �� ���������� ������?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//��� �� ����������? �� ������ ��������� ������� ���������? (�������)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//� ���, ���� � ���?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(��������) � ���� ������ ����� �������. ���, �������. ��� �� ��� ����.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//� �� ���� ������ �������� �������. ��� ��� �����, ��� ������������ ������, ����� ��� �� ��������.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//����� ����-������ ���.
	if(!Npc_IsDead(Torlof))
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//������ �������. �� ����� �� �����, ��������� � ����.
		TorlofIsSailor = TRUE;
	};
};


instance DIA_Raoul_PICKPOCKET(C_Info)
{
	npc = SLD_822_Raoul;
	nr = 900;
	condition = DIA_Raoul_PICKPOCKET_Condition;
	information = DIA_Raoul_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Raoul_PICKPOCKET_Condition()
{
	return C_Beklauen(45,85);
};

func void DIA_Raoul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,Dialog_Back,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Raoul_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

