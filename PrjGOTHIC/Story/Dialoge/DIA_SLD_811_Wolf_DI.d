
instance DIA_Wolf_DI_EXIT(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 999;
	condition = DIA_Wolf_DI_EXIT_Condition;
	information = DIA_Wolf_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_DI_HALLO(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 4;
	condition = DIA_Wolf_DI_HALLO_Condition;
	information = DIA_Wolf_DI_HALLO_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Wolf_DI_HALLO_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_HALLO_OneTime;

func void DIA_Wolf_DI_HALLO_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//��� ����?
	if((Bennet_IsOnBoard == LOG_SUCCESS) && !Npc_IsDead(Bennet_DI))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//���� ����� ����� ���� ����� � ����� �������?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//� ��� ��������?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//�, ������. ��� � �������. �����, ��� �������� ������.
	}
	else if(DIA_Wolf_DI_HALLO_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//��� ������� �� � ����� ������ ���������, �� � �����, � ���� ���-������ ���������.
		B_GivePlayerXP(XP_AmbientKap6);
		DIA_Wolf_DI_HALLO_OneTime = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SMITHDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//�� ������ ���������� ��� ���� �������?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//������, ��������. �� �� � ����� �������������. �������� ���������, ���� �� �� �������� �� �������.
	};
};


var int DIA_Wolf_DI_Teacher_permanent;

func void B_BuildLearnDialog_Wolf_DI()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training,Dialog_Back,DIA_Wolf_DI_Training_BACK);
	if(VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Wolf)
	{
		Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_BOW,1),DIA_Wolf_DI_Training_BOW_1);
		Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_BOW,5),DIA_Wolf_DI_Training_BOW_5);
	};
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Wolf)
	{
		Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,1),DIA_Wolf_DI_Training_CROSSBOW_1);
		Info_AddChoice(DIA_Wolf_DI_Training,B_BuildLearnTalentString(other,NPC_TALENT_CROSSBOW,5),DIA_Wolf_DI_Training_CROSSBOW_5);
	};
	if((VisibleTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Wolf) && (VisibleTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Wolf))
	{
		if((RealTalentValue(NPC_TALENT_BOW) >= TeachLimit_Bow_Wolf) && (RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Wolf))
		{
			DIA_Wolf_DI_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Wolf_DI_Training(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 10;
	condition = DIA_Wolf_DI_Training_Condition;
	information = DIA_Wolf_DI_Training_Info;
	permanent = TRUE;
	description = "����� ���� ��������.";
};


func int DIA_Wolf_DI_Training_Condition()
{
	if((UndeadDragonIsDead == FALSE) && (DIA_Wolf_DI_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_DI_Training_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//����� ���� ��������.
	if((VisibleTalentValue(NPC_TALENT_BOW) < TeachLimit_Bow_Wolf) || (VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Wolf))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//�� ����?
	};
	B_BuildLearnDialog_Wolf_DI();
};

func void DIA_Wolf_DI_Training_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,TeachLimit_Bow_Wolf))
	{
		B_Wolf_TeachComment(NPC_TALENT_BOW);
		B_BuildLearnDialog_Wolf_DI();
	};
};

func void DIA_Wolf_DI_Training_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,TeachLimit_Bow_Wolf))
	{
		B_Wolf_TeachComment(NPC_TALENT_BOW);
		B_BuildLearnDialog_Wolf_DI();
	};
};

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Wolf))
	{
		B_Wolf_TeachComment(NPC_TALENT_CROSSBOW);
		B_BuildLearnDialog_Wolf_DI();
	};
};

func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Wolf))
	{
		B_Wolf_TeachComment(NPC_TALENT_CROSSBOW);
		B_BuildLearnDialog_Wolf_DI();
	};
};

func void DIA_Wolf_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
};

instance DIA_Wolf_DI_UndeadDragonDead(C_Info)
{
	npc = SLD_811_Wolf_DI;
	nr = 2;
	condition = DIA_Wolf_DI_UndeadDragonDead_Condition;
	information = DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Wolf_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Wolf_DI_UndeadDragonDead_OneTime;

func void DIA_Wolf_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//�������. � � ����? ������� ���� ��������, ��?
	if(DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//���� �� ������?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//���� ������, ������ �� �����. � �� ����� ��� ���������.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//��� ��� �����, ���� �����. ���� �� �������� ������.
		DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};

