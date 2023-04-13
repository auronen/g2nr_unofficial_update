
instance DIA_Andre_EXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Andre_EXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Andre_FIRSTEXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Andre_FIRSTEXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTEXIT_Info()
{
	B_PlayerEnteredCity();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Wulfgar,"START");
};


var int Andre_ToldInfoFromPablo;
var int Andre_ToldInfoFromCanthar;

func int C_Andre_InfoFromCanthar()
{
	if((Andre_ToldInfoFromCanthar == FALSE) && !Npc_IsDead(Canthar))
	{
		if(MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
		{
			return TRUE;
		};
		if(Canthars_KomproBrief_Failed == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_Andre_InfoFromPablo()
{
	if((Andre_ToldInfoFromPablo == FALSE) && !Npc_IsDead(Pablo))
	{
		if(Pablo_AndreMelden == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void B_Andre_Informed()
{
	if(C_Andre_InfoFromPablo())
	{
		AI_Output(self,other,"DIA_Andre_Add_08_00");	//���� �� ���� ����� ������ ���, ��� ������� �������������� ���������� � ������� � ����� ������������.
		AI_Output(self,other,"DIA_Andre_Add_08_01");	//�� ����� ������, ��� �������� �� ��� �������.
		AI_Output(self,other,"DIA_Andre_Add_08_02");	//��� ��� ��� ��� ������?
		AI_Output(other,self,"DIA_Andre_Add_15_03");	//� �� ����, ������ ��� ���� ����...
		AI_Output(self,other,"DIA_Andre_Add_08_04");	//�������, ���� ������ �� �����, ��� �� �������� ��� ������.
		AI_Output(self,other,"DIA_Andre_Add_08_06");	//����������� �� ���� �������� - ������ ���������� �� �������.
		AI_Output(self,other,"DIA_Andre_Add_08_07");	//� �������, ��� �� ����� �� ������ � ����� ������������!
		Andre_ToldInfoFromPablo = TRUE;
	};
	if(C_Andre_InfoFromCanthar())
	{
		AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//�� ��� �������� �������� ������. �� ������, ��� �� ������ ��������� �� �������.
		AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//� �� ����, ������ �� ���, � ����������� �� ���������� ���� �� ����, �� �� ������ ������� ���� ������.
		if(!Npc_IsDead(Sarah))
		{
			if(SarahWeaponsRemoved == FALSE)
			{
				B_GiveTradeInv_Sarah(Sarah);
				B_RemoveSarahWeapons();
			};
			B_RemoveNpc(VLK_470_Sarah);
		};
		if((Canthar_Ausgeliefert == TRUE) && (Npc_GetDistToWP(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000))
		{
			B_NpcSetReleased(Canthar);
			Canthar.aivar[AIV_IGNORE_Murder] = FALSE;
			Canthar.aivar[AIV_IGNORE_Theft] = FALSE;
			Canthar.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
		};
		B_StartOtherRoutine(Canthar,"MARKTSTAND");
		AI_Teleport(Canthar,"NW_CITY_SARAH");
		if((Canthar_Sperre == FALSE) && (Canthar_Pay == FALSE))
		{
			Canthar_Sperre = TRUE;
		};
		MIS_Canthars_KomproBrief = LOG_OBSOLETE;
		B_CheckLog();
		Andre_ToldInfoFromCanthar = TRUE;
	};
	if((other.guild == GIL_MIL) || ((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin)))
	{
		AI_Output(self,other,"DIA_Andre_Add_08_05");	//��� �� ����� � ��������� ���� � ����������� ����������.
	};
};

instance DIA_Andre_Informed(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_Informed_Condition;
	information = DIA_Andre_Informed_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_Informed_Condition()
{
	if(C_Andre_InfoFromPablo() || C_Andre_InfoFromCanthar())
	{
		return TRUE;
	};
};

func void DIA_Andre_Informed_Info()
{
	B_Andre_Informed();
};


func void DIA_Andre_PayForCrimesNow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	B_GiveInvItems(other,self,ItMi_Gold,Andre_Schulden);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//������! � ����������, ����� ��� � ������ ������ �� ���� - ��� ���� ���-�� ����������� ���� ���������.
	B_GrantPersonalAbsolution(self);
};

func void DIA_Andre_PayForCrimesLater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//� ���� ������������ ������.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//����� ���������� ������� ����������� ����� ��� ����� �������.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//�� ������ ������������ ����: ���� �� ��� ���� ��������� ���� ����, �� ���� ����� ������ ���������.
	Andre_LastPetzCounter = B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};

func void DIA_Andre_BuildCrimesDialog()
{
	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_AddChoice(DIA_Andre_PMSchulden,"� ���� ������������ ������.",DIA_Andre_PMSchulden_PayForCrimesLater);
	Info_AddChoice(DIA_Andre_PMSchulden,"������� ��� ���?",DIA_Andre_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PMSchulden,"� ���� ��������� �����!",DIA_Andre_PMSchulden_PayForCrimesNow);
	};
};

func void DIA_Andre_PMSchulden_PayForCrimesNow()
{
	DIA_Andre_PayForCrimesNow();
	Info_ClearChoices(DIA_Andre_PMSchulden);
};

func void DIA_Andre_PMSchulden_PayForCrimesLater()
{
	DIA_Andre_PayForCrimesLater();
	Info_ClearChoices(DIA_Andre_PMSchulden);
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//������� ��� ���?
	B_Say_Gold(self,other,Andre_Schulden);
	DIA_Andre_BuildCrimesDialog();
};

instance DIA_Andre_PMSchulden(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Andre_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Andre_PMSchulden_Info()
{
	var int diff;
	B_PlayerEnteredCity();
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//�� ������ ��������� �����?
	};
	B_Andre_Informed();
	if(B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//� ���� ��������� ��������: ���������� �� �� ��������� �����?!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//��������� ������ ���� ������ ��������!
		if(Andre_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//� ������������ ����! ������ �����, ������� ���� �������� ���������, ������ ����������!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//�������?
			diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
			if(diff > 0)
			{
				Andre_Schulden += diff * 50;
			};
			if(Andre_Schulden > 1000)
			{
				Andre_Schulden = 1000;
			};
			B_Say_Gold(self,other,Andre_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//�� ������� ����������� ����!
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//���������� ����� �����������.
		if(Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//���������� �� �������� ������, ��� �� ��� �������� ���� � ��������.
		};
		if((Andre_LastPetzCrime == CRIME_THEFT) || ((Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//����� ������ �� ������, ����� �� ���-�� ����.
		};
		if((Andre_LastPetzCrime == CRIME_ATTACK) || ((Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//������ ��� ���������� ����, ��� �� �������� ������� � �����.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//������, ��� ��� ��������� ������ ���� ��������� ����������������.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//� �� ����, ��� ���������, �� � ������������ ����: �� ������� �������� ����!
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//��� �� �� �� ����, � ����� ����� � ���� ��� ���������.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//������, ����� ������ �� ���� ������� �������!
			B_GrantPersonalAbsolution(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//� ����, ����� ���� ���� �������: ���� ��� ����� �������� ��������� ������ ����� ������.
			B_Say_Gold(self,other,Andre_Schulden);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//��� �������?
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		DIA_Andre_BuildCrimesDialog();
	};
};


func void DIA_Andre_PETZMASTER_PayForCrimesNow()
{
	DIA_Andre_PayForCrimesNow();
	Info_ClearChoices(DIA_Andre_PETZMASTER);
};

func void DIA_Andre_PETZMASTER_PayForCrimesLater()
{
	DIA_Andre_PayForCrimesLater();
	Info_ClearChoices(DIA_Andre_PETZMASTER);
};

instance DIA_Andre_PETZMASTER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0;
	B_PlayerEnteredCity();
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//�� ��� �������, ��� ��������� �����.
	};
	B_Andre_Informed();
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//������, ��� �� ������ �� ��� ���� ��� ��� ����� �������.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//�������� - ��������� ������������!
		Andre_Schulden = B_GetTotalPetzCounter(self) * 50 + 500;
		if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//�� ������ ��� � ������ �����, ��� �� ��������.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//������ ��������� ������� ����� �� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//� ����������� ������� �� �������� ����� � ������!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//�� � �� ������������� � ���, ����� �������� ����. ���� �����, � ��� ����� ������ ������.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//�� ����� �� ���-�� ������ ��������� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//�� ��� �� ����������� ���� ���������, �������� ����� - �����������, �� ������ ���� �������� ������������.
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//������, ��� �� ������! ���� �������� � ���������! ���� ���������!
		if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//�� ������ ��� � ������ ����� ������������, � ������� � ������.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//� �� �������� ������ ��������� � ���� ������!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//�� ������ ��������� �����, ����� �������� ���� ����.
		Andre_Schulden = B_GetTotalPetzCounter(self) * 50;
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//���� �� �������� �� ������ ������� � ������ - ��� ����...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//�� ����� �� ��������� �� ������� ��� ����������� ������, � ������ ������� ����.
		if(PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//� ��� ���� ���� ����������� �������?
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//���� � ������ ��� ������ ����, ����� ��� ����� ������ ��, ��� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//��� ��� ���� �������� ��������� ��������������� ����� - � ���� ����������� ����� ������.
		Andre_Schulden = B_GetTotalPetzCounter(self) * 50;
	}
	else if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//� ������, ��� �� ������� ����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//�� �� ���������, ��� � �� ���� �������� ��� ���� ������ ���.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//���� �������� ��������� �����������!
		Andre_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//�������?
	if(Andre_Schulden > 1000)
	{
		Andre_Schulden = 1000;
	};
	B_Say_Gold(self,other,Andre_Schulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PETZMASTER,"� ���� ������������ ������.",DIA_Andre_PETZMASTER_PayForCrimesLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PETZMASTER,"� ���� ��������� �����!",DIA_Andre_PETZMASTER_PayForCrimesNow);
	};
};


instance DIA_Andre_Hallo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Hallo_Condition;
	information = DIA_Andre_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Hallo_Info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//�� �������� � ����� �����, ���������! ��� ������� ���� �� ���?
	B_PlayerEnteredCity();
};


func void B_Andre_GotoLordHagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//���� ����� ����������� ����� � ����.
};


func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//���� ����� ��������� ������ ��������� � ���, ��� ������ ���������.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//�� ������� ���� ������ ����������� ������� ����� �� ������� �����.
	Andre_LordHagenNichtZuSprechen = TRUE;
};


instance DIA_Andre_Message(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_Message_Condition;
	information = DIA_Andre_Message_Info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��������� ��� ����� ������.";
};


func int DIA_Andre_Message_Condition()
{
	if(LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Andre_Message_Info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//� ���� ���� ������ ��������� ��� ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//��, �� ������ ����� ��� ��������������. ��� ��� ��� �����?
	Info_ClearChoices(DIA_Andre_Message);
	Info_AddChoice(DIA_Andre_Message,"��� � ���� ������� ������ ����� ������.",DIA_Andre_Message_Personal);
	Info_AddChoice(DIA_Andre_Message,"����� �����, ������������� ���������, ��������� � �����!",DIA_Andre_Message_Dragons);
	Info_AddChoice(DIA_Andre_Message,"��� ������ ���������� ��������� - ����� ������.",DIA_Andre_Message_EyeInnos);
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//��� ������ ���������� ��������� - ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//���� ������ - ������� �� ������ � �����. �� ��� ��� ������ �� ������.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//���� ������������� ���������� ��������, ������� ��� ���, ������ ����� ������������������ ����� ������ ������ ����� ����� � ���.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//��� ������ ��� ����� ���������� ������ � ������ �������.
	Andre_EyeInnos = TRUE;
	if((other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_MIL))
	{
		B_Andre_LordHagenNichtZuSprechen();
	}
	else
	{
		B_Andre_GotoLordHagen();
	};
	Info_ClearChoices(DIA_Andre_Message);
};

func void DIA_Andre_Message_Dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//����� �����, ������������� ���...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(���������) � ����, ��� ����� ����� ���������� ��� �������.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//�� �� �� ������ ��� �������, ��� �� ������ ��� ������ �������� ����� ������.
	if((other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//�� ������� ���� ������, ���� �� ������ ������� ������� ��� �����, �������� ��� ������ ���������.
		AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//� ������, ��� �� ���������� ���� � ��������� ��� ���.
	};
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//��� ���-����, ����� ���� ����� ������� ���?
	if(Npc_KnowsInfo(other,DIA_Lothar_Dragons))
	{
		Player_TalkedAboutDragonsToSomeone = TRUE;
	};
};

func void DIA_Andre_Message_Personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//��� � ���� ������� ������ ����� ������.
	if((other.guild != GIL_KDF) && (other.guild != GIL_PAL) && (other.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//��� ������. �� �� ������ ������ ����:
		B_Andre_LordHagenNichtZuSprechen();
	}
	else
	{
		B_Andre_GotoLordHagen();
	};
	Info_ClearChoices(DIA_Andre_Message);
};


instance DIA_Andre_Paladine(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_Paladine_Condition;
	information = DIA_Andre_Paladine_Info;
	permanent = FALSE;
	description = "������ �������� ������� � �����?";
};


func int DIA_Andre_Paladine_Condition()
{
	if((other.guild != GIL_MIL) && (other.guild != GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladine_Info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//������ �������� ������� � �����?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//���� ����� �������� �������� ������.
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//� ���� ������� ���� ������, ��� ��������� ������ �� ������ ������� ���������.
		AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//���� �� � ��� �����������.
	};
};


func void B_Andre_PaladinsReason()
{
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//�� ������� �� ��������� ������ ������. � ����������� ������� �������� ���� ������������.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//������� ������ �� �������� ���� � ���������� �� �� �������. ��� ������ ���� ���� �� ������ ����� ������ � ������� �����.
	KnowsPaladins_Ore = TRUE;
};

instance DIA_Andre_PaladineAgain(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_PaladineAgain_Condition;
	information = DIA_Andre_PaladineAgain_Info;
	permanent = FALSE;
	description = "��� �� ������� ���, ����� �������� ������� � �������?";
};


func int DIA_Andre_PaladineAgain_Condition()
{
	if((Kapitel < 3) && Npc_KnowsInfo(other,DIA_Andre_Paladine))
	{
		if((other.guild == GIL_MIL) || (other.guild == GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_PaladineAgain_Info()
{
	AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//��� �� ������� ���, ����� �������� ������� � �������?
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//������, ����� �� ������� � ��������� ������, �� ������������ ���������.
		AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//� ������ � ���� �������� ����.
	};
	B_Andre_PaladinsReason();
};


instance DIA_Andre_PaladineAgain2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_PaladineAgain2_Condition;
	information = DIA_Andre_PaladineAgain2_Info;
	permanent = FALSE;
	description = "��� �������� ������ � ������?";
};


func int DIA_Andre_PaladineAgain2_Condition()
{
	if((Kapitel < 3) && !Npc_KnowsInfo(other,DIA_Andre_Paladine))
	{
		if((other.guild == GIL_MIL) || (other.guild == GIL_KDF))
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_PaladineAgain2_Info()
{
	AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//��� �������� ������ � ������?
	B_Andre_PaladinsReason();
};


instance DIA_Andre_AskToJoin(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_AskToJoin_Condition;
	information = DIA_Andre_AskToJoin_Info;
	permanent = FALSE;
	description = "� ���� ��������� �� ������ � ���������!";
};


func int DIA_Andre_AskToJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_AskToJoin_Info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//� ���� ��������� �� ������ � ���������!
	if(Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//������. ��� ����� ����. � ���� �� ����������, ������ �� ����� �������������� � ���.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//���� �� ��������� �� ������ � ���������, � ������ ���� �������� ��������� � ����� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//��������� �������.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//������ � ���� ���� ������ ��������� � ��������� ������ ������� ����� ������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//��� ����������� ���������, ��� � ���� ���� ����� ���������� ������ ��� ����������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//�� ����� ����� ������� ������ ���� � ��������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//������� �� ������� ������ ����� ����������� ������. �� ����, ����� ��� ������� ����� ��� ���, �� ������ ���� ������.
	MIL_Aufnahme = LOG_Running;
	Log_CreateTopic(TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_Running);
	B_LogEntry(TOPIC_BecomeMIL,"������ ��� � ����� �������� � ���� ��������� ������, � ������ ����� ����������� ������.");
};


instance DIA_Andre_AboutMiliz(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Andre_AboutMiliz_Condition;
	information = DIA_Andre_AboutMiliz_Info;
	permanent = FALSE;
	description = "��� � ������ �� ���������� � ���������?";
};


func int DIA_Andre_AboutMiliz_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//��� � ������ �� ���������� � ���������?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//������� ��� ��������� ���� ������. ����������� ������� ��������� �� �������������� ������������� �� ������ � ��������.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//��� ������� � ���� �������� ������. ����� �� ������� ����� �� ���, ���� ����� ����� ����� ���� ������.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//�� ��� ���� �����. ������ ���������, � ���� ���������� ���� ������� ����� ��������� ������ ������.
};


instance DIA_Addon_Andre_MartinEmpfehlung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information = DIA_Addon_Andre_MartinEmpfehlung_Info;
	description = "� ������ ���������������� ������ �� ������ ����������.";
};


func int DIA_Addon_Andre_MartinEmpfehlung_Condition()
{
	if(Npc_HasItems(other,ItWr_Martin_MilizEmpfehlung_Addon) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//� ������ ���������������� ������ �� ������ ����������.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(�����������) ���? � ��-��, ������.
	B_GiveInvItems(other,self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(���������) �� ���� ��! ����, ������ ����, �������� �����������! �� ���-�� ������ �������� ����� �������� �� �������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//�����, � �������. ���� ������ �� ���� ��������, � �������� ���� �������. ����� ���, ����� �� ������ �����.
	}
	else
	{
		B_GivePlayerXP(50);
	};
	Andre_Knows_MartinEmpfehlung = TRUE;
};


instance DIA_Andre_Alternative(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Alternative_Condition;
	information = DIA_Andre_Alternative_Info;
	permanent = FALSE;
	description = "� ��� ����� �������� ������� �������������� � ���?";
};


func int DIA_Andre_Alternative_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_AskToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Alternative_Info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//� ��� ����� �������� ������� �������������� � ���?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//�-�-�. (������������) � ���� ������������� ��������� ���������, ��?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//������. ������. � ���� ���� ��������. ���� �� ������ �� ��� ����, � ������, ��� �� ������ �������� � ���������.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//� ����� �������: ������ �� �����!
};


func void B_Andre_StartGuildOfThievesQuest()
{
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//��������� ����� � ������ ��������� ������� ����� �����. � �� ����� �� ����� ������� �� ������ �� ���. ���� ��������� ����� ���������.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//��� �������� ����� ���� ����. � ������, ��� � ������ ��������� �������������� �����.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//� �� ��������, ���� � �������� ��������� ������� �����. ����� �������� ���� ����� � ���������� ��.
	MIS_Andre_GuildOfThieves = LOG_Running;
};

instance DIA_Andre_GuildOfThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_GuildOfThieves_Condition;
	information = DIA_Andre_GuildOfThieves_Info;
	permanent = FALSE;
	description = "��� � ���� �� ��������?";
};


func int DIA_Andre_GuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
	if((other.guild == GIL_PAL) && (MIS_Andre_GuildOfThieves == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//��� � ���� �� ��������?
	B_Andre_StartGuildOfThievesQuest();
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//����� � ����� �������������, ��� �� ������ ������ � ��������� - �������, ��������� �� ��� ���.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//�� �� ������ �� ������ �������� � ����� ����������!
		B_LogEntry(TOPIC_BecomeMIL,"���� ����� ������ ������ �������� � ���� ��������� ������ - ����� � ���������� ������� ����� ��������.");
	};
};


instance DIA_Andre_WhereThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_WhereThieves_Condition;
	information = DIA_Andre_WhereThieves_Info;
	permanent = FALSE;
	description = "��� ��� ����� ������ ������ ���� �����?";
};


func int DIA_Andre_WhereThieves_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_WhereThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//��� ��� ����� ������ ������ ���� �����?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//���� �� � ���� ���, � �� ������ ��� ���!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//���� ������� ����: �� ������� ����������� ����� ���� ���� �������� ������� � ������ �� �����. ��������� ������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//����, ������� ���, �� ������� � ��������������, ��������, ���� �� ���� ������� ��������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//�� �� ���������. ��������, ���� ��� ����� ������ ��������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//�� ������ ������������ � �������� ��������. �� ���� ���������. ���� ���� ������, ��� �� ��������� �� ���������, �� �� ������� ������!
	if(other.guild == GIL_NONE)
	{
		B_LogEntry(TOPIC_BecomeMIL,"���� � ���� ����� ������� �����, ��� ����� ������ �������������� � ����, ��� ������� � �������� ��������.");
	};
};


instance DIA_Andre_WhatToDo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_WhatToDo_Condition;
	information = DIA_Andre_WhatToDo_Info;
	permanent = FALSE;
	description = "��� ��� ������, ����� � ����� ���� �����?";
};


func int DIA_Andre_WhatToDo_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_WhatToDo_Info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//��� ��� ������, ����� � ����� ���� �����?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//���� ���� �������� ������ ������� - �������� ���� ��� ���������, ����� ����� �������� �������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//������ ����� �� ��� � ������. � � ����������, ����� ��� ����� ��������� �� ��������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//��������� ������ ����� ��������� � ����� � � ���� �� ����� ����������� ��������� ��, ��� ����������.
		B_LogEntry(TOPIC_BecomeMIL,"���� � ������ �����-������ ������ ������� ������� �����, � ������ �������� ��� ����� � ����� �����. � ����� ������������� ������� �����, � ������ ����� �� ������.");
	};
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//����� ����, �� ������� �����������, ������� � ����� ������� ����� ������� �� �������, ���� ���������� �������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//������, ���� �� ������� ������ �������� - ��, ����� ����, ��������, �� ������� �������� ���.
};

func void B_AndreSold()
{
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_Sold_08_00");	//��� ���� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//���, ������ �������. �� �� ��������.
	};
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItMi_Gold,Andre_Sold);
};

func void B_AndreDoYouHaveProof()
{
	AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//�����? � ���� ���� ��������������?
};

func void B_AndreNoGossips()
{
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//����� �� ����� �������� � ����� ����������� �� ���� �����.
};

func void B_AndreNoProof()
{
	B_AndreDoYouHaveProof();
	DIA_Common_No();
	B_AndreNoGossips();
};

instance DIA_Andre_Auslieferung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 200;
	condition = DIA_Andre_Auslieferung_Condition;
	information = DIA_Andre_Auslieferung_Info;
	permanent = TRUE;
	description = "� ������ �������� ������� �� �����������.";
};


func int DIA_Andre_Auslieferung_Condition()
{
	if((Rengaru_Ausgeliefert == FALSE) || (Halvor_Ausgeliefert == FALSE) || (Nagur_Ausgeliefert == FALSE) || (MIS_Canthars_KomproBrief == LOG_Running) || (Fernando_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Auslieferung_Info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//� ������ �������� ������� �� �����������.
	Info_ClearChoices(DIA_Andre_Auslieferung);
	Info_AddChoice(DIA_Andre_Auslieferung,"� ������� �����...",DIA_Andre_Auslieferung_Back);
	if((Rengaru_InKnast == TRUE) && (Rengaru_Ausgeliefert == FALSE) && !Npc_IsDead(Rengaru))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"������� ����� � �������� �����.",DIA_Andre_Auslieferung_Rengaru);
	};
	if((Halvor_Ausgeliefert == FALSE) && (Halvor_Deal == FALSE) && !Npc_IsDead(Halvor))
	{
		if((Betrayal_Halvor == TRUE) || ((SC_KnowsCitySmuggler == TRUE) && (Knows_Halvor == TRUE)))
		{
			Info_AddChoice(DIA_Andre_Auslieferung,"������ ������� ��������.",DIA_Andre_Auslieferung_Halvor);
		};
	};
	if(((MIS_Nagur_Bote == LOG_Running) || (MIS_Nagur_Bote == LOG_FAILED)) && (Nagur_Ausgeliefert == FALSE) && !Npc_IsDead(Nagur))
	{
		if(Bote_Killed == TRUE)
		{
			Info_AddChoice(DIA_Andre_Auslieferung,"����� ���� ���������� ���������.",DIA_Andre_Auslieferung_Nagur);
		}
		else
		{
			Info_AddChoice(DIA_Andre_Auslieferung,"����� ������� ������������ ����, ����� ����������� ����� � ����� �����.",DIA_Andre_Auslieferung_Nagur);
		};
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		if(!Npc_IsDead(Canthar))
		{
			Info_AddChoice(DIA_Andre_Auslieferung,"�������� ������ �������� ���������� �� ����!",DIA_Andre_Auslieferung_Canthar);
		};
		if(!Npc_IsDead(Sarah))
		{
			Info_AddChoice(DIA_Andre_Auslieferung,"���� ������� ������ �����.",DIA_Andre_Auslieferung_Sarah);
		};
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	DIA_Common_IllBeBackLater();
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{
	AI_Teleport(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//������� ����� � �������� �����. �� ������� ��������, �� � ������ ���.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//������, ��� ���� ��� �������� ���. ������ �� �� ������ �������� � ��������������� �������.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//��� ���� ������.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_NpcSetJailed(Rengaru);
	B_StartOtherRoutine(Rengaru,"PRISON");
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Halvor()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//������ ������� ��������. �� ������� ������, ���������� ��������� � ���������.
	if(Npc_HasItems(other,ItWr_HalvorMessage))
	{
		AI_WaitTillEnd(self,other);
		B_GiveInvItems(other,self,ItWr_HalvorMessage,1);
		B_ReadFakeItem(self,other,Fakescroll,1);
		AI_Teleport(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
		AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//��� ���, ��� ���� ����������. ��� ���� ���������� ������� ���.
		AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//� �� �����, ��� ��� ����� ������. � ����� ������� ���� ���� ������� ����� ������.
		B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
		B_NpcSetJailed(Halvor);
		B_StartOtherRoutine(Halvor,"PRISON");
		MIS_ThiefGuild_sucked = TRUE;
		Halvor_Ausgeliefert = TRUE;
		B_GivePlayerXP(XP_Andre_Auslieferung);
	}
	else
	{
		B_AndreNoProof();
	};
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	AI_Teleport(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	if(Bote_Killed == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//����� ���� ���������� ���������. �� ������� ������������ ���� � �������� ������ ����������, ����� ����������� ����� � ����� �����.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00_add");	//����� ������� ������������ ����, ����� ����������� ����� � ����� �����.
	};
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//�� ������� ����������� ���������. � ���������� ������� �������� ��� �� �������.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//���, ������ �������. �� �� ��������.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_NpcSetJailed(Nagur);
	B_StartOtherRoutine(Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//�������� ������ �������� ���������� �� ����!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//����? �������� ������� � �������� �������?
	if(Npc_HasItems(other,ItWr_Canthars_KomproBrief_MIS))
	{
		AI_Teleport(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
		AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//� ������ ��� ��������� ���� ������, ������� ����������� ��, ��� ��� ���������� ������ �����.
		B_GiveInvItems(other,self,ItWr_Canthars_KomproBrief_MIS,1);
		B_ReadFakeItem(self,other,Fakescroll,1);
		AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//�������. � � �������� ������� ������� �� ����� �������. ������ �������, ��� �� ��� �� ��������.
		B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
		B_NpcSetJailed(Canthar);
		B_StartOtherRoutine(Canthar,"KNAST");
		MIS_Canthars_KomproBrief = LOG_FAILED;
		B_CheckLog();
		Canthar_Ausgeliefert = TRUE;
		B_GivePlayerXP(XP_Andre_Auslieferung);
	}
	else
	{
		B_AndreNoProof();
	};
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Sarah()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//���� ������� ������ �����.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//����? �������� ������� � �������� �������? � ���� ���� ��������������?
	if(Npc_HasItems(Sarah,ItWr_Canthars_KomproBrief_MIS))
	{
		AI_Teleport(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
		if(!Npc_IsDead(Canthar))
		{
			AI_Teleport(Canthar,"NW_CITY_SARAH");
		};
		AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//� �� ������� ������ � �������� �������� ������ ���.
		AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//��� ���������� �� ���. � ������� ���������� ��.
		AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//���, ������ �������. �� �� ��������.
		B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
		if(SarahWeaponsRemoved == FALSE)
		{
			B_GiveTradeInv_Sarah(Sarah);
			B_RemoveSarahWeapons();
		};
		B_NpcSetJailed(Sarah);
		B_StartOtherRoutine(Sarah,"KNAST");
		B_StartOtherRoutine(Canthar,"MARKTSTAND");
		Sarah_Ausgeliefert = TRUE;
		MIS_Canthars_KomproBrief = LOG_SUCCESS;
		B_GivePlayerXP(XP_Andre_Auslieferung);
	}
	else
	{
		B_AndreNoProof();
	};
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


func void B_AndreAskAboutSewer()
{
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//���?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//� ����������� ��� �������.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//���? �� ���������� �����������...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//������, ��� �� �������� �� ���������� ����.
};

instance DIA_Andre_DGRunning(C_Info)
{
	npc = MIL_311_Andre;
	nr = 4;
	condition = DIA_Andre_DGRunning_Condition;
	information = DIA_Andre_DGRunning_Info;
	permanent = TRUE;
	description = "������ ������� �����...";
};


func int DIA_Andre_DGRunning_Condition()
{
	if(MIS_Andre_GuildOfThieves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//������ ������� �����...
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//��?
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning,"� ������� ��� ����...",DIA_Andre_DGRunning_BACK);
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"� ���� �� ������������!",DIA_Andre_DGRunning_Success);
	};
	if((DG_gefunden == TRUE) && (Andre_FoundThieves_Reported == FALSE))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"� ����� ������ ������� �����!",DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//� ������� ��� ����...
	if(Andre_FoundThieves_Reported == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//������. � ��� ���� ��� ������� ������� �� ���������� ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//������! ����� ���� � �����.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//� ����� ������ ������� �����!
	B_AndreAskAboutSewer();
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//�� ������������ ���� ������������?
	Andre_FoundThieves_Reported_Day = Wld_GetDay();
	Andre_FoundThieves_Reported = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//� ���� �� ������������!
	if(Andre_FoundThieves_Reported == FALSE)
	{
		B_AndreAskAboutSewer();
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//�� ������ ������ ������� ������.
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP(XP_GuildOfThievesPlatt);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//���� �� ��� ��� ������ �������� � ���������, ��� ��� �����.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//�� �������� ���� ������, ��� ��������� ����� ������ � ������ ������.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//���� ���������� ������� �� ���� ��������. ���, ������.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld * 3);
	B_StartOtherRoutine(MIL_318_Miliz,"SEWER");
	B_StartOtherRoutine(MIL_327_Miliz,"SEWER");
	if(Npc_IsDead(Hanna))
	{
		B_SendMilitiaToHotel();
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};


instance DIA_Andre_FoundThieves_KilledByMilitia(C_Info)
{
	npc = MIL_311_Andre;
	nr = 9;
	condition = DIA_Andre_FoundThieves_KilledByMilitia_Condition;
	information = DIA_Andre_FoundThieves_KilledByMilitia_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_FoundThieves_KilledByMilitia_Condition()
{
	if(Andre_FoundThieves_KilledByMilitia == TRUE)
	{
		return TRUE;
	};
	if(Andre_FoundThieves_Reported == TRUE)
	{
		if(Andre_FoundThieves_Reported_Day <= (Wld_GetDay() - 2))
		{
			if(!Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez))
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Andre_FoundThieves_KilledByMilitia_Info()
{
	AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//�� ������ ������ �� ���� ����. � ������ ����� ����� � �����������.
	AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//������� ����� ������ �� ����� ��� ������������ �������� ������� ����� ������.
	B_AndreSold();
	if(Npc_IsDead(Hanna))
	{
		B_SendMilitiaToHotel();
	};
	B_KillThievesGuild();
	MIS_Andre_GuildOfThieves = LOG_FAILED;
	if(MIS_CassiaRing == LOG_Running)
	{
		MIS_CassiaRing = LOG_FAILED;
	};
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_FAILED;
	};
	if(MIS_RamirezSextant == LOG_Running)
	{
		MIS_RamirezSextant = LOG_FAILED;
	};
	B_CheckLog();
};


instance DIA_Andre_JOIN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_JOIN_Condition;
	information = DIA_Andre_JOIN_Info;
	permanent = TRUE;
	description = "� ����� �������� � ���������!";
};


func int DIA_Andre_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//� ����� �������� � ���������!
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//��������� ������ �������� �� ���� � ���� ����������� ���� ���. ����� ��� ����������.
	}
	else if((MIS_Andre_GuildOfThieves == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//� ������ ���� ����� � ����� ���� � ���������. ���� ���� �� � �� ��������� ����������� ����� ������.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//�� ������ �� ���� �� ������! ��� ������ ����� ����� ����� �� ���� ����������, ��� ������ ��� �������� �������������.
	}
	else if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//� �� ��������� ����������� ��������?
		if(Player_IsApprentice == APP_Harad)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//������ ���� ���� � �������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//�����? � ���� ���. �� �������� �� ���. �� ��������� �������.
		};
		if(Player_IsApprentice == APP_Constantino)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//� ������ ��������!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//� ���, � ���������, �� ��� �� ����� ������ �����. ��������, ���� ������ ������ ���������� ���.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//� ���� ��� ���� �� �������. �� ���� �������, ��� �� ��������� �������.
		};
		if(Player_IsApprentice == APP_Bosper)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//������, ������-������, ���� ���� � �������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//����� �� ��������� ������ ���-��� � ���, ��� ������ � ����? ��� ������, ������ ��� ��������� ���������� ��������� ������ �� ������ � ������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//���, �����������, ����� ����, ������� ��������������� � ����� ���������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//� ������ ��������� ������� � ���� ������.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//���� �� ��������� �� ����, ����� �� ������ ������ ���������� � ���� ���������.
		if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//����� ����, ���� ������� �������� ����� �� ������� �����. � �� ������ ���� ������ �� ���� ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//����� ���� - �� �� ��� ��� �� ��������� ����� ������, � � ���� ���� ������.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//�� ������ �������� � ���� ����, ���� ������. �� ���� ������� ������ ���� �������������.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//����� ����, ��� �� �������� ������ ���������, �� ��� �� ������� ������ ��� ����� ��� � ����� �� ����� �����.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//�� ����� ��������� ������ � ���� �� ������ � ������?
	Info_ClearChoices(DIA_Andre_JOIN);
	Info_AddChoice(DIA_Andre_JOIN,"� ���� �� ������...",DIA_Andre_JOIN_No);
	Info_AddChoice(DIA_Andre_JOIN,"� �����!",DIA_Andre_JOIN_Yes);
};

func void DIA_Andre_JOIN_Yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//� �����!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//����� ��� ���� � ����. ����� ���������� � ���� ���������.
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//��� ���� �������.
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//���� �� � ��������� � ������������.
	B_SetGuild(hero,GIL_MIL);
	B_GiveArmor(ITAR_MIL_L);
	Snd_Play("LEVELUP");
	B_StartOtherRoutine(Lothar,"START");
	B_StartOtherRoutine(Babo,"Garden");
	SLD_Aufnahme = LOG_OBSOLETE;
	NOV_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_CancelBengarMilitiaProblem();
	B_GivePlayerXP(XP_BecomeMiliz);
	if(MIS_Addon_Daron_GetStatue == LOG_Running)
	{
		Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
		Log_AddEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
	};
	Info_ClearChoices(DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//� ���� �� ������...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//���� �� ��� ������������ � ����� �������, � �� ���� ������� ���� � ���������.
	Info_ClearChoices(DIA_Andre_JOIN);
};


instance DIA_Andre_LORDHAGEN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_LORDHAGEN_Condition;
	information = DIA_Andre_LORDHAGEN_Info;
	permanent = FALSE;
	description = "���� � ������ ������� ����� ������?";
};


func int DIA_Andre_LORDHAGEN_Condition()
{
	if((other.guild == GIL_MIL) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE) && (Andre_LordHagenNichtZuSprechen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Andre_LORDHAGEN_Info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//���� � ������ ������� ����� ������?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//������ �� �������� �� ������ � ���������. ��� ��������� ����. �� ���� ��������� ������ ���� ������������� ������.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//�� ��������, ��� ��� � ����...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//�����, ��� �� ������������ � ������ ���������. ���� ���� ��������������. ������ �� ������������� �� ������ ����, �� ��� ���������.
};


instance DIA_Andre_Waffe(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Waffe_Condition;
	information = DIA_Andre_Waffe_Info;
	permanent = FALSE;
	description = "� � ������ ������?";
};


func int DIA_Andre_Waffe_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Waffe_Info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//� � ������ ������?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//�������. ������ ���� ���������� ���. �� ���-�� � ����� ��� �� �����.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//�����, ��� �� ����������, � ������� ��� ����. ����� �� ������ ���� ������.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//� ���� �� ������ �������, ������ ������� ����� ����� � ����� ��������.
	MIS_Andre_Peck = LOG_Running;
	Log_CreateTopic(TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Peck,LOG_Running);
	B_LogEntry(TOPIC_Peck,"��� ���-�� � ������. ���� � ������� ��� �����, � �������, � ����� �������� �� ���� ������.");
	AI_StopProcessInfos(self);
};


func void B_ReportToHagenNow()
{
	AI_Output(self,other,"DIA_Andre_PERM_08_03");	//� ����� ������� �� ������ ����������� ��������������� ����� ������. ���, �������� � ���.
};

instance DIA_Andre_FOUND_PECK(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_PECK_Condition;
	information = DIA_Andre_FOUND_PECK_Info;
	permanent = FALSE;
	description = "��� ������� ����� ����.";
};


func int DIA_Andre_FOUND_PECK_Condition()
{
	if(MIS_Andre_Peck == LOG_Running)
	{
		if(Npc_IsDead(Peck))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(hero,DIA_Peck_FOUND_PECK) && (Kapitel < 3))
		{
			return TRUE;
		}
		else if((Peck.aivar[AIV_TalkedToPlayer] == TRUE) && (Kapitel >= 3))
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//��� ������� ����� ����.
	if(Npc_IsDead(Peck))
	{
		DIA_Common_HeIsDead();
		AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//��� ����������! �...
		AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//� �������� ��������� �� ����!
		MIS_Andre_Peck = LOG_OBSOLETE;
		B_GivePlayerXP(XP_FoundPeck / 2);
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//��, �� ��� �������� �� ���� ���� � ��������� � ���������� ����� ������������. ��� �� ����� ���?
		Info_ClearChoices(DIA_Andre_FOUND_PECK);
		Info_AddChoice(DIA_Andre_FOUND_PECK,"� �������� ��������� �� ���� � ������.",DIA_Andre_FOUND_PECK_SOMEWHERE);
		Info_AddChoice(DIA_Andre_FOUND_PECK,"�� ��� � ������� ������.",DIA_Andre_FOUND_PECK_REDLIGHT);
	}
	else
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//� ���� ��������� ��������: ���������� �� �� ��������� �����?!
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//�� ������� ����������� ����!
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//� �-�� �����, ��� �� ��� ��� ��� �����!
			B_ReportToHagenNow();
		};
		MIS_Andre_Peck = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//� �������� ��������� �� ���� � ������.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//������, � ������ ��� � ���� � ������ ������.
	MIS_Andre_Peck = LOG_OBSOLETE;
	B_GivePlayerXP(XP_FoundPeck);
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//�� ��� � ������� ������.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//�� ���� �� ����������� � ��������� ������ ����, ����� ��������� ���� �����������.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//� �����, ��� ����� �������� ���������� � ���.
	B_GivePlayerXP(XP_FoundPeck * 2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};


instance DIA_Andre_FIRSTMISSION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIRSTMISSION_Condition;
	information = DIA_Andre_FIRSTMISSION_Info;
	permanent = FALSE;
	description = "� ���� ���� ������� ��� ����?";
};


func int DIA_Andre_FIRSTMISSION_Condition()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTMISSION_Info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//� ���� ���� ������� ��� ����?
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//��������� ����� � ������ ��������� ����� ����� �������� �����.
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//�� �� ����� ���������, ����� ��� ������ ����������� �� ������.
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//� ��������� ������, ��� ����� ������ ������ ������ � �� ������ ��������, �� ������ ��� � ���, ����� ������� ������.
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//��� �����������. �������� ������, ����� ��� ������ ��������� ��������� ����� ��� ���������.
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//� ����������, ��� � ����� ����� ��������� ��������. �������, ��� ��� �������� ����� � �����.
		AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//��� � ���� �������?
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//������, ���� �� ����� �����, ������ � �������� ������, ��� ���-�� � ����� ��������� ����� ��� ���� �����.
		AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//����� ��� � ������� ���� ��� ���.
		MIS_Andre_WAREHOUSE = LOG_Running;
		Log_CreateTopic(TOPIC_Warehouse,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Warehouse,LOG_Running);
		B_LogEntry(TOPIC_Warehouse,"��� �������� ����� ������ � ������. ������ ��������� �� ���� � ������� ����. � ������ ����� ���� ��� � �������� ��� ����� �����.");
	}
	else
	{
		B_ReportToHagenNow();
	};
};


instance DIA_Andre_FOUND_STUFF(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_STUFF_Condition;
	information = DIA_Andre_FOUND_STUFF_Info;
	permanent = TRUE;
	description = "������ ����...";
};


func int DIA_Andre_FOUND_STUFF_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_STUFF_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//������ ����...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//�� ����� ���?
	if(Npc_HasItems(other,ItMi_HerbPaket) || (MIS_Cipher_Paket == LOG_SUCCESS))
	{
		Info_ClearChoices(DIA_Andre_FOUND_STUFF);
		if(Npc_HasItems(other,ItMi_HerbPaket))
		{
			Info_AddChoice(DIA_Andre_FOUND_STUFF,"��, ��� ��.",DIA_Andre_FOUND_STUFF_Ja);
		};
		Info_AddChoice(DIA_Andre_FOUND_STUFF,"� �������� �� � ����.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//���� ���.
	};
};

func void B_AndreStartFindDealerQuest()
{
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	if(MIS_Cipher_Paket == LOG_FAILED)
	{
		B_GivePlayerXP(XP_Warehouse_Super * 2);
	}
	else
	{
		B_GivePlayerXP(XP_Warehouse_Super);
	};
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//�� ����� �������� ����� �� ������� - ��� ������.
	if(other.guild == GIL_MIL)
	{
		if(!Npc_IsDead(Borka) && !Npc_IsDead(Nadja))
		{
			AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//�� � ���� �����, ��� �������������� �� ����� �������.
			AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//���, ������ ����, ���-�� � �������� ��������.
			AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//���� �� ���� ������� ����� �������� � �����, �� ����� �� ��� ������.
			AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//��� ������ ��� ����� �������?
			AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//����� �������� � ������� ��� ������� ���� ���� �����. ��� ����� ��������, �� ����� �� �� ������ ���������� ���.
			AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//�������� � ��������. �� ������ ����� �������� �������. ��������, �� ������ ������ ����.
			MIS_Andre_REDLIGHT = LOG_Running;
			if(Bromor_Pay != 2)
			{
				B_StartOtherRoutine(Nadja,"SMOKE");
			};
			Log_CreateTopic(TOPIC_Redlight,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Redlight,LOG_Running);
			B_LogEntry(TOPIC_Redlight,"� ������ ����� ��������, ���������� �������� ����� � �������� ��������. � ������ ��������� ��� ������� ��� ������� �����. ������ ����� ������ ��� � ����.");
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//� �� �����, ��� �� ������ ������ ���-�� ������ � �������� ��������.
			if(Npc_IsDead(Borka))
			{
				AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//������ �� ������, ����� ���� �������� �����.
			};
			if(Npc_IsDead(Nadja))
			{
				AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//��� ������� �� �������� ������, ����, ������. ��������, ��� ������ ��������� ����������.
			};
		};
	};
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

func void DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//��, ��� ��.
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//�������. �� ����� �������� ��� �����.
	MIS_Cipher_Paket = LOG_FAILED;
	B_AndreStartFindDealerQuest();
};

func void DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//� �������� �� � ����.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//��? ��, �������, ��� ��� ������ �� ����� ������� � ������ ����.
	B_AndreStartFindDealerQuest();
};


instance DIA_Andre_REDLIGHT_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information = DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent = TRUE;
	description = "������ �����...";
};


func int DIA_Andre_REDLIGHT_SUCCESS_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_REDLIGHT_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//������ �����...
	if(Npc_IsDead(Borka) || (Undercover_Failed == TRUE) || (Npc_IsDead(Nadja) && (Knows_Borka_Dealer == FALSE)))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//� �� �����, ��� �� ������ ������ ���-�� ������ � �������� ��������.
		if(Npc_IsDead(Borka))
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//������ �� ������, ����� ���� �������� �����.
		};
		if((Nadja_Victim == TRUE) || (Npc_IsDead(Nadja) && (Knows_Borka_Dealer == FALSE)))
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//��� ������� �� �������� ������, ����, ������. ��������, ��� ������ ��������� ����������.
			B_RemoveNpc(VLK_435_Nadja);
		};
		if(Undercover_Failed == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//�� ��� ������������ ���������.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if(Borka_Deal == 2)
	{
		AI_Teleport(Borka,"NW_CITY_HABOUR_KASERN_BORKA");
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//� ����, ��� �������������� ����� � ������. ��� �����, �������� � ������� ������.
		B_AndreDoYouHaveProof();
		if(!Npc_HasItems(other,ItMi_Joint))
		{
			DIA_Common_No();
			B_AndreNoGossips();
		}
		else
		{
			AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//�� ������ ��� �������� �����.
			B_GiveInvItems(other,self,ItMi_Joint,1);
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//�������, ����� ���������� ��� ���. � ������� ���������� ���������� ���.
			B_AndreSold();
			B_NpcSetJailed(Borka);
			B_StartOtherRoutine(Borka,"PRISON");
			MIS_Andre_REDLIGHT = LOG_SUCCESS;
			B_GivePlayerXP(XP_Redlight);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//...� ��� ��� ������� ��� ����.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//������. �����, ��� �� ������ ��������� ����� �������� ��������� ������ � �����.
	};
};


instance DIA_Andre_HILFBAUERLOBART(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_HILFBAUERLOBART_Condition;
	information = DIA_Andre_HILFBAUERLOBART_Info;
	description = "� ���� ���� ��� ������� ��� ����?";
};


func int DIA_Andre_HILFBAUERLOBART_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_HILFBAUERLOBART_Info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//� ���� ���� ��� ������� ��� ����?
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//� ������� ������� �����-�� �������� �� ��� �����.
		AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//���� �� ������� ���, ��� ������� ��� ��������� � �������. ��� ��� ����������� ���� � ��������, ��� ��� �� ���.
		Log_CreateTopic(TOPIC_Feldraeuber,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Feldraeuber,LOG_Running);
		B_LogEntry(TOPIC_Feldraeuber,"����� �������� ���� �� ����� �������. � ����� ������ ������ ������� ������������ ������� �� �����.");
		MIS_AndreHelpLobart = LOG_Running;
		Wld_InsertNpc(Lobarts_Giant_Bug1,"NW_FARM1_FIELD_06");
		Wld_InsertNpc(Lobarts_Giant_Bug2,"NW_FARM1_FIELD_06");
		Wld_InsertNpc(Lobarts_Giant_Bug3,"NW_FARM1_FIELD_05");
		Wld_InsertNpc(Lobarts_Giant_Bug4,"NW_FARM1_FIELD_05");
		Wld_InsertNpc(Lobarts_Giant_Bug5,"NW_FARM1_FIELD_04");
		Wld_InsertNpc(Lobarts_Giant_Bug6,"NW_FARM1_FIELD_04");
		Wld_InsertNpc(Lobarts_Giant_Bug7,"NW_FARM1_FIELD_03");
		B_StartOtherRoutine(Vino,"BUGSTHERE");
		B_StartOtherRoutine(LobartsBauer1,"BUGSTHERE");
		B_StartOtherRoutine(LobartsBauer2,"BUGSTHERE");
	}
	else if(other.guild == GIL_PAL)
	{
		B_ReportToHagenNow();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Andre_LOBART_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_LOBART_SUCCESS_Condition;
	information = DIA_Andre_LOBART_SUCCESS_Info;
	description = "� ����� �������.";
};


func int DIA_Andre_LOBART_SUCCESS_Condition()
{
	if(MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_LOBART_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//� ����� �������.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//�����������. ���� ������ ����� ��������, �� ��������� ��������� ���� ������.
	B_AndreSold();
	B_GivePlayerXP(XP_LobartBugs);
};


instance DIA_Andre_ThievesGuildQuestForMIL(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_ThievesGuildQuestForMIL_Condition;
	information = DIA_Andre_ThievesGuildQuestForMIL_Info;
	description = "� ���� ���� ��� ������� ��� ����?";
};


func int DIA_Andre_ThievesGuildQuestForMIL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_LOBART_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Andre_ThievesGuildQuestForMIL_Info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//� ���� ���� ��� ������� ��� ����?
	if(MIS_Andre_GuildOfThieves == FALSE)
	{
		B_Andre_StartGuildOfThievesQuest();
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_01");	//��� ��� ���������.
	};
};


instance DIA_Addon_Andre_MissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople_Condition;
	information = DIA_Addon_Andre_MissingPeople_Info;
	description = "��� ������ ��������� �����?";
};


func int DIA_Addon_Andre_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)) && (MIS_Addon_Andre_MissingPeople != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//��� ������ ��������� �����?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//� ��� ������ ���?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//����� �� �� ������ ���������� �� �����?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//���� ����� ������� ��� ������ ������ � ����������� ����.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//��� ������, ��� �� ��������� � ��� �����, ������� ��� ��� �����.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//������� ��������� ����������� �� ����� �����. ��� ���, ��� � ���� �������.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//� �� ������ ���������� ���, ��� � ���� �������. ��������� ����?
	};
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_MissingPeople2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople2_Condition;
	information = DIA_Addon_Andre_MissingPeople2_Info;
	description = "�� ������ ��������� �����...";
};


func int DIA_Addon_Andre_MissingPeople2_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL) && (MIS_Addon_Andre_MissingPeople != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople2_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//�� ������ ��������� �����...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//������ ���� � �����! � ���� ����� ������ �����.
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_ReturnedMissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information = DIA_Addon_Andre_ReturnedMissingPeople_Info;
	description = "��� ������� ������ ����� ��������� �����.";
};


func int DIA_Addon_Andre_ReturnedMissingPeople_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (MIS_Addon_Andre_MissingPeople == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//��� ������� ������ ����� ��������� �����.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//� �-�� �����, ��� �� ��� ��� ��� �����!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//�� - ������ ���������! � �� �� ������� ������� ���������� �������� ���������!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//��...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//��� ����� ����� �� ����?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//���� ���, ��� ��� ��� ���...
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//����?! �... �-�-�...
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//� ����� �������! � � ���, ��� ������ ���� � ���� ����.
		B_AndreSold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//�� ������ ������� ����!
	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Andre_MissingPeople);
};

instance DIA_Andre_BerichtDrachen(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachen_Condition;
	information = DIA_Andre_BerichtDrachen_Info;
	permanent = FALSE;
	description = "� ��� � ������ �������� � ����� ��������!";
};


func int DIA_Andre_BerichtDrachen_Condition()
{
	if((Enter_OldWorld_FirstTime_Trigger_OneTime == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachen_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//� ��� � ������ �������� � ����� ��������!
	if(Npc_HasItems(hero,ItWr_PaladinLetter_MIS))
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//� ���� ���� ������ �� ������������ �������, �������������� ��, ��� � ������.
		AI_Output(self,other,"DIA_Andre_Add_08_10");	//��� ������������ ����� ������!
		B_Andre_GotoLordHagen();
	}
	else
	{
		B_AndreNoProof();
	};
};


instance DIA_Andre_BennetInPrison(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_BennetInPrison_Condition;
	information = DIA_Andre_BennetInPrison_Info;
	permanent = TRUE;
	description = "� ��� ������ �������, �������?";
};


func int DIA_Andre_BennetInPrison_Condition()
{
	if(MIS_RescueBennet == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_BennetInPrison_Info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//� ��� ������ �������, �������?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//�� ������ � ���� ����� ��������? �� ����� �� ��������, ��� ��� ����� �����.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//���� � ���������� � ���?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//�������. �� ���� �� ����������� ������ ��� ������, �� ��������� �� �������� ����� � ���.
};


instance DIA_Andre_Cornelius_Liar(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Cornelius_Liar_Condition;
	information = DIA_Andre_Cornelius_Liar_Info;
	permanent = TRUE;
	description = "� �����, ��������� ����.";
};


func int DIA_Andre_Cornelius_Liar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_WhatYouSee) && Npc_KnowsInfo(other,DIA_Andre_BennetInPrison) && (MIS_RescueBennet == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_Cornelius_Liar_Info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//� �����, ��������� ����.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//�� ������?
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"���.",DIA_Andre_Cornelius_Liar_No);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"��.",DIA_Andre_Cornelius_Liar_Yes);
};

func void DIA_Andre_Cornelius_Liar_No()
{
	DIA_Common_No();
	B_AndreNoGossips();
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//��������� - ����������� �������. �� ����� ������� ���� ����� ����, ���� �������.
	};
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//���� � ���� ��� �������������, � ����� �� ���� ������ ����.
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

func void DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//��.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//��� �� �������������� � ���� ����?
	if(Cornelius_IsLiar == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//� ������ ��� �������! ��� ���������. ���, ��� �� ������, ���� �����.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//���� ��� ������������� ���, �� ������ ���������� �������� �� ���� ����� ������.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//������ ��� ���� �������. �� ���������� � ���� ����.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//�-�-�, ��, � �����...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//��� ����� ��������������, � �� �������������. ������� ��������������, � ����� � ����� ���-������ �������.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//� �� ���� ������� ���� ����� ������������ �������� �����.
	};
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};


instance DIA_Andre_Paladin(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Paladin_Condition;
	information = DIA_Andre_Paladin_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Paladin_Condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladin_Info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//������ �� �������! ����������!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//� � ������ ������ ����, ��� �� �� ����������� ����� � ���������.
};


instance DIA_Andre_PERM(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_PERM_Condition;
	information = DIA_Andre_PERM_Info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int DIA_Andre_PERM_Condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_PERM_Info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//��� ���������� � ������?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//��� ��� ���������.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//�������� ���� �������.
	}
	else if(other.guild == GIL_PAL)
	{
		B_ReportToHagenNow();
	};
};


instance DIA_Andre_BerichtDrachenTot(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachenTot_Condition;
	information = DIA_Andre_BerichtDrachenTot_Info;
	permanent = FALSE;
	description = "� ���� ���� �������� � ������ ��������!";
};


func int DIA_Andre_BerichtDrachenTot_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachenTot_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//� ���� ���� �������� � ������ ��������!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//���� ��� ������, �� ������ ���������� �� ���� ����� ������.
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BerichtTorAuf(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtTorAuf_Condition;
	information = DIA_Andre_BerichtTorAuf_Info;
	permanent = FALSE;
	description = "����� � ������ �������� ���������� ����!";
};


func int DIA_Andre_BerichtTorAuf_Condition()
{
	if((Kapitel == 5) && (MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtTorAuf_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//����� � ������ �������� ���������� ����!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//���� ����� ������ �������� �� ����.
	B_Andre_GotoLordHagen();
};

