
instance DIA_Addon_Garett_EXIT(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 999;
	condition = DIA_Addon_Garett_EXIT_Condition;
	information = DIA_Addon_Garett_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


func void B_GarettTradeIntro()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//��� ��� ������. ���� ���� ���-������ �����������, ������ � ����.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//� ���� ������� ����������� ��� ������. ����, ������ - ���, ��� ����� ���� ������������.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//����� ��������. ���� ���� ����� �������, ��� � �������.
	if(!Npc_KnowsInfo(other,DIA_Addon_Skip_News))
	{
		Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	};
};

instance DIA_Addon_Garett_Anheuern(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Anheuern_Condition;
	information = DIA_Addon_Garett_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//���� �� ��������� ��� �������������� � ����� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//��� �� �������, ��� ����� ��������, ���� � ����?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//�� ��� � ����� ����������� �� ��������� �� ������ �����!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//���, � ������ ���������� ����� � �������� ���� ������.
	if(!Npc_KnowsInfo(other,DIA_Addon_Garett_Hello))
	{
		B_GarettTradeIntro();
	};
};


instance DIA_Addon_Garett_Hello(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hello_Condition;
	information = DIA_Addon_Garett_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Addon_Greg_ClearCanyon != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//���-���. ����� ����. �������, �� �� ���� �� ���� ������� ��������?
	B_GarettTradeIntro();
};


instance DIA_Addon_Garett_Samuel(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 2;
	condition = DIA_Addon_Garett_Samuel_Condition;
	information = DIA_Addon_Garett_Samuel_Info;
	permanent = FALSE;
	description = "��� ����� �������?";
};


func int DIA_Addon_Garett_Samuel_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && (Samuel.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//��� ����� �������?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//��� ����������. � ���� ���� ������ �� ������, �������� �� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//������ ��� �� ������ �� �����, � �� �� �������.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//� �� ����������� ���� ��������� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//�� ��� ���� ������ ���������� ��������� � ��������, �������, �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//� �������-������ ����� ����� ��������� ��������� ������!
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Garett_Warez(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Warez_Condition;
	information = DIA_Addon_Garett_Warez_Info;
	description = "������ �� ��������� ���� ������?";
};


func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//������ �� ��������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//����� ���� ����� � �������, �� ������ �������� ������ ��������� �����.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//�� ��������� ������� ����� �� ��� �� �������� �������� ��������.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//�� ������ � ��� � ��������� �����, ��� ��� ��� ������ ����������� � ����.
};


instance DIA_Addon_Garett_Bandits(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Bandits_Condition;
	information = DIA_Addon_Garett_Bandits_Info;
	description = "��� �� ������ � ��������?";
};


func int DIA_Addon_Garett_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Bandits_Info()
{
	DIA_Common_WhatDoYouKnowAboutBandits();
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//�� ���� ���� ����� �������� � �����.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//�� �������� ����� ������� � ���� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//� ������ ���� �������� ��� ������� ������� �������, ����������� � ������.
};


instance DIA_Addon_Garett_Greg(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 4;
	condition = DIA_Addon_Garett_Greg_Condition;
	information = DIA_Addon_Garett_Greg_Info;
	permanent = FALSE;
	description = "��� ������� ����. ����� ��?";
};


func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//��� ������� ����. ����� ��?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//� ���� ������ ������� ������ ����� �� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//� ���� �� �� ����� �� �������������.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//�������, ��� ��������, ������ ��� ����� �������, ������� �����, ����� �� �� ������� ����.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//� ���� ��� ��������� ���-������ ������������� ������, ������� ��� �� �������� ��� ����.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//������� �� ����������� ������� � ����� ������� ������.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//������� ��, ���� ������� ���� ������� ��� � ����.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//��������� �� ��� ���-������ �������. �� ��� ��������� �� ����� ������ �����������.
};


instance DIA_Addon_Garett_Tips(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Condition;
	information = DIA_Addon_Garett_Tips_Info;
	description = "� ��� �� ��� �������� ���� ������?";
};


func int DIA_Addon_Garett_Tips_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//� ��� �� ��� �������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//������� ���� ������ ���, ��� ������ �������� ���� ������. � ����� �� ������������.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//���-������ ���?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//�� ��� ���� ��������, ��������� �� ������� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//���� ������� ��� ������. ����� ����, ���� ������� ��� ���-������ �����.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//������� � ��� ��������� ����������� ��� �����, �� ���������, ��� ��� ����� ���������.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//���� �� ��� �� �������� ���� �����������, �� ������ �����.
	MIS_ADDON_GARett_BringKompass = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kompass,"���� ������� � ������� ����������� ������. ������ ������, ��� ���� ������� ��� ���-�� �� ����� �����.");
};


func void B_GarettGiveBelt()
{
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//������ � ������� ���� ����. ��� ���� �� ����� ������ ���� �����.
	B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
};

instance DIA_Addon_Garett_GiveKompass(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 6;
	condition = DIA_Addon_Garett_GiveKompass_Condition;
	information = DIA_Addon_Garett_GiveKompass_Info;
	permanent = FALSE;
	description = "��� ���� ������.";
};


func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if((Npc_HasItems(other,ItMI_Addon_Kompass_Mis) >= 1) && (MIS_ADDON_GARett_BringKompass == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//��� ���� ������.
	B_GiveInvItems(other,self,ItMI_Addon_Kompass_Mis,1);
	Npc_RemoveInvItem(self,ItMI_Addon_Kompass_Mis);
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(��������) ��, ��� ��! ��� �� �� �����, ��� ����� ��� �����.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//�������, ��������!
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//�� ���� ��� ���� ��� �� �������.
	if(Npc_HasItems(self,ItBe_Addon_Prot_EdgPoi))
	{
		B_GarettGiveBelt();
	}
	else if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//�������, �� ����� � ���� ����.
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//�� �������� �� ���� ���������� �����... ���, ������� �� ����� ���� �����. � �����, ������ ����� �� �������.
		B_GiveInvItems(self,other,ItMi_Gold,Value_ItBE_Addon_Prot_EdgPoi);
	}
	else
	{
		CreateInvItems(self,ItBe_Addon_Prot_EdgPoi,1);
		B_GarettGiveBelt();
	};
	B_LogEntry(TOPIC_Addon_Kompass,"������ ��� ����� ���, ����� � ������ ��� ������.");
	MIS_ADDON_GARett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};


instance DIA_Addon_Garett_Francis(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 7;
	condition = DIA_Addon_Garett_Francis_Condition;
	information = DIA_Addon_Garett_Francis_Info;
	permanent = FALSE;
	description = "��� �� ������ ��� ������� � ��������?";
};


func int DIA_Addon_Garett_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//��� �� ������ ��� ������� � ��������?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//����� ����� ���, �� �������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//�� ������ ������, ����� �� ���� �������.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//�� ���� ������� �� ����� ��������� �������� ���� ������� ������� �� �������.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//���-�� �������� ������ ���������� ������ ����� �� ������ ��������.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//��������� �� ������ �������������.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//�������, ��� ���� ����� ��������.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//��-�� ������� ���� �������, ��� � ����.
	};
};


instance DIA_Addon_Garett_PERM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 99;
	condition = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//���� �������?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//� ��� ���, ��� ���� �����, ������ ����������� �� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//����� ����, ��� ���� ��������, ��� ������ ��������� � �����.
	};
};


instance DIA_Addon_Garett_Trade(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 888;
	condition = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Addon_Garett_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Trade_Info()
{
	DIA_Common_ShowMeYourGoods();
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	B_RefreshTraderAmmo(self,25);
};

instance DIA_Addon_Garett_ArmorM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 8;
	condition = DIA_Addon_Garett_ArmorM_Condition;
	information = DIA_Addon_Garett_ArmorM_Info;
	permanent = TRUE;
	description = "� ��� ������ �������� �������?";
};


func int DIA_Addon_Garett_ArmorM_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && Npc_KnowsInfo(other,DIA_Addon_Greg_JoinPirates) && (Greg_NoHelpInNW >= 2) && (Garett_Armor_Given == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_ArmorM_Info()
{
	DIA_Common_WhatAboutBetterArmor();
	AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//��� ���� ����������. (����������)
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
	Info_AddChoice(DIA_Addon_Garett_ArmorM,Dialog_Back,DIA_Addon_Garett_ArmorM_Back);
	Info_AddChoice(DIA_Addon_Garett_ArmorM,B_BuildPriceString("������ ������� ������. ������: 55/55/0/0.",VALUE_ITAR_PIR_M_Addon),DIA_Addon_Garett_ArmorM_Buy);
};

func void DIA_Addon_Garett_ArmorM_Buy()
{
	DIA_Common_GiveMeThatArmor();
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_PIR_M_Addon))
	{
		B_Say(self,other,"$ABS_GOOD");
		B_GiveArmor(ITAR_PIR_M_Addon);
		Garett_Armor_Given = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//��� ������� ����� �������� - �� ���, �����������, ����� ����� �����. ��� ��� �����������, ����� � ���� ����� ���������� ������.
	};
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
};

func void DIA_Addon_Garett_ArmorM_Back()
{
	Info_ClearChoices(DIA_Addon_Garett_ArmorM);
};

/*instance DIA_Addon_Garett_StonePlate(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 9;
	condition = DIA_Addon_Garett_StonePlate_Condition;
	information = DIA_Addon_Garett_StonePlate_Info;
	permanent = FALSE;
	description = "� ���� � ����� ���� �������� ��������. ������� �� ����� ���� �� ���?";
};


func int DIA_Addon_Garett_StonePlate_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) || Npc_KnowsInfo(other,DIA_Addon_Garett_Anheuern)) && (MIS_Addon_Morgan_SeekTraitor == LOG_SUCCESS) && Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_StonePlate_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_StonePlate_15_00_add");	//� ���� � ����� ���� �������� ��������. ������� �� ����� ���� �� ���?
	AI_Output(self,other,"DIA_Addon_Garett_StonePlate_09_01_add");	//
};*/

