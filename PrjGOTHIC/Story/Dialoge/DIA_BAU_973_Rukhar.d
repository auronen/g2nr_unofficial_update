
instance DIA_Rukhar_EXIT(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 999;
	condition = DIA_Rukhar_EXIT_Condition;
	information = DIA_Rukhar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_HALLO(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 4;
	condition = DIA_Rukhar_HALLO_Condition;
	information = DIA_Rukhar_HALLO_Info;
	description = "��� ����� ����?";
};


func int DIA_Rukhar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//��� ����� ����?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//�� ����� ������, �� � ���� ����� �� ���������� �������� ��������������.
};


instance DIA_Rukhar_WASMACHSTDU(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 5;
	condition = DIA_Rukhar_WASMACHSTDU_Condition;
	information = DIA_Rukhar_WASMACHSTDU_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Rukhar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//��� ��������� ������ ����� �������� ��� ��� �� ����� �����.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//�� ������� � �����, ��� ������ ��� �� ������� � ������ ������.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//������ � ��� ���� ������. ���, ��� ����������� ���, ��������� � ���� �������. � ������ ��� ������ �� �����.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//�� ������ ������������� �� ����?
	if(Kapitel < 4)
	{
		if(TaverneTopicStarted == FALSE)
		{
			Log_CreateTopic(TOPIC_Wettsaufen,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Wettsaufen,LOG_Running);
			B_LogEntry(TOPIC_Wettsaufen,"� ������� ����� ��������� ����.");
			TaverneTopicStarted = TRUE;
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//����� ���� �����, ����� � �� ���� ��� ����������.
	};
};


instance DIA_Rukhar_WETTKAMPF(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_WETTKAMPF_Condition;
	information = DIA_Rukhar_WETTKAMPF_Info;
	description = "� ��� ��� �� ����������?";
};


func int DIA_Rukhar_WETTKAMPF_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WETTKAMPF_Info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//� ��� ��� �� ����������?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//� ������� ��� '��� �� ���'.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//������� ����� ������.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//�� �� ������� ���������� �� ������ ����� ������������� ����, ������� ���������� ���� ������ �����.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//������ ������ ����� ������� �� ���, ���, ����� ���� ������� �����, ���� �� ����������� ����� ����.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//���������� ���, ��� ������ ������ ��������� �� �����. ����������� ���������� ���� � ������. ��? ��� ���� ���?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//����� ���� �����, ����� � �� ���� ��� ����������.
};


instance DIA_Rukhar_HOLERANDOLPH(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HOLERANDOLPH_Condition;
	information = DIA_Rukhar_HOLERANDOLPH_Info;
	description = "���� � ��������� �� ����-������ ���?";
};


func int DIA_Rukhar_HOLERANDOLPH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WETTKAMPF) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_HOLERANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//���� � ��������� �� ����-������ ���?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//�������. ���� �� ������� ����-������, � ���� ������ �������� ���������� �� ���� ������, � ����� ���� ������.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//��� ������ ���������� ������ � ������. ���������� �������� ���. ������ ������ ������� ������ �� ������� ������ ��������.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//������� ��� ����-������, ��� ��������� ���������� �� ���� ������, � � ����� ���� ������.
	B_LogEntry(TOPIC_Wettsaufen,"����� �������� ��� ���� ��� �� ���. ���, �������, ��� ��� �� ���������. � ����� ����-������ ��� ��� ����. ����� ������� ������, �� �� ����.");
};


var int DIA_Rukhar_RANDOLPHWILL_noPerm;
var int DIA_Rukhar_RANDOLPHComment_Once;

func void B_ChooseRukharBet()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"����.",DIA_Rukhar_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"100.",DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"50.",DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"20.",DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"10 �������.",DIA_Rukhar_RANDOLPHWILL_10);
};

func void B_ConfirmRukharBet(var int amount)
{
	Rukhar_Einsatz = amount;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(������� ������ ������)",DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL,"(������� ������)",DIA_Rukhar_RANDOLPHWILL_annehmen);
};

instance DIA_Rukhar_RANDOLPHWILL(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_RANDOLPHWILL_Condition;
	information = DIA_Rukhar_RANDOLPHWILL_Info;
	permanent = TRUE;
	description = "� ����� ��������, ������� ����� ��������� � �����.";
};


func int DIA_Rukhar_RANDOLPHWILL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Randolph_GEGENWEN) && Npc_KnowsInfo(other,DIA_Rukhar_HOLERANDOLPH) && (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE) && !Npc_IsDead(Randolph) && (MIS_HealRandolph == FALSE) && (NpcObsessedByDMT_Randolph == FALSE) && (DIA_Randolph_SoberForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_RANDOLPHWILL_Info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//� ����� ��������, ������� ����� ��������� � �����.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//��� ���?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//��������.
	if(DIA_Rukhar_RANDOLPHComment_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//��-��-��. �������� �������? �� ������. ������ �� � ���.
		AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//������ ����� �������� �� ���, � ������ ������.
		AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//�� ������ ��������� ��� ��� ��� �� ������ ��� ����� ��� ���. ��� �����? �����, ���� �������, � �� ������ �����������.
		DIA_Rukhar_RANDOLPHComment_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//������ ���� ������?
	B_ChooseRukharBet();
};

func void DIA_Rukhar_RANDOLPHWILL_annehmen()
{
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//� ������ ���� ������ � ������� �� � ����, ���� ���������� �� ����� ��������, ������?
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
};

func void DIA_Rukhar_RANDOLPHWILL_mehr()
{
	B_ChooseRukharBet();
};

func void DIA_Rukhar_RANDOLPHWILL_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//����.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//����� ��� ����� ������ � ����������.
	AI_StopProcessInfos(self);
};

func void DIA_Rukhar_RANDOLPHWILL_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 �������.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//�� �����, ��, ������ ����, ������. ��� ��������� ������� �� ������� ����.
	B_ConfirmRukharBet(10);
};

func void DIA_Rukhar_RANDOLPHWILL_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//���� �� ������ ������� ������, �� ����� �� ��� ��-�����������.
	B_ConfirmRukharBet(20);
};

func void DIA_Rukhar_RANDOLPHWILL_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//�� �����. ������.
	B_ConfirmRukharBet(50);
};

func void DIA_Rukhar_RANDOLPHWILL_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//��� ��� ��� ��� ��������.
	B_ConfirmRukharBet(100);
};


instance DIA_Rukhar_ICHSEHEDICH(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_ICHSEHEDICH_Condition;
	information = DIA_Rukhar_ICHSEHEDICH_Info;
	permanent = TRUE;
	description = "��� ��� ������.";
};


var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition()
{
	if((DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE) && (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE) && (Rukhar_Einsatz != 0) && !Npc_IsDead(Randolph) && (MIS_HealRandolph == FALSE) && (NpcObsessedByDMT_Randolph == FALSE) && (DIA_Randolph_SoberForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_ICHSEHEDICH_Info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//��� ��� ������.
	if(B_GiveInvItems(other,self,ItMi_Gold,Rukhar_Einsatz))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//������. �� ������ �� ����, ������� ��������� ���������, �������?
		DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
		MIS_Rukhar_Wettkampf = LOG_Running;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//����� ������. �����������, ����� � ���� ����� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_NoRandolph(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_NoRandolph_Condition;
	information = DIA_Rukhar_NoRandolph_Info;
	permanent = FALSE;
	description = "������ ���������...";
};


func int DIA_Rukhar_NoRandolph_Condition()
{
	if(MIS_Rukhar_Wettkampf == LOG_Running)
	{
		if(Npc_IsDead(Randolph) || (MIS_HealRandolph != FALSE) || (NpcObsessedByDMT_Randolph == TRUE) || (DIA_Randolph_SoberForever == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Rukhar_NoRandolph_Info()
{
	AI_Output(other,self,"DIA_Rukhar_NORANDOLPH_15_00_add");	//������ ���������...
	if(Npc_IsDead(Randolph))
	{
		DIA_Common_HeIsDead();
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//��� ���� ������, � ������ � �� ����� �� �����.
		CreateInvItems(self,ItMi_Gold,Rukhar_Einsatz);
		B_GiveInvItems(self,other,ItMi_Gold,Rukhar_Einsatz);
	}
	else 
	{
		if(MIS_HealRandolph != FALSE)
		{
			AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//� ��������� ���������� �������.
		}
		else
		{
			AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//� �� �����, ��� �� �����-������ ��� �������.
		};
		AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//� ���� �������� ���� ������ �����.
		AI_Output(self,other,"DIA_Rukhar_NORANDOLPH_12_01_add");	//����� ������. ���� ��������� �������� �� ���� ������.
	};
	MIS_Rukhar_Wettkampf = LOG_FAILED;
	B_CheckLog();
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_GELDZURUECK(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_GELDZURUECK_Condition;
	information = DIA_Rukhar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "� ���� �������� ���� ������ �����.";
};


func int DIA_Rukhar_GELDZURUECK_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Rukhar_Won_Wettkampf == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//� ���� �������� ���� ������ �����.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//������� ���� - ��� ���� �����, ��������. ���� ��������� �������� �� ���� ������.
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_HAENSELN(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 3;
	condition = DIA_Rukhar_HAENSELN_Condition;
	information = DIA_Rukhar_HAENSELN_Info;
	permanent = TRUE;
	description = "������, �� ������� ������, ��� ������ ����������.";
};


func int DIA_Rukhar_HAENSELN_Condition()
{
	if((MIS_Rukhar_Wettkampf == LOG_SUCCESS) && (Rukhar_Won_Wettkampf == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//������, �� ������� ������, ��� ������ ����������.
	if(DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//��� ���� ������, � ������ � �� ����� �� �����.
		B_GivePlayerXP(XP_Rukhar_Lost);
		CreateInvItems(self,ItMi_Gold,Rukhar_Einsatz * 2);
		B_GiveInvItems(self,other,ItMi_Gold,Rukhar_Einsatz * 2);
		DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//� ��� ���������� � �����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Rukhar_Perm(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 7;
	condition = DIA_Rukhar_Perm_Condition;
	information = DIA_Rukhar_Perm_Info;
	permanent = TRUE;
	description = "������ ����������� �� ���������?";
};


func int DIA_Rukhar_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_Perm_Info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//������ ����������� �� ���������?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//������ ������, � ��� �� � ����. ����� ������ ��� �� ������������.
};


instance DIA_Rukhar_PICKPOCKET(C_Info)
{
	npc = BAU_973_Rukhar;
	nr = 900;
	condition = DIA_Rukhar_PICKPOCKET_Condition;
	information = DIA_Rukhar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Rukhar_PICKPOCKET_Condition()
{
	return C_Beklauen(26,30);
};

func void DIA_Rukhar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,Dialog_Back,DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

