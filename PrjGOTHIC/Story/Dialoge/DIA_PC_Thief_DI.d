
instance DIA_PC_Thief_DI_EXIT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 999;
	condition = DIA_PC_Thief_DI_EXIT_Condition;
	information = DIA_PC_Thief_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PC_Thief_DI_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_PC_Thief_DI_Hallo(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_Hallo_Condition;
	information = DIA_PC_Thief_DI_Hallo_Info;
	description = "�� �������.";
};


func int DIA_PC_Thief_DI_Hallo_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//�� �������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//���� ������, ������, ��������� ������ �������� �� ��������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//� �� ���� �� ����. �� ������ ������ ���� ����� ��� ���� ����������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//� ��� ����� ������� ���� ������ - ��� ����� ��� ������ ��������� ���������� �������� � ������������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//���� ����� ��������, ��� ���� ��� ��� ����� �������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//�� ���� ������ �������, ��, ��������, ���������� �� �������-������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//���� ���� ���������, ��� �� �� ������, ��� ������ ������, ������� �� ���. ��������, ��� ���� ������ ���� ������.
};


var int DIA_PC_Thief_DI_RAT_OneTime;

instance DIA_PC_Thief_DI_RAT(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_RAT_Condition;
	information = DIA_PC_Thief_DI_RAT_Info;
	permanent = TRUE;
	description = "��� ����� ���� �����.";
};


func int DIA_PC_Thief_DI_RAT_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_RAT_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//��� ����� ���� �����.
	if(Npc_IsDead(AntiPaladin_DI) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//� ���������� ����� ����� ���� ����-��������. � �� ���� ������������ ������ ������� ������ ���� �����.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//���� - ������ ��������. �������� �� �������������. � �������, � ��� ��� ���-�� ����� ���������� �������. ������� ����� �� ������� ������� ������������.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//�����, ������� - ��� ����������� ������ ����� �������� � ������������ �������, ����� �������� ��������.
	}
	else if(Npc_IsDead(FireDragonIsland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//� �������� � �������� � ������ ������� ����� ��������� � ��������� ������. ���� ���� ������, � � �� ����, ��� �������� ���.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//���. � �� �� �������� ������������ ������? ����� ����, �������� ����� ������������ ��� ������ ��������.
	}
	else if(Npc_IsDead(Archol) && (EnteredFinalDIHall == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//� �������� �� ����� ���� ������� ������ � �� ���������� �������.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//������, �� � ������� �� ���� ���� � �������. ����� ���� �������� ���������� ���-�� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//������� �� ���, ���� � ���� ��������� ��������, ������� ��� ���� ����� ������ ���������.
	};
	if((OrkSturmDI == TRUE) && (DIA_PC_Thief_DI_RAT_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//��� ����. � �� ���������, ����� �� �� �������� ���� ���� ������, ��� ������ �����, � �������. � �������, ���� ���� ����� ��� ��������� ������, ������� ��� �������� �������� �����!
		B_GivePlayerXP(XP_AmbientKap6);
		DIA_PC_Thief_DI_RAT_OneTime = TRUE;
	};
};


instance DIA_Diego_DI_TRADE(C_Info)
{
	npc = PC_Thief_DI;
	nr = 12;
	condition = DIA_Diego_DI_TRADE_Condition;
	information = DIA_Diego_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ����� ��������.";
};


func int DIA_Diego_DI_TRADE_Condition()
{
	if(!Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Diego_DI_TRADE_Info()
{
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//��� ����� ��������.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	B_RefreshTraderAmmo(self,50);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//��������, � ����� ������ ����.
};


func void B_BuildLearnDialog_Diego_DI()
{
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,Dialog_Back,DIA_PC_Thief_DI_Training_Talente_BACK);
	if(!Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(NAME_Skill_PickLock,B_GetLearnCostTalent(other,NPC_TALENT_PICKLOCK,1)),DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(ATR_DEXTERITY,1)),DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(ATR_DEXTERITY,5)),DIA_PC_Thief_DI_Training_DEX_5);
	if(VisibleTalentValue(NPC_TALENT_BOW) < 100)
	{
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_PC_Thief_DI_Training_Combat_BOW_1);
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_PC_Thief_DI_Training_Combat_BOW_5);
	};
};

instance DIA_PC_Thief_DI_Training_Talente(C_Info)
{
	npc = PC_Thief_DI;
	nr = 10;
	condition = DIA_PC_Thief_DI_Training_Talente_Condition;
	information = DIA_PC_Thief_DI_Training_Talente_Info;
	permanent = TRUE;
	description = "����� ����.";
};


func int DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if(!Npc_IsDead(UndeadDragon) && Npc_KnowsInfo(other,DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//����� ����.
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//� ���� ������� ����, ��� ����� ����� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//��� ���� �����?
	};
	B_BuildLearnDialog_Diego_DI();
};

func void DIA_PC_Thief_DI_Training_DEX_1()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//���� ����� ����������� �����, ���� �� ������ ��������� �������� �� ����� ����.
		B_BuildLearnDialog_Diego_DI();
	};
};

func void DIA_PC_Thief_DI_Training_DEX_5()
{
	if(B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//����� �� ����������, ������ ����� � ���, ��� ����� ������������� ����. ��������� ������ ���� �����.
		B_BuildLearnDialog_Diego_DI();
	};
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//��� ���������� ������� ���������� �������� ����������.
		B_BuildLearnDialog_Diego_DI();
	};
};

func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//����� ���� ���� �� �������, �� ����� ������������ �������� ������ ������.
		B_BuildLearnDialog_Diego_DI();
	};
};

func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//����� ������, ��� �������. �������, ��� �� �� ������ ��� ����������� ������.
		B_BuildLearnDialog_Diego_DI();
	};
};

func void DIA_PC_Thief_DI_Training_Talente_BACK()
{
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
};

func void B_PC_Thief_JustLucky()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//��� ������ �������, � �����.
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(�������) ��, ���� �� ��� �������...
};

var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;

instance DIA_PC_Thief_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Thief_DI;
	nr = 5;
	condition = DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information = DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "��� �������. ������ �� ����� ��������� ������.";
};


func int DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if(Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//��� �������. ������ �� ����� ��������� ������.
	if((Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000) && (DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//�� ������ �������� �� ���. � ����� �� ����� ������ ����������.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//��� ����, ���� ������, ������� ������ ���?
		B_PC_Thief_JustLucky();
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//�������.
	};
	if(DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//��� �� ����������� ������ ������?
		if(MIS_HelpDiegoNW != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_DIEGONW_NEEDHELP_PROBLEM_WILLHELPYOU_11_01");	//� ������� ��������� ��������� � ������ ��������...
		}
		else
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//������� ������. � �����, ������� ����� ��������� � �������.
			if((Andre_FoundThieves_Reported == TRUE) || (MIS_Andre_GuildOfThieves == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//��� ������ ��� ������� �����. ��� ��������� ����� ���������� �����������.
			};
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//���. ��, ���, ����� ����, � ������ �������� ������ �������. ��� ����� �������� ������. ������� ������.
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//��� � ��������. ����� �� ��������� �����.
	AI_StopProcessInfos(self);
	if(DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if(Lares_IsOnBoard != LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"SittingShipDI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
};


instance DIA_Thief_DI_PICKPOCKET(C_Info)
{
	npc = PC_Thief_DI;
	nr = 900;
	condition = DIA_Thief_DI_PICKPOCKET_Condition;
	information = DIA_Thief_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_120;
};


func int DIA_Thief_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET,Dialog_Back,DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

