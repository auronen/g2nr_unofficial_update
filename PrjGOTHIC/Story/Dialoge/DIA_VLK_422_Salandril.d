
instance DIA_Salandril_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Salandril_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


func void B_SalandrilTradeInfo()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//� ���� ������� ����� � ��������� ����. ��� ����� �����, ��� �� ������, ��� ������� �����.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"��������� ������� �������. ��� ����� ��������� � ������� ��������.");
};

instance DIA_Salandril_Hallo(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Hallo_Condition;
	information = DIA_Salandril_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//����� ����������, ������. ����� ������� �����?
	B_SalandrilTradeInfo();
};


instance DIA_Salandril_Trank(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Trank_Condition;
	information = DIA_Salandril_Trank_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Trank_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD == LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Salandril_KLOSTER))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trank_Info()
{
	AI_Output(self,other,"DIA_Salandril_Trank_13_00");	//� ������, �� ��� � ���������� � ������ ��������. � ��������.
	AI_Output(self,other,"DIA_Salandril_Trank_13_01");	//���� ����� ����������� � ��������� �� ��� ������. ���, ��������, ������ � ���� ���� ���������� ��������� �����. ������ ��� ����.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	if(!Npc_KnowsInfo(other,DIA_Salandril_Hallo))
	{
		B_SalandrilTradeInfo();
	};
};


instance DIA_Salandril_Trade(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 9;
	condition = DIA_Salandril_Trade_Condition;
	information = DIA_Salandril_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Salandril_Trade_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Salandril_KLOSTER))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//������ ��� ���� ������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//� �������������, ����������� ����.
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			SalandrilMinenAnteil = TRUE;
		};
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//� �������������, �, ����������� ����.
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Salandril_Minenanteil(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_Salandril_Minenanteil_Condition;
	information = DIA_Salandril_Minenanteil_Info;
	description = "�� �������� ���������� �����!";
};


func int DIA_Salandril_Minenanteil_Condition()
{
	if((other.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (SalandrilMinenAnteil == TRUE) && (SC_KnowsProspektorSalandril == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//�� �������� ���������� �����!
	B_Say(self,other,"$NOTNOW");
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

instance DIA_Salandril_KLOSTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_KLOSTER_Condition;
	information = DIA_Salandril_KLOSTER_Info;
	description = "�� ������ ����������� � ���������, ����� ��������� ����� �����.";
};


func int DIA_Salandril_KLOSTER_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//�� ������ ����������� � ���������, ����� ��������� ����� �����.
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//���? � ���� ����� �������? ����� � ���! � ���� ������ ����� ��� ������� ������������� ������ ����.
	if((hero.guild == GIL_KDF) && (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//� ��� ������ ���� ��������� �����, �������� �� �������� ��� ������? �� ��� ���� �������. �� �������.
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//� ���� ���� ������, � � ������� ���. ��� ���, ���� �� ������� ���, ���� ��� �������� ��������� ����.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//���? �� � ������� ���� ����� ���� ����� �� �������, ��� ��������� �����, � �������� �� ������.
	self.aivar[AIV_ToughGuy] = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Salandril_GehinsKloster(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_GehinsKloster_Condition;
	information = DIA_Salandril_GehinsKloster_Info;
	description = "��� �� ������� � ���������, ��� ���� ��� ��� ��������?";
};


func int DIA_Salandril_GehinsKloster_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		if(Npc_KnowsInfo(other,DIA_Salandril_KLOSTER) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
		{
			return TRUE;
		};
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//��� �� ������� � ���������, ��� ���� ��� ��� ��������?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//�� ��� ��������� �� ����. ��, ���� ���� ������, � ����� � ���� ���������, �� ���� ��� ������ ��� � ��� �� ������.
	if(Npc_HasItems(self,ItWr_MinenAnteil_MIS) && (hero.guild == GIL_KDF))
	{
		B_GiveInvItems(self,other,ItWr_MinenAnteil_MIS,Npc_HasItems(self,ItWr_MinenAnteil_MIS));
	};
	if(MIS_Serpentes_BringSalandril_SLD == LOG_Running)
	{
		MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;
	};
	Salandril_SentToMonastery = TRUE;
	SalandrilLocation = LOC_MONASTERY;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KLOSTERURTEIL");
};


instance DIA_Salandril_Verschwinde(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Verschwinde_Condition;
	information = DIA_Salandril_Verschwinde_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Salandril_Verschwinde_Condition()
{
	if((Salandril_SentToMonastery == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Verschwinde_Info()
{
	DIA_BDT_13_STANDARD_Info();
};

