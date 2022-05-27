
instance DIA_RodDJG_EXIT(C_Info)
{
	npc = DJG_702_Rod;
	nr = 999;
	condition = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_HALLO(C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_HALLO_Condition;
	information = DIA_RodDJG_HALLO_Info;
	description = "� ����� ��� � �������?";
};


func int DIA_RodDJG_HALLO_Condition()
{
	if(DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//� ����� ��� � �������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//��� ������ �������� ����! ��� ����� ������� ����� ������, �� ������ �������� �� ���� ������� ������ ���� ������ ������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//� ���� � ���� ������� ��, ������ �������� ����������� � ���� ���.
	if(!Npc_IsDead(SwampDragon) && (DJG_SwampParty == FALSE))
	{
		Info_AddChoice(DIA_RodDJG_HALLO,"���� �� �����?",DIA_RodDJG_HALLO_warten);
	};
	Info_AddChoice(DIA_RodDJG_HALLO,"��� �� ���� ��� ������?",DIA_RodDJG_HALLO_Woher);
};

func void DIA_RodDJG_HALLO_Woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//��� �� ���� ��� ������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//������ �������� ������ ������ �� ��� ���, ��������� �� ��������, � �������� ��� ������ ��������� �� ��� ��������� ������.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//���� � �����-������ �������� �� ����, � ������� �������� ��� ������ ��, � ����� ����� �� ���� ��� ������ �����.
};

func void DIA_RodDJG_HALLO_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//���� �� �����?
	Info_ClearChoices(DIA_RodDJG_HALLO);
	if(!Npc_IsDead(DJG_Cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//����� �����, �������, ��������� ������� ���� �������. ��� ��� ���� ������������ � ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//� ���� ����������� ��� ���������� ��������� ��� ���.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//��� �������, ����� ��� ����� ���� ������? ���������, ��� ��� �����?
		Info_AddChoice(DIA_RodDJG_HALLO,"� ����� ����.",DIA_RodDJG_HALLO_warten_allein);
		Info_AddChoice(DIA_RodDJG_HALLO,"��� �� ������ �� ���� ���������� ���������?",DIA_RodDJG_HALLO_warten_wasweisstdu);
		Info_AddChoice(DIA_RodDJG_HALLO,"������ ������.",DIA_RodDJG_HALLO_warten_zusammen);
	};
};

func void DIA_RodDJG_HALLO_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//������ ������.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//������. ����� ��� �� ����.
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_StopProcessInfos(self);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//��� �� ������ �� ���� ���������� ���������?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//������ ��� ���� �� ��� ����������� �� ����� � ��� ���, ��������, �������� ���� ������. ����� ����� ����?
};

func void DIA_RodDJG_HALLO_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//� ����� ����.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//��� �, ����� � ����� ���� �����.
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_WARTEMAL(C_Info)
{
	npc = DJG_702_Rod;
	condition = DIA_RodDJG_WARTEMAL_Condition;
	information = DIA_RodDJG_WARTEMAL_Info;
	permanent = TRUE;
	description = "��� � �����?";
};


func int DIA_RodDJG_WARTEMAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_RodDJG_HALLO) || (DJG_SwampParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WARTEMAL_Info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//��� � �����?
	if(((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(DJG_Cipher) && !Npc_IsDead(SwampDragon))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//��������, ������. � �����, ��� ����� ������� ��� �� �� �����. �, �������, �������� �������� �������.
		DJG_SwampParty = FALSE;
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(�����������) ��! ��� ������, ��� ������� ������!
	};
	if(Npc_IsDead(SwampDragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//� ��� �� ����������� ������ ������?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//�� ��� �����������! ������ �����, � ����� ���� ����� ������!
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_RodDJG_GiveItBack(C_Info)
{
	npc = DJG_702_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = "���, ����� ���� ���!";
};

