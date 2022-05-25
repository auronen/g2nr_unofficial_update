
instance DIA_Canthar_EXIT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 999;
	condition = DIA_Canthar_EXIT_Condition;
	information = DIA_Canthar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v2;
};


func int DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Canthar_EXIT_Info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//��� ����� ����.
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//��� ������.
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


func void B_GetCantharReward()
{
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//�� ��������� ���� ��� ������.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//���������. ���, ��� ������ - ������������ ���������� ���������.
//		B_GiveInvItems(self,other,ItMw_Lightsaebel,1);
		B_GiveInvItems(self,other,ItMw_Schiffsaxt,1);
	};
};

func void B_Canthar_Fail()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//� ������������ ����, �� �� �� ������. �� ������� ���� ������ �����.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//� ������ ����������, � ���� ���������.
	AI_StopProcessInfos_Pickpocket(20);
};

instance DIA_Canthar_PersonalCRIMES(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_PersonalCRIMES_Condition;
	information = DIA_Canthar_PersonalCRIMES_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_PersonalCRIMES_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(Canthar_Ausgeliefert == FALSE)
		{
			if(Canthar_Sperre == FALSE)
			{
				//�� ��� � ������, �������� �� �������
				return TRUE;
			}
			else
			{
				//�� ��� � ������, �������� �������
				return FALSE;
			};
		}
		else if(Canthar_Sperre == FALSE)
		{
			//��� � ������, �����, �������� �� �������
			return TRUE;
		};
	};
};

func void DIA_Canthar_PersonalCRIMES_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//��� ���� ����� ����� � ����� ������� - ��������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(����������) �� �����, ��� ��� ������ ������� ���������� �� ����?
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && !Npc_IsDead(Sarah) && (Kapitel < 3))
	{
		B_Canthar_Fail();
		Canthars_KomproBrief_Failed = TRUE;
		MIS_Canthars_KomproBrief = LOG_OBSOLETE;
		B_CheckLog();
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//���� �� ������ ����������, ���� � ����������, ����� �� ������ ������� � ���, ��� ������!
		DIA_Common_WhatDoYouMean();
		B_Say_Gold(self,other,100);
		Info_ClearChoices(DIA_Canthar_PersonalCRIMES);
		Info_AddChoice(DIA_Canthar_PersonalCRIMES,"� ���� ��� �������!",DIA_Canthar_PersonalCRIMES_NotEnough);
		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			Info_AddChoice(DIA_Canthar_PersonalCRIMES,"��� ���� ������ - ����� ������� �� ����!",DIA_Canthar_PersonalCRIMES_Pay);
		};
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//��� ���� ������ - ����� ������� �� ����!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//����� ������� � ����� �������!
	self.aivar[AIV_LastFightComment] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//� ���� ��� �������!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//����� ����� �� ������� ������� ��� �����?
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Hallo(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_Hallo_Condition;
	information = DIA_Canthar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Hallo_Info()
{
	if(!Npc_HasEquippedArmor(other))
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//����������, ��� � ��� �����!
		if(PlayerEnteredCity == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//�� ���� ����� � ����� - � �� ����?
			AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//����� ����.
		};
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//��! (�������) �� ����� �� �������! ��� ������� ������������ � �����.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//��������, �� ���� ������ ��������� �� �������.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(���������) ���� �� �������, ������ �� ������. �� ��� �������, � ���� ���� ���������� ����������� ��� ����...
		Canthar_GotMe = TRUE;
	}
	else if(VisibleGuild(other) == GIL_BAU)
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//��� ���� ������, ����������?
		Info_ClearChoices(DIA_Canthar_Hallo);
		Info_AddChoice(DIA_Canthar_Hallo,"� ����� �� �������?",DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice(DIA_Canthar_Hallo,"��� �� �� ��� ����������.",DIA_Canthar_Hallo_Bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//��� � ���� ������� ��� ����?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//��� �� �� ��� ����������.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//���� � ���-������ ������� ��� ����?
	Info_ClearChoices(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//� ����� �� �������?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//�� ��������� ��� ������. �� �������� ������ �� ���, ��� ���!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(� ���������) ���� � �� � ��� �� ��������, � ���� ���� ���������� ����������� ��� ����...
	Canthar_GotMe = TRUE;
	Info_ClearChoices(DIA_Canthar_Hallo);
};


instance DIA_Canthar_WhatOffer(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 1;
	condition = DIA_Canthar_WhatOffer_Condition;
	information = DIA_Canthar_WhatOffer_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ���?";
};


func int DIA_Canthar_WhatOffer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Canthar_WhatOffer_Info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//��� �� ������ ���������� ���?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//� �������� ��������. � ������ ����.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"������ ������� ��������� �������.");
	if((Canthar_GotMe == TRUE) && (PlayerEnteredCity == FALSE))
	{
		if(!Npc_HasEquippedArmor(other))
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//���� �� ����, ��� �� ���������, ������ ������� �� ������ ���� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//(��������) ���� �� ������ �������� ��� �� '�����������' �� ������� � �����, ��� �������� �� ����, ��� ������� �� ������ ���� � �����.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//� ���� ������ ���� ������� � �����.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//� ���� ���� ��� ���� ������ ������. � ����������� ������� � �������� �����������. �������.
		if(!Npc_HasEquippedArmor(other))
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//� ���� ��������� � ������� �� ������� �������� ����� � �����, � ������ �������� ���������� ����.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//���� ��� ���������?
		Info_ClearChoices(DIA_Canthar_WhatOffer);
		Info_AddChoice(DIA_Canthar_WhatOffer,"���! ������ ��� ������ ����!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice(DIA_Canthar_WhatOffer,"��� �� ������ �� ���� �������?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice(DIA_Canthar_WhatOffer,"� ��� �� �������� � �����?",DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice(DIA_Canthar_WhatOffer,"��� ������ �� ������...",DIA_Canthar_WhatOffer_Strings);
	};
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//��� ������ �� ������...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//���! �������� �������. �� ������ ������� ��� ������.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//� ��� �� �������� � �����?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//������ ����� ����. � ������ ����� ��, ��� ������� ��� �������.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//��� �� ������ �� ���� �������?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(��������������) � ����, ��� �� ������ � ����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//��������. �� �������� �� ���� �������. ����� ������!
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//������ ���?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//��. ��: ���� � ������� ���� � ������, �� ������ ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//�� ���, ������������?
	Info_AddChoice(DIA_Canthar_WhatOffer,"�������. ����� ���� ��� ������.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//�������. ����� ���� ��� ������.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//�����. �� ��������� � ��� ���������, ��� ����� ������.
	CreateInvItems(self,ItWr_Passierschein,1);
	B_GiveInvItems(self,other,ItWr_Passierschein,1);
	if((Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		Log_CreateTopic(TOPIC_City,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_City,LOG_Running);
		B_LogEntry(TOPIC_City,"� ������� ������� � �������� �������, ������� �������� ��� ������� � �����. ������ � ������ ������� ��� ������ � ��������� ���, ����� ����� ��� � ������.");
	};
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//� ��� ����: ���� � �� ����� �������� ���� �����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//� �������� � ���� ����� ������� ������� � ������ - ������ ��� ��� ���� � ��� �� ������, �� ������ ���!
	Canthar_Gefallen = TRUE;
	Info_ClearChoices(DIA_Canthar_WhatOffer);
};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//���! ������ ��� ������ ����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//��. ������, � ���������� ����, �?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//�����. ���� ����� ���-������ ���? �����, ���� �������� ��� ������?
	Info_ClearChoices(DIA_Canthar_WhatOffer);
};


instance DIA_Canthar_TRADE(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 888;
	condition = DIA_Canthar_TRADE_Condition;
	information = DIA_Canthar_TRADE_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Canthar_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_WhatOffer) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//������ ��� ���� ������.
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//�������.
	if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
	{
		CantharMinenAnteil = TRUE;
	};
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Canthar_PAYPRICEINCITY(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = DIA_Canthar_PAYPRICEINCITY_Condition;
	information = DIA_Canthar_PAYPRICEINCITY_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_PAYPRICEINCITY_Condition()
{
	if((PlayerEnteredCity == TRUE) && !Npc_IsDead(Sarah) && (Canthar_GotMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PAYPRICEINCITY_Info()
{
	if(Canthar_Gefallen == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//�� ����� ������. � ������ ����� ������� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//��, ��, � ���� ���� ����������� ��� ����.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//��� �� ������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//� ���� ������� ��� ������ �������� �� �������� �������. ���� ����� ��� � ����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//� � ����, ����� ��� ������� ��� ���� �������� �����.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//� ��� ���� � ���� �����?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//� ��� ���� ������, ������� �� ������ ��������� � �� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//����� �� ������� � ����� � ������� ���, ��� ���� ������� ������ �����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//�� ������� � ������, �� �������� �������, � � - ���� ��������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//� ���� ���� ��� ��� �� ���������� �����.
	if(Canthar_Gefallen == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//� ��� ��� � ����� �����?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//����� � ����� ���� ��������, �� �������� ������ �� ���� - ����� ������� ������.
	};
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"���, � �� ���� ����������� � ����.",DIA_Canthar_PAYPRICEINCITY_Nein);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"������, ������, � ���� ��� ������.",DIA_Canthar_PAYPRICEINCITY_Ok);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY,"� ��� �����, ���� � ��������?",DIA_Canthar_PAYPRICEINCITY_If);
};

func void DIA_Canthar_PAYPRICEINCITY_If()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//� ��� �����, ���� � ��������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//��� ����� ����� ����� � ����� �������. ���������, � ����, ��� �� ������ ���������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//���� �� ���� �������� ���������, ��� ������� ������������ ���� ����� ��������� � ������...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//���, � �� ���� ����������� � ����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//��� ���� �������� �������, ��� �������. �� �� ��� ���������.
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

func void DIA_Canthar_PAYPRICEINCITY_Ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//������, ������, � ���� ��� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//�� ��������������� ������. ���, ����� ������.
	CreateInvItems(self,ItWr_Canthars_KomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_Canthars_KomproBrief_MIS,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//� ��� � ������� �� ��� ������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//����� ��� ������� ���� ���� ������ - � ���� ��� ����� ������ ���, �� ��������� �� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//� �����, � ����� ����������� �������, ��� ��� �� ������� �������� ����.
	MIS_Canthars_KomproBrief = LOG_Running;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay();
	Log_CreateTopic(TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Canthar,LOG_Running);
	if(Canthar_Gefallen == TRUE)
	{
		B_LogEntry(TOPIC_Canthar,"������ �����, ����� � ������ ��� ������, ��� ������.");
	}
	else
	{
		B_LogEntry(TOPIC_Canthar,"������ �������� ���� ��� ������ ������ �� ��������� ��� ������.");
	};
	Log_AddEntry(TOPIC_Canthar,"� ������ ��������� ������ �������� ����, ������� ���� ����� ����������� �� � ���, ��� ��� ������� ������ �����. ����� � ������ ����� � ����� ����� � ��������� �� ���.");
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};


var int DIA_Canthar_SarahTip_Once;

instance DIA_Canthar_SARAHERLEDIGT(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SARAHERLEDIGT_Condition;
	information = DIA_Canthar_SARAHERLEDIGT_Info;
	permanent = TRUE;
	description = "��� ��� ����� �������?";
};


func int DIA_Canthar_SARAHERLEDIGT_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && !Npc_IsDead(Sarah) && (Kapitel < 3) && !Npc_KnowsInfo(other,DIA_Canthar_TooLate))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAHERLEDIGT_Info()
{
	DIA_Common_SoWhatNeedsToBeDone();
	if(DIA_Canthar_SarahTip_Once == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//�� ������� ������� ���� ����������� �����. �� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//������� ������� ������ ����, � ����� ����� � ����� � ������ ��.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//������ �� ���. � �� ������� �������� ����, �� ��������� �� ����.
		if(MIS_Canthars_KomproBrief_Day == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//� ���� ���� ��� ��� �� ���������� �����.
		};
		DIA_Canthar_SarahTip_Once = TRUE;
	};
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_SarahIsDead(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_SarahIsDead_Condition;
	information = DIA_Canthar_SarahIsDead_Info;
	permanent = FALSE;
	description = "���� ������.";
};


func int DIA_Canthar_SarahIsDead_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && Npc_IsDead(Sarah) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Canthar_SarahIsDead_Info()
{
	AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//���� ������.
	AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//������? �����������. ������, �� �������� ���� ����� ����� ��������� ������.
	B_GetCantharReward();
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Canthars_KomproBrief);
	Npc_ExchangeRoutine(self,"MARKTSTAND");
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_TooLate(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_TooLate_Condition;
	information = DIA_Canthar_TooLate_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_TooLate_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && !Npc_IsDead(Sarah) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TooLate_Info()
{
	B_Canthar_Fail();
	Canthars_KomproBrief_Failed = TRUE;
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
};


instance DIA_Canthar_Success(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Success_Condition;
	information = DIA_Canthar_Success_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Canthar_Success_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_SUCCESS) && !Npc_KnowsInfo(other,DIA_Canthar_SarahIsDead))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Success_Info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//�������. ���� ����������� ����, ��� �� ����� �����.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//� ������ �� ������, ��� ���, ���� ���� ����� ������, ������ �� ���.
	B_GetCantharReward();
	B_GivePlayerXP(XP_Canthars_KomproBrief);
};


instance DIA_Canthar_Again(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 5;
	condition = DIA_Canthar_Again_Condition;
	information = DIA_Canthar_Again_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Canthar_Again_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Again_Info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//��, ����� ��.
	if(MIS_Canthars_KomproBrief == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//������ �� �� � ������?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//���� ���������. ��� � ��� ������� ���� - � ����� ����������� ������� � ���� ������.
	}
	else if(MIS_Canthars_KomproBrief == LOG_Running)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//������, � ���������� � ����� ���. �� ������ ������ �� ���� ���� � �������.
	}
	else if(MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//����� � �� ������������ ����? ���� �� �����, ���� �� �� ����� ��, ��� � ������.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//������ ��� �������� ������, ��� �� ������ ���������.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//����� ������� - ������ �� �� ������� ������ �� �������� ������� ���� ����� �����.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//� ����, ������� ��, ������� ��� �������� ��� ����, ��� ����� ������, ������...
	B_Say_Gold(self,other,Canthar_Gold);
	AI_StopProcessInfos(self);
};


instance DIA_Canthar_Pay(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_Pay_Condition;
	information = DIA_Canthar_Pay_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Canthar_Pay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Canthar_Again) && (Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Pay_Info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//�� ����� ���������?
	Info_ClearChoices(DIA_Canthar_Pay);
	if(Npc_HasItems(other,ItMi_Gold) >= Canthar_Gold)
	{
		Info_AddChoice(DIA_Canthar_Pay,"������, � �������, �� �� ���������� ��� ������.",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice(DIA_Canthar_Pay,"� ���� ��� � ����� ������� �����...",DIA_Canthar_Pay_Nein);
	Info_AddChoice(DIA_Canthar_Pay,"������� ��� �����?",DIA_Canthar_Pay_Wieviel);
};

func void DIA_Canthar_Pay_Ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//������, � �������, �� �� ���������� ��� ������.
	B_GiveInvItems(other,self,ItMi_Gold,Canthar_Gold);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(����������) ������. � ������ � ����������, ����� ���� ��������� ����� ��������� ������� �����.
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE;
	Info_ClearChoices(DIA_Canthar_Pay);
};

func void DIA_Canthar_Pay_Nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//� ���� ��� � ����� ������� �����...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//����� ������ ��.
	Info_ClearChoices(DIA_Canthar_Pay);
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_Pay_Wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//������� ��� �����?
	B_Say_Gold(self,other,Canthar_Gold);
};


instance DIA_Canthar_CANTHARANGEPISST(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 2;
	condition = DIA_Canthar_CANTHARANGEPISST_Condition;
	information = DIA_Canthar_CANTHARANGEPISST_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Canthar_CANTHARANGEPISST_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_CANTHARANGEPISST_Info()
{
	B_Canthar_Fail();
};


instance DIA_Canthar_MinenAnteil(C_Info)
{
	npc = VLK_468_Canthar;
	nr = 3;
	condition = DIA_Canthar_MinenAnteil_Condition;
	information = DIA_Canthar_MinenAnteil_Info;
	description = "�� �������� ���������� �����!";
};


func int DIA_Canthar_MinenAnteil_Condition()
{
	//if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_KnowsInfo(other,DIA_Canthar_WhatOffer))
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && (CantharMinenAnteil == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_MinenAnteil_Info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//�� �������� ���������� �����!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//��, � ���? ���� �� �, ��� ������.
	B_GivePlayerXP(XP_Ambient);
};

