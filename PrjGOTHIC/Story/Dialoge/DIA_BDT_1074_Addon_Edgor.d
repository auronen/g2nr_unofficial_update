
var int Edgor_Exiteinmal;

instance DIA_Addon_Edgor_EXIT(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 999;
	condition = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		if(Edgor_Exiteinmal == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//��� ��� �������������...
			Edgor_Exiteinmal = TRUE;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Edgor_Hi(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Addon_Edgor_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Edgor_Hi_Info()
{
	DIA_Common_HowsItGoing();
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//�� ������ ������, ��� � ���� ����? � ���� ��������, ��� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//������� �����-�� ������ �������� ���� ���� � �����. � ������� ��� �� ��������.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//����� ����� ����� �����, ������ ��� �����-�� ������ ������� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//� ����� ������ ���� ���������� ��������� � ������� �������, ��� ������ ����.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//� �� ������, ��� ���� ���� �������������.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntries(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogNextEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogNextEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_Edgor_Franco(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 2;
	condition = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent = FALSE;
	description = "��� ������ �������� �������?";
};


func int DIA_Addon_Edgor_Franco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Franco_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//��� ������ �������� �������?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//����� ������. ���� ��������, ������� ��� ���������� �� ����.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//������� ��� ���� ������. � ������ ������ ������� ���.
};


instance DIA_Addon_Edgor_MIS2(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent = FALSE;
	description = "������ ������ ���� �� ������ ���� �������� ��������. �� �� �����?";
};


func int DIA_Addon_Edgor_MIS2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//������ ������ ���� �� ������ ���� �������� ��������. �� �� �����?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//��������, � ���� �� ������� �� ������. ���, ��� � ���� - ��� ��, ��� ��� ������ ���� ���-�� � ���� ������ ������ �� ������.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//� ��� ���������� ����� ������� ���: '�����, ��������� ������ ������, ������� �� ������'.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//� �� ��������� ��������� ����� ������ ���� ����� ��������� ������!
	B_LogEntry(Topic_Addon_Stoneplate,"����� �� ���������� ������ �������� ��������. �� �������, ��� ��� ��������� � �����-�� ������ �������� �� �������.");
};


instance DIA_Addon_Edgor_Weg(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent = TRUE;
	description = "� ��� ��������� ��� ������ ������?";
};


func int DIA_Addon_Edgor_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Found))
	{
		return FALSE;
	};
	if((SC_KnowsEdgorStoneLocation == TRUE) && Npc_HasItems(other,ItMi_Addon_Stone_04))
	{
		return FALSE;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_MIS2) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Weg_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//� ��� ��������� ��� ������ ������?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//������ ����� ��� ������� ������. ����� ��������� ����� ������� ������ ������� ������.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//��� ���� ������ �����... ��� ������, � ��� �� ����� - ��� ���� ������� �����.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//�� ��������� ������ ���� �� ��������� ����������. � ��� ������ ������� ����������.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//����� ����, ���� ������� � �� �� ������� ��...
	SC_KnowsEdgorStoneLocation = TRUE;
};


instance DIA_Addon_Edgor_Found(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 4;
	condition = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent = FALSE;
	description = "� ����� �������� ��������!";
};


func int DIA_Addon_Edgor_Found_Condition()
{
	if((SC_KnowsEdgorStoneLocation == TRUE) && Npc_HasItems(other,ItMi_Addon_Stone_04))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//(��������) � ����� �������� ��������!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(������) ������? �� ������ ������.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(������) ����� �� ��������� ��������� ���� ������� � ������. (������)
	}
	else
	{
		MIS_HlpEdgor = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_HlpEdgor / 2);
	};
};


instance DIA_Addon_Edgor_Teach(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent = FALSE;
	description = "������ ������� ���� ���-����?";
};


func int DIA_Addon_Edgor_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//������ ������� ���� ���-����?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//� ������ ���� ��� �������� ���. � �������� ���� ������ ������ ���� ������, ��� � �������� ������!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//�� � ����, ��� �������� �� ��� ���� � ������, �� ���� ������� �����. (� �������� �������) ��! �������� �� ���...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//����� ����, � ����, ��� �������� ������ �� ���������� ���.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//���� ������, � ���� ������� ���� ���� ���� �����.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//�������, � ������ �� ���� ������ ���������...
	if(!Npc_KnowsInfo(other,DIA_Addon_Logan_Lern))
	{
		Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_BDT_Teacher,Log_Text_Addon_EdgorTeach);
	};
};

func void B_Edgor_NotEnoughLP()
{
	PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
	B_Say(self,other,"$NOLEARNNOPOINTS");
};

func void B_Edgor_NotEnoughGold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//��� ����� ������. ���� ���������� ������ ������, �� ���������.
};

var int DIA_Edgor_Teach_permanent;

instance DIA_Addon_Edgor_TrainStart(C_Info)
{
	npc = BDT_1074_Addon_Edgor;
	nr = 9;
	condition = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent = TRUE;
	description = "�� ������ �������� ���...";
};


func int DIA_Addon_Edgor_Start_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Edgor_Teach) && (DIA_Edgor_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Edgor_Start_Info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//�� ������ �������� ���...
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (Knows_Bloodfly == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//��� �� �� ����� ������?
		Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
		Info_AddChoice(DIA_Addon_Edgor_TrainStart,Dialog_Back,DIA_Addon_Edgor_TrainStart_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Edgor_TrainStart,ConcatStrings(NAME_TROPHY_BFSting," (1 ���� ��������, 100 �������)"),DIA_Addon_Edgor_TrainStart_Sting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Edgor_TrainStart,ConcatStrings(NAME_TROPHY_BFWing," (1 ���� ��������, 100 �������)"),DIA_Addon_Edgor_TrainStart_Wing);
		};
		if(Knows_Bloodfly == FALSE)
		{
			Info_AddChoice(DIA_Addon_Edgor_TrainStart,ConcatStrings(NAME_TROPHY_BFPoison," (1 ���� ��������, 100 �������)"),DIA_Addon_Edgor_TrainStart_GIFT);
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		DIA_Edgor_Teach_permanent = TRUE;
	};
};

func void DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices(DIA_Addon_Edgor_TrainStart);
};

func void DIA_Addon_Edgor_TrainStart_Sting()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//��� �������� ���� �� ����?
	if(other.lp < B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting))
	{
		B_Edgor_NotEnoughLP();
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting);
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//��������� ������ ����� �� ����� � ������� �� �����-�������. ������ ������������ � ������� ����� ����� ���� �����.
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//����� ����� �� ������� ��������� ���� ������ ���������.
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
};

func void DIA_Addon_Edgor_TrainStart_Wing()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//� ��� �������� ������?
	if(other.lp < B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing))
	{
		B_Edgor_NotEnoughLP();
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing);
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//������ �� ����� �����. ������ ������ ������ �� �� ������� ������� ����.
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
};

func void DIA_Addon_Edgor_TrainStart_GIFT()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//��� ������ ������ �� ���� �������� ����?
	if(other.lp < 1)
	{
		B_Edgor_NotEnoughLP();
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//������� ������� ���� ���� ����� - ����� �������� ������ � �������.
		AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//��� ���������� ���������� ������ �������� ��� �� ���� - ��� ������������ ��� ��� ��������� �����.
		other.lp -= 1;
		Knows_Bloodfly = TRUE;
		PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_Screen,2);
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,PRINT_KnowsBloodfly);
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
};

