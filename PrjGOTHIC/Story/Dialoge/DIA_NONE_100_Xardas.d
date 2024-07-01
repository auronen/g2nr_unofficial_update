
instance DIA_Xardas_FirstEXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 990;
	condition = DIA_Xardas_FirstEXIT_Condition;
	information = DIA_Xardas_FirstEXIT_Info;
	permanent = FALSE;
	description = "� ���������� ����������� � ����!";
};


func int DIA_Xardas_FirstEXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstEXIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//� ���������� ����������� � ����!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//������! � ��� ����: �� ������ ������, ��� ������������ �� ����. �, ������ �����, �� ������ �� ���� �����!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//� ��� ���, ��� � ������ �� ���, ���� ���� ������� ���� ������� - � ��� ����� ������.
	AI_StopProcessInfos(self);
	B_Kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


var int Xardas_GoodLevelComment;

instance DIA_Xardas_EXIT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 999;
	condition = DIA_Xardas_EXIT_Condition;
	information = DIA_Xardas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Xardas_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EXIT_Info()
{
	if((other.guild == GIL_NONE) && (other.level > 10) && (Xardas_GoodLevelComment == FALSE))
	{
		AI_Output(self,other,"DIA_Xardas_Hello_14_02_add");	//�� ����� ������������ ���� ����.
		Xardas_GoodLevelComment = TRUE;
	};
	B_ClearFakeItems(other);
	AI_StopProcessInfos(self);
};


var int Addon_zuerst;

func void B_Xardas_SoLittleTime()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(���������) � ��� ����� ���� �������.
};

instance DIA_Xardas_Hello(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_Hello_Condition;
	information = DIA_Xardas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_Hello_Condition()
{
	return TRUE;
};

func void DIA_Xardas_Hello_Info()
{
	NewLogEnabled = TRUE;
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_00");	//�������-��! (���������) � � �� �����, ��� ��� � ����� ��������� ����������� �����.
	AI_Output(other,self,"DIA_Addon_Xardas_Hello_15_01");	//� �������� ���� ���, ����� ��� ������ �������� ��� ����� ������.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_02");	//��� ��� � ����. �� ����� ������ ��������� ����� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_03");	//� ��� ����� ���������, ��� �� ����� �������� ���� ��-��� �������� �����.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_04");	//�� ������ �� ����. ������-�� �� �����.
	AI_Output(self,other,"DIA_Addon_Xardas_Hello_14_05");	//� ��� ���� ������� ����� ������.
	Info_ClearChoices(DIA_Xardas_Hello);
	Info_AddChoice(DIA_Xardas_Hello,"��, �� ������� ����, � ��� ������ ���������� �������. � ������ ���. ������ ���������.",DIA_Addon_Xardas_Hello_Dragons);
	Info_AddChoice(DIA_Xardas_Hello,"��� ��� �� ����� ������, � ������� �� ��������?",DIA_Addon_Xardas_Hello_Man);
};

func void DIA_Addon_Xardas_Hello_Man()
{
	PlayVideo("Intro_ADDON.BIK");
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_01");	//(����������������) ���� �����.
	AI_Output(other,self,"DIA_Addon_AddonIntro_15_00");	//(���������) ...����?
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_02");	//(����������������) ��� ������� ����� ��������� ��������� ���.
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_03");	//����� ������� ��� ����������� � ����, ������� �� ����� ������ � �� ��� ����� �� ����� ��������������.
	AI_Output(self,other,"DIA_Addon_AddonIntro_14_04");	//������� � ����� ���� ��� ������ �������� � ������.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_10");	//�� ������ ����� �� ���������! ��� ������������ ������ ���������� �������.
	Addon_zuerst = TRUE;
};

func void DIA_Addon_Xardas_Hello_Dragons()
{
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//��, �� ������� ����, � ��� ������ ���������� �������. � ������ ���. ������...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//... ��� ������. �� ������� ���, ��, ��� ��� - �� �� � ����� ����� ���������� �����, ������� ����������� ������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_05");	//�� �������� �� �����?
	AI_Output(self,other,"DIA_Xardas_Hello_14_06");	//� ������ � ������� ����� ������� ���������.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//����� ��������� �������� ������ ������ ������ � �������� ����� ����.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//��� ��� ������ ���� ��������� ����. ����� ����, �������� ��� ��� ������� ������������.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//��� ��������� �������� ����: �����! � ��� �����. ���. ���� �������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(���������) �������?
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//��� �������� ������� ����. � �������� �� ����������� - ���� �����.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//� ��� ������� ������ ���� ����� ����� �� ������ �������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//� ��� ��� ����� ������?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//������ ���� ����� ��������� �������� ������, � ������ �������� ����� ��������, � ��� ��������� � �����.
	if(Addon_zuerst == TRUE)
	{
		B_Xardas_SoLittleTime();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Xardas_Hello_Dragons_14_06");	//�� ��� ��� �� ���. ���� ��� ���-���, ��� �������� ���. �� ���� � ����� ���� �������.
		Info_ClearChoices(DIA_Xardas_Hello);
		Info_AddChoice(DIA_Xardas_Hello,"��� ��� �� ����� ������, � ������� �� ��������?",DIA_Addon_Xardas_Hello_Man);
	};
};


instance DIA_Xardas_AWAY(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_AWAY_Condition;
	information = DIA_Xardas_AWAY_Info;
	permanent = FALSE;
	description = "����� ����� ��������� ������� ������ ����!";
};


func int DIA_Xardas_AWAY_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Xardas_TODO))
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//����� ����� ��������� ������� ������ ����!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//���� �� ������ ������, ��� ����� ���� �������� ���� ������� � ���������.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//��� ������ ������ � �����, ������� �����, �� ����� ���������� �� �� ����, ��� ����� ���� ����� ��������� ������������.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//� ��� �� ����� ������� ����� ��� �����.
};


instance DIA_Xardas_TODO(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_TODO_Condition;
	information = DIA_Xardas_TODO_Info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int DIA_Xardas_TODO_Condition()
{
	return TRUE;
};

func void DIA_Xardas_TODO_Info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//�� ���� ��� ����� ��� �� ����������. ������ ���� ������ ����� ������ ��� � ������ ������ ���� ��������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//� ������ �������, ��� ���������� ������, ����������� ����� ���������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//��� �������� ������� ����������, ������� ����� ������ ��� �������� ���� ��������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//��� �������� ��� '���� ������'. �� ������ ��������� ���� ����������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//�������� ��������� � ������������� ������. �� ������ ������� �� ������������ ���������� ���!
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_07");	//� ����� ����� �� ������ ����� �������� �������.
	AI_Output(self,other,"DIA_Addon_Xardas_Add_14_08");	//��� ����������������� ����� ������. �� �� ������ ������� � ���� ���.
	if(C_WorldIsFixed())
	{
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_017");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_018");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_019");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_019");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_021");
		Wld_InsertNpc(Waran_Rest,"SOME_NW_WAYPOINT_021");
		Wld_InsertNpc(Keiler,"SOME_NW_WAYPOINT_029");
		Wld_InsertNpc(Keiler,"SOME_NW_WAYPOINT_029");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_054");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_054");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_061");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_061");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_041");
		Wld_InsertNpc(Waran,"SOME_NW_WAYPOINT_041");
		Wld_InsertNpc(Giant_Rat,"SOME_NW_WAYPOINT_049");
		Wld_InsertNpc(Giant_Rat,"SOME_NW_WAYPOINT_049");
		Wld_InsertNpc(Meatbug,"SOME_NW_WAYPOINT_037");
		Wld_InsertNpc(Meatbug,"SOME_NW_WAYPOINT_037");
		Wld_InsertNpc(YGiant_Bug,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_03");
	}
	else
	{
		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_02");
		Wld_InsertNpc(Waran,"FP_ROAM_INSEL_01");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_07");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_08");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_09");
		Wld_InsertNpc(Waran_Rest,"FP_ROAM_INSEL_10");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
		Wld_InsertNpc(Keiler,"FP_ROAM_XARDAS_SECRET_23");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_08");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_15");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
		Wld_InsertNpc(Waran,"FP_ROAM_XARDAS_SECRET_04");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(Giant_Rat,"FP_ROAM_XARDAS_SECRET_27");
		Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(Meatbug,"FP_ROAM_XARDAS_SECRET_01");
		Wld_InsertNpc(YGiant_Bug,"NW_XARDAS_TOWER_WATERFALL_CAVE_SIDE_02");
	};
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_Running);
	B_LogEntry(TOPIC_INNOSEYE,"� ������ ������� ������������ ����� ���������. ��� �������� ������� ����������: ������ ������. ��� ���� ������ ������ ��� ���������� �� ��������. � ������ ������� ���������, ��� ��� ����� ���������� ���� ������.");
};


instance DIA_Addon_Xardas_StonePlate(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Addon_Xardas_StonePlate_Condition;
	information = DIA_Addon_Xardas_StonePlate_Info;
	description = "��� �� ������ ������� �� ���� �������� ��������?";
};


func int DIA_Addon_Xardas_StonePlate_Condition()
{
	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_StonePlate_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_StonePlate_15_00");	//��� �� ������ ������� �� ���� �������� ��������?
	//AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_01");	//Ich habe so eine unten in der H�hlen vor meinem Turm gefunden.
	//AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_02");	//Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_03");	//������� � ����������, ��� ��� ���������� ��������, �� ����� ������ � ������, ��� ������� �������� ��� �� �����.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_04");	//� �� ���� ��������� ������������ ������� �� ��������, ��, ������, ��� ��������� � ������� �����-�� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Xardas_StonePlate_14_05");	//���� ������, ������ ������� �������� ����. ��� ��� �� � ����.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Xardas_Portal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_Portal_Condition;
	information = DIA_Addon_Xardas_Portal_Info;
	description = "���� ���� ����� ������, ������� � ��������������� ����� �������...";
};


func int DIA_Addon_Xardas_Portal_Condition()
{
	if((SC_KnowsPortal == TRUE) && !C_ScHasMeleeBeliarsWeapon() && !C_SCHasBeliarsRune() && (Saturas_KlaueInsMeer == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_00");	//���� ���� ����� ������, ������� � ��������������� ����� �������...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_01");	//��� ���������...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_02");	//��� ������ �� ������� ���-������, ��� ������������� ������ ��� ������, ��� ��� �����!
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_03");	//���-�� ��� ����� ���� ������� �������� �������. �� ������ ����� ���!
};


instance DIA_Addon_Xardas_PortalAgain(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_PortalAgain_Condition;
	information = DIA_Addon_Xardas_PortalAgain_Info;
	permanent = TRUE;
	description = "������ ���� ����������� ����� �������...";
};


func int DIA_Addon_Xardas_PortalAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_Portal) && !C_ScHasMeleeBeliarsWeapon() && !C_SCHasBeliarsRune() && (Saturas_KlaueInsMeer == FALSE) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_17");	//������ ���� ����������� ����� �������...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_18");	//���� �� ���������� ������. �����������, ���� ������� ���-������ ������������� ��������.
};


func void B_Xardas_ClawIsLost()
{
	if(XardasKnowsAboutDestroyedClaw == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_13");	//(������) �� ����� � ���?! �� �� ���� �� ���������, ��� �� �����?
	};
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_14");	//��� ������ ����� �� ��������� ��� �������� ������!
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_15");	//� �����, ��� � ������ ���������� �����.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_16");	//(��������) ���� ����� ������������...
};

func void B_Xardas_ClawReaction()
{
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_08");	//(�����) ��� ���������...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_09");	//��� ������ ����� ��� ����� ������. �� ��� ����� � ����� ������.
	B_GivePlayerXP(XP_Ambient * 3);
};

instance DIA_Addon_Xardas_AddonSuccess(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Addon_Xardas_AddonSuccess_Condition;
	information = DIA_Addon_Xardas_AddonSuccess_Info;
	description = "� ���������� ����������� ����� �������...";
};


func int DIA_Addon_Xardas_AddonSuccess_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_03");	//� ���������� ����������� ����� �������...
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_04");	//� ��� �� �����?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_05");	//��� ��������� ���, ��� � ��� ���� ����� ������ �������.
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//������ �������?! ��� �� ������? �� � ���� � �����?
	if(C_ScHasMeleeBeliarsWeapon())
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_07");	//��, ��� ��.
		CreateInvItem(other,ItMw_BeliarWeapon_Fake);
		AI_UseItem(other,ItMw_BeliarWeapon_Fake);
		AI_Wait(other,0.5);
		AI_WaitTillEnd(self,other);
		B_Xardas_ClawReaction();
		AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_10");	//���� ����������! � ����� �������, �� ������� ������!
	}
	else if(C_SCHasBeliarsRune())
	{
		AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//� ������ ����.
		B_Xardas_ClawReaction();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_11");	//� ���� ��� ������ ���...
		if(Saturas_KlaueInsMeer == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//� ����� ��� ����� ����, ����� ��� ������� ��� � ����...
			XardasKnowsAboutDestroyedClaw = TRUE;
		};
		B_Xardas_ClawIsLost();
	};
};


instance DIA_Xardas_WhereIsClaw(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 77;
	condition = DIA_Xardas_WhereIsClaw_Condition;
	information = DIA_Xardas_WhereIsClaw_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_WhereIsClaw_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Xardas_AddonSuccess) && (XardasKnowsAboutDestroyedClaw == FALSE) && (Saturas_KlaueInsMeer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereIsClaw_Info()
{
	AI_Output(self,other,"DIA_Addon_Xardas_AddonSuccess_14_06");	//������ �������?! ��� �� ������? �� � ���� � �����?
	AI_Output(other,self,"DIA_Addon_Xardas_AddonSuccess_15_12");	//� ����� ��� ����� ����, ����� ��� ������� ��� � ����...
	XardasKnowsAboutDestroyedClaw = TRUE;
	B_Xardas_ClawIsLost();
};


instance DIA_Xardas_WEAPON(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_WEAPON_Condition;
	information = DIA_Xardas_WEAPON_Info;
	permanent = FALSE;
	description = "��� ����� ������.";
};


func int DIA_Xardas_WEAPON_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//� ���� ���� ���� ������ �� ��������, ��� � ���� ���� �����.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//�������� � ���� �����. �� ������ ����� ���, ��� ��������� ���� ��������.
};


instance DIA_Xardas_ARTEFAKT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 2;
	condition = DIA_Xardas_ARTEFAKT_Condition;
	information = DIA_Xardas_ARTEFAKT_Info;
	permanent = FALSE;
	description = "� ��� ����� ���� '���� ������'?";
};


func int DIA_Xardas_ARTEFAKT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//� ��� ����� ���� '���� ������'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//��� ������. ������� ������, ��� ��� ����� ������ ����� ����� ���� � ���� ������.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//�� ����������� ����� ����� ���������� ���� � ������� ��� �������� ��������.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//����� �� �������� � ������� �������� �������������. � �������� ���� ������, ����� ���� ������ ����� � ���� � �����.
};


instance DIA_Xardas_PALADIN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 3;
	condition = DIA_Xardas_PALADIN_Condition;
	information = DIA_Xardas_PALADIN_Info;
	permanent = FALSE;
	description = "� ������ �������� ������ ������ ��� ���� ���� ������?";
};


func int DIA_Xardas_PALADIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PALADIN_Info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//� ������ �������� ������ ������ ��� ���� ���� ������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//������ ��� �� ���, ���� ������� ������������� ������ ���.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//� ������ ���� ��� ��������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//���� ��������� ������ �������� ���. ��� ����� ������ �� ���: �� ������� �������. ���� �� ���� �� ����������� ����, �� �� ����� ��� ��� �����.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//�����������, ��� �� ����, � ��� ������������� ������������� ������ ���� ������. � ������ �������� ������, ��� ��� ������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//���� ��� �������� ����, ��� ����� ������ ���. ����� �� �������� ���, ��� �������� ��������� ���������.
};


instance DIA_Xardas_Khorinis(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 4;
	condition = DIA_Xardas_Khorinis_Condition;
	information = DIA_Xardas_Khorinis_Info;
	permanent = FALSE;
	description = "� ��� ��� ��������� �� ������?";
};


func int DIA_Xardas_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_TODO) && (PlayerEnteredCity == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//� ��� ��� ��������� �� ������?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//������ ��� �� ��������, ������� ������ ����� ����. ����� �������, �� ��� �� ����������.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//�� ���� ���������! ���� � ����� ����� ����������. � �� ������ ������ �� ��� �����, ��� ��� ������.
};


instance DIA_Xardas_WhereEx(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 6;
	condition = DIA_Xardas_WhereEx_Condition;
	information = DIA_Xardas_WhereEx_Info;
	permanent = FALSE;
	description = "� ��� ������ �� ������ ���������?";
};


func int DIA_Xardas_WhereEx_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//� ��� ������ �� ������ ���������?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//��� � ��� ������, ���������� �� ������ �������.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//� �������� ��� ����� �����.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//�� ���� ������ ����� ��������� ���� � ��� ���, ��� �� ���� � ������ ��������...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//�����, ������� � ������ ��� ������������� ���� �����, ��������� ����������� ������...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//��, ������ �� ���.
};


instance DIA_Xardas_EQUIPMENT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 7;
	condition = DIA_Xardas_EQUIPMENT_Condition;
	information = DIA_Xardas_EQUIPMENT_Info;
	permanent = FALSE;
	description = "� ��� � ����� ����� ���������� �������?";
};


func int DIA_Xardas_EQUIPMENT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_WEAPON) && Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//� ��� � ����� ����� ���������� �������?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//��������� �����, ��� �� ������� ��������� ��������� ������ � ������� - ����� �������.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//�� �����, � ������, �� ������� ����� �������� �����, ������� ������� ����, ���� �� ������ ����� � ���.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//������ ����� ������ �� ���� �����? ������ � ������ ����� ��������� ������.
};


instance DIA_Xardas_ABOUTLESTER(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 5;
	condition = DIA_Xardas_ABOUTLESTER_Condition;
	information = DIA_Xardas_ABOUTLESTER_Info;
	permanent = FALSE;
	description = "�� ��� ��������� � ��������?";
};


func int DIA_Xardas_ABOUTLESTER_Condition()
{
	if((Lester_SentToXardas == TRUE) && (Kapitel < 3))
	{
		if(!Npc_IsDead(Lester))
		{
			if(Npc_GetDistToWP(Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Xardas_ABOUTLESTER_Info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//�� ��� ��������� � ��������?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//��, � ������ ������� ��� ���������. �� ������ ���� ���������� ���, �� �� ��������� �������.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//��� ����� ����, ��� ��� ������� ������. � �������� ��� � �������.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//��� �� ��������� ����?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//�����, ��� ������ ��������. �� ����� �� ������ �������, �� ��� � ����� � ������ ������ � ����������.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//�?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//���� ��� ���� ����������, �� �� ����������� ����� ������������ ������.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//� ��� ��� �� ��������. ���, ������ ������. ��� ������� ���� �� �����.
	B_GiveInvItems(self,other,ItRi_Prot_Mage_03,1);
	B_GivePlayerXP(XP_AmbientKap2);
};


instance DIA_Xardas_FirstPal(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 10;
	condition = DIA_Xardas_FirstPal_Condition;
	information = DIA_Xardas_FirstPal_Info;
	permanent = TRUE;
	description = "� ��� � ������...";
};


func int DIA_Xardas_FirstPal_Condition()
{
	if((PlayerEnteredCity == TRUE) && (Kapitel < 3) && (XardasKnowsAboutProof == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_FirstPal_Info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//� ��� � ������...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//�? �� ���� ���������� � ������������� ���������?
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//���� � ���� �� ���������...
		AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//����! ������ ���� ������ ��������� � ���.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//���� ��� ��������� �� ���������, ������ � ���������.
			AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//���, ��������, ������������ ����� � ����� ������ ������, �� ��� ���� ���� ��, ��� ���� �����.
		};
		AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//���� �� ������ �����, ��� �������� ����������� � �����.
	}
	else if(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		DIA_Common_Yes();
		if(Kapitel == 2)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//�� �� �������� ���� � ������ ��������, ����� � ����� ��� �������������� ����� ����!
			AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//��� ��� �� ��������������?
			AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//� ������ ��������� ����� ������ �������������� ������������� ��������.
			AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//�� ������ ����������� �������� ������ �����. ������� ���� ���.
			XardasKnowsAboutProof = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//������. ��� �� ������?
			DIA_Common_NothingImportantYet();
			B_Xardas_SoLittleTime();
		};
	}
	else
	{
		DIA_Common_NoNotYet();
		B_Xardas_SoLittleTime();
	};
	if((LesterMovedToXardas == FALSE) && (Lester_SentToXardas == TRUE))
	{
		AI_Teleport(Lester,"NW_XARDAS_TOWER_IN1_14");
		B_StartOtherRoutine(Lester,"XARDAS");
		LesterMovedToXardas = TRUE;
		//����� �������, ����� DIA_Xardas_ABOUTLESTER ���������� ��������� � ������ ��������� �����
		AI_StopProcessInfos(self);
	};
};


instance DIA_Xardas_Weiter(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 99;
	condition = DIA_Xardas_Weiter_Condition;
	information = DIA_Xardas_Weiter_Info;
	permanent = TRUE;
	description = "� ��� ��� ������ ������?";
};


func int DIA_Xardas_Weiter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_Weiter_Info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//� ��� ��� ������ ������?
	if(XardasKnowsAboutProof == FALSE)
	{
		AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//�� ������ ����������� �������� ������ �����. ������� ���� ���.
	};
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//�� ������ ������ ���� ������, � � ���� ���������� ������ ������.
};


instance DIA_Xardas_KdfSecret(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 9;
	condition = DIA_Xardas_KdfSecret_Condition;
	information = DIA_Xardas_KdfSecret_Info;
	permanent = FALSE;
	description = "������ ���� ���� �� ������ ����� � ����?";
};


func int DIA_Xardas_KdfSecret_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) && !Npc_KnowsInfo(other,DIA_Pyrokar_SPOKETOVATRAS))
	{
		return TRUE;
	};
};

func void DIA_Xardas_KdfSecret_Info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//������ ���� ���� �� ������ ����� � ����?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//�����-�� � ��� ������ ������ �����. ���� ����� � ����������, ��� ������������ ����� ����� ���� ������ � ����� ����������� �������.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//�� ��� ���� �� �� ��� �� ������� ��������� ������ ����� ����������� ����� ����.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//������� � ������� ����, ����� ������� ������ �����.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//��� ������������, �������� � ������ ����� ����, (����������) '����������� ������', ������ ����� '������' � '��������������', ������� �� ����� ����������.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//��� �������, ��� � ��� ��� ���, �� ��� ������� �� �����, ��� ������ ���� - � ��� ������.
};


instance DIA_Xardas_HelloKap3(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 1;
	condition = DIA_Xardas_HelloKap3_Condition;
	information = DIA_Xardas_HelloKap3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Xardas_HelloKap3_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_HelloKap3_Info()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_00");	//�������-��! � ����� ���� ������� ������� ���� ����.
};


instance DIA_Xardas_BACKFROMOW(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 31;
	condition = DIA_Xardas_BACKFROMOW_Condition;
	information = DIA_Xardas_BACKFROMOW_Info;
	description = "� �������� �� ������ ��������.";
};


func int DIA_Xardas_BACKFROMOW_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//� �������� �� ������ ��������.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//����� ����. � ��� �� ��� �����?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//�� ��� ����. ��� ��� ����� �������, ���� ������ ������ �����.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//���� �������� �����, � ������� ���������� ��� ������.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//�������� �������, ������ ��� ��� ������� �� �������, ���� � �� ��������.
	B_GivePlayerXP(XP_AmbientKap3);
};


instance DIA_Xardas_DMTSINDDA(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 32;
	condition = DIA_Xardas_DMTSINDDA_Condition;
	information = DIA_Xardas_DMTSINDDA_Info;
	description = "���, ���� ������, ��������� �����?";
};


func int DIA_Xardas_DMTSINDDA_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//���, ���� ������, ��������� �����?
	if(Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//������ ������, ��� �� ����� ������ ���� ��� ����� �������.
	};
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//���� �����, ��� �� ��������� �� ����� ����, � ��������� ��������� ������ ������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//�� ��������� ��� ������. ��� ��������� ��� ����� �� ���� � �������� �� �������� �����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//���� � ������ ��������. ����� ��� ����� �� ����, ������ ����� ����� �����. �� ������ ��� ���������� ������� ��������.
	B_LogEntry(TOPIC_INNOSEYE,"����� ������ ��������, ��� � ��� ���� ������. ��� ����� ��������� ����� ���, ���� ��� �� ������� ������.");
	Info_ClearChoices(DIA_Xardas_DMTSINDDA);
	if((Lester_SentToXardas == TRUE) && !Npc_KnowsInfo(other,DIA_Xardas_ABOUTLESTER))
	{
		Info_AddChoice(DIA_Xardas_DMTSINDDA,"�� ��� ��������� � ��������?",DIA_Xardas_ABOUTLESTER_Info);
	};
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"���� ��������� ���� � ������ �������.",DIA_Xardas_DMTSINDDA_DMT);
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"�, �������, ����� ��������������, ������� �������� �� ���� ���� �����.",DIA_Xardas_DMTSINDDA_Beweis);
};

func void DIA_Xardas_DMTSINDDA_DMT()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//���� ��������� ���� � ������ �������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//� ����� ����� �������. ������ - ���� �� ���. ��� ��, ��� �������������� �������� ��� �����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//��� ������ ������� � �������������� ������, � ������ ������ ���� ����������� ���������� �������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//������� �� ��� ��������. ��� ������� ����, � ��� ���������� �� ��� �� �� �� ����� ���������� ����.
	if(hero.guild == GIL_KDF)
	{
		if(MIS_DementorsOrigins == FALSE)
		{
			Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_Running);
			MIS_DementorsOrigins = LOG_Running;
		};
		B_LogEntry(TOPIC_DEMENTOREN,"������� �����, ��� ����� ��� ���� � ������ �����. ������, ������ ������ ���������� ���� �� ��������� �����, � ��� ����� ������.");
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//�, �������, ����� ��������������, ������� �������� �� ���� ���� �����.
	if(XardasKnowsAboutProof == FALSE)
	{
		AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//��� ��� �� ��������������?
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//� ������� ������ �� �������, ������������ ��������� � ������ ��������. � ��� �� ������ � ������������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//����� ������ ���� ����������, ����� ������� ������������� ��������. �������.
	Info_AddChoice(DIA_Xardas_DMTSINDDA,"� ����� ����� ��� ��������� ���?",DIA_Xardas_DMTSINDDA_DMT_WhatToDo);
	XardasKnowsAboutProof = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//� ����� ����� ��� ��������� ���?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//��� � ������ ����� ������ ������ �� �������, � ������� �� ����, ����� �� �������� ���� ����� ���� ������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//����� ��� � ���������, � �������� � ���������. �� ������ ���� ���� ����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//������ ��� ������ ����� �������, ��� ���������� ������������ ����� ���������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//���, ���� ��� �� ������� ������. ���� ����� ���������� �������� �� ���� ���� ����.
	B_LogEntry(TOPIC_INNOSEYE,"���� ��������� � ��������� ����� ����. � �������, ��� ���� ����� ����������� ��� ������ � ����, ����� � ������� ��� ������ �� ����� �������. ��������� ��� ������� �� �������� ��� ������ ���� ������ ��� ��������� ������.");
};


instance DIA_Xardas_INNOSEYEBROKEN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 33;
	condition = DIA_Xardas_INNOSEYEBROKEN_Condition;
	information = DIA_Xardas_INNOSEYEBROKEN_Info;
	description = "���� ������ ��� ���������.";
};


func int DIA_Xardas_INNOSEYEBROKEN_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA) && (Npc_HasItems(other,ItMi_InnosEye_Broken_MIS) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//���� ������ ��� ���������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//��� �� ��������? ���������!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//� ����� ��� � �������� ����� - � ���������, ��� ������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//��� ��� ��� ������������ ���� ������������� ���� ��������. � �� ��������� ���!
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_AmbientKap3);
	Info_ClearChoices(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice(DIA_Xardas_INNOSEYEBROKEN,"� ��� ������?",DIA_Xardas_INNOSEYEBROKEN_wasnun);
};

func void DIA_Xardas_INNOSEYEBROKEN_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//� ��� ������?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//��� ����������� ����. �� ������ �������������. � ������ ����������, � ��� ��������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//� ��� ��������, �� ����������� � ����� � �������� � ��������, ����� ����. ��������, �� �����, ��� ����� ������.
	B_LogEntry(TOPIC_INNOSEYE,"������� ������� �� ����� ������� ������������ ����� ������. ��� ���� ������ � ������ �������, ��������, ���� ������������ �������.");
	MIS_Xardas_GoToVatrasInnoseye = LOG_Running;
};


func void B_XardasGivesProofForPyrokar()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//������� ������������ ������� ������� � �������.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//������� �� ����� �������� �������������� ����, ��� �� ����� �������� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//��, �������! �������. ��� ���������.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//���� ������ ����� ���������� ���������� �����������. �� � �����, � ���� ���� ���-���, ��� ������� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//����� � ������� ����� ����� ����, � ���� � ����� �� ��������� ��������� �����.
	/*if(Npc_GetDistToWP(self,"NW_XARDAS_START") <= 2000)
	{
		AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_05");	//Now that I've built my tower so close to town, I have to be prepared. Someone could come here and look for them at anytime.
	};*/
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//� �� �����, ����� �������� ��� ���� ���� ����������� ��� � ���� ����� ����� ����, � ����� ��� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//������� � ������� �� � �������� �����, ��� ����� ������� �� ������ � ������ ������ ��.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//� ��� ��?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//��������� �� ��� ����� � �������� ������� �� ����� ������.
	Wld_AssignRoomToGuild("grpbauer01",GIL_NONE);
	Sekob_RoomFree = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//�� ��������� ����� ������?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//���. �� ��� ����� ������ � �� �� ����� �������� ������ ��������. � ���� ��, ���� ������ ������. ��� ����.
	CreateInvItems(self,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//���, ����� �������, ���� ����� ������ �����. ����� ������� ������ ��� �����, �� ������, ��� ��� �� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//��� ������ �� ����� ���. ������� ����� ��� �������� ���� ����� ����.
	B_LogEntry(TOPIC_INNOSEYE,"������� ��� ��� ���� �� ������� �� ����� ������. � ������ ������� �����, ����������� � ���, ��������.");
};

func void B_XardasGoesToRitual()
{
	if(Pyrokar_DeniesInnosEyeRitual == TRUE)
	{
		B_XardasGivesProofForPyrokar();
	};
	AI_StopProcessInfos(self);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_UseMob(self,"THRONE",-1);
	};
	B_LogEntry(TOPIC_INNOSEYE,"������� ���������� ����������� � ������� � ����� ������.");
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	Xardas_GoesToRitualInnosEye = TRUE;
};

instance DIA_Xardas_RITUALREQUEST(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_RITUALREQUEST_Condition;
	information = DIA_Xardas_RITUALREQUEST_Info;
	description = "������ �������� ���� � ����.";
};


func int DIA_Xardas_RITUALREQUEST_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && Npc_KnowsInfo(other,DIA_Xardas_INNOSEYEBROKEN) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RITUALREQUEST_Info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//������ �������� ���� � ����.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//������. ��� �� ������?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//�� ������ ���-�� � ������� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(�������) ��� ������ ������. �����, � ����, ��� �� ������. �� ������, ����� �������� ���� � ����.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//������ �� ��. ����� �� �������������?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL) || (GuildlessMode == TRUE))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//�� ����� ���������� ������� �����. � ����������� ����������. � �� ������ ��������� ���� ������, � ����� �������������� �� ��� �����.
		B_GivePlayerXP(XP_AmbientKap3 * 2);
		B_XardasGoesToRitual();
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//� ���� �������� � ���� ������� ������ ����� ���� ������, ��� �� ����� � ������� � ���������.
		B_LogEntry(TOPIC_INNOSEYE,"������� �������, ��� � ��� �� ����� � ������� � ���������.");
		B_GivePlayerXP(XP_AmbientKap3);
	};
};


instance DIA_Xardas_WARUMNICHTJETZT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 34;
	condition = DIA_Xardas_WARUMNICHTJETZT_Condition;
	information = DIA_Xardas_WARUMNICHTJETZT_Info;
	description = "������ �� ���� �� ����������� �� ������� � �������� ����� ������?";
};


func int DIA_Xardas_WARUMNICHTJETZT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//������ �� ���� �� ����������� �� ������� � �������� ����� ������?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//������ � ������ �� ������� ����.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(�����������) �� ���� �������� �� ���� � ����� ����. ���� �� �� �, ���� �� �� ��� �� ������ ���� �� ��� ��� �� ����� � ���� �����.
	AI_Output(other,self,"Extro_Tempel_15_01");	//�������! ���...
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"�� ��������! ������ �����, ��� ��� ����� �������.",DIA_Xardas_WARUMNICHTJETZT_wastun);
	Info_AddChoice(DIA_Xardas_WARUMNICHTJETZT,"�����, �� ������� ����, ������� ���, ������ �� �����������.",DIA_Xardas_WARUMNICHTJETZT_grund);
};

func void DIA_Xardas_WARUMNICHTJETZT_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//�����, �� ������� ����, ������� ���, ������ �� �����������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//� ��� ���, ��� � ������ �� ����� ����, � �������� ��������� �� ��� ��������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//� � �� ��������� �������� ���� ��������, ���� ������ � ���� ������ �� �� ����� ������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//�� ������, ��� � ��������� ����� ������������ ������ ���� �����, � ������� ���� ���������, ��� � ���� ���� ���� �����-�� ����� ������������� ��������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//� ����� ������ �����������, �������, ���� ������ �� ������������. �����������, ����� ������� ���������� �����.
	AI_StopProcessInfos(self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//�� ��������! ������ �����, ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//�� ��� ��� ������� ����, ����� ��������� � ���������. � ���� ����������� � ���� ��� ������� ������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//�� ����������� �� ���, ���� �� ������ ��������� �����. ��� ����� � �����, � ������������ � �������.
	AI_StopProcessInfos(self);
};


instance DIA_Xardas_BEREIT(C_Info)
{
	npc = NONE_100_Xardas;
	condition = DIA_Xardas_BEREIT_Condition;
	information = DIA_Xardas_BEREIT_Info;
	description = "� ����� � �������� � ���������.";
};


func int DIA_Xardas_BEREIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Xardas_GoesToRitualInnosEye == FALSE) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//� ����� � �������� � ���������.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//����� �� ����� ������ �������. � ���������� ���������� � ����� ������. � �� ������� ���� ������. � ������� ���� ���.
	B_GivePlayerXP(XP_AmbientKap3);
	B_XardasGoesToRitual();
};


instance DIA_Xardas_BINGESPANNT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 35;
	condition = DIA_Xardas_BINGESPANNT_Condition;
	information = DIA_Xardas_BINGESPANNT_Info;
	permanent = TRUE;
	description = "���� ������ ��������� ���������?";
};


func int DIA_Xardas_BINGESPANNT_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3) && (Xardas_GoesToRitualInnosEye == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BINGESPANNT_Info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//���� ������ ��������� ���������?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//� �� ������ ������. ��� ������� �� ����, ��� ������ ���������� ������� ������.
};


instance DIA_Xardas_PYROWILLNICHT(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 37;
	condition = DIA_Xardas_PYROWILLNICHT_Condition;
	information = DIA_Xardas_PYROWILLNICHT_Info;
	description = "������� ������������ ������� ������� � �������.";
};


func int DIA_Xardas_PYROWILLNICHT_Condition()
{
	if((Pyrokar_DeniesInnosEyeRitual == TRUE) && Npc_KnowsInfo(other,DIA_Xardas_RITUALREQUEST) && (Kapitel == 3) && (Sekob_RoomFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Xardas_PYROWILLNICHT_Info()
{
	B_XardasGivesProofForPyrokar();
};


instance DIA_Xardas_RitualInnosEyeRepairImportant(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information = DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important = TRUE;
};


func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//������, ����� ���� ������ ������������, �� ������ ��������� ����� ���������!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//��� ��� ������ �������, ���� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//�� ������ ���� ����� ������ ����, ������� ������������ ��. ������ ��� ����� ��������� ��� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//����� �������� ���� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//� ��� ������ �� �������� ���, ����� �� ����������� �� ���!
	Info_ClearChoices(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice(DIA_Xardas_RitualInnosEyeRepairImportant,Dialog_Ende,DIA_Xardas_RitualInnosEyeRepairImportant_weiter);
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Vatras,"START");
};


instance DIA_Xardas_WASNUN(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 36;
	condition = DIA_Xardas_WASNUN_Condition;
	information = DIA_Xardas_WASNUN_Info;
	permanent = TRUE;
	description = "���� ������ ������������. ��� ������?";
};


func int DIA_Xardas_WASNUN_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WASNUN_Info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//���� ������ ������������. ��� ������?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//�� ������ ������ ���, ����� ��, �������, ����������� ����� ���������.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//�� ����� �������. ����������� � ������ �������� � ���� ���� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//��� � ��������, � ����� �� �������� ����, ��� ������������ ������.
	};
};


instance DIA_Xardas_PERM4(C_Info)
{
	npc = NONE_100_Xardas;
	nr = 40;
	condition = DIA_Xardas_PERM4_Condition;
	information = DIA_Xardas_PERM4_Info;
	permanent = TRUE;
	description = "��� ������?";
};


func int DIA_Xardas_PERM4_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_Xardas_DMTSINDDA))
	{
		return TRUE;
	};
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//��� ������?
	if(Kapitel == 3)
	{
		if(MIS_Ulthar_HeileSchreine_PAL == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_06");	//����������� ������� ���������� ���������� ������ �����.
			AI_Output(self,other,"DIA_Addon_Xardas_AddonIntro_Add_14_03");	//������ ��� � ���������.
		}
		else
		{
			AI_Output(self,other,"OUTRO_Xardas_14_10");	//���� ���� �� �����, ����� ������ ��� ����...
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//������ ��� �� ����. ��� �� �����������, ���� �� ��������� ����.
		AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//���� �������� � ������ �������� � ������, ��� ����� �� ����� �����������. � ��������� ������, �� ���� ������ �������� ��� ������.
	};
};

