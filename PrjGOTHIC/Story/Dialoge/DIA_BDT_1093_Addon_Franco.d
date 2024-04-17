
instance DIA_Addon_Franco_EXIT(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 999;
	condition = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if((Franco_Exit == FALSE) && (MIS_HlpLogan == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//�� ���������, ��� ������� �� ���� �������� ������.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_HI(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 1;
	condition = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//��, ��� �� ����� �������? �� ������ ������� � ������?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//��, �...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//���� �� ����������, ��� �� �����. ���� ����� ������. � ����� ��������.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//���� �� ������ ������ ��������, � �������� ���� � ������.
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"���� � ������� ������� ������, �� ������� ���� � ������.");
	if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//�������� ����� ����� ���� �������, ����� �� � ������ ����� ����. �������� � ���.
		Log_AddEntry(Topic_Addon_Franco,"� ������ �������� ������, ����� �� � ������ ��� ����.");
	};
};


instance DIA_Addon_Franco_Hai(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 2;
	condition = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent = FALSE;
	description = "������ ����� ����� �������.";
};


func int DIA_Addon_Franco_Hai_Condition()
{
	if(Ramon_News == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//������ ����� ����� �������.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//������, � ���������� �� ����.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//���������, � ��� �� �?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//�� ��� ������ �� ������.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//� ������ �������� �����, ��� ������ �� �� ���� �� ������.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//�� ������. ���� ����� ����? �� ��� ��������. ���� ���� ������� � ������. ��� �������� �������� �����.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//������ ��� ������������ � ���������� � ������, ��� �� � ������.
	B_LogEntry(Topic_Addon_Franco,"������ �����, ����� � ����� ������.");
};


instance DIA_Addon_Franco_Wo(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 3;
	condition = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent = FALSE;
	description = "��� ��� ����� ������?";
};


func int DIA_Addon_Franco_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_Hai) && !Npc_IsDead(Logan) && (MIS_HlpLogan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//��� ��� ����� ������?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//���� �� ������ ����� � ����� � ������, �� ���� ���� ���� ������, ����� �����. ����� ����������� � �������, ������ ������� ������ ������.
	AI_StopProcessInfos(self);
};


func void B_LoganIsDead()
{
	AI_Output(self,other,"DIA_Addon_Franco_Tot_08_01");	//����! �� ��� ����� ������ ���������. ������, ����� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Franco_Tot_08_02");	//�� �����. �� � ��� ������ � ������ ������� ��������.
};

instance DIA_Addon_Franco_Tot(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 5;
	condition = DIA_Addon_Franco_Tot_Condition;
	information = DIA_Addon_Franco_Tot_Info;
	permanent = FALSE;
	description = "����� �����.";
};


func int DIA_Addon_Franco_Tot_Condition()
{
	if((MIS_HlpLogan != LOG_SUCCESS) && Npc_IsDead(Logan) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Tot_15_00");	//����� �����.
	B_LoganIsDead();
	if(MIS_HlpLogan == LOG_Running)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};


instance DIA_Addon_Franco_HaiSuccess(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 6;
	condition = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent = FALSE;
	description = "� ����� ������.";
};


func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if((MIS_HlpLogan == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//� ����� ������.
	if(Npc_IsDead(Logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//�� �� �� �����.
		B_LoganIsDead();
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//����, �� ������� �������� ����. �������������, �� �������... �� �� ������� ����, ��������, ��� ����������� ������� ������������.
	B_GivePlayerXP(XP_Addon_HlpLogan);
	B_LogEntry(Topic_Addon_Franco,"����� ������ ������ ��������� ������������ ��� ����, ����� ������� � ������.");
};


instance DIA_Addon_Franco_Mis2(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 7;
	condition = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent = FALSE;
	description = "������ � ���� ������ � ������?";
};


func int DIA_Addon_Franco_Mis2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess) || Npc_KnowsInfo(other,DIA_Addon_Franco_Tot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//������ � ���� ������ � ������?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//��������, ��� �����, ����� �� �������� ��� ���� ��� ���������.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//��������� ���� ����� � ������ �� ������ ������.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//�� ������ ��� ������ ��� ���� ������� �������� ��������. �� � ��� ��� ��� ����� �� �����.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//�����, ��� �� ������, � ������� ��� ��� ������� ��������!
	MIS_HlpEdgor = LOG_Running;
	Log_CreateTopic(Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate,LOG_Running);
	B_LogEntries(Topic_Addon_Stoneplate,"������ ����� �������� ��������, ������� ������ ��� �������� ��� �����. ������ ��� ��� ������.");
	B_LogNextEntry(Topic_Addon_Franco,"������ �����, ����� � ����� ������.");
};


instance DIA_Addon_Franco_While(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 8;
	condition = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent = FALSE;
	description = "� ��� ������ ������?";
};


func int DIA_Addon_Franco_While_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//� ��� ������ ������?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//���?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//��� � ������ �� ���� ������ �� ������?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(����������) �, ���� ����� ������? �� �������! ������� �� ������? ��������� ����������? ���? � ��� ���� �������, ������� �� ������� ������...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(������) �� ��� �� �����?! �� ���, ������ ������� �� ���� ������?!
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//������ ����� �������� � �����, ��� ���� �������! ����� �� � ������ � ������ �� ���������!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_WOEDGOR(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 9;
	condition = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent = TRUE;
	description = "� ��� �� ��� ����� ����� ������?";
};


func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && !Npc_HasItems(other,ItMi_Addon_Stone_04))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(��������) � ��� �� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//���� ������ ���� ��� �������?
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"� ������� ������� ����.",DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"����� ��� ������ ����.",DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//����� ����� ���������. �� ��������� ����� ���-�� ���.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//�����, ��� ������� ��� �������� ������. �������, ������-�� �� ������� �����?
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//����� ��� ������ ����.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//��� �� ����, �������� � ������� �������. ��� �� ��������� �����.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//������ ��� ������ �� ���������� �������.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//� ������� ������� ����.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//������. ��� ������ �� ��������� ������. ����������� ������ ������, ����� ���������� �������.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};


instance DIA_Addon_Franco_Tafel(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 10;
	condition = DIA_Addon_Franco_Tafel_Condition;
	information = DIA_Addon_Franco_Tafel_Info;
	permanent = FALSE;
	description = "��� ���� �������� ��������.";
};


func int DIA_Addon_Franco_Tafel_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && Npc_HasItems(other,ItMi_Addon_Stone_04))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Tafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Tafel_15_00");	//��� ���� �������� ��������.
	B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_Tafel_08_01");	//����� ������. ����� ����� �������.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);
	B_LogEntry(Topic_Addon_Franco,"� ������ ������ ��� �������� ��������.");
};


instance DIA_Addon_Franco_JemandAnderen(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 11;
	condition = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent = FALSE;
	description = "�� ���, ������-�� ������� � ������ � ������?";
};


func int DIA_Addon_Franco_JemandAnderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_Tafel))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_JemandAnderen_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//�� ���, ������-�� ������� � ������ � ������?
	if(!Npc_IsDead(Logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//���, � ��� �������� ���� ������. �� ��� ����� ����� � ������.
		Logan_Inside = TRUE;
		AI_Teleport(Logan,"BL_INN_03_B");
		B_StartOtherRoutine(Logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//���, � ��� ������ � ������ ������� ��������.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//� ������ ���� � ������ �� �����.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//� ���� �� ������, ����� ������ ������ ����� ���, � ����� ������������ ������ ���� ����.
	B_LogEntry(Topic_Addon_Franco,"������ �� ������� ���� � ������. �����, �������� � ��� �����������...");
};


instance DIA_Addon_Franco_Fight(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 12;
	condition = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent = TRUE;
	description = "���������� ������ ���� � ������!";
};


func int DIA_Addon_Franco_Fight_Condition()
{
	if(!Npc_IsDead(Ramon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//���������� ������ ���� � ������!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//� ���, ���� � ��������?
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight,"�����, � �������...",DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight,"����� �� �� ���� ���������.",DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//����� �� �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//�� ���, ��� ���������? �� ��������� ���? �������� ��������� ���� ����...
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//�����, � �������...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//������ ���.
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_Pig(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 13;
	condition = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent = TRUE;
	description = "������! � ���������� � �����!";
};


func int DIA_Addon_Franco_Pig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_JemandAnderen) && !Npc_IsDead(Ramon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//������! � ���������� � �����!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//�� ��, ������ �������! �� ������ �������� ���? ���� �����!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

