
instance DIA_Carl_EXIT(C_Info)
{
	npc = VLK_461_Carl;
	nr = 999;
	condition = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_CarlSayHallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//������, � ������ ���� ��������� �����, ������� ������ � ���������� �������.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//��������� ������ ������� ����������� �������� ������� ����� ����, �� ��� ������ �� �����.
};


instance DIA_Carl_Hallo(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Carl_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//��� ������� ���� � ���� ������ �����? ��� �� ����� �����?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo,"� ����������.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo,"� ������ �����, ���������� �����������.",DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//� ����������.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//����� ������, ����� ���� �� ��������.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//� ������ �����, ���������� �����������.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//���. ������, ����������� � �������� ��������.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};


instance DIA_Carl_Diebe(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent = FALSE;
	description = "��� �� ������ � �����?";
};


func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//��� �� ������ � �����?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//������. �� ��� �������� �������� � ���������� ������������� - �������� � �������.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//������, ����� ���� �� ������� � ����� ����. � ��� ����� �� �����.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//��, �� ������ ��� ���������� �� �����. ������� ������� - ����� �����.
};


instance DIA_Carl_Lernen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//��, � ����� ���� ��� �������� ������� � ������ � ���� ��������� ��������.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//�� � ���� ��� ���� �� ������������ ������, ����� ����� ���� �����.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//���� �� ������ ��������� ����� �������, �������� � �������. ��-�� �� ����� �����, ��� ������ ������!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//�� ���� �� ������ ������� ������������� ���� �������, ��� � ���� ������.
	if(DIA_Kardif_Lernen_permanent == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"����, ������ � �������� ��������, ����� ������� ���� �������.");
	};
};


func int C_CarlCanTeachForFree()
{
	if(Npc_IsDead(Edda))
	{
		return FALSE;
	};
	if(Edda.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return FALSE;
	};
	if(!Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Carl_Wieviel(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent = FALSE;
	description = "������� �� ������ �� ��������?";
};


func int DIA_Carl_Wieviel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Carl_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//������� �� ������ �� ��������?
	if(C_CarlCanTeachForFree())
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//� ������, ��� �� ������ ��� ����. � ���� ����������� ���� ���������.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 ������� ����� - � � ������ ���� ����� �������.
	};
};


instance DIA_Carl_bezahlen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = B_BuildPriceString("� ���� ��������������� � �����.",50);
};


func int DIA_Carl_bezahlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Wieviel) && (Carl_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//� ���� ��������������� � �����.
	if(C_CarlCanTeachForFree())
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//� ������, ��� �� ������ ��� ����. � ���� ����������� ���� ���������.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//������, �� ����� ������, ��� ������ �� ������ �����.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//������� ������, � � ���������� ����.
	};
};


func void B_BuildLearnDialog_Carl()
{
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,1),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,B_BuildLearnAttributeString(ATR_STRENGTH,5),DIA_Carl_Teach_STR_5);
};

instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Carl_Teach_Condition()
{
	if(Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//� ���� ����� �������.
	B_BuildLearnDialog_Carl();
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH))
	{
		B_BuildLearnDialog_Carl();
	};
};

func void DIA_Carl_Teach_STR_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH))
	{
		B_BuildLearnDialog_Carl();
	};
};

instance DIA_Carl_RepairNecklace(C_Info)
{
	npc = VLK_461_Carl;
	nr = 8;
	condition = DIA_Carl_RepairNecklace_Condition;
	information = DIA_Carl_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������ �������������?";
};


func int DIA_Carl_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_MIS) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(!Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
		{
			return TRUE;
		};
	};
};

func void DIA_Carl_RepairNecklace_Info()
{
	DIA_Common_CanYouRepairJewelry();
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//��, � ����� ���� ��� �������� ������� � ������ � ���� ��������� ��������.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

