
instance DIA_Addon_Crimson_EXIT(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 999;
	condition = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Crimson_Hi(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent = FALSE;
	description = "��� �� �������? �� ������� ���� ������?";
};


func int DIA_Addon_Crimson_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Crimson_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//��� �� �������? �� ������� ���� ������?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//���, ��� �����. ������� ��, � ������ ������. � ������� �� ���� ������.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//�������������, ������� ������� ����� ������� �� ��� � ������ ��� ����� ��� �������.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//�� ������ ��������� � ���� ������� ����� ��������� �����. ��� ���������� ������ ��������, ��� �� ��������� �� �� ��������!
};


instance DIA_Addon_Crimson_How(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent = FALSE;
	description = "������� ����� �� ���� ��� �� ���������?";
};


func int DIA_Addon_Crimson_How_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_How_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//������� ����� �� ���� ��� �� ���������?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//��, ���� � ������ �� ����, �� �����, ��� ��� ���� ������ ����. �� ���� ��������� � ��� ����...
	B_Say_Gold(self,other,10);
	Log_CreateTopic(TOPIC_Bonus,LOG_NOTE);
	B_LogEntry(TOPIC_Bonus,"� ���� ��������� ������� ��������� �������� �� ������ ����.");
};


instance DIA_Addon_Crimson_Feilsch(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 2;
	condition = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent = FALSE;
	description = "����� �����������!";
};


func int DIA_Addon_Crimson_Feilsch_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//����� �����������!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//��-�, ���. ������� � ��� ������� ��������.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//�� �� �������, ��� ��� ������ ����.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//��� ���. � ���� ����� ������ ����.
};


instance DIA_Addon_Crimson_Gold(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 99;
	condition = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent = TRUE;
	description = "�������� ���������...";
};


func int DIA_Addon_Crimson_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//�������� ���������...
	if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
		Wld_StopEffect("DEMENTOR_FX");
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Crimson_Gold);
		Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
		if(Npc_HasItems(other,ItMi_GoldNugget_Addon))
		{
			if(Npc_HasItems(other,ItMi_GoldNugget_Addon) > 1)
			{
				Info_AddChoice(DIA_Addon_Crimson_Gold,DIALOG_SellGoldNuggets,DIA_Addon_Crimson_Gold_ALLE);
			};
			Info_AddChoice(DIA_Addon_Crimson_Gold,DIALOG_SellGoldNugget,DIA_Addon_Crimson_Gold_1);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//�� � ���� � ����� ��� �� ������ ���������.
		};
	};
};

func void DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems(other,ItMi_GoldNugget_Addon);
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,CurrentNuggets);
	B_GiveInvItems(self,other,ItMi_Gold,CurrentNuggets * 10);
	B_RemoveEveryInvItem(self,ItMi_GoldNugget_Addon);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
};

func void DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems(other,self,ItMi_GoldNugget_Addon,1);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	B_RemoveEveryInvItem(self,ItMi_GoldNugget_Addon);
	Info_ClearChoices(DIA_Addon_Crimson_Gold);
	Info_AddChoice(DIA_Addon_Crimson_Gold,Dialog_Back,DIA_Addon_Crimson_Gold_BACK);
	if(Npc_HasItems(other,ItMi_GoldNugget_Addon))
	{
		if(Npc_HasItems(other,ItMi_GoldNugget_Addon) > 1)
		{
			Info_AddChoice(DIA_Addon_Crimson_Gold,DIALOG_SellGoldNuggets,DIA_Addon_Crimson_Gold_ALLE);
		};
		Info_AddChoice(DIA_Addon_Crimson_Gold,DIALOG_SellGoldNugget,DIA_Addon_Crimson_Gold_1);
	};
};

func void B_Say_CrimsonBeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//�������� ������ ����� ������ ������.
};


instance DIA_Addon_Crimson_Raven(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 9;
	condition = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent = FALSE;
	description = "��� �� ������ � ������?";
};


func int DIA_Addon_Crimson_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_How))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//��� �� ������ � ������?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//�� �� ��������! � ��� ���. � �����, ��� �� ����� � ��������!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(�� �������) �� �������� � ���������� �����-�� �������� �����. ����� � �����...
	B_Say_CrimsonBeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//� ����� �� ������ �������� ����� �����, � � ������� ������� �����.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//� ����... ���� �����... �� ������, ��� ����� ������������ ����� �����!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//����� ������� � ���! ��� ������������� - ����� � ���� �����!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//� �� �����, � ��� ��� ��������. �� ����� � ����������� ��� ������� ����� ������ ����� ��������� �����.
};


instance DIA_Addon_Crimson_FATAGN(C_Info)
{
	npc = BDT_1095_Addon_Crimson;
	nr = 98;
	condition = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent = TRUE;
	description = "�� ������ ��������� ����� ������?";
};


func int DIA_Addon_Crimson_FATAGN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Crimson_Raven) && (Crimson_SayBeliar < 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar += 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//�� ������ ��������� ����� ������?
	if(Crimson_SayBeliar <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//�������. �� �����?
		Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
		Info_AddChoice(DIA_Addon_Crimson_FATAGN,"������.",DIA_Addon_Crimson_FATAGN_LOS);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//�����, ��� ����� �� ����������� � ���...
	};
};

func void DIA_Addon_Crimson_FATAGN_LOS()
{
	if(Crimson_SayBeliar == 1)
	{
		Snd_Play("MYSTERY_01");
	}
	else if(Crimson_SayBeliar == 2)
	{
		Snd_Play("MYSTERY_03");
	}
	else
	{
		Snd_Play("MYSTERY_07");
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	B_Say_CrimsonBeliar();
	Info_ClearChoices(DIA_Addon_Crimson_FATAGN);
};

