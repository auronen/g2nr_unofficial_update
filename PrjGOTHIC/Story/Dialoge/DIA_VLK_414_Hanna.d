
instance DIA_Hanna_EXIT(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 999;
	condition = DIA_Hanna_EXIT_Condition;
	information = DIA_Hanna_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hanna_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func int C_Hanna_ThievesGuildIsExposed()
{
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		return TRUE;
	};
	if(Andre_FoundThieves_Reported == TRUE)
	{
		if(Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2))
		{
			if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
			{
				return TRUE;
			};
		};
	};
	if(Hanna_ThievesIsDead == TRUE)
	{
		if(Hanna_ThievesIsDead_Day <= (Wld_GetDay() - 2))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void B_Hanna_ThievesCheck()
{
	if(Npc_IsDead(Cassia) || Npc_IsDead(Jesper) || Npc_IsDead(Ramirez))
	{
		Hanna_ThievesIsDead = TRUE;
		Hanna_ThievesIsDead_Day = Wld_GetDay();
	};
};

instance DIA_Hanna_Hello(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Hello_Condition;
	information = DIA_Hanna_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_Hello_Condition()
{
	if(!C_Hanna_ThievesGuildIsExposed() && (HotelDoorOpened == FALSE) && (Knows_SecretSign == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//���, ������ - ��� � ���� ������� ��� ����?
};


instance DIA_Hanna_Room(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 2;
	condition = DIA_Hanna_Room_Condition;
	information = DIA_Hanna_Room_Info;
	permanent = FALSE;
	description = "� ���� ����� �������.";
};


func int DIA_Hanna_Room_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//� ���� ����� �������.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//�� ��������� ��� ��� �� ������.
	if(Npc_KnowsInfo(other,DIA_Lothar_Schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//���� �� ��������� ������ ���, ��� � ���� �������� ���� ����� ���������...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//������� ����� ������� �� ����?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//��� ������ ��������� ���������.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//�������� ���������� ������ ���� ����������������.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//�� ����, � ���� ������������ ����� �� ���� ���������?!
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//��, ��.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//������ ��������� ����� �� ��������.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//���� ���� ��� ��� ��������.
};


instance DIA_Hanna_WhyPay(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 3;
	condition = DIA_Hanna_WhyPay_Condition;
	information = DIA_Hanna_WhyPay_Info;
	permanent = FALSE;
	description = "� ������ �������� ������ �� ���?";
};


func int DIA_Hanna_WhyPay_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//� ������ �������� ������ �� ���?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//� �� ���� �����, � ��� ��� �������.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//� ����� �������, � �����, ��� �����, ����� ����� �� ��������� ����� �� ������. ��� ���������� ��� ����.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//��, � � ������ �������, ��� ����� ��������� ������������ ������������� ���������.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//������, ����� ������� ������� ���������, ��� �������� ���������� ������ �� ��������� � �������� ����������� ������ ���������������.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//����� ����, � �����, ��� ����� ������� ������� ��������� ��� � ������.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//���� ����� ���� �������� ��������� ���������� ���� �� ������� ����������.
};


instance DIA_Hanna_WerHier(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 4;
	condition = DIA_Hanna_WerHier_Condition;
	information = DIA_Hanna_WerHier_Info;
	permanent = TRUE;
	description = "��� ����� ����� ������?";
};


func int DIA_Hanna_WerHier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Room) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//��� ����� ����� ������?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//� �������� ������������� �������� � �����.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//���.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//���� �� �����, ����� �������� � �� ��������! ��� �� ����� ����� ��������!
};


instance DIA_Hanna_City(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 5;
	condition = DIA_Hanna_City_Condition;
	information = DIA_Hanna_City_Info;
	permanent = TRUE;
	description = "��������� �������� � ������...";
};


func int DIA_Hanna_City_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//��������� �������� � ������...
	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City,Dialog_Back,DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City,"��� � ���� ������ ���-������ �����?",DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City,"�������� ��� � ������.",DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//��� � ���� ������ ���-������ �����?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//����� ��������� ����� ����� �������� ������ � �����. � �����, �� ������� ��� ���, ��� ���� �����.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//����� ���� ��������� ����� ������������� � ������ ����� ������. ����������� �� ��� ��������� ���������� �� ��������� �����.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//����� � ����� �� ������� �������� �����. ��� ����� ������� ����� �� ������.
};

func void DIA_Hanna_City_City()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//�������� ��� � ������.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//������� - ���� �� ����� ������� ������� �����������, ���� �������� �� ��, ��� ������ �� ������ �� ������� �����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//�� � ��� ���, ��� �������� ����� � ������, ��������� �������� ����������� ������. ������ ������������ ���� �������� ���� ��� ���� �����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//� ������ � ��� ���� ������� ����������� �� �������. ������� �������� ������� ����� ����������, � ������ �������� ����� ����������� ����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//����� �� �����, ��� �������� ��� �������. ��� ������ �� ��������, ����� ��� ����� � ��������� �� ������. ���� �� � ����� ����� ���� ���-�� ��������.
};


var int Hanna_PriceForLetter;

instance DIA_Hanna_AnyNews(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_AnyNews_Condition;
	information = DIA_Hanna_AnyNews_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Hanna_AnyNews_Condition()
{
	if((Kapitel >= 3) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//��� ������-�� �������, ��� ���� �� �����-�� ������� �������� ������ �����.
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"�� ����������.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews,"��, ��� �������...",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews,"��, � �����, ��.",DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//��, � �����, ��.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//��, ������ � �����. ������ ��� ������ ������ � ����. ��� ��� ���� �����?
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//��, ��� �������, �...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//��� ������� �� ����, ������� �� ���� ����� ����������, �� ������ �������?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//� �� ����� �����, ��� ��.
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	DIA_Common_YouAreWrong();
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//��, ��������� ����� ����... � ��������� ������� � ���� ������ ���� � ������� ����� ������ ���� ��������, ���������� � ������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//�� ����� � ��������, ��� � ���� �� ������� ������ ���������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//� �����, �� ��� �������� ��������� � ������ ���� ����.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//�� �� ��� �� ������� ��� ���?
	MIS_HannaRetrieveLetter = LOG_Running;
	Log_CreateTopic(TOPIC_HannaRetrieveLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter,LOG_Running);
	B_LogEntry(TOPIC_HannaRetrieveLetter,"� ����� ������ ��������. ������, �� ������ � ������, ���, ��� ����� ��������� �������.");
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"� ���� �� ������� �� ����������.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews,"��� � �� ��� ������?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews,"� ��������.",DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//� ���� �� ������� �� ����������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//������� - �������� ������� ������� ������� �������� ��� ����. ������, ��� �������� �������� ���� �����.
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//��� � �� ��� ������?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//���, � ����� - �� �� �����, ��� ���� ���� ��������� �������� �����.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//��� ��� �� ������ �������� �� ������ �������?
	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews,"�����, ������.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews,"��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews,"������.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//�����, ������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//��, ���� ������� ������� � ���� ��� ����. ���� �� ��������� ��� ���� ��������, � ��� ���� 75 �������.
	Hanna_PriceForLetter = 75;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//��, �� ���! �... �������� ������! ����������� ������!
	MIS_HannaRetrieveLetter = LOG_FAILED;
	B_CheckLog();
	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//���� ����� ���� ���������� ������? ����� - � �������� ���� �������� � 50 �������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//���� �� ������� ������� ��� ���� ��������, � ��� ���� 50 ������� �����.
	Hanna_PriceForLetter = 50;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//� ��������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//�� ����� ��������. � ����� ���� �����!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//���� �� ��������� ��� ��� ������, ���� ���� �������.
	Hanna_PriceForLetter = 200;
	Info_ClearChoices(DIA_Hanna_AnyNews);
};


instance DIA_Hanna_ThisLetter(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 31;
	condition = DIA_Hanna_ThisLetter_Condition;
	information = DIA_Hanna_ThisLetter_Info;
	permanent = FALSE;
	description = "�� ���� �������� ����� � ����?";
};


func int DIA_Hanna_ThisLetter_Condition()
{
	if((MIS_HannaRetrieveLetter == LOG_Running) && Npc_HasItems(other,ItWr_ShatteredGolem_MIS) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//�� ���� �������� ����� � ����?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//��, ������ ���. �������.
	B_GiveInvItems(other,self,ItWr_ShatteredGolem_MIS,1);
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//��� ������ ���� �������?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//�� ��� ������. ��� ���� ������.
	CreateInvItems(self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems(self,other,ItMi_Gold,Hanna_PriceForLetter);
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};


instance DIA_Hanna_PICKPOCKET(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 900;
	condition = DIA_Hanna_PICKPOCKET_Condition;
	information = DIA_Hanna_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int DIA_Hanna_PICKPOCKET_Condition()
{
	return C_Beklauen(45,25);
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,Dialog_Back,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};


instance DIA_Hanna_AusKeller(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 11;
	condition = DIA_Hanna_AusKeller_Condition;
	information = DIA_Hanna_AusKeller_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hanna_AusKeller_Condition()
{
	if(((HotelDoorOpened == TRUE) || (Knows_SecretSign == TRUE)) && !C_Hanna_ThievesGuildIsExposed())
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if(HotelDoorOpened == TRUE)
	{
		if(Knows_SecretSign == TRUE)
		{
			AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(�����������) �������� �� ����! �� ������ ����� ������? �?
			AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(��������) �...
			AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(�������) � ����!
		}
		else
		{
			AI_Output(self,other,"DIA_Hanna_Add_17_27");	//������... �� ������?
			AI_Output(other,self,"DIA_Hanna_Add_15_28");	//� ����� ���-��� ���������� � ����� �������...
			AI_Output(self,other,"DIA_Hanna_Add_17_29");	//��� �� ����� � ���� �������?!
			AI_Output(other,self,"DIA_Hanna_Add_15_30");	//�� ��������� ������ ���!
			AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(�������) � �� ����, � ��� �� ��������...
		};
	};
	if(Knows_SecretSign == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(������������) �� ������ ���. � ��� ����.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//���� � �� ����� ������� ���-������ �����, �����?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//�� �� ����� ���� ��������� ���������� �������� � �����.
	};
	B_Hanna_ThievesCheck();
	AI_StopProcessInfos(self);
};


instance DIA_Hanna_Schuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Schuldenbuch_Condition;
	information = DIA_Hanna_Schuldenbuch_Info;
	permanent = FALSE;
	description = "��������, ����� � ���� ���� �����!";
};


func int DIA_Hanna_Schuldenbuch_Condition()
{
	if(Npc_HasItems(other,ItWr_Schuldenbuch) && (SchuldBuchNamesKnown == TRUE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//��������, ����� � ���� ���� �����!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//�������� ������. ��� ���� ��� �������?
	DIA_Common_Well();
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//��, ��� ����� ������� ������ ��������� - ��� ������. �� �����, ���� �� ����� � ����...
};


instance DIA_Hanna_GiveSchuldenbuch(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_GiveSchuldenbuch_Condition;
	information = DIA_Hanna_GiveSchuldenbuch_Info;
	permanent = FALSE;
	description = "��� - ������ ��� �����.";
};


func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_Schuldenbuch) && Npc_HasItems(other,ItWr_Schuldenbuch) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//��� - ������ ��� �����.
	B_GiveInvItems(other,self,ItWr_Schuldenbuch,1);
	DIA_Common_17_Thanks();
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//������ ��� � �������� �������.
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//��� ��� ����� �� ���� ���?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//��� ���� �� ����, ������� � ���������.
};


instance DIA_Hanna_Blubb(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb_Condition;
	information = DIA_Hanna_Blubb_Info;
	permanent = TRUE;
	description = "� ������ ��� � �������?";
};

func int DIA_Hanna_Blubb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) && (Knows_SecretSign == TRUE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//� ������ ��� � �������?
	if(!Npc_IsDead(Cassia) && !Npc_IsDead(Jesper) && !Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_38");	//��. �� ���� ����� �� �������� �� ����...
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_39");	//� ����� ��� �� ������ ��.
		AI_Output(self,other,"DIA_Hanna_Add_17_40");	//�, �������, ����� ����, ����� � ���� ����� ����� � �������, ��� � ��� ����.
		B_Hanna_ThievesCheck();
	};
};

instance DIA_Hanna_Blubb2(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb2_Condition;
	information = DIA_Hanna_Blubb2_Info;
	permanent = TRUE;
	description = "�� ����� � ������ �����?";
};

func int DIA_Hanna_Blubb2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hanna_AusKeller) && (Knows_SecretSign == FALSE) && (Andre_FoundThieves_KilledByMilitia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb2_Info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//�� ����� � ������ �����?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(����� ���������) � �� �������, � ��� �� ��������...
	B_Hanna_ThievesCheck();
};


instance DIA_Hanna_Blubb3(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb3_Condition;
	information = DIA_Hanna_Blubb3_Info;
	important = TRUE;
};

func int DIA_Hanna_Blubb3_Condition()
{
	if(C_Hanna_ThievesGuildIsExposed())
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb3_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	CreateInvItem(self,ItSc_IceCube);
	CreateInvItem(self,ItSc_Firestorm);
	CreateInvItem(self,ItKe_ThiefGuildKey_Hotel_MIS);
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_32");	//����� ���� ���������... ���-�� ������ ���� �������!
		if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
		{
			AI_Output(self,other,"DIA_Hanna_Add_17_33");	//��� ��� ������ �� ������ ����������, �� ������ � �� ���� ������!
		};
		AI_Output(self,other,"DIA_Hanna_Add_17_34");	//� �������, ��� ��� ��...
	}
	else
	{
		B_Say(self,other,"$YOUMURDERER");
	};
	B_SelectSpell(self,other);
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//� ������ ��� ���������� ��� ����.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//��� �������� ��� � ����������� �����. �� ��� ���� ������ �� �����, ������...
	B_KillThievesGuild();
	if(MIS_CassiaRing == LOG_Running)
	{
		MIS_CassiaRing = LOG_FAILED;
	};
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_FAILED;
	};
	if(MIS_RamirezSextant == LOG_Running)
	{
		MIS_RamirezSextant = LOG_FAILED;
	};
	B_CheckLog();
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Hanna_PICKPOCKET_Book(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 700;
	condition = DIA_Hanna_PICKPOCKET_Book_Condition;
	information = DIA_Hanna_PICKPOCKET_Book_Info;
	permanent = TRUE;
	description = "(������� �������� ����� ����� �������� ����������)";
};


func int DIA_Hanna_PICKPOCKET_Book_Condition()
{
	if((ClassicLehmarBook == FALSE) && Npc_HasItems(self,ItWr_Schuldenbuch) && Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) && (other.attribute[ATR_DEXTERITY] >= 35))
	{
		return TRUE;
	};
};

func void DIA_Hanna_PICKPOCKET_Book_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
	Info_AddChoice(DIA_Hanna_PICKPOCKET_Book,Dialog_Back,DIA_Hanna_PICKPOCKET_Book_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET_Book,DIALOG_PICKPOCKET,DIA_Hanna_PICKPOCKET_Book_DoIt);
};

func void DIA_Hanna_PICKPOCKET_Book_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 45)
	{
		Npc_RemoveInvItem(self,ItWr_Schuldenbuch);
		CreateInvItem(other,ItWr_Schuldenbuch);
		AI_PrintScreen("�������� ����� ��������",-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		B_GiveThiefXP();
		B_LogEntry(Topic_PickPocket,ConcatStrings("�����",PRINT_PickPocketSuccess));
	}
	else
	{
		B_ResetThiefLevel();
		B_LogEntry(Topic_PickPocket,ConcatStrings("�����",PRINT_PickPocketFailed));
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
};

func void DIA_Hanna_PICKPOCKET_Book_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET_Book);
};

instance DIA_Hanna_Blubb4(C_Info)
{
	npc = VLK_414_Hanna;
	nr = 1;
	condition = DIA_Hanna_Blubb4_Condition;
	information = DIA_Hanna_Blubb4_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Hanna_Blubb4_Condition()
{
	if((Andre_FoundThieves_KilledByMilitia == TRUE) && Npc_KnowsInfo(other,DIA_Hanna_Blubb3) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hanna_Blubb4_Info()
{
	B_Say(self,other,"$KILLENEMY");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

