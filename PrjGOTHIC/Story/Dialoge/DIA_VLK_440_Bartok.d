
instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bartok_Hallo(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//�� ���� ���������, ��? ������ - � ����.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//� ������ �� ������?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//�� ����, � ��� �������� �� ����������� � ������ ������ � ������� ����������.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//�� � ������ ��� �������. ������� ������� �������. ������� �������� ������ �����...
};


instance DIA_Bartok_Jaeger(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = "��� ��� ����� ������ ���������?";
};


func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//��� ��� ����� ������ ���������?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//� ��� ��� ������ ����� �������, �� ������� � ����� �����.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//�� � �� ����, ������� �� ��� ��� ���.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//��� � ������ ���� ����. �� ��������� �������.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//�� ���� ��� ��� ���� ������, ������������ �������.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = "� ��� ������ ������?";
};


func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//� ��� ������ ������?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//��� ����� ��������� �������.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//��������� ���� ����� �� �������� � ������� �������� � ������������� �� �����.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//�� ��������� ����, ��� ���� ������. � ���� ������� � ��� ������� ���������.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//� �����, ��� ������ ������� ���-�� � ���, ��� ���������� ������ ��������� ������� �� �������� �����. � ��� ��� � ��� �� �����.
//	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"� �� �� ����� ���?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"� ��� ����� ����� ����� �� �������� �����?",DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//� ��� ����� ����� ����� �� �������� �����?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//�����, � �����. �� ������� ����, ��� ��� ��������.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//� �� �� ����� ���?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//���. �� � ������� �� ���� ���������.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//��� ��� ���� �� �����.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//�������, ��� �� ������� ����� ��� ��� ���-������ ������.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//� �����, ��� ������� �� ����� � ����� ��� ������������� ����.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//� ����� �� ������.
};


instance DIA_Bartok_Bosper(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = "������ �������, ��� �� ������� �� ����...";
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//������ �������, ��� �� ������� �� ����...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//��, ���� ����. �� ��� ������������ ������ ��� ������� �����.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//� ������� ���, ��� ������ ����� ���������. �� �� �� ����� ������ �������.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//������, ������ �� ������ - ���� ����������.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//�� ������ ���������� ���-������ � ���?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(�������) � ������� ������� ������ ���. ����� ����� ���� ���.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//���-�� �������� � ��� �����, ������� ��� � ��� �����.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//���� ������� ����� �� ������!
	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};


instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ���������?";
};


func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//�� ������ ������� ���� ���������?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//� ���� ������� ���� �������� � ��������� ������� ���.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//���� �� ������ ��������� ������� ����� � �������� - ��� � �������. ��� �� ������ ����.
	};
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� �������� � �������� �� ����.");
	}
	else
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������ ����� ������� ���� �������� �� ����.");
	};
	Bartok_TeachPlayer = TRUE;
};


instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
//	description = B_BuildLearnString("����� ���� ��������!",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
	description = B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1));
};


func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && !Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//����� ���� ��������!
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//������ - ������� �� ������ ��������� ��������� ������������ ���� ���.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//��� ����� ����� ���� � ������� � �������� ������ �������� ���� �� �����.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//��� �������� ������ ����������� �� ������� ����, ���� ������ ���� �� ����� ������ ������ �� �����.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//� ����������� ������ ���������� �����������, ���� ������ ��� �� ����. ��� ������ ����� ����.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//��� ��� ���� ���������� ��� �����.
	};
};


var int Bartok_MerkeBow;
var int DIA_Bartok_Teacher_permanent;

func void B_BuildLearnDialog_Bartok()
{
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Bartok)
	{
		Info_ClearChoices(DIA_Bartok_Teach);
		Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
		Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnTalentString(other,NPC_TALENT_BOW,1),DIA_Bartok_Teach_BOW_1);
		Info_AddChoice(DIA_Bartok_Teach,B_BuildLearnTalentString(other,NPC_TALENT_BOW,5),DIA_Bartok_Teach_BOW_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Bartok)
		{
			DIA_Bartok_Teacher_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Bow_Bartok)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//���� ����� �������� ����-������, ��� ����� ������, ��� �.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = "� ���� ��������� ����� �������� �� ����!";
};


func int DIA_Bartok_Teach_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (DIA_Bartok_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//� ���� ��������� ����� �������� �� ����!
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Bartok)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//������, ���������, ���� � ���� ���� �������...
		Bartok_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	};
	B_BuildLearnDialog_Bartok();
};

func void DIA_Bartok_Teach_Back()
{
	if(Bartok_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//������, �� ���� �������� ����������� �����.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_Bartok))
	{
		B_BuildLearnDialog_Bartok();
	};
};

func void DIA_Bartok_Teach_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_Bartok))
	{
		B_BuildLearnDialog_Bartok();
	};
};

var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Zusammen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Zusammen_Condition;
	information = DIA_Bartok_Zusammen_Info;
	permanent = TRUE;
	description = "������ �� ��� �� ����������� ������?";
};


func int DIA_Bartok_Zusammen_Condition()
{
	if((Bartok_Bereit == FALSE) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//������ �� ��� �� ����������� ������?
	if(Bartok_Later == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//��. ������ ��������� �� ��� ������, ��� �����...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//� ��� �� ������ �� �����, �?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//� ���� � ����, �� ������, ��� ������� ����� � ��������?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//� ���� ���� 50 �����?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//��.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//������, � ���� �������� 50 ������� �����. � �� ������ �������� ���� ����� � ��������� �� �������.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//��� ����� ������, ������?
		};
		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen,"�����...",DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen,"���, �����...",DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//���.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//����� ������� ������� �� �����.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//�����������, ����� ��������� ����-������.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//�����...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//���, �����...
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//���? �� ����! � ���� ��� ������.
	};
	Info_ClearChoices(DIA_Bartok_Zusammen);
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = "������ ���������!";
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if(Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//������ ���������!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//������, ����� �� ����. �� ������ �������� ���������� ���. ��� ������� ����� ��� ���������� ������ ������.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(���� ��� ���) ���� ������, ��� �������� ��...
	CreateInvItem(self,ITAR_Leather_L);
	CreateInvItem(self,ItRw_Bow_M_03);
	B_RefreshInvItemToAmount(self,ItRw_Arrow,40);
	AI_EquipArmor(self,ITAR_Leather_L);
	AI_EquipBestRangedWeapon(self);
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//��� �� �������, ����� ��� ���������� � ��� ��� ���?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald,"������ �����!",DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald,"�����.",DIA_Bartok_ImWald_Weiter);
};

var int Bartok_Ende;

func void B_Bartok_BackInCity()
{
	Bartok_Ende = TRUE;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	AI_EquipArmor(self,ITAR_Vlk_L);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	Npc_RemoveInvItem(self,ItRw_Bow_M_03);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//������ �����!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//� ���� ��� �����. � �� �� ��� ������� ����� � ������� ����.
	Knows_Ork = TRUE;
	B_Bartok_BackInCity();
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//�����.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//������. (��� ����) ����� ���������, ��� ��� �������...
	if(!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


instance DIA_Bartok_Angekommen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Angekommen_Condition;
	information = DIA_Bartok_Angekommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_Angekommen_Condition()
{
	if((Bartok_Los == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//���! � �����, ��� ����� ��������� � �����.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//����� ��� ���� ������� ������ - � ���� ��� ��� �����.
	if(Bartok_OrkStillThere == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_Angekommen_04_02");	//(���� ��� ���) ��� ����� � ����� ������ - ���� ������...
		Bartok_OrkGesagt = TRUE;
		Knows_Ork = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//��� ��������!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//�� ������ ������� ����� �������.
	B_GivePlayerXP(XP_Bartok_Deal);
	B_Bartok_BackInCity();
};


instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//��� � �������?
	if(Bartok_Ende == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//��. �� � ������ �� ����� �� ������. �� ������� ����, � ��������� �����.
		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//� ���� ��� ��� �������� �������� �� ����� ����� �� ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//�������. ����� ��������� ��� ������� ������!
	};
};

