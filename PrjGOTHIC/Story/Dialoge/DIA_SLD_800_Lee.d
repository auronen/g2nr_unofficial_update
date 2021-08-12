
var int Lee_Teleport;

func void B_Lee_Teleport()
{
	if((Lee_Teleport == FALSE) && (Kapitel >= 3))
	{
		AI_Output(self,other,"DIA_Lee_Add_04_05");	//��. ������, ��� �� ������.
		AI_Output(other,self,"DIA_Lee_Add_15_06");	//��� ���������?
		AI_Output(self,other,"DIA_Lee_Add_04_07");	//� ����� ��� � ������ �������.
		B_GiveInvItems(self,other,ItRu_TeleportFarm,1);
		AI_Output(self,other,"DIA_Lee_Add_04_08");	//��� ���������� ����. � �����, ��� ����� � ����� ����� ��������� ���� ����, �� �����.
		AI_Output(self,other,"DIA_Lee_Add_04_09");	//� �������, ��� �� ������� ������������ ��.
		Lee_Teleport = TRUE;
	};
};

var int Lee_Sends_To_Buster;

func void B_Lee_Sends_To_Buster()
{
	if((Kapitel >= 3) && (Kapitel < 5) && (Lee_Sends_To_Buster == FALSE) && !Npc_IsDead(Buster) && !Npc_KnowsInfo(other,DIA_Buster_SHADOWBEASTS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//��, ��. ���� �� �����... ������ ����� ��������� � �����. �� �� ������� ���, � ���. �����, ����� ����� ���?
		Lee_Sends_To_Buster = TRUE;
	};
};

instance DIA_Lee_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_EXIT_Info()
{
	B_Lee_Teleport();
	B_Lee_Sends_To_Buster();
	AI_StopProcessInfos(self);
};


var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

instance DIA_Lee_PMSchulden(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lee_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Lee_PMSchulden_Info()
{
	var int diff;
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//�� �����, ����� �������� ������ �����?
	if(B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//� ��� ������ ����, ��� �� ���� ������� �������� �����.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//���� �����, ��� �� ����� ��������� ���� ������ ����� �����.
		if(Lee_Schulden < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//�� � �����������, �� ������ ����� ������ �����.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//�������?
			diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
			if(diff > 0)
			{
				Lee_Schulden += diff * 50;
			};
			if(Lee_Schulden > 1000)
			{
				Lee_Schulden = 1000;
			};
			B_Say_Gold(self,other,Lee_Schulden);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//� �����, �� �����.
		};
	}
	else if(B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//������ ������� ������� ��� ����.
		if(Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//���������� �� �������� ������, ��� �����, ��� �� �������� ��������.
		};
		if((Lee_LastPetzCrime == CRIME_THEFT) || ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//����� ������ �� ����� �����������, ��� �����, ��� �� �������.
		};
		if((Lee_LastPetzCrime == CRIME_ATTACK) || ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//�� �������� ������, ��� ����� ��, ��� �� ����� ������ �� ��������.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//������, ��� ��� ��������� ������ ���� ������������ � �������.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//�� ��, ����� ����, ��� ������ ���������� �� �������� �������.
		if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//��� �� �� �� ����, ���� ������ �� ����� �������.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//�� ���� ���������� � �������.
			Lee_Schulden = 0;
			Lee_LastPetzCounter = 0;
			Lee_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//���� ����: �� ������, ��� �� �����, ��������� ����� ���������.
			B_Say_Gold(self,other,Lee_Schulden);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//��� ��� ������ �����?
		};
	};
	if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Lee_PMSchulden,"������� ��� �����?",DIA_Lee_PMSchulden_HowMuchAgain);
		if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PMSchulden,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//������� ��� �����?
	B_Say_Gold(self,other,Lee_Schulden);
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden,"������� ��� �����?",DIA_Lee_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
	};
};


instance DIA_Lee_PETZMASTER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	Lee_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//������ ������� ���� ��������� ������� ����? (���������) ��� �� �������, �� �������� ���� ��������?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//� ������ �� �����, ��� �� ��� ��� ���. �� ��� �� ������� ����... �, �����...
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//������, ��� �� ��� �� ������ �� ���, ���� ���� ���� �� ����� ������ ���������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//�������� - ������ �����, � ������� ����� ���� ����� �������� �� ����, �� �� �� ������ ������ ��� ������� �����.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50 + 500;
		if((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//�� ������ ��� � ������ ����� ������������� �����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//� ���� ������ ���� ��������� �� ����� ������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//��� ��������� ���� � ����������� �����, �������. ���� ������ �������, � ������ ���� �� ������� �� ��� ��� �����, ������ ����� ����� ������� ���������.
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//������, ��� �� ������. � ������, ��� �� ���-�� �����.
		if(PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//� ����� ��� �� ���������� ��������.
		};
		if(PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//� ���� ��������� ����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//�� �� ������ ������ ��� ������� �������� �����. � ����� ������� ���� ����������, ����� � ��������� ������������ ��������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//��� ��������: �� �������, �� �������� ���� ������, ��, �� ������� ����, �� ���� ���� ����� ����� ������.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//���� �� ����������� � ����� � ���������, ��� ����...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//�� ���� �� ����� �������, ��� ����� ����� � �����. � �� ������� ������������ �������� �� ����.
		if(PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//�� ������ ��� � ���, ��� �� �������� � ���������, ����� ���-�� ������� ����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//�� ������ ��������� �����. ���� ������ ��������� � ������ �����, �� ��� ������������ ������ ������ ��������.
		Lee_Schulden = B_GetTotalPetzCounter(self) * 50;
	};
	if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//���� ������� �� ����, ��� � ���� �������� ��� �����. ������� ��� ����.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//���� �������� ��������� ��� �����������!
		Lee_Schulden = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//�������?
	if(Lee_Schulden > 1000)
	{
		Lee_Schulden = 1000;
	};
	B_Say_Gold(self,other,Lee_Schulden);
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PETZMASTER,"� ���� ��� ������� ������!",DIA_Lee_PETZMASTER_PayLater);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PETZMASTER,"� ���� ��������� �����!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	B_GiveInvItems(other,self,ItMi_Gold,Lee_Schulden);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//������! � ��������, ����� ��� ������ ����� �� �����. ������ ������� ��� �������� �������.
	B_GrantAbsolution(LOC_FARM);
	Lee_Schulden = 0;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden);
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//� ���� ��� ������� ������!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//����� ������ ��� � ��������.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//�� � �� �����, ��� �� ������� ������� ��� �����, �� �����. ���� ���� �������, ���� ��� ������ �� �����������.
	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lee_Hallo(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_Hallo_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//������ ������� ���� ��������� ������� ����? (���������) ��� �� ������� �����? � �����, �� �����!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//� ���� �� ��� �����?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//���� ������ ���, ��� ��� �� �������� ������.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//��, ��� ������������� ��� �.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//������� �� �� �������, ��� ������� ����� ������ ����� ����� �����. ��� ������� ���� ����? �� �� ����� �� ������ ���...
};


instance DIA_Lee_Paladine(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent = FALSE;
	description = "��� ������ ���������� ���������� � ���������� � ������.";
};


func int DIA_Lee_Paladine_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//��� ������ ���������� ���������� � ���������� � ������. �� �� ��� �� ������ ��� ��������� �� ���?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(�����������) ����� � ���� ����� ���� ���� � ����������?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//��� ������ �������...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//� ���� ���� �����.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(��������) ������� ��� ��� �������. �� �����, ����� � ��������� ������ ������, ���� ������.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//������, �� ��� ��� � ����� � ���� �����������. �������. � ���� ������ ��������� � ���������, ��?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//��������� � ����, ��.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//� ���� ������ ���� ��������� �� ���������. �� ������� �� ������ ����� ����� �� ���.
};


instance DIA_Lee_PaladineHOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent = FALSE;
	description = "��� �� ������ ������ ��� ��������� �� ���������?";
};


func int DIA_Lee_PaladineHOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		if(GuildlessMode == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//��� �� ������ ������ ��� ��������� �� ���������?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//������� ���. � ���� ���� ����. � �����, �� ��� ��� ��������� ��� ����...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//� ����� ���� � ����������, � �� ������� ��� ������. �� ������� ������������ � ���!
};


instance DIA_Lee_LeesPlan(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent = FALSE;
	description = "� ��� �� ����� �����������?";
};


func int DIA_Lee_LeesPlan_Condition()
{
	if(Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//� ��� �� ����� �����������?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//��� ������: � ����� ��� ���������, ����� �� ��� ������ �������� � ����� �������.
	if(MIS_Lee_Friedensangebot != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//���� ����� ��� ��� ������ ��� �����, � ������ ���� �� � �������� ����������.
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//�� ���� ������� - ����� �������, ��� ������ ����� �� ������. ������� ��������, �� �������� ����� �� ��������.
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//� ��� ������ �������� ����, ��� ������ ��� ������������, �����, �������, � ������ �� ����������� � ����.
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//����� ������, ��� ���� �������� �������������� ������ � ���.
		};
		if(MIS_Lee_Friedensangebot == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//��� �� ����������� �� ������ �������?
			if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
			{
				AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//�����������, �������� ����� ���� ����������� � ��������� ���� �� �������. �� ��� �������, ����� ������ �����.
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_LeesPlan_04_07_add");	//�����������, �������� ����� ���� ����������� � ��������� ���� �� �������.
			};
		};
	};
};


instance DIA_Lee_WannaJoin(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent = FALSE;
	description = "� ���� �������������� � ���!";
};


func int DIA_Lee_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//� ���� �������������� � ���!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//� ��������, ��� �� ������� ���! ��� ����� ����� ������ �������� ����.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//�� ��������� ���������, ��� � �����, �� ���� �������� �����, ���� ��������!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//� ��������, �� ������ ���������� ����� ������. ��, ������, ���� ������� ��������, ������� ����� �������������, ��, � �����, ��� �� ����� ���������...
};


instance DIA_Lee_ClearWhat(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent = FALSE;
	description = "��� ����� '�������������', ������ ��� � ����� �������������� � ���?";
};


func int DIA_Lee_ClearWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//��� ����� '�������������', ������ ��� � ����� �������������� � ���?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//��� �������� ����, ��������. �� ������ ���������� �� ����� ������ � ��� ���������.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//�����, ���� ��� � ����� ������. � ����� ������� ����, ������ ���� ����������� ��������� ����������, ��� �� ������ �������������� � ���.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//�� �� ���� � �����, ���� ��� �� ����� �������. �� ����� ��������������� ���...
	SCKnowsSLDVotes = TRUE;
	SLD_Aufnahme = LOG_Running;
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"����� ���� �������� � ���� ���������, � ������ �������� ��������� �����, ����� ����, ��� �������� ���������� ���������.");
};


instance DIA_Lee_OtherSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 7;
	condition = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent = FALSE;
	description = "��� ��� ������� ��������� ������������� �� ����?";
};


func int DIA_Lee_OtherSld_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ClearWhat) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//��� ��� ������� ��������� ������������� �� ����?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//����� ��, ��� ��������� �� ����, ����� �� ������ ���������, � �� ������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//�������� � ��������. �� ������ ��������� ����� �����. �� ���� ���� ���������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//���� �� ������� ������ ���, �� �������� ������� ����� ������������ ��������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//�� ��������� ���� ��� ����, ��� ���� ����� �����.
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"����� ���� �������� � ���� ���������, � ������ ������ ��������� ������� � ��������� �������� ��������� ���������.");
};


instance DIA_Addon_Lee_Ranger(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Addon_Lee_Ranger_Condition;
	information = DIA_Addon_Lee_Ranger_Info;
	description = "��� �� ������ � ������ ����?";
};


func int DIA_Addon_Lee_Ranger_Condition()
{
	if(SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//��� �� ������ � ������ ����?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(�������) � ��� � ����! ���� ������ ���������� ����� ������ ���� ���!
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//�� �����, ������.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//������� � ���� �������. � ����, ��� ��� ������ �������� ���������� � ��� ��������� �� ���� ����.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//� ������ �� ������ ����������� � ������ ����, ������� �� ��������� � ���� � �� �������, ����� ��� ����� ������.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//�������, ���� � ���� ���-�� �� ������, � ��� �����. �� ������� ����� ������� � ����� ������ ������. �� �� ��� ������ ������� �� ��������.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//���� �� ������ ������ �� ���� �������� ������, �������� � ������. ��������� � ����, �� ���� �� ���.
	B_Lee_Teleport();
//	RangerHelp_gildeSLD = TRUE;
	SC_KnowsCordAsRangerFromLee = TRUE;
};


var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

instance DIA_Lee_JoinNOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 8;
	condition = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent = TRUE;
	description = "� ����� �������������� � ���!";
};


func int DIA_Lee_JoinNOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (Lee_OnarOK == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//� ����� �������������� � ���!
	if(Lee_ProbeOK == FALSE)
	{
		if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//������� �� ������ ������ ��������� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//��� �� ������ ��������� �������?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//��.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//��� ������.
			Lee_ProbeOK = TRUE;
		};
	};
	if((Lee_ProbeOK == TRUE) && (Lee_StimmenOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//� ��� ������� ������ ��������?
		if(Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//� �� ������, ���������� �� ��������� �� ���� �������.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//����� �������� � ��������, �� ����� ��� ����, � ��� ������� �� ���� �����.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//����������� �� ��� �� ���� �������.
			Lee_StimmenOK = TRUE;
		};
	};
	if((Lee_StimmenOK == TRUE) && (Lee_OnarOK == FALSE))
	{
		if(Onar_Approved == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//������, ����� ��� ����� � �����. � ��� ����������� � ���.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//�� �� ������ ������������ � ����� ��������� ���.
			if(Lee_SendToOnar == FALSE)
			{
				B_LogEntry(TOPIC_BecomeSLD,"���, ��� ��� ����� ������ - ��� ��������� �����.");
				Lee_SendToOnar = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//�� ��������� � ������?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//�� ����������.
			Lee_OnarOK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//����� ����� ���������� � ���� ����, ��������!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//���, ������ ��� ������ ��� �������!
			B_SetGuild(hero,GIL_SLD);
			B_GiveArmor(ITAR_SLD_L);
			Snd_Play("LEVELUP");
			if(Hlp_IsValidNpc(Lothar) && !Npc_IsDead(Lothar))
			{
				Npc_ExchangeRoutine(Lothar,"START");
			};
			if(Hlp_IsValidNpc(Babo) && !Npc_IsDead(Babo))
			{
				Npc_ExchangeRoutine(Babo,"FAVOUR");
			};
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//� ���, ��� �� � ����.
			if(MIS_Lee_Friedensangebot == FALSE)
			{
				AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//� ���� ��� ���� ������ ��������� ��� ����.
				AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//��� ����� ��������� � ���������. ������ ����� ���� ��������� � ����.
				if(Npc_KnowsInfo(other,DIA_Lee_Paladine))
				{
					AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//�� ��� ����� ����� ���� ����.
				};
			};
			if(MIS_Addon_Daron_GetStatue == LOG_Running)
			{
				Log_CreateTopic(TOPIC_Addon_HelpDaron,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_HelpDaron,LOG_Running);
				Log_AddEntry(TOPIC_Addon_HelpDaron,TOPIC_Addon_DaronGobbos);
			};
		};
	};
};


instance DIA_Lee_KeinSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_KeinSld_Condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Lee_IsOnBoard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//� ����, �� �������� �� ������ � ���������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//�� ��������� � ���������? (�������) � ����� ������, ������ �� �����.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//��� �, ������ �� �� ������� ����� ���������.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//�� ��� �����, ����� ����, �� ������� ������� ���-������ ��� ���� - ��� � ��� ����.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//���������. ��, ��� �� �� �� ����, � ����� ���� ����� ����������.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//�� ���� � �� ����� ������� ���� ������ ������, �����?
};


instance DIA_Lee_ToHagen(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent = FALSE;
	description = "� ��� ��� ������ ��������� �� ���������?";
};


func int DIA_Lee_ToHagen_Condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
	if((GuildlessMode == TRUE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//� ��� ��� ������ ��������� �� ���������?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//����� ������. �� �������� �� ���� ����������� � ����.
	if(!Npc_KnowsInfo(other,DIA_Lee_LeesPlan))
	{
		AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//��� �� ����������� �� ������ �������?
	};
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//� ���� ����� ������, ������������ ���������, �� ������ ���� ������ � ����������� �����.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//� ����, � ��� �� ������ - � ���� ������������ �����. �� ������ ��� �����������. �� ������� ����, �� ��������� ����.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//� ������� ��� ������ - �����.
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//� ����� ������, ��� ������ ���� ��������� �������� ��������� � ������������ ���������.
	Player_KnowsLordHagen = TRUE;
	MIS_Lee_Friedensangebot = LOG_Running;
	Log_CreateTopic(TOPIC_Frieden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Frieden,LOG_Running);
	B_LogEntry(TOPIC_Frieden,"�� ���������� ���� � ����� ������ � ������������ ����. ��� � ���� �������� ��������� � ���������.");
};


instance DIA_Lee_AngebotSuccess(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent = FALSE;
	description = "� ����� ����� ������ ���� ����������� � ����.";
};


func int DIA_Lee_AngebotSuccess_Condition()
{
	if(Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_AngebotSuccess_Info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//� ����� ����� ������ ���� ����������� � ����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//��� �� ������?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//�� ������, ��� �� ����� �������� ����������� ����, �� �� ����� �����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//��� ������� �����. ����������� ����� � ����������� ����� ������� ����������, ��� ��� �����.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//� ������ ����� ������ ������ �������� ��� ������. ���� �����������, �� �������� �������. ��� ����� �������� �� ����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//�������� ���� ������ �� ����� � ������� ���� ����� - ��� ���� �� �����������.
	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};


instance DIA_Lee_Background(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent = FALSE;
	description = "������ �� ��� ������� �� �������?";
};


func int DIA_Lee_Background_Condition()
{
	if(MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//������ �� ��� ������� �� �������?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//��� �� ������, � ��� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//�� ��� ��������� ������� ����, ������ ��� � ���� ���-���, ���� �� ������ ��� �����.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//��� �������� ���� � ��� �������, � ������ �������� ���.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//� ���� ���� ����� ���������� �������, ����� ��� ��������.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//� ������ ���������.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(���������) ������?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(����������) ������! � ��� �����������. ��� ��� ������ �������� � ���, ��� ������� �� ����...
};


instance DIA_Lee_RescueGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent = FALSE;
	description = "� ��������� ����������� � ������ ��������.";
};


func int DIA_Lee_RescueGorn_Condition()
{
	if((Hagen_BringProof == TRUE) && (Kapitel < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//� ��������� ����������� � ������ ��������.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//� � �� ��������, ��� �� ����� ����������� �� ���� �����.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//���� �� ������������� � �������, ����� ��� �����. �������� ������ ��� ��� �� ��������.
		AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//���� ������� �������, � �� �� ����� ���������� ��� �����, ��� ��� ���� � ���� �������� ���� ���������� �����, �� ������� ���.
		KnowsAboutGorn = TRUE;
	};
};


instance DIA_Lee_Success(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent = FALSE;
	description = "� ��������� �����.";
};


func int DIA_Lee_Success_Condition()
{
//	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel >= 3) && (other.guild == GIL_SLD))
	if((MIS_RescueGorn == LOG_SUCCESS) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//� ��������� �����.
	if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Lee_Success_04_01");	//��, �� ��� ��������� ��� �� ����. ������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//�������� ������.
	};
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//�� ����� ������, ��� ������� � ��� ��� ����� ������ ������.
	B_Lee_Teleport();
	B_GivePlayerXP(XP_AmbientKap5);
};


func void B_Lee_AboutGorn()
{
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//��� ������� �������� � ��������� �����, � ������ ��������, � ������� �����������.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//���� �� ������ � ������ �������� �� ������ ���������� � ������, � �� ��� �������� ���� ����� ������, ����� ���������� ���.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//�� ������ ��� ��������� �������������. �������.
	KnowsAboutGorn = TRUE;
};

instance DIA_Lee_AboutGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent = FALSE;
	description = "���� ������ ���� ��� ���? ��� ��������� � ���?";
};


func int DIA_Lee_AboutGorn_Condition()
{
	if((Kapitel < 3) && !Npc_KnowsInfo(other,DIA_Lee_RescueGorn))
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//���� ������ ���� ��� ���? ��� ��������� � ���?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//�� ���� ������� ���, ��?
	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn,"��� ��������� ���������...",DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn,"�������.",DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//�������.
	B_Lee_AboutGorn();
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//��� ��������� ���������...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//�������, ������������, ������ ������ � ������� �������, �� ����� ���� ����� � ����� �������. ��� ���� � �������.
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//�� ��.
	B_Lee_AboutGorn();
	Info_ClearChoices(DIA_Lee_AboutGorn);
};


instance DIA_Lee_WegenBullco(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent = FALSE;
	description = "� ����� ������ �� ��������� ���� ������ ��������� ������...";
};


func int DIA_Lee_WegenBullco_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//� ����� ������ �� ��������� ���� ������ ��������� ������...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//��, �� ��������� �� ��� � ����� �������! � ���� � ��� ����� ������� �������.
	if((Bullco_scharf == TRUE) && !Npc_IsDead(Bullco) && (MIS_ReadyforChapter4 == FALSE))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//� ���� ����. ������, ������, ����� �������� �� ���. �� �����, ����� � ������� �����...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//��, � ���? ������ �� ����.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//�� ������ ������� ���, ��� �� ������ ����� ���� ����������, ��� � ����� ��������� ���� �� ��� ���������...
	};
};


instance DIA_Lee_Report(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Report_Condition;
	information = DIA_Lee_Report_Info;
//	permanent = TRUE;
	permanent = FALSE;
	description = "� ������ �� ������ ��������. �����, ����������� ���, ��� �������� ���������!";
};


func int DIA_Lee_Report_Condition()
{
//	if((EnterOW_Kapitel2 == TRUE) && (Kapitel <= 3))
	if(Enter_OldWorld_FirstTime_Trigger_OneTime == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//� ������ �� ������ ��������. �����, ����������� ���, ��� �������� ���������!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//��� ��� ������! ����� �������, ��� � ������ ����������� ����� � ��������... � �� ������� � ���...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//� ��� ������ ���������?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//��� ������� ������� ������.
	if(MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//������! ����� ������ ���� ����� ����� ��������� �������� � ���� �����������...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//������! �����, ��� �������� ����� ������ ����������� �� ������ ������ � ������ ��������...
		if(other.guild != GIL_PAL)
		{
			AI_Output(self,other,"DIA_Lee_Add_04_25");	//��� ������ ��������� ��������� �����, ��� �����.
		};
	};
	AI_Output(self,other,"DIA_Lee_Add_04_23");	//� ���� ���... (������) ����� �� ������ ������ ������ ��������� ������...
};


var int Lee_Give_Sld_M;

instance DIA_Lee_ArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorM_Condition;
	information = DIA_Lee_ArmorM_Info;
	permanent = TRUE;
	description = "� ��� ������ �������� �������?";
};


func int DIA_Lee_ArmorM_Condition()
{
	if((Kapitel == 2) && (other.guild == GIL_SLD) && (Lee_Give_Sld_M == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	DIA_Common_WhatAboutBetterArmor();
	if((MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS) && (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//�� �������� �������.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//� ���� ���� ��������� ������� ��� ����. �������, ���� �� ���������������.
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//������ ������� ������� �� �����, ������� ������ ���� ���� ��������� ��� ������-�����.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//������� ���� ���� ������, � ����� �� ��������� � ��������� ��������!
	};
};


instance DIA_Lee_BuyArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BuyArmorM_Condition;
	information = DIA_Lee_BuyArmorM_Info;
	permanent = TRUE;
	description = "������ ������� ������� ��������. ������: 50/50/0/5. (1000 �������)";
};


func int DIA_Lee_BuyArmorM_Condition()
{
	if((Lee_Give_Sld_M == TRUE) && (Lee_SldMGiven == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorM_Info()
{
	DIA_Common_GiveMeThatArmor();
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//�����. ��� ����� ������� �������.
		B_GiveArmor(ITAR_SLD_M);
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//�� ��� �� �������! ������� � ���� ������� ������!
	};
};


instance DIA_Lee_ArmorH(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorH_Condition;
	information = DIA_Lee_ArmorH_Info;
	permanent = FALSE;
	description = "� ���� ���� ������� ������� ��� ����?";
};


func int DIA_Lee_ArmorH_Condition()
{
	if((Kapitel == 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorH_Info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//� ���� ���� ������� ������� ��� ����?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//�������.
	B_Lee_Teleport();
};


instance DIA_Lee_BuyArmorH(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BuyArmorH_Condition;
	information = DIA_Lee_BuyArmorH_Info;
	permanent = TRUE;
	description = "������ ������� ������� ��������. ������: 80/80/5/10. (2500 �������)";
};


func int DIA_Lee_BuyArmorH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ArmorH) && (Lee_SldHGiven == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorH_Info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//��� ��� ������� �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,2500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//�����. ��� ����� ������� �������. � ��� ����� ����.
		B_GiveArmor(ITAR_SLD_H);
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//�� ������ �������. ������� ������!
	};
};


instance DIA_Lee_Richter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Richter_Condition;
	information = DIA_Lee_Richter_Info;
	permanent = FALSE;
	description = "� ���� ��� ��� ��� ���� ������?";
};


func int DIA_Lee_Richter_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//� ���� ��� ��� ��� ���� ������?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//���� ��� ����, ��? ��-�����, � ���� � ��� ���� ������� �������. ���� �� ��� ���� �����?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//��� �������. � �� �������, �������?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//������. � ���� ���� ���-���. ��� ��� ��� ����.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//� ������ ����������� � ������ � ������. � ��, �������, ��������� ������� ��� ���.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//�� �������� � �� �������� ������� �� ��������� ���� � ��� ����.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//��� ���� ����� ����������. ��� ��� ������ �����������. �� ������� � ����� � ���������� ��� ���� ������.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//�� ������ ���������� ��������� ��� ������� � ��������� ������ ������� ������, ���� �� ������� ���-������, ���������������� ���.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//��� ������ ���������� ������� ������� �������, ��� �� ���� ������� �� ������.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//��� ��� ���-������, ��� � ����� ������������, ����� ��������� ��� ��� ����� ����� ���������. � ����, ����� �� ������ ������� ����� ���� �� ��������.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//�� � �� ����, ����� �� ������ ���. ��� ��� ���� ������� ����. � ����, ����� �� �������, ���������?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//��� �� �������, ����������?
	if(!Npc_IsDead(Richter))
	{
		Log_CreateTopic(TOPIC_RichterLakai,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RichterLakai,LOG_Running);
		B_LogEntry(TOPIC_RichterLakai,"�� �����, ����� � ����� ��������������, ���������� ����� ��������. ��� �����, � ������ ���������� ���� ������ ����� � ������ ������� ���� �� �������.");
		MIS_Lee_JudgeRichter = LOG_Running;
		Info_ClearChoices(DIA_Lee_Richter);
		Info_AddChoice(DIA_Lee_Richter,"� �� ���� ���������� ����. � �� ���� ������������ ���� ������.",DIA_Lee_Richter_nein);
		Info_AddChoice(DIA_Lee_Richter,"��� �������. �������?",DIA_Lee_Richter_wieviel);
	}
	else
	{
		DIA_Common_HeIsDead();
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//� �����, �� �����.
		B_GivePlayerXP(XP_JudgeRichter / 3);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Lee_Richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//��� �������. �������?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//���� ������� ������� �� ����, ��� �� �������� ���. ��� ��� ����������.
	B_Lee_Teleport();
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//� �� ���� ���������� ����. � �� ���� ������������ ���� ������.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//�� ��������� ���. ����� � ���, ��� ������ �� ������� ���� �� ������� � ������� �� ������. ��� �� ����� ���?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//��������, ��� ������, �� � �������, �� ������� ���������� �������.
	Info_ClearChoices(DIA_Lee_Richter);
};


instance DIA_Lee_RichterBeweise(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_RichterBeweise_Condition;
	information = DIA_Lee_RichterBeweise_Info;
	description = "� ����� ���-���, ���������������� �����.";
};


func int DIA_Lee_RichterBeweise_Condition()
{
	if((Kapitel >= 3) && (MIS_Lee_JudgeRichter == LOG_Running) && Npc_HasItems(other,ItWr_RichterKomproBrief_MIS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweise_Info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//� ����� ���-���, ���������������� �����.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//������? � ��� ��?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//�� ����� �����������, ����� �� �������� ����������� ��������.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//������ ����� ����� �� ��������� �� � ������ ���� ��� ������.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//� ������ ���� � �������� �������������� ���������� ������ ����� ���� �����������.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//������.
	B_GiveInvItems(other,self,ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();
	if(!Npc_IsDead(Richter))
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//�������-��. ����� ������ ���� ����������, ����� ��������� ��� ��������. � ��������.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//� ����� ������ ��������� �� ���. ����� ���� �������.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//� �� ������ �� ���� ������, ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//��� ����������. �� ������ ������� ��� �����. ����� �����.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//�����-�� ����� ��������� ���. ��, ��. ���� ��� ����, � �����-��, ����������.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//��� ��������� �����. ��� ������� ������ �������� �� �����.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Lee_TalkAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_TalkAboutBennet_Condition;
	information = DIA_Lee_TalkAboutBennet_Info;
	permanent = FALSE;
	description = "��� ������ �������?";
};


func int DIA_Lee_TalkAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//��� ������ �������?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//��� �� ��� ������. ��� ������� �������� ��� �� �������. ��� � ���.
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//��� ����� ��� �� ������� ������� � ����� ������ - ������ � ������ ���������� ��� � � ���������.
	B_Lee_Teleport();
};


instance DIA_Lee_DoAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_DoAboutBennet_Condition;
	information = DIA_Lee_DoAboutBennet_Info;
	permanent = FALSE;
	description = "��� �� ����������� ������� ��� �������?";
};


func int DIA_Lee_DoAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_TalkAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//��� �� ����������� ������� ��� �������?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//� ���� �� ����. ����� ������ ������ ���� ������ ��������� � ����� � ����� ���� ����� ������ �� ����� ������.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//� �������, � ��� ������������ ����� ��� ����� ��������, �, ����� ����, ��� �� � ���� �����.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//�� ���� �� ����������� ������ ����� ����?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//�������, ���.
	B_LogEntry(TOPIC_RescueBennet,"���� � �� ����� �������� ������������ ������� ���������� ������, �� ������ �� ����� �������������. ��� ���� ����� �� ��������� � ������� �� ����� � ����� ������, ����� ���������� �������.");
	if(!Npc_IsDead(Lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//����� ��� ��� � ������ � �������� ��������, ��� ����� �������� �������.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//� ���� � ��������� ��������� ���� ������. �������� ���������, ��� ������ �� ����������� ������� ����� ������� �� ���.
	};
};


instance DIA_Lee_CanHelpYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_CanHelpYou_Condition;
	information = DIA_Lee_CanHelpYou_Info;
	permanent = FALSE;
	description = "���� � ���-������ ������ � ��������?";
};


func int DIA_Lee_CanHelpYou_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//���� � ���-������ ������ � ��������?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//�������, �� �����, ��� � ����� ���� ����� ������� �� � �������� ������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//����� ���������, ������� ������� ����� � ��� �������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//��� � �����, �����, ���� ������� ����� ������ �������� ������� ������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//�� �� ��������� ������ � ���� �����, � �� ����, ��� ����� ��� ������� ���������� ������ ��� ���������.
};


var int DIA_Lee_AnyNews_OneTime;

instance DIA_Lee_AnyNews(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_AnyNews_Condition;
	information = DIA_Lee_AnyNews_Info;
	permanent = TRUE;
	description = "���� ������� � �������?";
};


func int DIA_Lee_AnyNews_Condition()
{
	if((MIS_RescueBennet != FALSE) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet) && (DIA_Lee_AnyNews_OneTime == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//���� ������� � �������?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//��, �� ������� ����, ������, ������, �� ������ ��������� �� ��� ��������.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//�������� ������.
		B_Lee_Teleport();
		if(DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_AmbientKap3);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//���, �� ��� ��� ����� ������������.
	};
};


instance DIA_Lee_SYLVIO(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_SYLVIO_Condition;
	information = DIA_Lee_SYLVIO_Info;
	description = "��� ��������� �� ��������� �����?";
};


func int DIA_Lee_SYLVIO_Condition()
{
	if(MIS_ReadyforChapter4 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//��� ��������� �� ��������� �����?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//�������, �������, ��������� � �������� � ������ �������� � ���� � ��� ���� ����� �� ����� ������� � ���.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//�� ������� ��������� ������ ����� � ��� � ������ ��������. �� ������ �� �����, �����, ������ � ��� ���� ��������� ����.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//����������� �� �������� ������������� ����� ���� ������ ���� �������, �� ��� �� ������� ��������� �������, ������� ������� �� ��� �������.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//��� ����������� ���, ��� ��� ����������� � �������, � ����� �������.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(����������) ��. ���������� ������, � ���� ���, ��� ������� ������� ���� � �����.
	B_Lee_Teleport();
};


var int DIA_Lee_Teacher_permanent;
var int Lee_Labercount;
var int DIA_Lee_TeachState_2H;

func void B_Lee_CommentFightSkill()
{
	if(Lee_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//���� ����� ������� ���������. �� ������ ������� ������ ���������.
		Lee_Labercount = 1;
	}
	else if(Lee_Labercount == 1)
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//������ �����: ������� ���� ������ ���� �� �����, � �� �� ��������.
		Lee_Labercount = 2;
	}
	else if(Lee_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//���������� ���� ����������, ���� �� ���������� � ������. ��� ��� �������� ����� ������������ �����.
		Lee_Labercount = 0;
	};
};

func void B_Lee_TeachNoMore()
{
	AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//������ �� ��������� ������ ��� ��������� �������.
	AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//�� ������ �� ���������� � ��������.
};

instance DIA_Lee_CanTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_CanTeach_Condition;
	information = DIA_Lee_CanTeach_Info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int DIA_Lee_CanTeach_Condition()
{
//	if((Kapitel >= 4) && (Lee_TeachPlayer == FALSE))
	if(Lee_TeachPlayer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//�� ������ ������� ����?
	if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Lee)
	{
		B_Lee_TeachNoMore();
		Lee_TeachPlayer = TRUE;
		DIA_Lee_Teacher_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//� ���� �������� ����, ��� ��������� ��������� �������.
		if(!TeacherCanTrainTalent(NPC_TALENT_2H,TeachCondition_2H_Lee))
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//�� � ���� ��� ������� �� ��, ����� ����� ���� �������.
			AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//��� ������ �� ���������� ������������� ������, � � ����� ������������. � ���� ����� ������� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//� ������, ��� �� ����� �����. �� ����� ���������, ��� � ��� �� ���� ������� ���� �������-������ �������.
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				Lee_TeachPlayer = TRUE;
				Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
				B_LogEntry(TOPIC_SoldierTeacher,"�� ����� ������� ���� ��������� ��������� � ��������� �������.");
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//��� ���, ���� ������, � ���� ������������� ����. �������, �� ���������.
				AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//�������?
				AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 ����� - � ������, ��� �� ������������.
				Info_ClearChoices(DIA_Lee_CanTeach);
				Info_AddChoice(DIA_Lee_CanTeach,"��� ������� ������ ��� ����.",DIA_Lee_CanTeach_No);
				if(Npc_HasItems(other,ItMi_Gold) >= 1000)
				{
					Info_AddChoice(DIA_Lee_CanTeach,"������������. ��� ������.",DIA_Lee_CanTeach_Yes);
				};
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//��� ������� ������ ��� ����.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//������� �� ������. ������� ����� ������� ����������� �������.
	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//������������. ��� ������.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//������, ������ ���: � ���� ���� �����.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(TOPIC_SoldierTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_SoldierTeacher,"�� ����� ������� ���� ��������� ��������� � ��������� �������.");
};

func void B_BuildLearnDialog_Lee()
{
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Lee)
	{
		Info_ClearChoices(DIA_Lee_Teach);
		Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
		Info_AddChoice(DIA_Lee_Teach,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
		Info_AddChoice(DIA_Lee_Teach,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
	}
	else
	{
		if(RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Lee)
		{
			DIA_Lee_Teacher_permanent = TRUE;
		};
		PrintScreen(PRINT_NoLearnOverMAX,-1,53,FONT_Screen,2);
		B_Lee_TeachNoMore();
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lee_Teach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_Teach_Condition;
	information = DIA_Lee_Teach_Info;
	permanent = TRUE;
	description = "������ ��������.";
};


func int DIA_Lee_Teach_Condition()
{
	if((Lee_TeachPlayer == TRUE) && (DIA_Lee_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//������ ��������.
	B_BuildLearnDialog_Lee();
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Lee))
	{
		B_Lee_CommentFightSkill();
		B_BuildLearnDialog_Lee();
	};
};

func void DIA_Lee_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Lee))
	{
		B_Lee_CommentFightSkill();
		B_BuildLearnDialog_Lee();
	};
};


instance DIA_Lee_DRACHENEI(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_DRACHENEI_Condition;
	information = DIA_Lee_DRACHENEI_Info;
	description = "����-����� ������������ �������� ���� �� ����� �������.";
};


func int DIA_Lee_DRACHENEI_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//����-����� ������������ �������� ���� �� ����� �������.
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//� ��� ������ ��� ������. ������ ����� ��������� ������.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//� ��� ��� ������ � ����?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//������ ��. ��� ���?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//����� ����, �� �������� ����� ����� ������� ������� ��� ��� ���-������.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//������, ��� ����� �������. �������� �� ���� � ��������.
		B_LogEntry(TOPIC_DRACHENEIER,"�� �� �����, ��� ������ � ��������� �����. �� �������� ���� � ������� �������.");
	};
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Lee_KAP4_Perm(C_Info)
{
	npc = SLD_800_Lee;
	nr = 49;
	condition = DIA_Lee_KAP4_Perm_Condition;
	information = DIA_Lee_KAP4_Perm_Info;
	permanent = TRUE;
	description = "��� ���� ���� �� �����?";
};


func int DIA_Lee_KAP4_Perm_Condition()
{
	if((Kapitel >= 4) && (Lee_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//��� ���� ���� �� �����?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//��, � ��� ���, ��� ������� ������, ����� ����� �������� ��������.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//��-�����, ��� ���� �������.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//��, � ���������, � ��� �� ����� ������ ������. ����� ��� ���� � ���� �������� ������������, �� ������ ���������� �������� ��� � �� ����� �������.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//�� ��� ��� ��������. � ���������.
	B_Lee_Teleport();
};


instance DIA_Lee_GetShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GetShip_Condition;
	information = DIA_Lee_GetShip_Info;
	description = "�� �� ������, ��� ��� ��������� ������� ���������?";
};


func int DIA_Lee_GetShip_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//�� �� ������, ��� ��� ��������� ������� ���������?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//�� �������, � ��� ��� ����� �� �����, ���� �� ����? ���� ������� �������� �������, ��� ���������� � ����� � ������ �������.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//������ �� ���� ������ ������� �� �������.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//�������. ������� �� ���� ������.
	if((MIS_Lee_JudgeRichter == LOG_SUCCESS) && !Npc_IsDead(Richter))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//�� �� ������, � ��� ����� ��� ��������. �� ������ ����� � ���� � �������� �� ���� ����������� ������, ������� �������� ��� ������� �� �������.
		MIS_RichtersPermissionForShip = LOG_Running;
		B_LogEntry(Topic_Ship,"�� ��������, ��� ������ ������ ������� �� ������� ��������� - �������� ������ � ��������������� ����������� �� �����. �� ���� �� �� ���� ����� ������ �� ����� ������ ����.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//� ���� ���� ���������� ������ � �������������� ����������. ������ ���, ����������� ������ �������� ���� ������.
		B_LogEntry(Topic_Ship,"��, ������� ��! �� �������� ���������� ������, ������� �������� ��� ������� �� ������� ���������.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//�� ��� �� ���. ����� ��������� ��������, ���� ����������� �������, ������� � ����� ���� ���.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//����� ��������� ����� ������� ������.
	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip,Dialog_Back,DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip,"� ���� ��� ����� � �������?",DIA_Lee_GetShip_crew);
	if(!Npc_IsDead(Torlof) && (SCGotCaptain == FALSE))
	{
		Info_AddChoice(DIA_Lee_GetShip,"�� ������ ����-������, ��� ��� �� ��������� ��������?",DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//�� ������ ����-������, ��� ��� �� ��������� ��������?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//��������� � ����, ������ ����� � ����. �� ����������� � ������� ����.
	TorlofIsSailor = TRUE;
	B_LogEntry(Topic_Captain,"������ - ������ ������� ����. ��������, �� ������� ����� ���� ���������.");
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//� ���� ��� ����� � �������?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//��� �� ������ ������ ���. �� � �� ���� ������ �����, ������� �������. �� ����� ������ �����, ������� ����� ��������?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//���� ���� ����� ������ � �������, �������� ��������� �������. ����� ��� �� ���� �� �������.
	if(SCToldBennetHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"��� �������� ���� �������, ����� �� ���� ��� ����� ������ ���. �� ��� �� �� ��� ����� - �������� ������ �����, ������� � ���� ��������. �, �������, ������ �������, ����� ����, ��� ��� ����� ���������.");
	}
	else
	{
		B_LogEntry(Topic_Crew,"��� �������� ���� �������, ����� �� ���� ��� ����� ������ ���. �� ��� �� �� ��� ����� - �������� ������ �����, ������� � ���� ��������.");
	};	
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};


instance DIA_Lee_GotRichtersPermissionForShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GotRichtersPermissionForShip_Condition;
	information = DIA_Lee_GotRichtersPermissionForShip_Info;
	description = "������ ���������. ������� ������ ���. ����� �������� ����� ������.";
};


func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if(MIS_RichtersPermissionForShip == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//������ ���������. ������� ������ ���. ����� �������� ����� ������.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//������. ������, ��� ���� �������� ����� ���� �������� ���� �� ����������.
	B_GivePlayerXP(XP_AmbientKap5);
};


instance DIA_Lee_StealShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StealShip_Condition;
	information = DIA_Lee_StealShip_Info;
	permanent = FALSE;
	description = "� ���� ������� �������.";
};


func int DIA_Lee_StealShip_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_GetShip) && (MIS_RichtersPermissionForShip == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//� ���� ������� �������.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//� ��� �� ����������� ������� ���?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//����� ������� - � ����� ����, ������ �� ���� ������ - � ������� ���!
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//��-��. �����. �������, �� ������, ��� �������.
	CreateInvItems(self,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
};


instance DIA_Lee_KnowWhereEnemy(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KnowWhereEnemy_Condition;
	information = DIA_Lee_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "�� ������� �� ���� �� �������?";
};


func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lee_IsOnBoard == FALSE))
	{
		if(Npc_KnowsInfo(other,DIA_Lee_GetShip) || (MIS_ShipIsFree == TRUE))
		{
			return TRUE;
		};
	};
};

var int SCToldLeeHeKnowWhereEnemy;

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//�� ������� �� ���� �� �������?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//�� ������? �������. ��� �� �������� ����������� ��� � ��� �� ��������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//����� ����, � ���� ������� ���� ��������� �������� ���������� � ��������� �������. ��� ����� ��������� ����� ��������.
	if(SCToldLeeHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"�� �� �������� ������� ������� �����. �� ��������� ��� ���� ���������. ��� ����� ������ ����� ������ ������� ������ �������� ���-���� ���.");
		SCToldLeeHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//��� ����� �� ������� ������ ������, �� � �������, ���� �������� �����-������ ��������.
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		if(!Npc_KnowsInfo(other,DIA_Lee_GetShip) && !Npc_IsDead(Torlof) && (SCGotCaptain == FALSE) && (TorlofIsSailor == FALSE))
		{
			Info_AddChoice(DIA_Lee_KnowWhereEnemy,"�� ������ ����-������, ��� ��� �� ��������� ��������?",DIA_Lee_GetShip_torlof);
		};
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"� ��� ���� �����, ���� �� ��� ������������.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"����� ���� ����!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//����� ���� ����!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//���? ����� ������?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//��, � ����� ����������� � ����, � ���� �� ������� �� ����, ������� � ������. ���������� �� �������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//� ��� ����� ���� ����� �������. � ���� ���.
	B_JoinShip(self);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ���� �� ��� ������������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//�������, �� ������, ��� �������. �� �����, ��� ������� ������ ������� �� ������ ������� �����.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(����������) ���� ��� ������ �� ������ ������� ����� �������.
	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};


instance DIA_Lee_LeaveMyShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeaveMyShip_Condition;
	information = DIA_Lee_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� ���-���� �� ���� ����� ���� � �����!";
};


func int DIA_Lee_LeaveMyShip_Condition()
{
	if((Lee_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//� ���-���� �� ���� ����� ���� � �����!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//��� �������. �� ������, ��� ���� �����, ���� ���!
	Lee_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Lee_Nerver += 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lee_StillNeedYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StillNeedYou_Condition;
	information = DIA_Lee_StillNeedYou_Info;
	permanent = TRUE;
	description = "�� ��� ���-���� �����!";
};


func int DIA_Lee_StillNeedYou_Condition()
{
	if(((Lee_IsOnBoard == LOG_OBSOLETE) || (Lee_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//�� ��� ���-���� �����!
	if((Lee_IsOnBoard == LOG_OBSOLETE) && (Lee_Nerver <= 2))
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//� ����, ��� ����������� ����! �������� �� �������.
		B_JoinShip(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//������, � �� ����� �� ��! ������� �� ������, ����� � ������, ����� �������� ���� �����!
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//����� ���� ������� ������!
		AI_StopProcessInfos(self);
		Lee_IsOnBoard = LOG_FAILED;
	};
};

