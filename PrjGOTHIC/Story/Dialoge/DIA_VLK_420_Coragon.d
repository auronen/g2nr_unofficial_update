
instance DIA_Coragon_EXIT(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 999;
	condition = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Coragon_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Coragon_HALLO(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_HALLO_Condition;
	information = DIA_Coragon_HALLO_Info;
	permanent = FALSE;
	description = "���� � ������ �����?";
};


func int DIA_Coragon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//���� � ������ �����?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//���� � ���� ���� ������, �� ����� ������ ���� ������.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"� ���� �������� ��� � ����� � ����������� ��������.");
};


instance DIA_Coragon_Trade(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 2;
	condition = DIA_Coragon_Trade_Condition;
	information = DIA_Coragon_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE_v4;
	trade = TRUE;
};


func int DIA_Coragon_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Trade_Info()
{
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//������ ��� ���� ������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};


instance DIA_Coragon_WhatsUp(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 3;
	condition = DIA_Coragon_WhatsUp_Condition;
	information = DIA_Coragon_WhatsUp_Info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int DIA_Coragon_WhatsUp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Coragon_WhatsUp_Info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//�, �� ���������. �� ��������� ������� �� ������� ����� ����� ������� ���������� ����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//�� ��� ����������� ����� �� �������. ��, ����� ���� ������� �� �������� ��������.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//� ��� � ���� �� ���?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(�������) ��������� �� ���� ������� ������ ��������� �� �����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//����� ���� �� ���������. � ��� ������ �� ��������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//�� �������� ��� �������� �� ����������. ������ ��� ������ ������ �������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//���, ��� ��� ������� �������, � ���� ������ ������ � ���� ��������.
};


instance DIA_Addon_Coragon_MissingPeople(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Addon_Coragon_MissingPeople_Condition;
	information = DIA_Addon_Coragon_MissingPeople_Info;
	description = "��� �� ������ � ��������� �����?";
};


func int DIA_Addon_Coragon_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_HALLO) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Coragon_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//��� �� ������ � ��������� �����?
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//� ������, ��� ������ �� ��� ������� � ������ �����. �������������, ���� ���������, ��� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//������ ���� ������ �������� ������� �� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//�����, ���� �� �������� ���������, ��������� ��� ����� �������� �������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//�� �������, ��� ������ ���� �� �������� ������ �����, � ����� ��� ������ ����� � ���� �����. ����� ���� ��������� � ���������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//�������� �������� ����������. �� �������, ������ ��� ����������. �����, ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//����� � �������� ���������, �� �� �������� ��� �������.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//��, ��� �� �������� � ������, ���� ��� ������ ������� � ���� � �������� ��� � ���� � ����� ��������. ��� ������.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"�����, �������� �� �������� �������, � ������� ������ ����� ���-�� � ��������� �����.");
};


instance DIA_Coragon_Bestohlen(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 4;
	condition = DIA_Coragon_Bestohlen_Condition;
	information = DIA_Coragon_Bestohlen_Info;
	permanent = FALSE;
	description = "���� ��������?";
};


func int DIA_Coragon_Bestohlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Bestohlen_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//���� ��������?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//��, ��������� ����� �����. ��� ������� ���� �������� �����, � � ������ � �����, ��� �������� ����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//�� ������ � ������� �� ���������, �� ���� �������� ������� � ���������� �������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//� ��������� � ����� ���������, �� ���, ������� ��, ������ �� �����. ��� ������ ������������ ������������ ���������� �����.
	MIS_Coragon_Silber = LOG_Running;
};


var int Coragon_Bier;

func void B_Coragon_Bier()
{
	Coragon_Bier += 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//���, ������ ��� � �������� �������.
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	if(Coragon_Bier < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//��� ������ ����. ���� ������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//��������� ��������� �����!
	};
};


instance DIA_Coragon_BringSilber(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 5;
	condition = DIA_Coragon_BringSilber_Condition;
	information = DIA_Coragon_BringSilber_Info;
	permanent = FALSE;
	description = "� ������ ���� �������.";
};


func int DIA_Coragon_BringSilber_Condition()
{
	if((MIS_Coragon_Silber == LOG_Running) && (Npc_HasItems(other,ItMi_CoragonsSilber) >= 8))
	{
		return TRUE;
	};
};

func void DIA_Coragon_BringSilber_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//� ������ ���� �������.
	B_GiveInvItems(other,self,ItMi_CoragonsSilber,8);
	Npc_RemoveInvItems(self,ItMi_CoragonsSilber,8);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//������?
	B_Coragon_Bier();
	MIS_Coragon_Silber = LOG_SUCCESS;
	B_GivePlayerXP(XP_CoragonsSilber);
};


instance DIA_Coragon_Schuldenbuch(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 6;
	condition = DIA_Coragon_Schuldenbuch_Condition;
	information = DIA_Coragon_Schuldenbuch_Info;
	permanent = FALSE;
	description = "��������, ��� � ���� ����...";
};


func int DIA_Coragon_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && (SchuldBuchNamesKnown == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Schuldenbuch_Info()
{
	DIA_Common_LookWhatIGot();
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//��-�... (���������) �� ��� �� �������� ������!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//��� �� � ��� ����������� ������?
};


instance DIA_Coragon_GiveBook(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 7;
	condition = DIA_Coragon_GiveBook_Condition;
	information = DIA_Coragon_GiveBook_Info;
	permanent = FALSE;
	description = "��� ���� �����.";
};


func int DIA_Coragon_GiveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch))
	{
		return TRUE;
	};
};

func void DIA_Coragon_GiveBook_Info()
{
	DIA_Common_HereIsYourBook();
	if(ClassicLehmarBook == FALSE)
	{
		AI_PrintScreen("�������� ����� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		Npc_RemoveInvItem(other,ItWr_Schuldenbuch);
	}
	else
	{
		B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//�������! �� ���� ����. ����� ����� ���� ����� ���������� ���������.
	B_Coragon_Bier();
	B_GivePlayerXP(XP_Schuldenbuch);
};


instance DIA_Coragon_ToOV(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 9;
	condition = DIA_Coragon_ToOV_Condition;
	information = DIA_Coragon_ToOV_Info;
	permanent = FALSE;
	description = "��� ��� ������� � ������� �������?";
};


func int DIA_Coragon_ToOV_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp) && (other.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Coragon_ToOV_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//��� ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//�� ������ ����� ����������� ������. ����� ���� ������!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//����� ����� ������� � ������ �� ������������� �� ������ ����� ������. ����� �� ������� �����������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//� ���� ����� ����� ������������, ����������� � ������� � �������� � ������ �����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//��������, �� ������ ���� � ���� ���������. ��� ������� ���� ���� � ������� �������.
};


instance DIA_Coragon_Valentino(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 8;
	condition = DIA_Coragon_Valentino_Condition;
	information = DIA_Coragon_Valentino_Info;
	permanent = FALSE;
	description = "� ��� ��� ������ ���������?";
};


func int DIA_Coragon_Valentino_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Valentino_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//� ��� ��� ������ ���������?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//�� ����� �� ����������, � ��� �� ���������� ��������. � �� ������������ �� ���� ���� ������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//������ �� ��� ������� ��� ���.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//�� ���� ��� ���� � ������ �������� �� ������ ����. � �����, �������, ������������ �����, � ������� �������.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//��� ���������� ������ ����.
};


instance DIA_Coragon_News(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 1;
	condition = DIA_Coragon_News_Condition;
	information = DIA_Coragon_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Coragon_News_Condition()
{
	if(!Npc_IsDead(Valentino) && (Valentino_Day < Wld_GetDay()))
	{
		if(Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Coragon_News_Info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//������� ����� ��������� �� ���� ������������ �� �����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//������ ��� �� ��������� � ���, ��� ����� � ���� �����.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//� ��� �� ��������� ���� � ������, ������ ������ ���� � �������, ��� ��� ��������...
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//�? ��� �� ������?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//�? ����� ��� ������� ������, ��� �� ���?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//�� ������ ���-�� � ���, ��� ��� �������� � ��� �� �������� ��� �����. ��, ��� ��!
	B_RemoveEveryInvItem(Valentino,ItMi_Gold);
};


instance DIA_Coragon_Ring(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 10;
	condition = DIA_Coragon_Ring_Condition;
	information = DIA_Coragon_Ring_Info;
	permanent = FALSE;
	description = "��� - ������ ��� ������.";
};


func int DIA_Coragon_Ring_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Coragon_News) && Npc_HasItems(other,ItRi_Prot_Edge_01_Valentino))
	{
		return TRUE;
	};
};

func void DIA_Coragon_Ring_Info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//��� - ������ ��� ������.
	B_GiveInvItems(other,self,ItRi_Prot_Edge_01_Valentino,1);
	Npc_RemoveInvItems(self,ItRi_Prot_Edge_01_Valentino,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//���? �� �������...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//��� ������������ ���������.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//�� ������ �������� ��� ����������, ��� ��������� ���...
	B_GivePlayerXP(300);
};

instance DIA_Coragon_PICKPOCKET_Book(C_Info)
{
	npc = VLK_420_Coragon;
	nr = 700;
	condition = DIA_Coragon_PICKPOCKET_Book_Condition;
	information = DIA_Coragon_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(������� �������� ����� ����� �������� ������)";
};


func int DIA_Coragon_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && (SchuldBuch_Stolen_Coragon == FALSE) && Npc_KnowsInfo(other,DIA_Coragon_GiveBook) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 30))
	{
		return TRUE;
	};
};

func void DIA_Coragon_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
	Info_AddChoice(DIA_Coragon_PICKPOCKET_Book,Dialog_Back,DIA_Coragon_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Coragon_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Coragon_PICKPOCKET_Book_DoIt);
};

func void DIA_Coragon_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("�������� ����� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("�������",ConcatStrings(PRINT_PickPocketSuccess,"�������� �����.")));
		SchuldBuch_Stolen_Coragon = TRUE;
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(TOPIC_PickPocket,ConcatStrings("�������",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
};

func void DIA_Coragon_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Coragon_PICKPOCKET_Book);
};

