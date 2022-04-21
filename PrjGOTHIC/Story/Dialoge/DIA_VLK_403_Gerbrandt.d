
var int DIEGO_COMING;

func void B_StartNewLife()
{
	if(DIEGO_COMING == 1)
	{
		if(Diego_IsOnBoard == FALSE)
		{
			B_StartOtherRoutine(DiegoNW,"GERBRANDT");
		};
		self.aivar[AIV_CommentedPlayerCrime] = FALSE;
		self.aivar[AIV_ToughGuy] = TRUE;
		Npc_ExchangeRoutine(self,"FLEE");
		if(!Npc_IsDead(GerbrandtsFrau))
		{
			GerbrandtsFrau.aivar[AIV_CommentedPlayerCrime] = FALSE;
			GerbrandtsFrau.aivar[AIV_ToughGuy] = TRUE;
			B_StartOtherRoutine(GerbrandtsFrau,"NEWLIFE");
		};
		B_StartOtherRoutine(VLK_419_Buerger,"NEWPLACE");
		DIEGO_COMING = 2;
	};
};

instance DIA_Gerbrandt_EXIT(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 999;
	condition = DIA_Gerbrandt_EXIT_Condition;
	information = DIA_Gerbrandt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerbrandt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gerbrandt_EXIT_Info()
{
	B_StartNewLife();
	AI_StopProcessInfos(self);
};


instance DIA_Gerbrandt_PICKPOCKET(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 900;
	condition = DIA_Gerbrandt_PICKPOCKET_Condition;
	information = DIA_Gerbrandt_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Gerbrandt_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItSe_GoldPocket100) && (DIEGO_COMING == FALSE))
	{
		return C_CanStealFromNpc(30);
	};
	return FALSE;
};

func void DIA_Gerbrandt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET,Dialog_Back,DIA_Gerbrandt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerbrandt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gerbrandt_PICKPOCKET_DoIt);
};

func void DIA_Gerbrandt_PICKPOCKET_DoIt()
{
	B_StartNewLife();
	B_StealItem(30,ItSe_GoldPocket100);
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
};

func void DIA_Gerbrandt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerbrandt_PICKPOCKET);
};


instance DIA_Gerbrandt_PreHello(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 2;
	condition = DIA_Gerbrandt_PreHello_Condition;
	information = DIA_Gerbrandt_PreHello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gerbrandt_PreHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (VisibleGuild(hero) != GIL_KDF) && (VisibleGuild(hero) != GIL_PAL) && (VisibleGuild(hero) != GIL_KDW))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_PreHello_Info()
{
	AI_Output(self,other,"DIA_Constantino_Hallo_10_00");	//��� ���� �����? ����������� ����� ������ ���, � ��������� ���� � ���� ������ �� ���������.
};

instance DIA_Gerbrandt_Hello(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 5;
	condition = DIA_Gerbrandt_Hello_Condition;
	information = DIA_Gerbrandt_Hello_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Gerbrandt_Hello_Condition()
{
	if(DIEGO_COMING == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Hello_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//��� �� ������� �����?
	if((VisibleGuild(hero) != GIL_KDF) && (VisibleGuild(hero) != GIL_PAL) && (VisibleGuild(hero) != GIL_KDW))
	{
		AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//� �� ��� �����? ������, �� ������� ����� � ������� �� ������, � ��� ������ ����.
		AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//���� ����� ���������. � ��� ���� � ������ ���������. �����?
		Info_ClearChoices(DIA_Gerbrandt_Hello);
		Info_AddChoice(DIA_Gerbrandt_Hello,"� �����, ���������.",DIA_Gerbrandt_Hello_No);
		Info_AddChoice(DIA_Gerbrandt_Hello,"� �����, ������ ���������.",DIA_Gerbrandt_Hello_Yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//����� � ����� �����. ����, ��� ������� ��������, �������� ������� ����� ������ ����. � ����� ��� ����� ������ �� ������ �� ���� ���, ������ ��� ����� ����, ��� � ��������� � ���, �� ��������, ��� ������� ��� �� �����!
	};
};

func void DIA_Gerbrandt_Hello_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//� �����, ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//���������� ����! ���� ����� ��������� �������� �� ���, ����� � ���� ����� ������� ��������...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//����� � ����� �����. ����, ��� ������� ��������, �������� ������� ����� ������ ����. � ����� ��� ����� ������ �� ������ �� ���� ���, ������ ��� ����� ����, ��� � ��������� � ���, �� ��������, ��� ������� ��� �� �����!
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//����������� ����� � ����� �������� �� ����. � ���� �� ����� ������, ���� ����� ��������������, ����� ��� ������������ � ���� ���� ���������.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//� �����, ������ ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//��, �� ������� ����, ���� �� ������������� ����� �������, ����� ������, ���� ����� ����� ����.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//��� ������ ������ ����� ������ � ����, � ���� ��������� �������� ������ ��� ������ ���������� ��������, ��� ��.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//�� ���� �� ��������� �������� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//�� ������ ������?
	Info_ClearChoices(DIA_Gerbrandt_Hello);
	Info_AddChoice(DIA_Gerbrandt_Hello,"���.",DIA_Gerbrandt_Hello_Yes_No);
	Info_AddChoice(DIA_Gerbrandt_Hello,"��� �� ����� ������.",DIA_Gerbrandt_Hello_NoJob);
	Info_AddChoice(DIA_Gerbrandt_Hello,"�������.",DIA_Gerbrandt_Hello_Yes_Yes);
};

func void DIA_Gerbrandt_Hello_Yes_No()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//���.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//������, �� ������ ����, �� ������� ���������� ��������� ������ � ����� �� �����.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//� ���� � ���� ������� �����, ��������, � ���� �������� ���� ���������� �����. ����� ������ ����� ������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//��� �, ����� � ��� ���� � ����, ��� ������ � �������� ������������� ������ �������� �������.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_NoJob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//��� �� ����� ������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//�� �������, �� ������ ����. ������, ����� �� ����� �������� ������ ����� ��� ����� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//� ���� �� ���������� ���������� ����, �� ������ ����� ������ ���� ���������� ����� � �������, ������ ��� ��� ����� ���, ��� �� ������� ���� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//��� ������ �����, ����� �� ������ ������� ���� ���� ���� ������.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void DIA_Gerbrandt_Hello_Yes_Yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//�������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//�������. � ���� ������� ������ ����� ��������� ����������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//��� ������ ����� ������������?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//������������?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//������, � ������� ���� ����. ����� �������� ������������ �����, ������� �� ���. ����� � ��� ���� ������.
	Info_ClearChoices(DIA_Gerbrandt_Hello);
};

func void B_Gerbrandt_PissOff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//��� ��� ��� ������ - �� ����������� ���� ����?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//�� � ���� �������� ����� ��� � ��� ��� ���������.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//������ ���� � �����!
	B_StartNewLife();
	AI_StopProcessInfos(self);
};


instance DIA_Gerbrandt_Perm(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 800;
	condition = DIA_Gerbrandt_Perm_Condition;
	information = DIA_Gerbrandt_Perm_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_Gerbrandt_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerbrandt_Hello) || (DIEGO_COMING == 2))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//���� �������?
	if(MIS_DiegosResidence != LOG_SUCCESS)
	{
		if(VisibleGuild(other) == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//��� �� �� ��� ����������, �, ����������� ������.
		}
		else if((VisibleGuild(other) == GIL_KDF) || (VisibleGuild(other) == GIL_KDW))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//��� ������ �� ��������, ����� ����. � �����!
		}
		else if((VisibleGuild(other) == GIL_SLD) || (VisibleGuild(other) == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//����� � ����� ����� ����� ��� �� - �� ������ �� ������ ������ �����.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//��� ����� ���������� � ������������ �� �������� ��� ������������ � ������� ��������.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//����� ����� ���� ������ ������ �����. ����� ����� ���������� ����� ��������, � �� �����-������ ������� � ����������.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//���� ���� �����-������ ������� ����� ������� � ���������, ��������, ���� ����� ����� ���� �����.
		};
	}
	else
	{
		B_Gerbrandt_PissOff();
	};
};


instance DIA_Gerbrandt_GreetingsFromDiego(C_Info)
{
	npc = VLK_403_Gerbrandt;
	nr = 10;
	condition = DIA_Gerbrandt_GreetingsFromDiego_Condition;
	information = DIA_Gerbrandt_GreetingsFromDiego_Info;
	permanent = FALSE;
	description = "����� �������� ���� ������.";
};


func int DIA_Gerbrandt_GreetingsFromDiego_Condition()
{
	if((MIS_DiegosResidence == LOG_Running) && Npc_HasItems(other,ItWr_DiegosLetter_MIS))
	{
		return TRUE;
	};
};

func void DIA_Gerbrandt_GreetingsFromDiego_Info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//����� �������� ���� ������.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(���������) ���? ���? ����� �����?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//�� �������� ���� ������� ���� ��� ������.
	B_GiveInvItems(other,self,ItWr_DiegosLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(�����������) ����� �� ����� ����. ��� �����!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(� ������) �� ���, ��� � ������?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//���?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//�����, ������� ��!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//��, � ������ ����� ����������� � ���.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(� ��������, ��� ����) ��� �����! ��� �������!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//� ���� ��� �������, ��� ����� ������� ������! ������! ���� �� ������ ���� �����, ��� �����!
	MIS_DiegosResidence = LOG_SUCCESS;
	B_GivePlayerXP(XP_DiegosResidence);
	DIEGO_COMING = 1;
};

