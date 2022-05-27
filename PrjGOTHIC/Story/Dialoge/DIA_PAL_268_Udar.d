
instance DIA_Udar_EXIT(C_Info)
{
	npc = PAL_268_Udar;
	nr = 999;
	condition = DIA_Udar_EXIT_Condition;
	information = DIA_Udar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Udar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Udar_Hello(C_Info)
{
	npc = PAL_268_Udar;
	nr = 2;
	condition = DIA_Udar_Hello_Condition;
	information = DIA_Udar_Hello_Info;
	important = TRUE;
};


func int DIA_Udar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//���� ������ �������, ����� �� ���������� ����. � ���� �� ��������� ����.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//�����, ��������, � ������ ����������, ��� � ���� ����� ������ ����.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//�� ����� ��������� �������. �������� � ���������, ���� ���� ���-������ �����.
	AI_StopProcessInfos(self);
};


instance DIA_Udar_YouAreBest(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_YouAreBest_Condition;
	information = DIA_Udar_YouAreBest_Info;
	permanent = FALSE;
	description = "� ������, ��� �� ������ ���������� �� ���� ������.";
};


func int DIA_Udar_YouAreBest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_Udar))
	{
		return TRUE;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//� ������, ��� �� ������ ���������� �� ���� ������.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//��, ���� ��� �������, ��������, ��� ������. ��� ���� �����?
};


instance DIA_Udar_TeachMe(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_TeachMe_Condition;
	information = DIA_Udar_TeachME_Info;
	permanent = FALSE;
	description = "����� ���� �������� �� ��������.";
};


func int DIA_Udar_TeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest) && (Udar_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//����� ���� �������� �� ��������.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//��������! ������ ����� ������ ���������� �������, �� ������� ����� ���������������.
};


instance DIA_Udar_ImGood(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_ImGood_Condition;
	information = DIA_Udar_ImGood_Info;
	permanent = FALSE;
	description = "����� ������� ���������� - �.";
};


func int DIA_Udar_ImGood_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Udar_YouAreBest))
	{
		return TRUE;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//����� ������� ���������� - �.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(�������) ��, �� ����!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//��� �, ���� �� ������ ���������, � ���� ������.
	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC,"���� ����� ������� ���� ��������� �������� �� ��������.");
};


var int DIA_Udar_Teach_permanent;

func void B_BuildLearnDialog_Udar()
{
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Udar)
	{
		Info_ClearChoices(DIA_Udar_Teach);
		Info_AddChoice(DIA_Udar_Teach,Dialog_Back,DIA_Udar_Teach_Back);
		Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Udar_Teach_CROSSBOW_1);
		Info_AddChoice(DIA_Udar_Teach,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Udar_Teach_CROSSBOW_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_CROSSBOW) >= TeachLimit_Crossbow_Udar)
		{
			DIA_Udar_Teach_permanent = TRUE;
		};
		PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_Crossbow_Udar)),-1,53,FONT_Screen,2);
		AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//�� ��� ������ ������ - �� ������� � ��� ��� �������.
		if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < 100)
		{
			AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//����� �������� �������� ���� �������, ���� ����� �������� ����� ����������� �������.
		};
		AI_StopProcessInfos(self);
	};
};

instance DIA_Udar_Teach(C_Info)
{
	npc = PAL_268_Udar;
	nr = 3;
	condition = DIA_Udar_Teach_Condition;
	information = DIA_Udar_Teach_Info;
	permanent = TRUE;
	description = "� ���� ��������� � ����.";
};


func int DIA_Udar_Teach_Condition()
{
	if((Udar_TeachPlayer == TRUE) && (DIA_Udar_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//� ���� ��������� � ����.
	if(VisibleTalentValue(NPC_TALENT_CROSSBOW) < TeachLimit_Crossbow_Udar)
	{
		AI_Output(self,other,"DIA_Udar_Teach_09_01");	//�����, �����!
	};
	B_BuildLearnDialog_Udar();
};

func void DIA_Udar_Teach_Back()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void DIA_Udar_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,TeachLimit_Crossbow_Udar))
	{
		B_BuildLearnDialog_Udar();
	};
};

func void DIA_Udar_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,TeachLimit_Crossbow_Udar))
	{
		B_BuildLearnDialog_Udar();
	};
};

instance DIA_Udar_Perm(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Perm_Condition;
	information = DIA_Udar_Perm_Info;
	permanent = TRUE;
	description = "��� ���� � �����?";
};


func int DIA_Udar_Perm_Condition()
{
	return TRUE;
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//��� ���� � �����?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_Udar_Perm_09_01");	//��������� �� ����� ������ ��������� ���� �����������, ��, � ��������, ��� �� ������ ����, ����� ���-������ ����������.
		AI_Output(self,other,"DIA_Udar_Perm_09_02");	//��� ���������������� ����������. ������ ��������� ���� �������� �����. ��� ����� ��������, ���� ���� �������� �� ������.
	}
	else if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//��� ���� ����� ���������������� ����� � ��� �����.
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//���� ����� ����������. ���-�� ����� �������� ��. � �������� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//��� ����� �� �������� ��� ���.
	};
};


instance DIA_Udar_Ring(C_Info)
{
	npc = PAL_268_Udar;
	nr = 11;
	condition = DIA_Udar_Ring_Condition;
	information = DIA_Udar_Ring_Info;
	permanent = FALSE;
	description = "���, � ������ ���� ������ ��������. ��� ����� �������� ����.";
};


func int DIA_Udar_Ring_Condition()
{
	if(Npc_HasItems(other,ItRi_HP_01_Tengron))
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//���, � ������ ���� ������ ��������. ��� ����� �������� ����. ������� �������, ��� �� �����-������ �������� � ������� ��� ������ �����.
	B_GiveInvItems(other,self,ItRi_HP_01_Tengron,1);
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//���? �� �� ������, ��� ��� �� ������? �� ������� ��� ������� �� ��������, ����������� � ���.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//��������, ��� �� ����� ������� ��� �����? ���� ������ ���� ������, ��� � �����. ���� ������ ���� ������...
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};


instance DIA_Udar_Kap4WiederDa(C_Info)
{
	npc = PAL_268_Udar;
	nr = 40;
	condition = DIA_Udar_Kap4WiederDa_Condition;
	information = DIA_Udar_Kap4WiederDa_Info;
	important = TRUE;
};


func int DIA_Udar_Kap4WiederDa_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//������, ��� �� ������. ����� �������� ����� ��.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//��� ���������?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//�������� �� �������� ��������� �� ����� ����� � ����������, ��� ����� ������ �������� � ���������.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//�� � ����� ���� - ���� �� ����, ��� ��� ��������, ��� �� � ��������� ����� ���� ������� �������� ��������.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//������ �� ��� ��� ��������� � ��� �� �����, ��� ��� ������� ��������� ������ ������.
};


instance DIA_Udar_Sengrath(C_Info)
{
	npc = PAL_268_Udar;
	nr = 41;
	condition = DIA_Udar_Sengrath_Condition;
	information = DIA_Udar_Sengrath_Info;
	description = "��-�����, �� ������ ������ ����� �� �����?";
};


func int DIA_Udar_Sengrath_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Kap4WiederDa) && (Sengrath_Missing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//��-�����, �� ������ ������ ����� �� �����?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//������ ���. ������� ����� � ���� ����� � ������.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//�� ������� ���� �������, � ��� ���� ����.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//�� ������, ��� ���� �� ����� ������� ��� � ����������� � �������.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//������� ��������� � ������� � ���� �� ����������� � ��������� �����. � ��� ��� ��� ����� �� �����.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//�� �������� � ���� �����!
	Log_CreateTopic(TOPIC_Sengrath_Missing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing,LOG_Running);
	B_LogEntry(TOPIC_Sengrath_Missing,"����, ������ �� �����, ������� �� ������ �������� ��������. ��������� ��� �� ����� ��� ���-�� ������ �����, ��� ����������� � ������ �����, ����� ������� ���� �������.");
};


instance DIA_Udar_SENGRATHGEFUNDEN(C_Info)
{
	npc = PAL_268_Udar;
	nr = 42;
	condition = DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information = DIA_Udar_SENGRATHGEFUNDEN_Info;
	description = "� ����� ��������.";
};


func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Udar_Sengrath) && !Npc_HasItems(DeadSengrath,ItRw_SengrathsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//� ����� ��������.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//��? � ��� �� ��?
	if(Npc_HasItems(other,ItRw_SengrathsArmbrust_MIS))
	{
		AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//�� �����. ��� ��� �������. �� ��� ��� ���.
		AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//������ ����, �� ���� ������� ���� �������, �� ���� ��� �� ���������� ���.
	}
	else
	{
		DIA_Common_HeIsDead();
	};
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//������ �����. � ����, ��� ��� �����. �� ��� ��� ��������.
	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};

