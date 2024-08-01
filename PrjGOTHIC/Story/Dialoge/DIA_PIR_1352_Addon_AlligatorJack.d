
instance DIA_Addon_AlligatorJack_Exit(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 999;
	condition = DIA_Addon_AlligatorJack_Exit_Condition;
	information = DIA_Addon_AlligatorJack_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};


var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;

func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if((MIS_KrokoJagd == LOG_SUCCESS) && (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//���� � ���� �����������, �� ������ ����� ���� � ����� ������ ����� � ����������.
		if(Henry.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//����������?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//��������� ���� �� �����, � �� �������, � ��� � ������.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_AlligatorJack_Hello(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Hello_Condition;
	information = DIA_Addon_AlligatorJack_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	if(!C_BanditArmorEquipped(other) && (VisibleGuild(other) != GIL_KDW))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//���, ���� ������, �� �����? �� �� ����� �� ���������.
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//����� ��� ���������?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//��, �����, ������� ����� ������������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//�� ���� �� �� ��������, ���?
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//�������� ����� � ����� ������� ����������� ����� � ��������.
};


instance DIA_Addon_AlligatorJack_WerBistDu(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information = DIA_Addon_AlligatorJack_WerBistDu_Info;
	description = "��� �� �����?";
};


func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//��� �� �����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//������, �� ��� ��� ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(�����) � - ��������� ����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//���� ������ ������ ���� ������. � - ���� �� ����� ������� ������� � ���� �����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//������ � ��������� ������ �� �������� ������ ���������� ��������, ��� � ���� ���������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//��� ��� ������ �� �������������� � ����� ��������.
};


instance DIA_Addon_AlligatorJack_Vorschlag(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information = DIA_Addon_AlligatorJack_Vorschlag_Info;
	description = "�� ������ �������� �� ����� �����?";
};


func int DIA_Addon_AlligatorJack_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//�� ������ �������� �� ����� �����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//�������. �� ��������� ���������, �������� �� �������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//� ��� ���� �� ���� ����?
	B_LogEntry(TOPIC_Addon_RavenKDW,"������ � ��� �������� ����� ����� � ��������� ����� ������.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"� ���� �������������� � ������.",DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"� ������ ����� ������.",DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//�����, � ���� � ���� ���� ������ �����������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//������������� � ���.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//� ����� �� ���������� ��� ���, � ���� ���������� ������� �� �����.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//� ���� ����� ����� ��� ��������.
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
};

func void DIA_Addon_AlligatorJack_Vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(�������) ���? ��? � ��� �� ����������� ��� �������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//����� �� ���� �� �����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//�� � ���� � ������ �� ���������. ��� ������� � ���� ������ ����� ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//�� ���� ����� ������ �� ���� �� ��������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_05");	//��������� �� ���, ��� � ��� ��� ���� ���� ����� ���� ���������.
	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//� ���� �������������� � ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//�������������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//� ��������� �� �� ���, ��� �������, ������� �������������� � ����� �������.
	B_AlligatorJack_Besser();
};


instance DIA_Addon_AlligatorJack_BDTRuestung(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information = DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description = "��� ����� ���������� �������.";
};


func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Vorschlag) && (MIS_Greg_ScoutBandits == FALSE) && !C_SCHasBDTArmor())
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//��� ����� ���������� �������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//����� ��� ��� ���� ������������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//���� ���� � ��� ������, �� ������ ������� � ����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//���� ������ �� ������� � ���������� �����.
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"�� �� ������, ��� ��� ����� ����� �������?",DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"������ �������...",DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	DIA_Common_SoundsGood();
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//��, ��� ����, ��� ������� ��������� ����� �������������.
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//�� �� ������, ��� ��� ����� ����� �������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//� ��� � ��������� ������ ��� ���� ��������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//�� ����, ������� �� �� �� ��� ���.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"� ������� ������ ���� ������� ��������. �� ��������� ���� �� ����� ������� ���, ��� �� ���.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};


instance DIA_Addon_AlligatorJack_Greg(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Greg_Condition;
	information = DIA_Addon_AlligatorJack_Greg_Info;
	description = "������ �������� ����� ����?";
};


func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//������ �������� ����� ����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//��. � ��� ����� ���������� �����, �����-���� ����������� ����.
	if(PlayerTalkedToGregNW == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//�����, � ���� ������ ��������. � �������� ��� � ��������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(�������) �����? � ��������? ������!
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//���� � ������ ������� ���������� � ���� �� �������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//� ������� �� ����� ������� ������ �� ����������� �������� ������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//��� �� ���� �� ����� ��������� ������������ � ������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//�� �� �� ��� �� ������ � ����� �� ����� ����. ������ �� �������� �������� ��� � ������ � ������.
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//��, ���� �� ��� ��������...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//���� � ������ ������� ���������� � ���� �� �������.
	};
};


instance DIA_Addon_AlligatorJack_PIRLager(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_PIRLager_Condition;
	information = DIA_Addon_AlligatorJack_PIRLager_Info;
	description = "��� ��������� ��� ������?";
};


func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//��� ��������� ��� ������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//������ ���� ������? ��� ����� ���� � ����������� �� �����. ���� ��� ������ �� ������� �� ������ ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//��� � ����� ���� ����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//� �� ��� ���� ���������, �� �� ������ ������� ��� ���� ������.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//����� ��?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//������ ��� ������������ � ������, � ������ ������ ������� ���.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//���� �� ����, �� ������� �������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//�� ��� �� ������ ��� ���������. ��������?
	Log_CreateTopic(TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_RatHunt,"���������� ����� ����� ������ � �����.");
};


instance DIA_Addon_AlligatorJack_WasJagen(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WasJagen_Condition;
	information = DIA_Addon_AlligatorJack_WasJagen_Info;
	description = "�� ���� �� ���������?";
};


func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
	if((GregIsBack == TRUE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//�� ���� �� ���������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//���� ����� �� �����������. �� �� ���� ����������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//� ���� ��, �� ����� ��� �� ��������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//������� ��� ���������� ������ �������� ����.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//���?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//���� ����������� ������� ������ ���� ����� ���� ������ ������, ���� �������, ��� ��������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//�����-����� �������� ������ ���� ���� ������ �������� ����.
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		B_LogEntry(TOPIC_Addon_RatHunt,"������������ �������� �����, ���� �������� ����� ���� - ��� �������� �����.");
	};
};


instance DIA_Addon_AlligatorJack_Pirates(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Pirates_Condition;
	information = DIA_Addon_AlligatorJack_Pirates_Info;
	permanent = FALSE;
	description = "�������� ��� ������ � �������.";
};


func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
	if((GregIsBack == TRUE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//�������� ��� ������ � �������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//�� ����� ����� ��� ����� ���. �� ������ ����� ��� ����� �����, �� �������� �� ����������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//���� ��� ������ ����� ������ ���� � ������ �������� �� �������� ��������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//�� �� ������� ������. ��� ��������� ������ ��� �� ����������� ������� � �������.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//������� ���� � �������� ����� ���������� �� ������ ��������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//� ��������� ������ ����� � ������ � ����, ����� �� ��������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//�������, �� �������� �������� ���.
	};
};


instance DIA_Addon_AlligatorJack_LetsGoHunting(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information = DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent = TRUE;
	description = "������ �� �����.";
};


func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if((MIS_KrokoJagd == FALSE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WasJagen) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//������ �� �����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//�������. ������ �� � ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//�� �����?
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"��� ���.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"��.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};


const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;

func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//��.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//���������. ������� ����� �� ����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	MIS_KrokoJagd = LOG_Running;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//��� ���.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//����� �������.
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//����� ��� ����� �������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//������ �� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


instance DIA_Addon_AlligatorJack_TheHunt(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_TheHunt_Condition;
	information = DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Kessel) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//����� � � ������.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//����� ������ �������� �� ���� ���������� ����, ��� ��� �����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//������ ��� �������� ����������� � ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//���� ���������. ����������� � ������ ������ ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//���� ���� ������ �����, �� ������ �� ����.
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"� ��� ���, � �������?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"������, ������.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//� ��� ���, � �������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//�� ��������� �������� ����� �����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//��� ����� ����������. ������� �����. ���� ������ ���� - ������� �� ��� ��������.
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//������, ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//������������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 250) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};


instance DIA_Addon_AlligatorJack_HuntEnd(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information = DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Canyon) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if(AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//�� ��������� ���, ����� � ���� ����?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//�� �� ���� �� ����� �������� �����!
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//�� �����. ��������, �� ���� � ������ �����-������ ����.
	}
	else if(AlligatorJack_KrokosKilled == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//�������. ����� �������, ��� ��, ����� ��� �����������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//�� ������ �� ����� �� ����� ������ �����. ����� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//� �� - ������� �������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//����! ���� �� � ������ ������ ��� ���������, � ��������� ��� � ����� �������� � ������.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//������ ��� ���� �������� ���� ������� ������ �������.
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItFoMuttonRaw,10);
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//�� ������� ��� � ����� ������.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//�� ��������� ������� �� ��������. ����� ��� ����, �� ����.
	if(!Npc_IsDead(Henry))
	{
		if(Henry.aivar[AIV_PASSGATE] == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//���� � ������ ������ �������� �����. ��� ������ - �� ���������� ��������.
			AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//���� �� ��������� ���� ��������, �����, ��� ������ ���� �.
			AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//��������, ��� ������� ��� ����� �����������.
			AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//����� ������ ���������� ����� ����������...
		};
	};
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_AlligatorJack_BringMeat = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_Addon_BringMeat,"��������� ���� ��� ��� ������ ������ ����. � ������ �������� �� �������.");
	Log_AddEntry(TOPIC_Addon_RatHunt,"����� ���� �������. �� ����� ��������� �������� ����.");
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};


instance DIA_Addon_AlligatorJack_Angus(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Angus_Condition;
	information = DIA_Addon_AlligatorJack_Angus_Info;
	permanent = FALSE;
	description = "�� ������ ������ � �����?";
};


func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_AngusnHank))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//�� ������ ������ � �����?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//� �� ��� �������� ����� �� �����.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//� � �� ���� �������, ���� ��� ������� � ����� �� ��������.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//������?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//��� ������� ��������� �������� � ����� � ������ ����.
};


instance DIA_Addon_AlligatorJack_Lake(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Lake_Condition;
	information = DIA_Addon_AlligatorJack_Lake_Info;
	permanent = FALSE;
	description = "��� ��� �� �����?";
};


func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Angus) && (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//��� ��� �� �����?
	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//������� ���� �����?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//��.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//����� � ������. � ��������� �� ��� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//����� � ������� ������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//��� �� ������ �� ������. �� �������� ������ ����������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//��� ��� ��������� ��������� ���������.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//���� ���������� - ���� � ���� ��� ������ ������ ���, ����� �����, ������, �� ��������� ������� � ������ � ������.
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog,"������ ������ ���� � ������ �� ������� �� ������, ����� � ������.");
};


func void B_AlliJack_AlliKlar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//������...
};

func void B_AlligatorJack_CanLearn()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//���� ������, � ���� �������� ����� ���������.
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,"��������� ���� ����� ������� ���� ������� ���� � �������� � �������� ����. ����� ����, �� ����� ������� ���� ����� �������� �� ����.");
	AlligatorJack_Addon_TeachPlayer = TRUE;
};

func void DIA_Addon_AlligatorJack_CanLearn_Pay()
{
	DIA_Common_TakeIt();
	B_GiveInvItems(other,self,ItMi_Gold,200);
	B_AlliJack_AlliKlar();
	B_AlligatorJack_CanLearn();
	Info_ClearChoices(DIA_Addon_AlligatorJack_CanLearn);
};

func void DIA_Addon_AlligatorJack_CanLearn_NoPay()
{
	DIA_Common_IWillThinkAboutIt();
	Info_ClearChoices(DIA_Addon_AlligatorJack_CanLearn);
};

var int DIA_AlligatorJack_Teacher_permanent;

instance DIA_Addon_AlligatorJack_CanLearn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_CanLearn_Condition;
	information = DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent = TRUE;
	description = "�� ������ ���� ����-������ �������?";
};


func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if((AlligatorJack_Addon_TeachPlayer == FALSE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WasJagen))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//�� ������ ���� ����-������ �������?
	if((VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_AlligatorJack) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//�������. � ������� ������� � ���� ������� ���� ������� � �������� ����� � �������� ����.
		if((GregIsBack == TRUE) && (MIS_KrokoJagd == FALSE))
		{
			B_Say_Gold(self,other,200);
			Info_ClearChoices(DIA_Addon_AlligatorJack_CanLearn);
			Info_AddChoice(DIA_Addon_AlligatorJack_CanLearn,"� ������� ��� ����.",DIA_Addon_AlligatorJack_CanLearn_NoPay);
			if(Npc_HasItems(other,ItMi_Gold) >= 200)
			{
				Info_AddChoice(DIA_Addon_AlligatorJack_CanLearn,"�����.",DIA_Addon_AlligatorJack_CanLearn_Pay);
			};
		}
		else if(MIS_KrokoJagd > LOG_Running)
		{
			B_AlligatorJack_CanLearn();
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//�� ������� �� ������ �������� ���, ��� ����� � ����� ��������.
			AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//� ����� ����� ���� ������ ����� ����, ��� �� ������ ������ �� �����.
		};
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_AlligatorJack)
		{
			AlligatorJack_Addon_TeachPlayer = TRUE;
			DIA_AlligatorJack_Teacher_permanent = TRUE;
		};
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};


func void B_BuildLearnDialog_AlligatorJack()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,Dialog_Back,DIA_Addon_AlligatorJack_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_AlligatorJack)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnTalentString(other,NPC_TALENT_BOW,1),DIA_Addon_AlligatorJack_Teach_Bow_1);
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnTalentString(other,NPC_TALENT_BOW,5),DIA_Addon_AlligatorJack_Teach_Bow_5);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString(NAME_TROPHY_ReptileSkin,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALFUR,TROPHY_ReptileSkin)),DIA_Addon_AlligatorJack_Teach_FUR);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,B_BuildLearnString(NAME_TROPHY_Teeth,B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_AlligatorJack_Teach_Teeth);
	};
	if((VisibleTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_AlligatorJack) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE))
	{
		if(RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_AlligatorJack)
		{
			DIA_AlligatorJack_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_AlligatorJack_Teach(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Teach_Condition;
	information = DIA_Addon_AlligatorJack_Teach_Info;
	permanent = TRUE;
	description = "� ����� �������!";
};


func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if((AlligatorJack_Addon_TeachPlayer == TRUE) && (DIA_AlligatorJack_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//� ����� �������!
	if((VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_AlligatorJack) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//���� ���� �������?
	};
	B_BuildLearnDialog_AlligatorJack();
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_AlligatorJack))
	{
		B_BuildLearnDialog_AlligatorJack();
	};
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_AlligatorJack))
	{
		B_BuildLearnDialog_AlligatorJack();
	};
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//������ ����� ������ �� ������, ����� �� ��������� �����.
		B_BuildLearnDialog_AlligatorJack();
	};
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		B_BuildLearnDialog_AlligatorJack();
	};
};

instance DIA_Addon_AlligatorJack_Anheuern(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 11;
	condition = DIA_Addon_AlligatorJack_Anheuern_Condition;
	information = DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent = FALSE;
	description = "������ �� �����.";
};


func int DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//������ �� �����.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_AlligatorJack_ComeOn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 12;
	condition = DIA_Addon_AlligatorJack_ComeOn_Condition;
	information = DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent = TRUE;
	description = "������������� �� ���.";
};


func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//������������� �� ���.
	if(C_GregsPiratesTooFar())
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_AlligatorJack_GoHome(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 13;
	condition = DIA_Addon_AlligatorJack_GoHome_Condition;
	information = DIA_Addon_AlligatorJack_GoHome_Info;
	permanent = TRUE;
	description = "�� ��� ������ �� �����.";
};


func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//�� ��� ������ �� �����.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_AlligatorJack_TooFar(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 14;
	condition = DIA_Addon_AlligatorJack_TooFar_Condition;
	information = DIA_Addon_AlligatorJack_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && C_GregsPiratesTooFar() && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

