
instance DIA_Addon_10023_Wache_EXIT(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_10023_Wache_Hi(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if((Npc_GetDistToNpc(self,other) <= 300) || Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//��, ���� �� �����? �� ������ ������� � ��� ������?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//�� ��, � ������ �� � ���?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//��� ��� ������ �����. � �� ��������, ����� �� ���� ���, �� �� ���� �� �������� �� ������ ���������, ����� ��� �� ����� ��������.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//� ����� ������, �� �� �����, ����� ��� ������ ��� ������. ��� ������ �������� ������.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//����. � ��� ��� ��������?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//��� ������ ������ ��������.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//� � �����, ����� ��������� �����.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//����� - �� ���� ��� ������ �� �����, �� ����� �� ��������.
	if(!Npc_IsDead(Pardos) && (Pardos_Geheilt == FALSE))
	{
		if(Pardos.attribute[ATR_HITPOINTS] > 70)
		{
			Pardos.attribute[ATR_HITPOINTS] = 70;
		};
	};
	B_LogEntry(TOPIC_Addon_Sklaven,"������ ������ �� ����� ����. ������ ��� ����������� ��������.");
};


var int PrisonGuard_Rules;
var int Wache_einmal;

func void B_YouBetterLetSlavesGo()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//����� �� ���� ��������� ����� ������ ��.
};

instance DIA_Addon_10023_Wache_go(C_Info)
{
	npc = BDT_10023_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent = TRUE;
	description = "������� ��!";
};


func int DIA_Addon_10023_Wache_go_Condition()
{
	if(Ready_Togo == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//������� ��!
	if(PrisonGuard_Rules == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//������. ����� ��������� �������. ���� ����������� ���, ��� ��� ������ � ���� ���� ����� ��������� ��.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//��, ��� � ������ ���� ����������� ��������� ��������. � ��?
		B_LogEntry(TOPIC_Addon_Sklaven,"����� ���������� ����� ���� ������ � �������� � ������.");
		PrisonGuard_Rules = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//� ���� ���� �����-�� ����� �� ���?
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go,Dialog_Back,DIA_Addon_10023_Wache_go_BACK);
	if(Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"� ��������� � �������. �� �������� ��������� �����.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if(Wache_einmal == TRUE)
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"����� �� ���� ��������� ����� ������ ��.",DIA_Addon_10023_Wache_go_Threat);
	}
	else if(Npc_IsDead(Bloodwyn) && Npc_HasItems(other,ItMi_Addon_Bloodwyn_Kopf))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,DIALOG_BloodwynHead,DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go,"� �����, ��� ���� � �����.",DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//� �����, ��� ���� � �����.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//�� ������� ������ ��������. ����� �������, � ���� ��� �������� ����� �����������. ��������.
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_Blood()
{
	CreateInvItem(other,ItMi_FakeBloodwynHead);
	AI_UseItemToState(other,ItMi_FakeBloodwynHead,1);
	//��� ������� �����, ����� �� �� ������� �� ������ ��������, �� �������� ��� �����������
	B_LookAtNpc(other,self);
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//���. ����� ����������?
	AI_UseItemToState(other,ItMi_FakeBloodwynHead,-1);
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(�����) �����. � ���� ������ ����� �� ����.
	B_YouBetterLetSlavesGo();
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//������ �������. ������� - �� ������������, ��� ����� ������. ���� � ���� �� ����� ������� �� ������, � ������ �� ������.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//�� �� ������ ��� ������, ��� ���� ����������� ��������.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//��, �� � ����� ������, ��� ������ �� ������ ��� ������� �� ������.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//�� �� ��� �����, ��� �� ����� ���� ���������� ��� �������?
	Wache_einmal = TRUE;
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_Threat()
{
	B_YouBetterLetSlavesGo();
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03_add");	//���� � ���� �� ����� ������� �� ������, � ������ �� ������.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//� �� ���� ������...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//... ������, ������ � ����.
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//� ��������� � �������. �� �������� ��������� �����.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//��, ���� ����� ��������. �� � ��������� ����, ����� ��� ��� ����� ������������...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//... �������, ���� �� ������ �� ��, ����� �� ������� �������.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//�����, �����. � ������ �����, ��� �������, �� �����, ��� ��� � ����� ���� ������� ����.
	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

