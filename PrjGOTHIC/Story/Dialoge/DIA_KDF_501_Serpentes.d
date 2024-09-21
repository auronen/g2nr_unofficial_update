
instance DIA_Serpentes_EXIT(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 999;
	condition = DIA_Serpentes_EXIT_Condition;
	information = DIA_Serpentes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Serpentes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Serpentes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOTALK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOTALK_Condition;
	information = DIA_Serpentes_NOTALK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Serpentes_NOTALK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Knows_Fire_Contest == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(��������) �� ������������� ���������� �� ���, ���������? ����������� � ����� ������.
	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK,Dialog_Ende_v1,DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK,"� ���� ���� ��� ���� ������...",DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//� ���� ���� ��� ���� ������...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(� ������) ������, �� �� ���������. � �����, ����� �������� � �����, � ����� ���. ��� �� � ���� ���������?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//� ������ ����������� � ������!
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	DIA_Common_IHaveToGo_v1();
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_GOAWAY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_GOAWAY_Condition;
	information = DIA_Serpentes_GOAWAY_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_GOAWAY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_NOTALK) && Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//���� ����������� ����� ������� �� ������ � ���������� ��������, �� ����� � ����� �������, ���������!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_YOURSTORY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 24;
	condition = DIA_Serpentes_YOURSTORY_Condition;
	information = DIA_Serpentes_YOURSTORY_Info;
	permanent = FALSE;
	description = "� ������, ��� �� ������ ��������� �����.";
};


func int DIA_Serpentes_YOURSTORY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulthar_TEST) && (other.guild == GIL_NOV) && !Npc_KnowsInfo(other,DIA_Pyrokar_MAGICAN) && (MIS_Golem != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//� ������, ��� �� ������ ��������� �����.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//�� ���� �������� ��� ����������� � �������� ���� �� ����. ��� ���������, ��� �������� ������ ��� ���������, ������.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(��������������) ���� �� ����� �������� ������ ��� ���������. ���� ��� ����. ����� ����� � ���������, �, ��������, ����� ��������� ��� �� ������ ������.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//� ���� ������ ��� ���������.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//���� ������ ���� ������, �� ��������. �� ���� ��� - �� �� ������.
};


instance DIA_Serpentes_TEST(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_TEST_Condition;
	information = DIA_Serpentes_TEST_Info;
	permanent = FALSE;
	description = "� ����� ������ ���� ���������, ������.";
};


func int DIA_Serpentes_TEST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//� ����� ������ ���� ���������, ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//����, �� ������ ������������� ����� ���������. ������ ����� ������������ ���������� ������� �����. �� �������� - ��� �� ���, ��� ���� �����������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//���������� �� �� ����, ����� ������ ��� ���������? � ��� � ���� ������ ��������� ��� ���������, ��� ��������� ����?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//���� ���, �� ��������� �� ��� ����� ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//� ������ ������: � ����� ������ ����� ����, ��� ������� �� ��� ������ - ����� ����, ��� �����-�� ��� ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//������ ����, ���� ������ ������� - �������� ������ � ����� ������, ������� � ����������� ������ - � �������� ���.
	Wld_InsertNpc(MagicGolem,"FP_MAGICGOLEM");
	B_InitNpcGlobals();
	MIS_Golem = LOG_Running;
	Log_CreateTopic(TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem,LOG_Running);
	B_LogEntry(TOPIC_Golem,"��������� ��� ��� ���������. �� �����, ����� � ����� '����, ��� �����-�� ��� ������', ����� �����, � ������� ���.");
};


instance DIA_Serpentes_NOIDEA(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOIDEA_Condition;
	information = DIA_Serpentes_NOIDEA_Info;
	permanent = FALSE;
	description = "� ����� ������? ��� �� �������� ��� ������ ����?";
};


func int DIA_Serpentes_NOIDEA_Condition()
{
	if((MIS_Golem == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOIDEA_Info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//� ����� ������? ��� �� �������� ��� ������ ����?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//� ������ ���� ���. (� ��������) ��� ��� ��������� ������� ���� ������� �������?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//������ �� �������, ��� �������� ������ ��������� ����� - � ������ �� ���� �������� �� ���� �������.
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOHELP(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOHELP_Condition;
	information = DIA_Serpentes_NOHELP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_NOHELP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_NOIDEA) && (MIS_Golem == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && (!Npc_KnowsInfo(other,DIA_Ulthar_TEST) || Npc_KnowsInfo(other,DIA_Serpentes_YOURSTORY)))
	{
		if(!Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(� ����������) ��� � �������� ���� ������, ���������!
	AI_StopProcessInfos(self);
};


func void B_ReturnHolyHammer()
{
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//� ����� �����, ���� � ������ ���� �����.
	Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
	AI_PrintScreen("��������� ����� ������",-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	GarwigThiefOneTime = FALSE;
};

instance DIA_Serpentes_SUCCESS(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 3;
	condition = DIA_Serpentes_SUCCESS_Condition;
	information = DIA_Serpentes_SUCCESS_Info;
	permanent = FALSE;
	description = "� ������� ������.";
};


func int DIA_Serpentes_SUCCESS_Condition()
{
	if((MIS_Golem == LOG_Running) && (other.guild == GIL_NOV))
	{
		if(Npc_IsDead(Magic_Golem))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//� ������� ������.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//���? �� ������������� ������ ���? �� ��� ������ ������ �� ������� �� �� ���� ���������� ����� ������.
	if(!Npc_IsDead(Garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(� ����������) ��� �� �����, � ������ ��������, ��� �� �������� �������, ������� � ��� ����.
		if(Npc_HasItems(other,Holy_Hammer_MIS))
		{
			B_ReturnHolyHammer();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(������������) �� �� ����� ����! ��� �� ���� �������!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//�� �������� ��������� �� �������� ����� ������!!!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_HumanMurderedHuman,0);
	};
	MIS_Golem = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};


instance DIA_Serpentes_PERM(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 99;
	condition = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent = TRUE;
	description = "�� ������ ���-�� ��� ������� ���?";
};


func int DIA_Serpentes_PERM_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//�� ������ ���-�� ��� ������� ���?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//���. ���� ���, ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//��������. �� ������, ��� ���� ����� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_MinenAnteile(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 30;
	condition = DIA_Serpentes_MinenAnteile_Condition;
	information = DIA_Serpentes_MinenAnteile_Info;
	important = TRUE;
};


func int DIA_Serpentes_MinenAnteile_Condition()
{
	if((Pedro_Traitor == TRUE) && (Kapitel >= 3))
	{
		if(other.guild == GIL_KDF)
		{
			if(!Npc_IsDead(Salandril))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Matteo))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Bosper))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Zuris))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Elena))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Orlan))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Hakon))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Rosi))
			{
				return TRUE;
			};
			if(!Npc_IsDead(Canthar))
			{
				return TRUE;
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			if(!Npc_IsDead(Salandril))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//�� ��� ������. � ���� ���� ��� ���� ������� ��� ����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(��������) ��� ���?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//������, ����� �� ������������ � �������� ����, �� ����� ������ ��������� �����������, ������������� ������ ���������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//������� ���������� �� ������ ��������� ����� - ��� �����, ��� �� ������, �������� ��������� ���������� � ������� ������������� ����������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//��������� ������, � ������� ��� �������� ����� ����, ��������� ��������� ��������, � � ���� ����� ����������� ��� � ��������.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"� ���� � ��� ��� ����� �������. ����� ����-������ ���.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"�� ��� ��� ���?",DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"����� ��� �� ������ ���������?",DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//������� ����� ���� ��� �� ����� ������ ��� � ���� �������.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"����� ���� ������� �������� �� ����������, ������!",DIA_Serpentes_MinenAnteile_nein_sld);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"���� � ������ �����?",DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenAnteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//����� ��� �� ������ ���������?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//��������� �������� ������ �� �����. ��� ���� ����� ����� ������ ������ �����������.
};

func void DIA_Serpentes_MinenAnteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//� ���� � ��� ��� ����� �������. ����� ����-������ ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(�������) ��� �������������. ���� ������� �� ������� ������ ������ �����, ���� �� �� ������� ��������� ������ ��� ��������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//� �������� ���� �������. �������, ������ ����� �� ���������� - ����� �� ����� �������.
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_nein_sld()
{
	AI_Output(other,self,"DIA_Vatras_Mission_No_15_00");	//����� ���� ������� �������� �� ����������, ������!
	B_Say(self,other,"$YESGOOUTOFHERE");
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//�� ��� ��� ���?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//���-�� � ������ ������� ��������� ����� ���� ������ �������������� �������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//��� ������ ��������� ���������� � �� ����� ������� ��������. �� ��� ��, ��� ����� ������� �������� � ������������ ����� �����, ��� �� �� ����� ��������� ���� � ������� ��������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//���� �������� ���������������� ����� ����� �� ����� �������� ������������ ���������� � ������ � �������� ���������, � ��� ���� ������� ������� ���� ���������� ����� ��������� �� ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//����� ����� ��������� � ������� ��� ����. � ����� ������� ������� �� �� �������� ������� � ����������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//��� ���� ������ ����� �������������, ���� ������ ���� ���������.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"� �������� ��������� ���� ������.",DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenAnteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//� �������� ��������� ���� ������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//��� ����. ����� �� ������ ������������� � ����� ����������, �����, ����� ��� �� ������, ��� �� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//� �����, ��� ������� ������� ��, �� ��������� ��������� ����� � ����� ����, ���� ������, ��� �� ���������� �� ��������� ������, ���������?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//��.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//����� �� ������. � ����� ���� ������, ����.
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	MIS_Serpentes_MinenAnteil_KDF = LOG_Running;
	if(!Npc_IsDead(Salandril))
	{
		CreateInvItems(Salandril,ItWr_MinenAnteil_MIS,2);
		SalandrilMinenAnteil_MAINCounter += 2;
	};
	if(!Npc_IsDead(Matteo))
	{
		CreateInvItems(Matteo,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Bosper))
	{
		CreateInvItems(Bosper,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Zuris))
	{
		CreateInvItems(Zuris,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Elena))
	{
		CreateInvItems(Elena,ItWr_MinenAnteil_MIS,2);
		SalandrilMinenAnteil_MAINCounter += 2;
	};
	if(!Npc_IsDead(Orlan))
	{
		CreateInvItems(Orlan,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Hakon))
	{
		CreateInvItems(Hakon,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Rosi))
	{
		CreateInvItems(Rosi,ItWr_MinenAnteil_MIS,1);
		SalandrilMinenAnteil_MAINCounter += 1;
	};
	if(!Npc_IsDead(Canthar))
	{
		CreateInvItems(Canthar,ItWr_MinenAnteil_MIS,3);
		SalandrilMinenAnteil_MAINCounter += 3;
	};
	Log_CreateTopic(TOPIC_MinenAnteileKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteileKDF,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteileKDF,"���-�� ������� ��������� ����� ����� � ����������� ����� ���������� ��������. � ������ ����� ����, ��� ������� ��� ����� ���������. ��������� ����� ���������� ��� ��� ���������� ���������.");
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//���� � ������ �����?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//�, �����. ������, ������� ��. ��� ���� ������� ���������, ��, ������ ������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//���������, ������� �� �������� ��������, ������� � ��������� ������������ � ��� ����� �������� �� ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//������ �� ������������ ������� � ��������� ��� ����. ������� ��� ����.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//��� �� �������� ���, ���� �� �������. �� ��, ������� ��, ������ ������������.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"����� ��� �� ������ ���������?",DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"��� �������. � ������ ���.",DIA_Serpentes_MinenAnteile_was_jaSLD);
};


var int MIS_Serpentes_BringSalandril_SLD;

func void DIA_Serpentes_MinenAnteile_was_jaSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//��� �������. � ������ ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//������. �� ������� �������� �� ���� ������� ����� ��������� ����.
	MIS_Serpentes_BringSalandril_SLD = LOG_Running;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	Log_CreateTopic(TOPIC_MinenAnteileSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteileSLD,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteileSLD,"� ������ ��������� ����������, �������� �� ������� ����� ��������, � ��������� ��� ����. ���� �� �������� ����������, ��� �� ��� ��������, ���� ��� ������ ������ �� ���.");
};


var int SerpentesMinenAnteilCounter;
var int AllMinenAnteilFound;

instance DIA_Serpentes_MinenAnteileBringen(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 2;
	condition = DIA_Serpentes_MinenAnteileBringen_Condition;
	information = DIA_Serpentes_MinenAnteileBringen_Info;
	permanent = TRUE;
	description = "������ ���������� �����...";
};


func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if((MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_HasItems(other,ItWr_MinenAnteil_MIS) && (other.guild == GIL_KDF))
	{
		if(Npc_HasItems(other,ItWr_MinenAnteil_MIS) > 1)
		{
			DIA_Serpentes_MinenAnteileBringen.description = "� ���� ����� ��������� ����� ����.";
		}
		else
		{
			DIA_Serpentes_MinenAnteileBringen.description = "� ���� ����� ����� ����.";
		};
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int SerpentesMinenAnteilGeld;
	var int MinenAnteilLeft;
	SerpentesMinenAnteilCount = Npc_HasItems(other,ItWr_MinenAnteil_MIS);
	if(SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//� ���� ����� ����� ����.
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//� ���� ����� ��������� ����� ����.
	};
	B_GiveInvItems(other,self,ItWr_MinenAnteil_MIS,SerpentesMinenAnteilCount);
	Npc_RemoveInvItems(self,ItWr_MinenAnteil_MIS,SerpentesMinenAnteilCount);
	B_GivePlayerXP(SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
	SerpentesMinenAnteilCounter += SerpentesMinenAnteilCount;
	MinenAnteilLeft = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCounter;
	if(MinenAnteilLeft > 0)
	{
		AI_PrintScreen(ConcatStrings(PRINT_MinenAnteilLeft,IntToString(MinenAnteilLeft)),-1,YPOS_ItemTaken,FONT_ScreenSmall,3);
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//����� ������. �� ������ ������ �� ��������� ��� �����. ��� ������ ��� ����� �����. ������� �� ��� ���.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//���. ��� ������������ ���� �������.
	}
	else if(AllMinenAnteilFound == FALSE)
	{
		AI_PrintScreen(PRINT_AllMinenAnteil,-1,YPOS_ItemTaken,FONT_ScreenSmall,3);
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//��� ��� �����, ��� ��� �������.
		if(SerpentesMinenAnteilCount == 1)
		{
			AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//��� ������������� ��������� �����, ��?
		};
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//�������. �� �������� �������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//������ ���� �������� ������. �� ������� ���� ������ �� ����, ������� ��� ������ ������� ����.
		CreateInvItems(self,ItAm_Prot_Mage_01,1);
		B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
		AllMinenAnteilFound = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOTBAD");
	};
	SerpentesMinenAnteilGeld = SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer;
	CreateInvItems(self,ItMi_Gold,SerpentesMinenAnteilGeld);
	B_GiveInvItems(self,other,ItMi_Gold,SerpentesMinenAnteilGeld);
};


instance DIA_Serpentes_GOTSalandril(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 32;
	condition = DIA_Serpentes_GOTSalandril_Condition;
	information = DIA_Serpentes_GOTSalandril_Info;
	description = "� ����, ��� ���� ��� ����� � ���������.";
};


func int DIA_Serpentes_GOTSalandril_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//� ����, ��� ���� ��� ����� � ���������. ��� ���������, ������� �� �������� �������� ������.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//����� ������� ��� ����. ��� ����, ��� �������� � ���.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_SalandrilHERE(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilHERE_Condition;
	information = DIA_Serpentes_SalandrilHERE_Info;
	description = "��������� �����, � ���������.";
};


func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (MIS_Serpentes_BringSalandril_SLD != FALSE))
	{
		if(!Npc_IsDead(Salandril) && (Salandril_SentToMonastery == TRUE))
		{
			if(Npc_GetDistToWP(Salandril,"ALTAR") < 5000)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//��������� �����, � ���������.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//�������. �� ���������� � ��� �����.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//��� ���� �������. � ������ �� ����� �� ����, �������?
		CreateInvItems(self,ItMi_Gold,400);
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};


instance DIA_Serpentes_SalandrilDEAD(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilDEAD_Condition;
	information = DIA_Serpentes_SalandrilDEAD_Info;
	description = "��������� �����.";
};


func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (MIS_Serpentes_BringSalandril_SLD != FALSE))
	{
		if(Npc_IsDead(Salandril) && !Npc_KnowsInfo(other,DIA_Serpentes_SalandrilHERE))
		{
			return TRUE;
		};
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//��������� �����.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//��� �, ������, ��� ���� �� �������� ��������������. �� �������� ����� ��� ��� ������ �����.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

