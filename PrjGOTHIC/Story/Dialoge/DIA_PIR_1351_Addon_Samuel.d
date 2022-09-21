
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	B_EquipTrader(self);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//�, �������!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//����, ���� �� ������? ���� ��� ����-������ ��������?
	if(!Npc_KnowsInfo(other,DIA_Addon_Garett_Samuel))
	{
		Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
	};
};


func int C_CanAskPiratesAboutFrancis()
{
	if(Npc_IsDead(Francis))
	{
		return FALSE;
	};
	if(Francis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "� ���� ���������� � ����� � ��������.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(C_CanAskPiratesAboutFrancis())
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//� ���� ���������� � ����� � ��������.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//�� �������� ��� ��� ��� ������ ������� �� ��������!
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//�� ������ ����� ����� �� ����� ������ ������� � ������ �����.
		AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//� ����� �� ��� �� ����� ������, � ���, ���� ������, ����� �������, ����� �������� ��� �� ��������!
		AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//��� ���� ����� �� ����� ������?
	};
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "� ������ ������� � ������ �����.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (GregIsBack == FALSE) && !Npc_IsDead(Francis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//� ������ ������� � ������ �����.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//�������? � �����, ���������?
	if(!C_SCHasBDTArmor())
	{
		AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//��� ����� ���������� �������.
		B_LogEntry(TOPIC_Addon_BDTRuestung,"���������� ������� �������� ������ ��������, ������� ��������� � ����� �� ����� �������. ��������, � ����� ��� ���-����, ��� ������� ��� ������� � ������.");
	}
	else
	{
		DIA_Common_Well();
	};
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(�������) ������� �� �� ��� �� ������ ���� � ������, ���� �� ��� ���������� � ����� �����.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//���� ������...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//���?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//���� ������ � ���� �� ����� ���-��, ��� ������������� ����� ��������.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//� ����, ��� ������� ���-�� ������� � ����������� ����� � �������.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//������� �� ������ ������ � �������, � �� ��� ������ ������. � �������, ��� �� �������� �� ���� �� ���.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//�� ����, ��� �� ��� �����, �� ��������, ��� ��� ��������� ��� ���� �����, ��� �� ���� ������� �� ��������� ���� � ������...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//(��������) ����� ������� �������� � ������, ��� ���-�� �� ��� ����� �������, �� ������� � �������� �����!
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "� ���� ���� ��� ���� ������!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && Npc_HasItems(other,ITWr_Addon_Lou_Rezept)) || ((Samuel_Knows_SchlafHammer == FALSE) && Npc_HasItems(other,ITWr_Addon_Lou_Rezept2)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//� ���� ���� ��� ���� ������!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//�������, ���������. ��� ��� �� ������?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
	Info_AddChoice(DIA_Addon_Samuel_Recipe,Dialog_Back,DIA_Addon_Samuel_Recipe_Back);
	if((Samuel_Knows_LousHammer == FALSE) && Npc_HasItems(other,ITWr_Addon_Lou_Rezept))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"(������ ������ '������ ��')",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && Npc_HasItems(other,ITWr_Addon_Lou_Rezept2))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"(������ ������ �������� '������ ��')",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//��� �� �����.
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//�� ��� �� ������! � ������ ���������� �����������...
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//���� ���������. ��� ������� �����!
	AI_WaitTillEnd(self,other);
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//�� ���� �������. �� � ��� ����� ��������.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = B_BuildPriceString("� ������ �� ����� ������� �����.",Value_Grog);
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//� ������ �� ����� ������� �����.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_Grog))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//��, ��� ����� �� ����� � ����� ������� �� ������. ���, �������.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//�������, ���� ��� �����. � ���� ��������� ������� ����. �� ������� ������� ���� ��� ������ �� ���������, �����?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//�� ������ �������� ������� �����, ������� ��������!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//������ � ���� ������, �� �� ���������! ��������� ������� ������, ��������.
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = B_BuildPriceString("��� ��� ����!",Value_Rum);
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//��� ��� ����!
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_Rum))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//�-�, ��� ��� ������ - ��� ����� ��� ������ ������! ���, ����!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//� ���� ����� ���� ��������� ������� ����. � ���� �������� ������ ����� ��-��� �������. �� ��� �������� �����. ���� ��������!
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//���, ����.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//� ���� ������������ ������, ��������! ��� ������ �����?
	};
};

func void B_BuildSamuelDrinksDialog()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,B_BuildPriceString("������� ����� ��",Value_SchlafHammer),DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,B_BuildPriceString("����� ��",Value_LousHammer),DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,B_BuildPriceString("������� �������",Value_SchnellerHering),DIA_Addon_Samuel_Stronger_SchnellerHering);
};

var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "� ���� ����-������ ��������!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//� ���� ����-������ ��������!
	if(Samuel_Stronger_Varianz == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//�, ���� ����������� ����! � � ��� ����� ������������������.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//������� ������� ������ ���� ������, �������, � ������ ���������, ��� ������ �����.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//����� ������� �����������. �� � ������� ����� ������, � �� ������ ������.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//���. ��� ����������� ������. ���� ����������. � ������� ���� ������� '������� �������'.
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//����������!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(�������) ��� �����!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//� ���� �� ����������� ������� ��������? ���� ����������, ����������� �������� ���.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//������ ���?
		Samuel_Stronger_Varianz = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//��� ���� �����������?
	};
	B_BuildSamuelDrinksDialog();
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//��� ������ - ��� �������!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//��� ��� '������� �������'.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_SchnellerHering))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//���� �������. �� �����������!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	B_BuildSamuelDrinksDialog();
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//� ���� '����� ��'!
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_LousHammer))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//�������� �����! �����������!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	B_BuildSamuelDrinksDialog();
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(��������) ������ ��� ������� '�����'.
	if(B_GiveInvItems(other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if(Samuel_DoppelHammer_Varianz == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//�� ����� ���������, �����. ����� �������, ��� �� ������ ��� �� ��� ����.
			Samuel_DoppelHammer_Varianz = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//��! ����� ��� �� ��������� ���!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	B_BuildSamuelDrinksDialog();
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "��� � ���� ��� ����?";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_Trade_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//��� � ���� ��� ����?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//� ���� ������� ���� ���, ��� ����� ������ ��� �����.
	B_GiveTradeInv(self);
	Trade_IsActive = TRUE;
	B_RefreshInvItemToAmount(self,ItFo_Addon_Grog,15);
	if((Player_KnowsSchnellerHering == TRUE) && !Npc_HasItems(self,ITWr_Addon_Piratentod))
	{
		CreateInvItem(self,ITWr_Addon_Piratentod);
	};
};


var int News_Francis_GotSome;

instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "��� ������ � ������?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//��� ������ � ������?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//������� ������� �� ��������! �� ���� ���� �������, ��� ��� ���� ������.
		if(News_Francis_GotSome == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//� �� ���������� ������. ����� ������ - � ������!
			B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
			News_Francis_GotSome = TRUE;
		};
		if((GregIsBack == TRUE) && !Npc_IsDead(Greg))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//� ���� �������-�� ��������. �� ������� �������, ��, �� ������� ����, ����������� ������� � ������.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//� ��� ���, ��� ���� �����, ������ ����������� �� �����������. ������ � ����������� ������ ������ ����� ����������.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//������ ����� ���������� �����. �� �� ������ ������ ������ ��������.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//���� �� ��� �������� ��������� � ���� �������� �������� ����� ��� ���!
	};
};

