
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//� ��� ���, ��� �������� ���� �������, ����������� �� ��� �����.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//������ ������ �� ����� ����, ������� ��� ������ �������� ������. �� ������� ��������.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//�������� �� ������� �����������. (��������) � ���������, ������� �� �����������, �� ��� ����� � �����.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"������ ������� ��������� ������.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "�������? �� ������ ���������?";
};


func int DIA_Addon_Scatty_last_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//�������? �� ������ ���������?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//�� ������� �� �����. �� ��� �� ����� ������� �� ����������. ����������� ������� �� �������� � ����� � �������.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//'����� �������' - ��� ��� �����, ���� ���� ������?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//��������� ��� � ��� �����, ����� �� ������� �� ��������...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(������) ...���� ���, �������! ��������� ��� ���, ����� �� ������� ����� �������� ������.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//� ������� �� ������, ��� ����� ���������� ������.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "� ��� ��� �� ��������?";
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//� ��� ��� �� ��������?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//���������, ������� ��������! �� ��������� ����� ��������� ������!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//���������? �� ������ � ���� ����� �������� �������? ������� � � ������� �������?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//� ��������! ��� ������� �� ������ ����� ������ ��������.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//� � ������ ������ ����, ��� ����������� �������� - ������ ����.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//�� ����� ��� ������ ������� ����� ������ �����. � ����� �������� ���-���� ���������, �� ����� ���� �� ������ �����������.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "��� ������ ����� � ��������?";
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//��� ������ ����� � ��������?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(����� ���������������) ��... �� ����� ���������. �� ����������� ��� ������ �����, ��� � �����-�� ����.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//�� ��� ����� �� ����������. � � �����-�� ������ ��� ����� �������� ��� ������.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//�����-�� � ����. ��� ��������� � ��������?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//��... �-�... ���-�� � ���� ����� ���������...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//��, ������, �� ������. ��� �����, ��� ��� ������ ��� �����?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//�����. (�������� ����) ��... �� ����... �������� ����-��. �� ���������� ����� �� ����� �����.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//����� ���� �������� �� ��������, � � ������� �����, ������� ������� ���� �� ������ - ������������ �����.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//� �����?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//��� ���, ��� � ����. ����� ����� ������� ����� �� �������� � ������, ����� � ����������. ��� � � ������.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//����� �������� ����� ����� �� ������ ������ �������� � ����. � � ��� ��� ����� �� ����� ������.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "������ ������?";
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//������ ������?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//������ ��... �-���... ����. �� ���� �� � ������ ���� ����.
	if(!Npc_IsDead(Lucia))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//��, ����� ����, � ����� ���� ���������...
		if(!Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
		{
			Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
			B_LogEntry(Topic_Addon_BDT_Trader,"� ����� � ���� ������ �������.");
		};
	};
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "���, ����������. (���� ����)";
};


func int DIA_Addon_Scatty_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken) && Npc_HasItems(other,ItFo_Beer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//���, ����������.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ItFo_Beer,1);
	AI_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//�, �������, ��� ������. �������. �� - ��� �����.
	B_GivePlayerXP(XP_Ambient * 5);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 800;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//������ ����� � ���� � ������ �� ������� ���� - ������ ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//��, ���� ��� �������, ���������� ����� ����������. ������� ������ ������ ����, ������� �������� � ���� ����.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//� ����� ���������� ���� ������, ����� � ���� ����� ������ �����.
	B_Upgrade_Hero_HackChance(5);
};


var int Scatty_teach_noPerm;

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 800;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
//	description = "�������� ��� ��� ���-������ � ���, ��� ������ ������. (1 LP/10 ���������)";
	description = "(�������� ����� ������: + 10, 1 ���� ��������)";
};


func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Scatty_teach_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//�������� ��� ��� ���-������ � ���, ��� ������ ������.
	if(Hero_HackChance < 100)
	{
		if(other.lp >= 1)
		{
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//� ������ ������� �� ������ �����, ��� ������ - ��� �� ����. ��� ������, ��� �����. ���� �� ������� ������� ������, ��� ����������.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//� ������� �������� ���� ���� ������, ����������� ��� �������� ��������� �� ������.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//� �������� �����, ��� ������ � �������� ������ �������� �� �������� ��������.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//����� �����, ���������� - ���� ������. ������ �������, �� ������� ������� ���������.
			other.lp -= 1;
			B_Upgrade_Hero_HackChance(10);
		}
		else
		{
			B_Say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
		Scatty_teach_noPerm = TRUE;
	};
};


instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = "������� �����.";
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//������� �����.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//��, ���� �� ��� ����� �����, ���� ������ � �� �����... �� ������� ������� ����� ������.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_v1;
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
};

