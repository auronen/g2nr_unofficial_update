
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HALLO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HALLO_Info;
	description = "�� ����-�� �����?";
};


func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//�� ����-�� �����?
	if(Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//� �������. ��-�����, ��� ��������.
		Grimbald_PissOff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//������ ���. �� ���� ��� ������.
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO,"���� ���� ����.",DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO,"��� �� �������?",DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO,"������ �?",DIA_Grimbald_HALLO_ich);
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//������ �?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//������, �� ������� �������. � �� �� ��������� �� ����� ������.
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//� ���� ����������� �� ��������� ��� ���, �� �����, ��� �� ���������� � ���� � ��������.
	Info_AddChoice(DIA_Grimbald_HALLO,"������ �� ������������ �� ����.",DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO,"������, � ������ ����. �� �� ������� �������.",DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//������ �� ������������ �� ����.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//����� ����������, ����.
	Grimbald_PissOff = TRUE;
	Info_ClearChoices(DIA_Grimbald_HALLO);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//������, � ������ ����. �� �� ������� �������.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//�������. ������ �� ����������� ������� ������ � ������� ������. �� �������� ���� �� �����, �����?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//� � �� ����� ����, ���� �� ������ ����� �� ����.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
//	B_StartOtherRoutine(self,"Jagd");
	Npc_ExchangeRoutine(self,"Jagd");
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//���� ���� ����.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//�� ���� ������. ��� ������ ������� ����� ����� ���� � ���� �����?
};


instance DIA_Grimbald_Jagd(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Jagd_Info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Grimbald_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO) && (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

const string Grimbald_IsTeacher = "������� ���������, ������� ���������� �� ������ ������� ������, ����� ������� ���� �������� ��������.";

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//�� ������ ������� ���� ���������?
	if(Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3) && (Grimbald_PissOff == FALSE))
	{
		if(Grimbald_Snappers_KilledByPlayer == TRUE)
		{
			B_Say(self,other,"$ABS_GOOD");
		}
		else
		{
			AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//���. ������. �� �� ��������-�� ����� ���, �� �� ����� ���� ������� �������.
		};
		self.aivar[AIV_PARTYMEMBER] = FALSE;
//		B_StartOtherRoutine(self,"JagdOver");
		Npc_ExchangeRoutine(self,"JagdOver");
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,Grimbald_IsTeacher);
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//�������. �� �� ���������.
		B_Say_Gold(self,other,200);
		Info_ClearChoices(DIA_Grimbald_Jagd);
		Info_AddChoice(DIA_Grimbald_Jagd,"� ������� ��� ����.",DIA_Grimbald_Jagd_zuviel);
		Info_AddChoice(DIA_Grimbald_Jagd,"������, ��� ������.",DIA_Grimbald_Jagd_ja);
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//������, ��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//�������. �������, ����� �������� ��������� ����-������.
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,Grimbald_IsTeacher);
		Grimbald_TeachAnimalTrophy = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//������� ��� ������, � � ����� ������� ����.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//��� ������.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "����� ���� ���������.";
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if(Grimbald_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};


func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//����� ���� ���������.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//��� ������ �� ������ ������?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_BFSting,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_BFWing,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Claws,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_Mandibles,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,B_BuildLearnString(NAME_TROPHY_CrawlerPlate,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//�� ��� ������ ���, ���� � ��� ������� ����.
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//�������� ���� �������� ���� �������� ������. ���� ����� ����� ��� ��������� � � ����� �������� ���� ���.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//������ �������� ���� ����� ������� ��� �������� ��� ������ ������� ����.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//���� ��������� �������� �������� �����. ��� ����� �������� ��������� ������� ������ ���� �����, � � ������ �� ����� �������� ����� ���������.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//� ��������� � ������� �������� ������� ���������, ������� ����� �������� �� ������ ������� ������ ������.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//������� � ��������� ����� �������, �� ��� ��� �� ����� ������� ��� ������ ������� �������� ��������.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = "�� �� ����� ����� ����������?";
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//�� �� ����� ����� ����������?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//������� ����� ������ ����� ������ �������� ���������, ������� ��� ���� ������� � �������� ����.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//� ������� � ���� � ���-�� ������������ ��������� ����� ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 4;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(Troll_Black))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//������ ������ �����. �������� ������. � �� �����, ��� ��� ������ ����� �����. ������� ����� �� ������.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_Success(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Success_Condition;
	information = DIA_Grimbald_Success_Info;
	important = TRUE;
};


func int DIA_Grimbald_Success_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_IsDead(Grimbald_Snapper1) && Npc_IsDead(Grimbald_Snapper2) && Npc_IsDead(Grimbald_Snapper3))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Success_Info()
{
	if(Grimbald_Snappers_KilledByPlayer == TRUE)
	{
		B_Say(self,other,"$NOTBAD");
	}
	else
	{
		B_Say(self,other,"$GOODMONSTERKILL");
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"JagdOver");
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_100;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return C_Beklauen(85,250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};



