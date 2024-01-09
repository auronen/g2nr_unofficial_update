
instance DIA_Addon_Juan_EXIT(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 999;
	condition = DIA_Addon_Juan_EXIT_Condition;
	information = DIA_Addon_Juan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Juan_HI(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_HI_Condition;
	information = DIA_Addon_Juan_HI_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//��� ���� �����? ���� ���� ������ ��� �������, ������� ����.
	if(!Npc_IsDead(Freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//����� ��� �������� ������� �� ���� ����. ��� ��� ���� �����?
		B_StartOtherRoutine(Freund,"STAND");
	};
};


instance DIA_Addon_Juan_Losung(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_Losung_Condition;
	information = DIA_Addon_Juan_Losung_Info;
	permanent = FALSE;
	description = "�������, � ���� ���� ���������� ����...";
};


func int DIA_Addon_Juan_Losung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_HI) && ((Tom_Tells == TRUE) || (MIS_Huno_Stahl == LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//�������, � ���� ���� ���������� ����...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//� ���? ������� ����� ���� �����? � ��� ����� �������, ������ ����� �� ������ �� ���� ������ ����...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//... � �� ������ �������� ����-��, ����� ������� ��� ����? � �� �� �����!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//�� � ���? ��� �� ��� ��������.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//��� � ������ ���� ��������. �� ������ ��������� ������ - �������, ������� �� ���!
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//������ ������ � �������� ��� � ������, ��� � �� ���� ��� ���. ��� ��� �������. ���� ����-�� ����� ��� ������, �� ��� �������� ���������!
};


instance DIA_Addon_Juan_AufsMaul(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 2;
	condition = DIA_Addon_Juan_AufsMaul_Condition;
	information = DIA_Addon_Juan_AufsMaul_Info;
	permanent = FALSE;
	description = "� ������ �� �� ��������!";
};


func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//� ������ �� �� ��������!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//��? �� �����... �-�... ����������! �����! � ���� �� ����� �����-�� �����.
	Info_ClearChoices(DIA_Addon_Juan_AufsMaul);
	Info_AddChoice(DIA_Addon_Juan_AufsMaul,Dialog_Ende,DIA_Addon_Juan_AufsMaul_ENDAttack);
};

func void DIA_Addon_Juan_AufsMaul_ENDAttack()
{
	AI_StopProcessInfos(self);
	if(!Npc_HasEquippedWeapon(self))
	{
		B_RefreshMeleeWeapon(self);
	};
	B_Attack(self,other,AR_NONE,1);
	if(Hlp_IsValidNpc(Freund))
	{
		if(!Npc_IsDead(Freund))
		{
			B_Attack(Freund,other,AR_NONE,1);
		};
	};
};


instance DIA_Addon_Juan_Trade(C_Info)
{
	npc = BDT_10017_Addon_Juan;
	nr = 99;
	condition = DIA_Addon_Juan_Trade_Condition;
	information = DIA_Addon_Juan_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v3;
};


func int DIA_Addon_Juan_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Trade_Info()
{
	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

