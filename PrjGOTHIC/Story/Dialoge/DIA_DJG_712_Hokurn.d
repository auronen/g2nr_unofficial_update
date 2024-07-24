
var int Hokurn_BoozeGiven;
var int Hokurn_WineGiven;
var int Hokurn_DarkWineGiven;
var int Hokurn_WineComment;

func int C_GotDrinkForHokurn()
{
	if(Npc_HasItems(other,ItFo_Beer))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Booze))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Addon_Rum))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Addon_Grog))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Addon_Liquor))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Addon_LousHammer))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_Addon_SchlafHammer))
	{
		return TRUE;
	};
	if(Npc_HasItems(other,ItFo_DarkWine))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_GiveDarkWineHokurnXP()
{
	if(Hokurn_DarkWineGiven == FALSE)
	{
		B_GivePlayerXP(200);
		Hokurn_DarkWineGiven = TRUE;
	};
};

func void B_Hokurn_WineComment()
{
	if((Hokurn_WineGiven == TRUE) && (Hokurn_WineComment == FALSE))
	{
		AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//�� ������� ���� � ����� ��������� �� ����� ��������� ����.
		Hokurn_WineComment = TRUE;
	};
};

func void B_GiveDrinkToHokurn()
{
	AI_WaitTillEnd(self,other);
	if(Npc_HasItems(other,ItFo_Booze))
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
		Hokurn_BoozeGiven = TRUE;
	}
	else if(Npc_HasItems(other,ItFo_Wine))
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
		Hokurn_WineGiven = TRUE;
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum))
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog))
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Liquor))
	{
		B_GiveInvItems(other,self,ItFo_Addon_Liquor,1);
		B_UseItem(self,ItFo_Addon_Liquor);
	}
	else if(Npc_HasItems(other,ItFo_Addon_LousHammer))
	{
		B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
		B_UseItem(self,ItFo_Addon_LousHammer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_SchlafHammer))
	{
		B_GiveInvItems(other,self,ItFo_Addon_SchlafHammer,1);
		B_UseItem(self,ItFo_Addon_SchlafHammer);
	}
	else if(Npc_HasItems(other,ItFo_Beer))
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_DarkWine))
	{
		B_GiveInvItems(other,self,ItFo_DarkWine,1);
		B_UseItem(self,ItFo_DarkWine);
		Hokurn_WineGiven = TRUE;
		B_GiveDarkWineHokurnXP();
	};
	if(HokurnGetsDrink == FALSE)
	{
		AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(������) ��, ����� ����������!
		B_Hokurn_WineComment();
		AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//������ � ����� ���� ���������� ������. ��� � ���� ������� ��� ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//��� ����� ������� �����. � ������ ����� �� �����.
		B_Hokurn_WineComment();
	};
	HokurnLastDrink = B_GetDayPlus();
	HokurnGetsDrink = TRUE;
};

instance DIA_Hokurn_EXIT(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hokurn_Hello(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hokurn_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//� ���� �� �������� ����-������ ������?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//�������, ���� ���� �� ��������.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//���, ���� ������! ��� ����� ���-������ �����������, ����� �, �������, ��� ���������� �� ���� ��������� �������� ����.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//����� ��� ����� �� ������� ��������� �����, ��� ����� ������������� � ��� �������, ��� �� ���-��� ���������.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,"� ����� �� ���� ������ ����.",DIA_Hokurn_Hello_No);
	if(C_GotDrinkForHokurn())
	{
		Info_AddChoice(DIA_Hokurn_Hello,"���, ������ ���.",DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//� ����� �� ���� ������ ����.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//����� ����������!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"��� ����...",DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//��� ����...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(�����) �� ���, �� ����� ����? ��������!!!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"��� �����.",DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//��� �����.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(�����) �� ��� ����������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//���, ������ ���.
	B_GiveDrinkToHokurn();
	Info_ClearChoices(DIA_Hokurn_Hello);
};


instance DIA_Hokurn_Drink(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent = TRUE;
	description = "� ������ ���� �������.";
};


func int DIA_Hokurn_Drink_Condition()
{
	if((HokurnGetsDrink == FALSE) && C_GotDrinkForHokurn())
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//� ������ ���� �������.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(�����) ����� ����!!!
	B_GiveDrinkToHokurn();
};


instance DIA_Hokurn_Question(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent = TRUE;
	description = "��� ����� ���-����� ����������.";
};


func int DIA_Hokurn_Question_Condition()
{
	if(HokurnGetsDrink == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//��� ����� ���-����� ����������.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(�����������) � �����, �� ���� �����. � ������ ������ � ��������.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//� ������ ������ ������� �� ���� ��������. �����? ������ ����������!
};


var int DIA_Hokurn_Teacher_permanent;

instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = "� ��� ��������, ������� ��� �� ������� ���� ����-������.";
};


func int DIA_Hokurn_Learn_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//� ��� ��������, ������� ��� �� ������� ���� ����-������.
	if(VisibleGuild(other) == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//��� �� ���������. ���� ���� �� ��������� ������ �������� ���.
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Hokurn) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Hokurn))
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Hokurn_TeachPlayer = TRUE;
		DIA_Hokurn_Teacher_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//� ��� �� ������� ���� ��������� �����. � ������ ���� �� ������ ���� ������.
		AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//��� ��� �� ������, � ������ ���� ������. ��� ����� ������ 300 ������� �����.
		Log_CreateTopic(TOPIC_OutTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_OutTeacher,"������� �� �������� ������ ������ ������� ���� ��������� ������ �������.");
		Info_ClearChoices(DIA_Hokurn_Learn);
		Info_AddChoice(DIA_Hokurn_Learn,"��� ��� ���� ������� ������.",DIA_Hokurn_Learn_TooExpensive);
		if(Npc_HasItems(other,ItMi_Gold) >= 300)
		{
			Info_AddChoice(DIA_Hokurn_Learn,"������, ��� ������.",DIA_Hokurn_Learn_OK);
		};
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//��� ��� ���� ������� ������.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//������� ������? ��� ������, ��� ����� ������ �������� �� �� ���� �����.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//��, ��� �������.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void B_Hokurn_TeachPlayer()
{
	B_GiveInvItems(other,self,ItMi_Gold,300);
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//�� �� ���������!
	Hokurn_TeachPlayer = TRUE;
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//������, ��� ������.
	B_Hokurn_TeachPlayer();
	Info_ClearChoices(DIA_Hokurn_Learn);
};


instance DIA_Hokurn_PayTeacher(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent = TRUE;
	description = "��� ���� ������. � ����, ����� �� ������ ����.";
};


func int DIA_Hokurn_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hokurn_Learn) && (Npc_HasItems(other,ItMi_Gold) >= 300) && (Hokurn_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//��� ���� ������. � ����, ����� �� ������ ����.
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Hokurn) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Hokurn))
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Hokurn_TeachPlayer = TRUE;
		DIA_Hokurn_Teacher_permanent = TRUE;
	}
	else
	{
		B_Hokurn_TeachPlayer();
	};
};


instance DIA_Hokurn_DrinkAndLearn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent = TRUE;
	description = "���, ����� �������.";
};


func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if((HokurnGetsDrink == TRUE) && C_GotDrinkForHokurn())
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//���, ����� �������.
	B_GiveDrinkToHokurn();
};


var int DIA_Hokurn_TeachState_1H;
var int DIA_Hokurn_TeachState_2H;

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//���� ������ �� ����� ������� � ���� ���� ������� ���������.
};

func void B_BuildLearnDialog_Hokurn()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
	Info_AddChoice(DIA_Hokurn_Teach,Dialog_Back,DIA_Hokurn_Teach_Back);
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Hokurn)
	{
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,1),DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnTalentString(other,NPC_TALENT_2H,5),DIA_Hokurn_Teach_2H_5);
		DIA_Hokurn_TeachState_2H = 1;
	}
	else
	{
		if(DIA_Hokurn_TeachState_2H != 2)
		{
			if(DIA_Hokurn_TeachState_1H != 2)
			{
				if(DIA_Hokurn_TeachState_2H != 0)
				{
					PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
					B_Hokurn_TeachedEnough();
				};
			};
		};
		DIA_Hokurn_TeachState_2H = 2;
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Hokurn)
	{
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,1),DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach,B_BuildLearnTalentString(other,NPC_TALENT_1H,5),DIA_Hokurn_Teach_1H_5);
		DIA_Hokurn_TeachState_1H = 1;
	}
	else
	{
		if(DIA_Hokurn_TeachState_1H != 2)
		{
			if(DIA_Hokurn_TeachState_2H != 2)
			{
				if(DIA_Hokurn_TeachState_1H != 0)
				{
					PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
					B_Hokurn_TeachedEnough();
				};
			};
		};
		DIA_Hokurn_TeachState_1H = 2;
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Hokurn) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Hokurn))
	{
		DIA_Hokurn_Teacher_permanent = TRUE;
	};
	if((DIA_Hokurn_TeachState_1H == 2) && (DIA_Hokurn_TeachState_2H == 2))
	{
		PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = "����� ������ ��������.";
};


func int DIA_Hokurn_Teach_Condition()
{
	if((Hokurn_TeachPlayer == TRUE) && (DIA_Hokurn_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//����� ������ ��������.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//������� ������� ��� ���-������ ������!
		if(VisibleGuild(other) == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//� ����� ���������, ��� ����� ������ �� ����� ������ ����������� ������, ��?
		};
	}
	else
	{
		B_BuildLearnDialog_Hokurn();
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void DIA_Hokurn_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Hokurn))
	{
		B_BuildLearnDialog_Hokurn();
	};
};

func void DIA_Hokurn_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Hokurn))
	{
		B_BuildLearnDialog_Hokurn();
	};
};

func void DIA_Hokurn_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Hokurn))
	{
		B_BuildLearnDialog_Hokurn();
	};
};

func void DIA_Hokurn_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Hokurn))
	{
		B_BuildLearnDialog_Hokurn();
	};
};


instance DIA_Hokurn_StayHere(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent = FALSE;
	description = "������, � ��� �� ������ ����� �������?";
};


func int DIA_Hokurn_StayHere_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//������, � ��� �� ������ ����� �������?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//���� ������, ������� �� ����, ��� �� ������ ����� � ����� ��� ��������.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//� ���� � ���� ���� �������, ���� ��� ���������� �� �������.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = "�� ������, ��� ��������� �������?";
};


func int DIA_Hokurn_WhereDragon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hokurn_StayHere) && (MIS_AllDragonsDead == FALSE) && (HokurnTellsDragon == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//�� ������, ��� ��������� �������?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//� ��� � ������ �� ��, ��� ����� ��� ����?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"������, � ��� �� �����.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"� ��� �� �� ����� ��������� ���� �� ��� ����������.",DIA_Hokurn_WhereDragon_Gold);
	if((Hokurn_WineComment == TRUE) && (Npc_HasItems(other,ItFo_Wine) || Npc_HasItems(other,ItFo_DarkWine)))
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"��� ���� ����.",DIA_Hokurn_WhereDragon_GiveDrink);
	}
	else if(Npc_HasItems(other,ItFo_Booze))
	{
		if(Hokurn_BoozeGiven == TRUE)
		{
			Info_AddChoice(DIA_Hokurn_WhereDragon,"� ���� ���� ��� ���� ��������� �����!",DIA_Hokurn_WhereDragon_GiveDrink);
		}
		else
		{
			Info_AddChoice(DIA_Hokurn_WhereDragon,"� ���� ���� ��������� �����!",DIA_Hokurn_WhereDragon_GiveDrink);
		};
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//������, � ��� �� �����.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//���� ����� ���� ������������. ������� ���� ���� ����� �������������� ����.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//� ��� �� �� ����� ��������� ���� �� ��� ����������.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//��������� ���? ���. ������, � ������ ���� ��� ���������� �� 200 ������� �����.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"��� ������� �����!",DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"������������. ��� ���� ������!",DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//��� ������� �����!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//����� ������ �� ����.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//������������. ��� ���� ������!
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void B_HokurnGiveMeThat()
{
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//������������. ����� ��� ��� �������!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//� ������� �� �� ������ ����.
};

func void DIA_Hokurn_WhereDragon_GiveDrink()
{
	if((Hokurn_WineComment == TRUE) && (Npc_HasItems(other,ItFo_Wine) || Npc_HasItems(other,ItFo_DarkWine)))
	{
		AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//��� ���� ����.
		B_HokurnGiveMeThat();
		if(Npc_HasItems(other,ItFo_Wine))
		{
			B_GiveInvItems(other,self,ItFo_Wine,1);
		}
		else if(Npc_HasItems(other,ItFo_DarkWine))
		{
			B_GiveInvItems(other,self,ItFo_DarkWine,1);
			B_GiveDarkWineHokurnXP();
		};
	}
	else if(Npc_HasItems(other,ItFo_Booze))
	{
		if(Hokurn_BoozeGiven == TRUE)
		{
			AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//� ���� ���� ��� ���� ��������� �����!
		}
		else
		{
			AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00_add");	//� ���� ���� ��������� �����!
		};
		B_HokurnGiveMeThat();
		B_GiveInvItems(other,self,ItFo_Booze,1);
	};
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};


instance DIA_Hokurn_Dragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent = TRUE;
	description = "������, ������ �����, ��� ��� ��� �������?";
};


func int DIA_Hokurn_Dragon_Condition()
{
	if((HokurnTellsDragon == TRUE) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//������, ������ �����, ��� ��� ��� �������?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//��, ���� ������, � �� ���� ������� ���� ������ �������������, �� � ������, ��� ����� ������ ���� ������ �������.
	if(FireDragonIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//������� ����� ��� ����� ������� ����� �� ������ �������� ��������.
		AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//����� ���������� ����� �������, ��� ���� �� ����� ��������, ������ �� ��� �� ������� ���.
	};
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = "� ���� ���� ��������.";
};


func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//� ���� ���� ��������.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//���, ����������� ������ ����-������ �������.
};

