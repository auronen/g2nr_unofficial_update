
instance DIA_Garvell_EXIT(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 999;
	condition = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garvell_PICKPOCKET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 900;
	condition = DIA_Garvell_PICKPOCKET_Condition;
	information = DIA_Garvell_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Garvell_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItSe_GoldPocket25))
	{
		return C_CanStealFromNpc(10);
	};
	return FALSE;
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,Dialog_Back,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	B_StealItem(10,ItSe_GoldPocket25);
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};


instance DIA_Garvell_GREET(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_GREET_Condition;
	information = DIA_Garvell_GREET_Info;
	description = "��� �� ������� �����?";
};


func int DIA_Garvell_GREET_Condition()
{
	if(Wld_IsTime(5,0,19,10))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//� ����� �������, ������ ��� � ���� �������� ������ - � ��� �������, ��� �����.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//�� ���� �� ����, ��� ���� ������, ���� ������� ������� �� ����� ��������.
};


instance DIA_Garvell_eilig(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_eilig_Condition;
	information = DIA_Garvell_eilig_Info;
	description = "������ �� ��� ����������?";
};


func int DIA_Garvell_eilig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//������ �� ��� ����������?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//����� ������ ���� � ������ ����� �����.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//������ �� ��� �������?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//������, �� ������, ��� �������� ������ �������? ������, ��� �� �������, ��� �����?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//� ����� ����. ��� �����, ������ ��� ����� �� ��� ������� ����. � ��� �� �������� ��� �������.
};


instance DIA_Garvell_Schiff(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_Schiff_Condition;
	information = DIA_Garvell_Schiff_Info;
	description = "������ �� �� ������ ��������� �������?";
};


func int DIA_Garvell_Schiff_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//������ �� �� ������ ��������� �������?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//��, � ��� ������ �������. ����� ���� ��� �� ����� �������� � �� ������� ����� �� �������.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//� ���� ����� �� �������� ������� �� ������� ����������, � ��������� ������ ��� ���� ������� ������.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//��� ����� �������� �� ����� ����������. ���� ����� ��������� ������� �������, � ������� ������� ������ ������ ������, ������� ����� ����������� �� ���� �����.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//��� ����� ��� ������ ����� ��������!
	if(MissingPeopleReturnedHome == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//� ���� �� ���� �� ���� ������ ������ �������� ��������� �� ������. � ������� ���������, ��� ��� ��� ������� �������� ���������.
	};
};


instance DIA_Addon_Garvell_MissingPeople(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeople_Condition;
	information = DIA_Addon_Garvell_MissingPeople_Info;
	description = "� ���� ������ �������?";
};


func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//� ���� ������ �������?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//��. ��� ����� �����. �� ��� ����� ����������� � �������.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//��� ������� ������, ��������, ������������� ������ �� �����-������ �����. �� ���� ���� ������� ��� �����.
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//����� � ��������� ��� �� ����� �����?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(�������) ������ ��� �� �� ���������� ������ �� ������ ��� ��� �����.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"������� �������� �� ������ ��������� �����, ������� �� ����� �� ������ ��������� ���� �����. ������� ������, ��� ����� ������ � ��������.");
};

instance DIA_Addon_Garvell_MissingPeopleMore(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 5;
	condition = DIA_Addon_Garvell_MissingPeopleMore_Condition;
	information = DIA_Addon_Garvell_MissingPeopleMore_Info;
	description = "� ������, ��� ��������� � ������ ����.";
};


func int DIA_Addon_Garvell_MissingPeopleMore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garvell_MissingPeople) && (MissingPeopleReturnedHome == FALSE) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeopleMore_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//� ������, ��� ��������� � ������ ����.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//� ��� � � ������! ������ ������� �������...
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//����� ����� ����������� ��� ������� �������. ������ ��� �������� ������.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//� ������, ��� �� ���� ���� ����� ����.
	SCKnowsFarimAsWilliamsFriend = TRUE;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		B_LogEntry(TOPIC_Addon_WhoStolePeople,"������, ����� ����� ���-�� ����� �� ������������ ������ ����� �������.");
	}
	else
	{
		B_LogEntries(TOPIC_Addon_WhoStolePeople,"������, ����� ����� ���-�� ����� �� ������������ ������ ����� �������.");
		Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		B_LogNextEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	};
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeopleMore);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeopleMore,Dialog_Back,DIA_Addon_Garvell_MissingPeopleMore_BACK);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeopleMore,"��� ��� ����� ����� ������?",DIA_Addon_Garvell_MissingPeopleMore_Farim);
};

func void DIA_Addon_Garvell_MissingPeopleMore_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeopleMore);
};

func void DIA_Addon_Garvell_MissingPeopleMore_Farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//��� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//�� �����. �����, �� ������� ��� ����� �� ������� ������� ���������. �� � �� ������.
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"������ ������ ��������� ���������� �� ������ ������� ���������.");
};

instance DIA_Garvell_ReturnMonty(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 99;
	condition = DIA_Garvell_ReturnMonty_Condition;
	information = DIA_Garvell_ReturnMonty_Info;
	description = "��� ������������ ����?";
};


func int DIA_Garvell_ReturnMonty_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_Schiff) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//��� ������������ ����?
	if(!Npc_IsDead(Monty_NW))
	{
		AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//����� ��������! ������ �� ������� �������.
		AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//����� ����, ������ ��� � ������� ��������� �������...
		B_GivePlayerXP(XP_Ambient);
	}
	else if(MIS_Garvell_Infos == LOG_Running)
	{
		AI_Output(self,other,"DIA_Garvell_Add_04_00");	//� ������ �����, ������� � ���� �������� ������� �� ��������� �����.	
	}
	else if(MIS_Garvell_Infos == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Success_04_00");	//������� �� ����������. ���� �� �����, � ��� ������� ������ ������� �� ��������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//��, � ��� ������ �������. ����� ���� ��� �� ����� �������� � �� ������� ����� �� �������.
	};
};


instance DIA_Garvell_MISSION(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_MISSION_Condition;
	information = DIA_Garvell_MISSION_Info;
	permanent = FALSE;
	description = "���� � ���-������ ������?";
};


func int DIA_Garvell_MISSION_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_eilig) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//��, ������. ������, ��� ��������� ��������. � ���� �����, ����� ��� �����.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//� � ������ �����, ������������� �� ���� ���������� ������� �� ��� � ��� ������ �� ������ ��� ���������.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//������ �� ���� ������� ������ ������ ���������� �� ������.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//������ ������� ��� ��� ����������, ��� �����������.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//� ������ �����, ������� � ���� �������� ������� �� ��������� �����.
	MIS_Garvell_Infos = LOG_Running;
	Knows_Ork = TRUE;
	Log_CreateTopic(TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell,LOG_Running);
	B_LogEntry(TOPIC_Garvell,"������� ����� �������� ���������� �� ����� � � ���� �������� ���������.");
};

func void B_GarvellInfoCheck()
{
	Tell_Garvell += 1;
	if(Tell_Garvell >= 3)
	{
		AI_Output(self,other,"DIA_Garvell_Success_04_00");	//������� �� ����������. ���� �� �����, � ��� ������� ������ ������� �� ��������� �����.
		MIS_Garvell_Infos = LOG_SUCCESS;
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//������. ���� ��� ���-������ ��������, ��� ��� �����.
	};
	if(EnterOW_Kapitel2 == FALSE)
	{
		B_GivePlayerXP(100);
	}
	else if(Kapitel == 2)
	{
		B_GivePlayerXP(75);
	}
	else if(Kapitel == 3)
	{
		B_GivePlayerXP(50);
	}
	else if(Kapitel > 3)
	{
		B_GivePlayerXP(25);
	};
};

instance DIA_Garvell_Orks(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 3;
	condition = DIA_Garvell_Orks_Condition;
	information = DIA_Garvell_Orks_Info;
	permanent = FALSE;
	description = "� ���� ���� ���������� �� �����.";
};


func int DIA_Garvell_Orks_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && ((RangarToldAboutPaladins == TRUE) || Npc_KnowsInfo(other,DIA_Garond_NeedProof)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//� ���� ���� ���������� �� �����.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//����������.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//��� �������� � ������ ��������, �, ������, ��� ���������� �������� ���.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//����� ����� ���� ���������, �������� �������� ������.
	B_GarvellInfoCheck();
};


instance DIA_Garvell_Paladine(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 2;
	condition = DIA_Garvell_Paladine_Condition;
	information = DIA_Garvell_Paladine_Info;
	permanent = FALSE;
	description = "� ����, ����� �������� �����.";
};


func int DIA_Garvell_Paladine_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//� ����, ����� �������� �����.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//������? ����� ���!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//�������� �����, ����� �������� ���������� ���� � ������ ��������, � �� ������, ��� ��� ������� ��������� ����� �� �����.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//��� ������ ��� ������� ����, ��� �������� �� �������.
	B_GarvellInfoCheck();
};


instance DIA_Garvell_City(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 4;
	condition = DIA_Garvell_City_Condition;
	information = DIA_Garvell_City_Info;
	permanent = FALSE;
	description = "��� �������� ���� ����� ������...";
};


func int DIA_Garvell_City_Condition()
{
	if((MIS_Garvell_Infos == LOG_Running) && ((RangarToldAboutOrc == TRUE) || Npc_IsDead(CityOrc)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//��� �������� ���� ����� ������...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//����?
	if(Npc_IsDead(CityOrc))
	{
		DIA_Common_HeIsDead();
	}
	else
	{
		AI_Output(other,self,"DIA_Garvell_City_15_02");	//�� �������� ������ ����. ��������� ������ ����������� � ���.
	};
	B_GarvellInfoCheck();
};


instance DIA_Garvell_Perm(C_Info)
{
	npc = VLK_441_Garvell;
	nr = 13;
	condition = DIA_Garvell_Perm_Condition;
	information = DIA_Garvell_Perm_Info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int DIA_Garvell_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//��� ���������� � ������?
	if(MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//���� ����� ��� � �����, � �� ����������� � ������?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//� ������ �����...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//����� ������� �������� � ���, ��� � ������ ������������ ��������, ����� ������� ��� ������.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//���� ������, ����� ����� ���� �������, � �� ����������� ���������. � ��� �� ����� �� �������� ��� ��������������� ��.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//�������� ������, ����� ����� ��� ������ �� ����������.
	};
};

