
instance DIA_Lares_DI_EXIT(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 999;
	condition = DIA_Lares_DI_EXIT_Condition;
	information = DIA_Lares_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lares_DI_Hallo(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 2;
	condition = DIA_Lares_DI_Hallo_Condition;
	information = DIA_Lares_DI_Hallo_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Lares_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Hallo_15_00");	//��� ����?
	if(OrkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_01");	//����������. ����, ���������, �������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_DI_Hallo_09_02");	//������. ���� ���� ���� ������� ������ ����.
	};
};


var int DIA_Lares_DI_Teacher_permanent;
var int Lares_DI_TeachComment;

func void B_BuildLearnDialog_Lares_DI()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training,Dialog_Back,DIA_Lares_DI_Training_BACK);
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK))
	{
		Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnString(NAME_Skill_Sneak,B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Lares_DI_Training_SNEAK);
	};
	if(VisibleAttributeValue(ATR_DEXTERITY) < T_MED)
	{
		Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnAttributeString(ATR_DEXTERITY,1),DIA_Lares_DI_Training_DEX_1);
		Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnAttributeString(ATR_DEXTERITY,5),DIA_Lares_DI_Training_DEX_5);
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Lares)
	{
		Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Lares_DI_Training_1H_1);
		Info_AddChoice(DIA_Lares_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Lares_DI_Training_1H_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && (VisibleAttributeValue(ATR_DEXTERITY) >= T_MED) && (VisibleTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Lares))
	{
		if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Lares) && (RealAttributeValue(ATR_DEXTERITY) >= T_MED))
		{
			DIA_Lares_DI_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

func void B_Lares_DI_TeachComment()
{
	if(Lares_DI_TeachComment == 0)
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_1_09_00");	//���� ����� ������� ������� �������� ���� � ��������� ����� - ��� �� ������� ���������� ������.
		Lares_DI_TeachComment = 1;
	}
	else if(Lares_DI_TeachComment == 1)
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_1H_5_09_00");	//�� �������� �����, ��� �������� ���� ������� ���������� �� ����������.
		Lares_DI_TeachComment = 2;
	}
	else if(Lares_DI_TeachComment == 2)
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_1_09_00");	//������� ����� ������ �������� ������ ����������� ������������ � ������.
		Lares_DI_TeachComment = 3;
	}
	else if(Lares_DI_TeachComment == 3)
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_DEX_5_09_00");	//������ ����� �� ������ ������.
		Lares_DI_TeachComment = 0;
	};
};

instance DIA_Lares_DI_Training(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 10;
	condition = DIA_Lares_DI_Training_Condition;
	information = DIA_Lares_DI_Training_Info;
	permanent = TRUE;
	description = "����� ���� ����, ��� ������ ���.";
};


func int DIA_Lares_DI_Training_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (DIA_Lares_DI_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_Training_15_00");	//����� ���� ����, ��� ������ ���.
	if(!Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) && (VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Lares))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_09_01");	//��� �������.
	}
	else if(VisibleAttributeValue(ATR_DEXTERITY) < T_MED)
	{
		AI_Output(self,other,"DIA_Lares_Dex_09_01");	//�������. ���� ������, � ������ ���� ����� ����� ������.
	};
	B_BuildLearnDialog_Lares_DI();
};

func void DIA_Lares_DI_Training_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Lares))
	{
		B_Lares_DI_TeachComment();
		B_BuildLearnDialog_Lares_DI();
	};
};

func void DIA_Lares_DI_Training_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Lares))
	{
		B_Lares_DI_TeachComment();
		B_BuildLearnDialog_Lares_DI();
	};
};

func void DIA_Lares_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED))
	{
		B_Lares_DI_TeachComment();
		B_BuildLearnDialog_Lares_DI();
	};
};

func void DIA_Lares_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED))
	{
		B_Lares_DI_TeachComment();
		B_BuildLearnDialog_Lares_DI();
	};
};

func void DIA_Lares_DI_Training_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Lares_DI_Training_SNEAK_09_00");	//������ ��������� ��� ������� �������, ����� ���������.
		B_BuildLearnDialog_Lares_DI();
	};
};

func void DIA_Lares_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
};

var int DIA_Lares_DI_UndeadDragonDead_OneTime;

instance DIA_Lares_DI_UndeadDragonDead(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 5;
	condition = DIA_Lares_DI_UndeadDragonDead_Condition;
	information = DIA_Lares_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "������, ��� ��� ���� �� �������� �������.";
};


func int DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_00");	//������, ��� ��� ���� �� �������� �������.
	AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_01");	//��, ������, � ��� ������, ��� �� ����������.
	if(DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Lares_DI_UndeadDragonDead_15_02");	//��� �� ����������� ������ ������?
		AI_Output(self,other,"DIA_Lares_DI_UndeadDragonDead_09_03");	//���� �� ����. �������, � ���� ������ � �����.
		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Lares_DI_RingBack(C_Info)
{
	npc = VLK_449_Lares_DI;
	nr = 6;
	condition = DIA_Addon_Lares_RingBack2_Condition;
	information = DIA_Addon_Lares_RingBack2_Info;
	description = "��� ���� ������.";
};

