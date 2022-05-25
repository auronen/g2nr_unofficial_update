
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};


func int C_LuteroIsReadyToTalk()
{
	if((GuildlessMode == TRUE) && (Kapitel >= 2))
	{
		return TRUE;
	};
	if(hero.guild == GIL_NONE)
	{
		return FALSE;
	};
	if(hero.guild == GIL_NOV)
	{
		return FALSE;
	};
	return TRUE;
};

instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && C_LuteroIsReadyToTalk())
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//���� ����� ������. � ������ ����������� ����.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//����� ������ �� �����������?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//��, � �������� ������ � ��������� ����. � ����� ������������� ���� ����� ����������� ������� ���� ��������.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"������ ������� ���������� � ������� ���������� � ������� ��������.");
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !C_LuteroIsReadyToTalk())
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//���������� ������! ���� ���, ������ ������? ����� ����� ���� ������ - ������ ���-������ ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//��� ���� �����, ���������? ����� �� �� ������ ���� � ���������?
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "�� ����� ���-������ ����������?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if(C_LuteroIsReadyToTalk())
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//�� ����� ���-������ ����������?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//��, ��� ������ �� ���� �������� ��� ����� ����� ��������.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//�� �� ������ ������� �����. ��� ������ ���� ���-�� ��������� - ����� ����� �������� �����, �������� ����� �����, ��������.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//�� ���� ������� ��� ����������� �����������, �� ����������� �� ��� ����� � ������ ��������.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//� ��� � � ����� ������?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//� ���� ���� ���� ������ ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//� ���� ���� ���� ������ ������������.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//� ��������, ��� ����� �������.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"�������� ������ ���� ����� ���������� �������� ��������.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������� ����� �������� ��� ����.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if(Npc_HasItems(other,ItAt_ClawLeader) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//� ���� ���� ��������� ����� �������� ��� ����.
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//��� ������ ����� �������� �������� ���.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	Npc_RemoveInvItem(self,ItAt_ClawLeader);
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//� ���� ��� ����� ������� ����� � �����. �� � ����, ��� ��� ����� �����.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//�� ���� �� ������ � �������, �� ������� ��� ������.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//���, � ������, ��� ���� ������� � ������� ������ ������. ��� ����.
		B_GiveInvItems(self,other,ItKe_Rune_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//��� ������, ��� � � ������ ����.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

