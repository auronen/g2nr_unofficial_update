
instance DIA_Wulfgar_EXIT(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 999;
	condition = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wulfgar_Hallo(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Hallo_Condition;
	information = DIA_Wulfgar_Hallo_Info;
	permanent = FALSE;
	description = "������ ���� �����������?";
};


func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//������ ���� �����������?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(������������) ��� ����� ����� ������, ��� ���������.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(���������) �� ����� ��� ������� �������� ��� ���� ������������, ������ �� ��� ������ ��������� ������.
};


instance DIA_Wulfgar_WannaJoin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_WannaJoin_Condition;
	information = DIA_Wulfgar_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������� � ���������!";
};


func int DIA_Wulfgar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//� ���� �������� � ���������!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//��? � �� ��������� ����� ������?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//���.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//����� ���� ����� �� ������ ����.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//�������, �� ������ ���������� � ���, �� � �� �����, ��� �� ������� ��� ���� ����������.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//��.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//����� �������� � ������ �����. �� ������, ���� ����� �������, � ���� ���.
	};
};


instance DIA_Wulfgar_AboutMiliz(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 3;
	condition = DIA_Wulfgar_AboutMiliz_Condition;
	information = DIA_Wulfgar_AboutMiliz_Info;
	permanent = FALSE;
	description = "������ ���, ������� � ���������?";
};


func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//������ ���, ������� � ���������?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//������ ���� ��������� ���� �����.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//������ ��������� ����������� �����������. (�������) �� ������� �� ����, ��� �� ���������� �����.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//�� ���� ����� ����� ���� ����. �� ��������� � ����� �����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//������, ��� �������� � ���������, �������� �������� ������� � ������� ������.
	};
	if((other.guild == GIL_NONE) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//� ���� �� ���������� ���� ������ ������, �� ������ ������������ �� ���������. ���� ����� ���� ������� �� ������� ���������� �����������.
	};
};


instance DIA_Wulfgar_CanYouTrain(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 4;
	condition = DIA_Wulfgar_CanYouTrain_Condition;
	information = DIA_Wulfgar_CanYouTrain_Info;
	permanent = FALSE;
	description = "�� ������ ������� ���� �������� �� �����?";
};


func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//�� ������ ������� ���� �������� �� �����?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//�� ������� ����� ����� �� ��������� ����, ��� � ��������� �������� �����.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//�������, ��� �� �������� ���������. ������ �� ����.
	}
	else
	{
		if(other.guild != GIL_MIL)
		{
			if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03_add");	//�� ��� �������� ������ ������� ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//�� ��� �������� ������ ������� ��������. ��� ��������� ���� �������� ������������� ������ ��� ���������.
			};
		};
		if((other.guild == GIL_MIL) || (other.guild == GIL_NONE) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//� �� ���-�� ������ ��������?
			AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//�����, ��� ��...
			AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(��������) ������, �� ������ ����������, ����� ���������.
		};
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"��������, ��������� ���������, ����� ������� ���� ��������� ��������� � ���������� � ��������� �������.");
		Wulfgar_Teach1H = TRUE;
	};
};


instance DIA_Wulfgar_Advantage(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 5;
	condition = DIA_Wulfgar_Advantage_Condition;
	information = DIA_Wulfgar_Advantage_Info;
	permanent = FALSE;
	description = "������ ������������ ���������� ������?";
};


func int DIA_Wulfgar_Advantage_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//������ ������������ ���������� ������?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//��� ������. � ���������� ������� �� �������. ��� ����� ����� ������������ ������������� � ���.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//��������� ������ ����� ����������� � ��������� ����. ��� �������� �� ����� ������������ ���� �������� �� ��� ������, �� ��� ������� ������� ����.
};


instance DIA_Wulfgar_HowToBegin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 6;
	condition = DIA_Wulfgar_HowToBegin_Condition;
	information = DIA_Wulfgar_HowToBegin_Info;
	permanent = FALSE;
	description = "� ���� ��� ����� ������? � ����������� ��� ���������� ������?";
};


func int DIA_Wulfgar_HowToBegin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (RealTalentValue(NPC_TALENT_1H) < 100) && (RealTalentValue(NPC_TALENT_2H) < 100))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//� ���� ��� ����� ������? � ����������� ��� ���������� ������?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//������� ���.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//�� ���� ���� �� � ����������������� ������ � ����� ���� ������, �� �������� �� ������� ������������� ������� � ������ ���.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//����, ��������, �� ������ ���������� ���������� �������, �� ��� ��� ������� � ������������� ����������...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//... ���� ����� �������� ��������� ������� ���������� ������ ���, ����� �� ������������ � ����������...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//������, � ���� ������ �������� ���������� �������, ��� ����� �� ������������ � ��������� ����� ������ �� �������.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//���� ����� ������ ������ - � �� ��� �������, � ��� � ������.
};


var int DIA_Wulfgar_Teacher_permanent;
var int DIA_Wulfgar_TeachState_1H;
var int DIA_Wulfgar_TeachState_2H;
var int Wulfgar_Merke_1h;
var int Wulfgar_Merke_2h;

func void B_Wulfgar_NoMoreTeach()
{
	AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//�� ���� ������������ ��������. ��� ������ ������ ����� ����.
};

func void B_Wulfgar_SkillComment()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//� ��� ������ �� ���� ��������� �����!
};

func void B_BuildLearnDialog_Wulfgar()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
	Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Wulfgar)
	{
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Wulfgar_Teach_2H_5);
		DIA_Wulfgar_TeachState_2H = 1;
	}
	else
	{
		if((DIA_Wulfgar_TeachState_2H == 1) && (DIA_Wulfgar_TeachState_1H != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Wulfgar)),-1,53,FONT_Screen,2);
			B_Henry_NoMore_2H();
		};
		DIA_Wulfgar_TeachState_2H = 2;
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Wulfgar)
	{
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Wulfgar_Teach_1H_5);
		DIA_Wulfgar_TeachState_1H = 1;
	}
	else
	{
		if((DIA_Wulfgar_TeachState_1H == 1) && (DIA_Wulfgar_TeachState_2H != 2))
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Wulfgar)),-1,53,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNYOUREBETTER");
		};
		DIA_Wulfgar_TeachState_1H = 2;
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Wulfgar) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Wulfgar))
	{
		DIA_Wulfgar_Teacher_permanent = TRUE;
	};
	if((DIA_Wulfgar_TeachState_1H == 2) && (DIA_Wulfgar_TeachState_2H == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		B_Wulfgar_NoMoreTeach();
		AI_StopProcessInfos(self);
	};
};

instance DIA_Wulfgar_Teach(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 7;
	condition = DIA_Wulfgar_Teach_Condition;
	information = DIA_Wulfgar_Teach_Info;
	permanent = TRUE;
	description = "������ ��������.";
};


func int DIA_Wulfgar_Teach_Condition()
{
	if((Wulfgar_Teach1H == TRUE) && (DIA_Wulfgar_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//������ ��������.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//� �� ������ ���������!
		DIA_Wulfgar_Teacher_permanent = TRUE;
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			if((VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Wulfgar) || (VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Wulfgar))
			{
				AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//�������, ���������.
			};
		};
		Wulfgar_Merke_1h = other.HitChance[NPC_TALENT_1H];
		Wulfgar_Merke_2h = other.HitChance[NPC_TALENT_2H];
		B_BuildLearnDialog_Wulfgar();
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	if((Wulfgar_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Wulfgar_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		B_Wulfgar_SkillComment();
	};
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Wulfgar))
	{
		B_BuildLearnDialog_Wulfgar();
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Wulfgar))
	{
		B_BuildLearnDialog_Wulfgar();
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Wulfgar))
	{
		B_BuildLearnDialog_Wulfgar();
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Wulfgar))
	{
		B_BuildLearnDialog_Wulfgar();
	};
};

func void B_Ruga_Teach_Log()
{
	if(Ruga_Teach_Log == FALSE)
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"��������� ���� ����� ������ ��� �������� ��� �������� � ������� ���� ������������ ���������.");
		}
		else if((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV))
		{
			Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
			B_LogEntry(TOPIC_CityTeacher,"��������� ���� ����� ������ ��� �������� ��� �������� � ������� ���� ������������ ���������. �� ��� ����� � ������ ��������� � ��������� ��������� ��� ����� �����.");
		};
		Ruga_Teach_Log = TRUE;
	};
};

func int C_WulfgarCanGiveBonus()
{
	if(Wld_IsTime(5,0,6,54) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_CENTRE_01") < 600))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Wulfgar_AlsMil(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_AlsMil_Condition;
	information = DIA_Wulfgar_AlsMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_AlsMil_Condition()
{
	if(other.guild == GIL_MIL)
	{
		if(Npc_KnowsInfo(other,DIA_Wulfgar_Bonus) || !C_WulfgarCanGiveBonus())
		{
			return TRUE;
		};
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//������, ���� ����� ������ ����!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//� �������, �� ������ ��������� ������������� �����.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//���� ������ ���� ������������ ���������, � ������ ������� ���� ����� �������.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//�� ����� ������ - ��� ��������� ��������� ������� ���� ���.
	B_Wulfgar_SkillComment();
	if(Mortis_TeachSTR == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"��������� ������ ����� ������ ��� �������� ��� ����.");
	};
	B_Ruga_Teach_Log();
};


instance DIA_Wulfgar_Bonus(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_Bonus_Condition;
	information = DIA_Wulfgar_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && C_WulfgarCanGiveBonus())
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//������ ������? � ������ ���� � ��� ����� ���. �� ��� �� �� �����, �� ����� ���������������.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//���� ������������. �� ������ �������� ��������� �����������, ���� ���������� �� �����, � ����� �������� � ���������� ������.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//����� �� ���� � ����� ��������� ���!
	B_RaiseTalentByPermBonus(other,NPC_TALENT_1H,2);
};

