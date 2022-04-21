
instance DIA_Lehmar_EXIT(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 999;
	condition = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_ENTSCHULDIGUNG(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 2;
	condition = DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information = DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent = FALSE;
	description = "��� ����?";
};


func int DIA_Lehmar_ENTSCHULDIGUNG_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//(������) ������� �� ������?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//��� ������ '�������'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//� ��������� � �� ������ �� ���. ��� ���� ��� ����� ���� ����� �� ����? ������, �������.
};


var int DIA_Lehmar_GELDLEIHEN_noPerm;

func void B_BorrowLehmarGold(var int gold)
{
	CreateInvItems(self,ItMi_Gold,gold);
	B_GiveInvItems(self,other,ItMi_Gold,gold);
	Lehmar_GeldGeliehen = gold;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
};

func void B_CalculateLehmarDebt(var int percentage)
{
	Lehmar_GeldGeliehen_MitZinsen = Lehmar_GeldGeliehen * (100 + percentage) / 100;
};

instance DIA_Lehmar_GELDLEIHEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_GELDLEIHEN_Condition;
	information = DIA_Lehmar_GELDLEIHEN_Info;
	permanent = TRUE;
	description = "������ ��� �����!";
};


func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) && (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//������ ��� �����!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//�������! ������� �� ������? � ���� 20 ���������!
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"� ������� ��� ����.",DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"1000 �������.",DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"200 �������.",DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"50 �������.",DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	DIA_Common_IWillThinkAboutIt();
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//����� �� �������! �� ����� ��� ����� �������!
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 �������.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//������, ��? � ����, ����� �� ������ �� ������, �������?
	B_BorrowLehmarGold(50);
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 �������.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//��� ������� ����� �����. � ���� ������ ���� ������, � ������ ����, �������?
	B_BorrowLehmarGold(200);
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 �������.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//� ���� � ������� ��� � �������?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//� ��� ���� 100. � �� ������ ������� �� ������!
	B_BorrowLehmarGold(100);
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};


instance DIA_Lehmar_WARUMGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_WARUMGELD_Condition;
	information = DIA_Lehmar_WARUMGELD_Info;
	permanent = FALSE;
	description = "�� ������ ��� ����� �������� ������?";
};


func int DIA_Lehmar_WARUMGELD_Condition()
{
	if(Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//�� ������ ��� ����� �������� ������?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//�� ��������. �� ���������. ��� � ����� ���� � ����. ��� ������.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//� ���� ����� �������������� ���������, ��� ��� �� �������� ����� ����� ����.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//��� ��� ���� �� ����� �������� ����.
};


var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_GELDEINTREIBEN_Condition;
	information = DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_GELDEINTREIBEN_Condition()
{
	if(C_LehmarDebtIsOverdue())
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//�� �� ������ ����, �������! ����� ��� ��� ������! � ��� ��� ��� �������� ���������� ���� �� ����, ������� ����������.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//������ ��� ��������� ���� � 30 ��������� ������ ������� 20.
	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"� ����� ���� ����.",DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"� ������ ���� �� ���.",DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_GELDEINTREIBEN_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//� ������ ���� �� ���.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//��, ���, ����!
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	if(Hlp_IsValidNpc(Meldor) && !C_NpcIsDown(Meldor))
	{
		B_Attack(Meldor,other,AR_NONE,1);
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//� ����� ���� ����.
	B_CalculateLehmarDebt(30);
	if(B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen))
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//���� �������! � ������ ����������!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//� ���� � ����� ��� ������� �����! �����. ������, ��� �������� ��������� ���� ����.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//������ ������� - ��� ������ ����� ������������ ���� ���������.
		Lehmar_vorbei = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
		if(Hlp_IsValidNpc(Meldor) && !C_NpcIsDown(Meldor))
		{
			B_Attack(Meldor,other,AR_NONE,1);
		};
	};
};


instance DIA_Lehmar_GELDZURUECK(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 6;
	condition = DIA_Lehmar_GELDZURUECK_Condition;
	information = DIA_Lehmar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "��� ���� ������!";
};


func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) && (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//��� ���� ������!
	B_CalculateLehmarDebt(20);
	if(RangerHelp_LehmarKohle == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//������ ��. ����� ��� ��� ���� �����������.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//������, �� � ���� ���������� ��������, �? �����, �����, ��� �� ��� ����. �����.
		Lehmar_GeldGeliehen = 0;
	}
	else
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen))
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//�����������! ������� ����� � ����� ����.
			Lehmar_GeldGeliehen = 0;
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//����� ������������! �����������, ����� � ���� ����� ��� �����. � ���� ��� ���� �����. �����, 20 ���������!
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_NOCHMALGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 8;
	condition = DIA_Lehmar_NOCHMALGELD_Condition;
	information = DIA_Lehmar_NOCHMALGELD_Info;
	permanent = TRUE;
	description = "���� � ������ � ���� �����?";
};


func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if((Lehmar_GeldGeliehen == 0) && (Lehmar_GeldGeliehen_MitZinsen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//���� � ������ � ���� �����?
	if(Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg) || (self.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//�� �������, � �����? ����������!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//������ �� ������! � ����� ������� �������� � ������ � ���� �� ����� ������ ����.
//		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//������ ����� ��������� ����!
	};
};


instance DIA_Lehmar_PICKPOCKET(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 900;
	condition = DIA_Lehmar_PICKPOCKET_Condition;
	information = DIA_Lehmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(��� ������ �����, ��� ������� ��� �����)";
};


func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItWr_Schuldenbuch))
	{
		return C_CanStealFromNpc(20);
	};
	return FALSE;
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,Dialog_Back,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	B_StealItem(20,ItWr_Schuldenbuch);
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
};


var int LehmarToldAboutBook;

instance DIA_Lehmar_BuchWeg(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_BuchWeg_Condition;
	information = DIA_Lehmar_BuchWeg_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_BuchWeg_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE) && (Lehmar_StealBook_Day < Wld_GetDay()) && (Lehmar_vorbei == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//(� ����������) �����-�� ������� ��� ����� ��� ��������...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//�� �������� �� ������ � ����� ���������, ���?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//(����������) �? ���.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//��-��, ������. ����� ������...
	LehmarToldAboutBook = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_verhauen(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_verhauen_Condition;
	information = DIA_Lehmar_verhauen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lehmar_verhauen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lehmar_vorbei == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE) && (Lehmar_StealBook_Day < Wld_GetDay()) && (LehmarToldAboutBook == FALSE))
	{
		DIA_Lehmar_BuchWeg_Info();
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};

