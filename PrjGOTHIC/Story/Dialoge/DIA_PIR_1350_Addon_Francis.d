
instance DIA_Addon_Francis_EXIT(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 999;
	condition = DIA_Addon_Francis_EXIT_Condition;
	information = DIA_Addon_Francis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Francis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Francis_First(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 1;
	condition = DIA_Addon_Francis_First_Condition;
	information = DIA_Addon_Francis_First_Info;
	permanent = FALSE;
	description = "��� ���� ������?";
};


func int DIA_Addon_Francis_First_Condition()
{
	if((Knows_GregsHut == FALSE) && (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//���, ��� ����������� �����.
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Francis_LetMeIn(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 2;
	condition = DIA_Addon_Francis_LetMeIn_Condition;
	information = DIA_Addon_Francis_LetMeIn_Info;
	permanent = FALSE;
	description = "� ������ ������� � ������ �����.";
};


func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if((Knows_GregsHut == TRUE) && (GregIsBack == FALSE) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//� ������ ������� � ������ �����.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//� ������ ������!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//����� ������ ���. � � ����� �����, ����� ��� �� �������� ���������.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//��� ��� ����� �� ����, � �� ���������!
};


instance DIA_Addon_Francis_AboutGreg(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 3;
	condition = DIA_Addon_Francis_AboutGreg_Condition;
	information = DIA_Addon_Francis_AboutGreg_Info;
	permanent = FALSE;
	description = "���� - ���� ���������?";
};


func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//���� - ���� ���������?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//������ �� ������� ��� �������, ��� �� ��� ������!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//����� �����... �� ��� ���, ���� ��������� ���������� ����� ����� �������� �������� �����!
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(�����������) � �� ������� �� �������� ����!
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//� ������ ���������� ���� ������� ��������� ��� �������!
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//��������� ������, ��� ������, ���� �������� ���, ��� ����� ������ ���, ��� �� �����������������.
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//��� ����� ��������, ����� ���� ��������.
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//� ��� ��� �������� � ���, ��� ����� �����������, �������?
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//� ����� �������� ��� � ���, ��� ������� ���������� � ��� ������.
		AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//������� ����������, ��� � ���� ����� ������� ������������.
	};
};


var int Francis_bezahlt;

instance DIA_Addon_Francis_Key(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 4;
	condition = DIA_Addon_Francis_Key_Condition;
	information = DIA_Addon_Francis_Key_Info;
	permanent = TRUE;
	description = "����� ��� ���� �� ������ �����!";
};


func int DIA_Addon_Francis_Key_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//����� ��� ���� �� ������ �����!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//������ ����, �� ������!
	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key,"� ������� ��� ����.",DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key,"� ��� ���� 2000 �������!",DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key,"� ��� ���� 1000 �������!",DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	DIA_Common_IWillThinkAboutIt();
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//� ��� ���� 1000 �������!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//�����, ��� ��� ������������� �������� ����� ������������.
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//����� �� �������, ��� � ���� ����� ������������!
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//� ��� ���� 2000 �������!
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//������, �� ������� ���� �������� ���� �� �������.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(������ ����) ����, � ������ �������...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//�� �����, ����� ������. � ����� ������, �� ������ �� ������.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//��� ����!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//�������, ���� ���� �� ��������. � �� ���� ������ ������������ �� ����, �����?!
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		B_GiveInvItems(self,other,ItKe_Greg_Addon_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(�������) ��! ����� ���������, � ���� ������� ���!
	};
	Info_ClearChoices(DIA_Addon_Francis_Key);
};


instance DIA_Addon_Francis_AufsMaul(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_AufsMaul_Condition;
	information = DIA_Addon_Francis_AufsMaul_Info;
	permanent = TRUE;
	description = "��� �, ����� ���������, ��� �� ����������� ���� ����������.";
};


func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//��� �, ����� ���������, ��� �� ����������� ���� ����������.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(������������) ���? ����� � �������!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//�� ��, ����� ����������, � ����� ���� ��������� ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Francis_Buch(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_Buch_Condition;
	information = DIA_Addon_Francis_Buch_Info;
	permanent = TRUE;
	description = "� ����� ���� �������. ���� ������ � ������������� �����.";
};


func int DIA_Addon_Francis_Buch_Condition()
{
//	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis))
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis) && (Francis_HasProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//� ����� ���� �������. ���� ������ � ������������� �����. ��� �� ���� �����, �� ��� ��?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//���... ������� ������ �� ����� ���� �����.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//�... ���... ���� ���� �� ��� ���� ��� �����...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//�� �� �� �������, ��� ����� ������� ����, �� ��� ��?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//�� ������� �� � ����� �������� ������.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//���... ������� �������...
	if(Npc_HasItems(self,ItKe_Greg_Addon_MIS))
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(�����������) ���� �� ����� ��� ���� �� ������ �����, �� ��� ��?
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//� ��� ���� ���� ����!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//��� ������ ����� �������...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(������) �� �� ������ ������ ��� ����� � ������� ���� ��� �� �����, ����?
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItem(self,ITWR_Addon_FrancisAbrechnung_Mis);
		B_GiveInvItems(self,other,ItKe_Greg_Addon_MIS,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//�� ����� ���������!
		if((Francis_bezahlt == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//��� ���� 2000 �������.
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//� �� ���� � ������� ��� 500 �������.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//���, ����� 500 �������!
			B_GiveInvItems(self,other,ItMi_Gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(���������) � ������ ����� ��� ���� ��� �����...
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItem(self,ITWR_Addon_FrancisAbrechnung_Mis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_Francis_Ausgeschissen(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_Ausgeschissen_Condition;
	information = DIA_Francis_Ausgeschissen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Francis_Ausgeschissen_Condition()
{
	if((Francis_ausgeschissen == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausgeschissen_Info()
{
	if(!Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(������) ��������� ���� ���� �������� ���� ������ ����� �� ��� ���, ���� �� ������� �� ��������� �� ������ ������.
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//������ ���� � �����!
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis) && (Francis_HasProof == TRUE))
	{
		DIA_Common_NotSoFastMyFriend();
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

