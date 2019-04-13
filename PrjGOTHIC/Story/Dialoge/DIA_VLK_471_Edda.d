
instance DIA_Edda_EXIT(C_Info)
{
	npc = VLK_471_Edda;
	nr = 999;
	condition = DIA_Edda_EXIT_Condition;
	information = DIA_Edda_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Edda_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Edda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Edda_Hallo(C_Info)
{
	npc = VLK_471_Edda;
	nr = 2;
	condition = DIA_Edda_Hallo_Condition;
	information = DIA_Edda_Hallo_Info;
	permanent = FALSE;
//	important = TRUE;
	description = "��� �� ������?";
};


func int DIA_Edda_Hallo_Condition()
{
	/*if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};*/
	return TRUE;
};

func void DIA_Edda_Hallo_Info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//��� �� ������?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//���. �����, ��� �� �������� �������, ��, �� ������� ����, ��� ������� ���.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//���� ������ ���� �������, ���� ������.
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//� ������� ��� ����. ��� ���� ����, ���� ��������. ���, ��� ��� ����� - ��� ����� �� ������ ��� ����.
};


instance DIA_Edda_Stadt(C_Info)
{
	npc = VLK_471_Edda;
	nr = 9;
	condition = DIA_Edda_Stadt_Condition;
	information = DIA_Edda_Stadt_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ������?";
};


func int DIA_Edda_Stadt_Condition()
{
	return TRUE;
};

func void DIA_Edda_Stadt_Info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//��� �� ������ ���������� ��� � ������?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//����������� ������� ��������� �����. ������� ����� �� ������� � ����� ����.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//�� ���� �� �����, ��� ������������ �� ����, ������ ������� � ���� ������. ��� ���� ��� ���� �������.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//� �� �� ������� �����?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//������������ ������ ����, ��� � ���� ����, ��� �������.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//���-�� ����� ��� ������ ������.
	Edda_Schlafplatz = TRUE;
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
};


/*instance DIA_Edda_Kochen(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Kochen_Condition;
	information = DIA_Edda_Kochen_Info;
	permanent = FALSE;
	description = "�� ������ ������� ��� ��� ����?";
};


func int DIA_Edda_Kochen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Edda_Kochen_Info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//�� ������ ������� ��� ��� ����?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//� ������� ��� ����. ��� ���� ����, ���� ��������. ���, ��� ��� ����� - ��� ����� �� ������ ��� ����.
};*/


instance DIA_Edda_Suppe(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Suppe_Condition;
	information = DIA_Edda_Suppe_Info;
	permanent = TRUE;
	description = "�� ������ ������� ��� ���� ���?";
};


func int DIA_Edda_Suppe_Condition()
{
//	if(Npc_KnowsInfo(other,DIA_Edda_Kochen))
	if(Npc_KnowsInfo(other,DIA_Edda_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Edda_Suppe_Info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//�� ������ ������� ��� ���� ���?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//� ����������� ��� �� ������ ��������� � �������� ��� ������ ����.
	}
	else if(Edda_Day != Wld_GetDay())
	{
//		if(B_GiveInvItems(other,self,ItFo_Fish,1))
		if(Npc_HasItems(other,ItFo_Fish) || Npc_HasItems(other,ItFo_SmellyFish))
		{
			if(Npc_HasItems(other,ItFo_Fish))
			{
				B_GiveInvItems(other,self,ItFo_Fish,1);
				Npc_RemoveInvItems(self,ItFo_Fish,Npc_HasItems(self,ItFo_Fish));
			}
			else
			{
				B_GiveInvItems(other,self,ItFo_SmellyFish,1);
				Npc_RemoveInvItems(self,ItFo_SmellyFish,Npc_HasItems(self,ItFo_SmellyFish));
			};
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//��� ������ �����. ���, ����� �������.
			B_GiveInvItems(self,other,ItFo_EddasFishSoup,1);
			Edda_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//������� ��� ����, � � ����� ���� ������� ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//���, �� �������. ������� ������.
	};
};


instance DIA_Edda_Statue(C_Info)
{
	npc = VLK_471_Edda;
	nr = 6;
	condition = DIA_Edda_Statue_Condition;
	information = DIA_Edda_Statue_Info;
	permanent = FALSE;
	description = "��������, � ������ ������ ������ ��� ����.";
};


func int DIA_Edda_Statue_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Edda_Stadt) && Npc_HasItems(other,ItMi_InnosStatue))
	{
		return TRUE;
	};
};

func void DIA_Edda_Statue_Info()
{
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//��������, � ������ ������ ������ ��� ����.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//�� - �������� ���� �������. �� �� ������� ���� ���� ������...
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//�� ����� ��������������.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	B_GivePlayerXP(XP_Edda_Statue);
};


instance DIA_Edda_PICKPOCKET(C_Info)
{
	npc = VLK_471_Edda;
	nr = 900;
	condition = DIA_Edda_PICKPOCKET_Condition;
	information = DIA_Edda_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(��� ������ �����, ��� ������� �� ���������)";
};


func int DIA_Edda_PICKPOCKET_Condition()
{
//	return C_StealItems(20,Hlp_GetInstanceID(ItMi_InnosStatue),1);
	if(Npc_HasItems(self,ItMi_InnosStatue))
	{
		return C_StealItem(20,Hlp_GetInstanceID(ItMi_InnosStatue));
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Edda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
	Info_AddChoice(DIA_Edda_PICKPOCKET,Dialog_Back,DIA_Edda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Edda_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Edda_PICKPOCKET_DoIt);
};

func void DIA_Edda_PICKPOCKET_DoIt()
{
//	B_StealItems(20,Hlp_GetInstanceID(ItMi_InnosStatue),1);
	B_StealItem(20,Hlp_GetInstanceID(ItMi_InnosStatue));
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};

func void DIA_Edda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Edda_PICKPOCKET);
};

