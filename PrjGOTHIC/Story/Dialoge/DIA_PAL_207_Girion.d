
instance DIA_Girion_EXIT(C_Info)
{
	npc = PAL_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_Hallo(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//� ������, ������ ��� ��������� ������� � ������� ������. �� ������ ������ �� ���������� ����?
};


var int DIA_Girion_Teach_permanent;

instance DIA_Girion_CanTeach(C_Info)
{
	npc = PAL_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//�� ������ ������� ����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//��� ������, ��� �� ������ ��������� ������ ������������ �� ���� ������ ������. ��� � �������� ���������� ����� ������.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//� ����� ����. �������� �� ���, ����� ������ �����.
		Girion_Teach2H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"������� ������ ����� ������� ���� ��������� �������� ��������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//���� �� ������ ��������� ����-������, ���� ����� �������� ������� �� �� ������ ������.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//� ����, � �� �������.
		if((other.guild != GIL_NONE) && (other.guild != GIL_MIL))
		{
			Girion_Teach2H = TRUE;
			DIA_Girion_Teach_permanent = TRUE;
		};
	};
};


func void B_BuildLearnDialog_Girion()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Girion)
	{
		Info_ClearChoices(DIA_Girion_Teach);
		Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
		Info_AddChoice(DIA_Girion_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Girion_Teach_2H_1);
		Info_AddChoice(DIA_Girion_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Girion_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Girion)
		{
			DIA_Girion_Teach_permanent = TRUE;
		};
		if(VisibleTalentValue(NPC_TALENT_2H) < 100)
		{
			PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Girion)),-1,53,FONT_Screen,2);
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//������-�� ������, ���� �������� ��� �� ���������, �� � ������ ������ �� ���� ������� ����.
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//���� �� ������ �������� ���� ���������� ��� ������, ���� ����� �������� ���������� ������� ����.
			AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//� ��� ��� ����� ������ ��������?
			AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//���� ����� - ������-������. �� ��������� ������ ������� ����.
		}
		else
		{
			PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
			B_Say(self,other,"$NOLEARNYOUREBETTER");
		};
		AI_StopProcessInfos(self);
	};
};

func void B_GirionTeachComment()
{
	if(Girion_Labercount == 0)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//�������� � ������. ��� - ���� �����, � ��� �� ����� ��� �����?
		Girion_Labercount = 1;
	}
	else if(Girion_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//���� ��������� � ����� � ���. ������� ������ ����������.
		Girion_Labercount = 2;
	}
	else if(Girion_Labercount == 2)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//������� �� ������� � ��� ����������������. ����������, ������� �� ����� �������.
		Girion_Labercount = 3;
	}
	else if(Girion_Labercount == 3)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//������� ������ ����� � ���. �� ������� �� �������� ���, � ������� �� ����� ��������.
		Girion_Labercount = 4;
	}
	else if(Girion_Labercount == 4)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//������� ��������� �� ������ �����, �� � �������.
		Girion_Labercount = 5;
	}
	else if(Girion_Labercount == 5)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//�����, ���� �� ���������� ������, �� ������������� ������ ���������� � �� ����� ��� ����� �������������� ����.
		Girion_Labercount = 6;
	}
	else if(Girion_Labercount == 6)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//����������� - ��� ������ ������.
		Girion_Labercount = 0;
	};
};

instance DIA_Girion_Teach(C_Info)
{
	npc = PAL_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = "� ����� � ��������.";
};


func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Teach_Info()
{
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//� ����� � ��������.
	B_BuildLearnDialog_Girion();
};

func void DIA_Girion_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Girion))
	{
		B_GirionTeachComment();
		B_BuildLearnDialog_Girion();
	};
};

func void DIA_Girion_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Girion))
	{
		B_GirionTeachComment();
		B_BuildLearnDialog_Girion();
	};
};

instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = PAL_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//��! �� ������ ������� ���, ��� �� ������� �����?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"� �� ����, � ��� �� ��������.",DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"����� � ���� ������, ��� ��� �������� ����� ����.",DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"��� ����� ���� �������. ������� � ������� ���.",DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//� �� ����, � ��� �� ��������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//� ������ � ���, ��� �� ������ � ����������� �������. ��� ���� ����� ������.
	if((hero.guild == GIL_KDF) && !Npc_IsDead(Schiffswache_212) && !Npc_IsDead(Schiffswache_213))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//���� �������� �� ��, ��� �� ���, � �� ������� ����.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//����� � ���� ������, ��� ��� �������� ����� ����.
	if(!Npc_IsDead(Schiffswache_212) && !Npc_IsDead(Schiffswache_213))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//��������, ���� ������� �������� ������ �������, �� �� ���� ���� ��� ������ �� ����������, ��� ��������� ����.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//���� ���� �� ���� �� ���, ��� �� ���� ���� ����� �������� ������������� ������. ����, ��������� ���������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//���������!
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//����� �� �������� � ���� �����, �� ������� ���� ������� ������� ���, �������?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//��� ����� ���� �������. ������� � ������� ���.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//�� �� ������ ������� ���. ��� ��������� ��� ����...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//��� �� ������?! ��, ������� �������...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//���� � ������ �������� ������������, ����� ������������� ����������� ������. � ��� ���. ��� ������ ������. ������ ������ - ���� ������ ����.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//��������� ���� ������ ���� ����� �� ������� ���������� ������. � ������� ���� � ������ ����� ����� �����.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//���� ������������� �� ���, ���� ��� �������� ����������� � �����. �������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//�-�-�. ������, � ���� ��� ������.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//���������.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//�����, ������. � ������������ � ����, �� ��� ����� �������.
	B_GirionStayOnShip();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//� �������� ���.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//����� ����� ��, ��� ������. � � ������� ���� �����.
	B_JoinShip(self);
};


instance DIA_Girion_Verrat(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if(Girion_WantstoKillSC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//���������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = PAL_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};

