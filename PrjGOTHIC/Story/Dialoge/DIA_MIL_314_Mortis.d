
instance DIA_Mortis_EXIT(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mortis_Hallo(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Mortis_Hallo_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
	{
		if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	}
	else if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	if(!Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
	{
		AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//��� ���� �����? ���� ����� ���. � ��� ���� �� ������ �� ��������. ������ �����.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//�� ������ ��� ������� � ���� ����? ��, ����� ����� ����������.
	};
};


instance DIA_Mortis_Waffe(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 3;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Waffe_Info;
	permanent = FALSE;
	description = "� ��� ���?";
};


func int DIA_Mortis_Waffe_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && !Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//� ��� ���?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//�� ������ ��� ������� � ���� ����? ��, ����� ����� ����������.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//��� ���� � ����� ��� �����. ����� ���������, ��� �� ���������� ���� � ������� ������.
};


instance DIA_Mortis_Paket(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 4;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = "�� ���-������ ������ � ���� ������?";
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//�� ���-������ ������ � ���� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//��... ��������� ���, ����� � ��� � �������� ������, � ������, ��� ������ ������� �� ���� � �����-�� ������.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//��� ��� �� ������?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//������� �� ����. �� �� ������, ��� ����� �������� ����� ��� �������� ����� - � ����� ��� ����� ����� ��� ������ ����.
	B_LogEntry(TOPIC_Warehouse,"������ ������, ��� ���������� ������ � ���-�� ��� ������������� � ���� � �������� �������. ��� ���������, ��� ����� ������� ���.");
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_Redlight_Condition;
	information = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = "� ���� ����� ����, ��� ������� �������� �����.";
};


func int DIA_Mortis_Redlight_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//�� ������ ������ �������� �������? � ���� ����� ����, ��� ������� �������� �����.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//��-�... ����� ��� �� �������� �������������, � ��� �� ����� ������ �� ������ ���������� ���������.
	};
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//���� �� ������ ��������� ���-���� ���, ���� �����... ���, �� ������ ����� ���� �������.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//������, � ��� ������?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//����� � ������� - ��������, ����� ������ ����� ��� �������. ���� ���� ������ ������� ���-���� ������, �� �� ������� ��� ���.
	B_LogEntry(TOPIC_Redlight,"������ ��������, ��� ���� � ���� ������ �������� ����� � �������� ��������, ��� ����� ����� ���� �������. ����� ����� �������� ������� � ������� ��� �������.");
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 6;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//� ���� ����� �������.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//�������. ���� � ���� ���������� �����, � ���� ������������� ����.
		if(!Npc_KnowsInfo(other,DIA_Wulfgar_AlsMil))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"��������� ������ ����� ������ ��� �������� ��� ����.");
		};
		Mortis_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//�������, ������. �� ���� �� �� ������� ����� �� ��� ��� ���������, � �� ���� �������� ����.
	};
};


func void B_BuildLearnDialog_Mortis()
{
	if(other.aivar[REAL_STRENGTH] >= 150)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//�� � ��� ���������� �����. ���� �� �� ���������� � ��������, ����� ���� ������� �������.
	}
	else
	{
		Info_ClearChoices(DIA_Mortis_Teach);
		Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
		Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH,1)),DIA_Mortis_Teach_1);
		Info_AddChoice(DIA_Mortis_Teach,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH,5)),DIA_Mortis_Teach_5);
	};
};

instance DIA_Mortis_Teach(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
	description = "������.";
};


func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//������.
	B_BuildLearnDialog_Mortis();
};

func void DIA_Mortis_Teach_BACK()
{
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,1,150))
	{
		B_BuildLearnDialog_Mortis();
	};
};

func void DIA_Mortis_Teach_5()
{
	if(B_TeachAttributePoints(self,other,ATR_STRENGTH,5,150))
	{
		B_BuildLearnDialog_Mortis();
	};
};

instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return C_Beklauen(38,60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

instance DIA_Mortis_RepairNecklace(C_Info)
{
	npc = MIL_314_Mortis;
	nr = 8;
	condition = DIA_Mortis_RepairNecklace_Condition;
	information = DIA_Mortis_RepairNecklace_Info;
	permanent = FALSE;
	description = "�� ������ ������ �������������?";
};


func int DIA_Mortis_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		if(!Npc_KnowsInfo(other,DIA_Bennet_ShowInnosEye))
		{
			return TRUE;
		};
	};
};

func void DIA_Mortis_RepairNecklace_Info()
{
	DIA_Common_CanYouRepairJewelry();
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//��, ������ ���� � �����!
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	AI_StopProcessInfos(self);
};

