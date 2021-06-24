
instance DIA_Rengaru_EXIT(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 999;
	condition = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_PICKPOCKET(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 900;
	condition = DIA_Rengaru_PICKPOCKET_Condition;
	information = DIA_Rengaru_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Rengaru_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItMi_Gold) > 5)
	{
		return C_Beklauen(20,5);
	};
	return FALSE;
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,Dialog_Back,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};


instance DIA_Rengaru_Hauab(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Hauab_Condition;
	information = DIA_Rengaru_Hauab_Info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int DIA_Rengaru_Hauab_Condition()
{
	if((Jora_Dieb == FALSE) && !Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	DIA_Common_WhatAreYouDoingHere();
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//� �� �������, ����� ���� �� ����� ����. ����������!
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_HALLODIEB(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_HALLODIEB_Condition;
	information = DIA_Rengaru_HALLODIEB_Info;
	permanent = FALSE;
	description = "����� �������, ��� �� ����� � ���� ������...";
};


func int DIA_Rengaru_HALLODIEB_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//����� �������, ��� �� ����� � ���� ������...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//����! � �������� ������!
	self.aivar[AIV_ToughGuy] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


var int RengaruGold;

func void B_Rengaru_NoGoldReason()
{
	if(self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//�� ����� � ������ ���� ���? ���� ��� �� ���� �������!
	}
	else if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//�� ��� ������ ���, ��� � ���� ����, ����� ����, ��� ������� ����! �����!
	};
};

instance DIA_Rengaru_GOTYOU(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 3;
	condition = DIA_Rengaru_GOTYOU_Condition;
	information = DIA_Rengaru_GOTYOU_Info;
	permanent = FALSE;
	description = "������!";
};


func int DIA_Rengaru_GOTYOU_Condition()
{
	if(C_RengaruIsReadyToTalk() && Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//������!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//��� ���� ����� �� ����?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//�� ����� ������� � ����� ����� ���� ���, � �� ���� �����, ��� �� ������ ���.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//������� � ������ ������� ����, ��� �� ������� ��� � ���...
	B_GivePlayerXP(XP_RengaruGotThief);
	RengaruGold = Npc_HasItems(self,ItMi_Gold);
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... � ���������� ���� �� �������������.",DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... ���� ����� ������� ������ �����. � ����������.",DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... � ������ �� ���������� ���, ��� �� �����.",DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//... ���� ����� ������� ������ �����. � ����������.
	if(RengaruGold >= 50)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//��� ������, ������! �� ������ ������� ����. � ������ ������� �� ���� ���������� ����!
		B_GiveInvItems(self,other,ItMi_Gold,50);
	}
	else if(RengaruGold > 0)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//� ���� ��� ��� ����� ������.
		B_Rengaru_NoGoldReason();
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//� �� ����� ���� ������, �� � ���� ������ ������ ���.
		B_Rengaru_NoGoldReason();
	};
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//... � ���������� ���� �� �������������.
	if(RengaruGold >= 25)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//��� ���� ��������! � ������ ������� ����!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"���, �� ������ ��� ���!",DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"������, ����� ��� �������� �����.",DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	}
	else if(RengaruGold > 0)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//�� ������ ������� ����. �����, ������ ��� ������. � ������ ������ ���� � �����.
		B_GiveInvItems(self,other,ItMi_Gold,RengaruGold);
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//� ��� �� �� ����� ������ ���� ��������, �� � ���� ������ ������ ���.
		B_Rengaru_NoGoldReason();
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//���, �� ������ ��� ���!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//�� ������ ������� ����. �����, ������ ��� ������. � ������ ������ ���� � �����.
	B_GiveInvItems(self,other,ItMi_Gold,RengaruGold);
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//������, ����� ��� �������� �����.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//��� ������, ������! �� ������ ������� ����. � ������ ������� �� ���� ���������� ����!
	B_GiveInvItems(self,other,ItMi_Gold,25);
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//... � ������ �� ���������� ���, ��� �� �����.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//� ������ ������ �������, ���������� ������ ����� � �������.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//� ��� ��� ��� ������? � �� ���� ����� ������ � ������...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//... ������, � �������. ������ �������.
};


instance DIA_Rengaru_INKNAST(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 4;
	condition = DIA_Rengaru_INKNAST_Condition;
	information = DIA_Rengaru_INKNAST_Info;
	permanent = FALSE;
	description = "� ������ ����� ���� ���������.";
};


func int DIA_Rengaru_INKNAST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU) && !Npc_KnowsInfo(other,DIA_Rengaru_SPARE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//� ������ ����� ���� ���������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//��� ��� ���� �����? � ���� ������ �� ��������! ������� ����, �?!
	Info_AddChoice(DIA_Rengaru_INKNAST,"������ � ������ ��������� ����?",DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"� ����������, ����� ���� �������� �� �������.",DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"����������! � ���� ������ � ���� ����� �� �����!",DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//����������! � ���� ������ � ���� ����� �� �����!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//�� �� ��������� �� ����! �������, ������!
	self.aivar[AIV_ToughGuy] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	Diebesgilde_Okay += 1;
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//� ����������, ����� ���� �������� �� �������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(������) � ��� ����� �� ����� �����. ���� ���� �������, ��� �� ������ ��� �������, �������� ��� ������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(��������������) �� ��������: ��� ������ ��� ���� ��� �� �������...
	Rengaru_InKnast = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Hide");
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//������ � ������ ��������� ����?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//� ������ ������� �� �������� ����� � ������� ������ - � ������� ��������� � ����.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//� ��� �� ��������� �������� �� ����. � �� ���� � �� ���� �������� ������. ������ ����.
};


instance DIA_Rengaru_SPARE(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 5;
	condition = DIA_Rengaru_SPARE_Condition;
	information = DIA_Rengaru_SPARE_Info;
	permanent = FALSE;
	description = "����������! � ���� ������ � ���� ����� �� �����!";
};


func int DIA_Rengaru_SPARE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU) && !Npc_KnowsInfo(other,DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_SPARE_Info()
{
	DIA_Rengaru_INKNAST_HauAb();
};


instance DIA_Rengaru_LastInfoKap1(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 6;
	condition = DIA_Rengaru_LastInfoKap1_Condition;
	information = DIA_Rengaru_LastInfoKap1_Info;
	permanent = TRUE;
	description = "��� ����? � ���� ��� � �������?";
};


func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_INKNAST) || Npc_KnowsInfo(other,DIA_Rengaru_SPARE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//��� ����? � ���� ��� � �������?
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//�����, �����, ��������. �����-������, �� ����������� �� ���. �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//��� ��� ���� �����? � ������ ������ �� �����, ������!
	};
};


instance DIA_Rengaru_Zeichen(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 800;
	condition = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent = FALSE;
	description = DIALOG_SecretSign;
};


func int DIA_Rengaru_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Rengaru_InKnast == FALSE) && Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//��, �� ���� �� ���.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//� ����� ���� ���-���. ���� �� ������������� ������� � ���-������ ������ � ������, ���� �������� ��������� � ����������!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//��� ����� ��������� � ���� �� �������� �� ����� �����. �� � ���� ���� ���� �����.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//�������� ����� ������ ���� ������� ����� �����, ���������� ��� ���� ������. ��� �������� ��.
	B_RaiseAttribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

