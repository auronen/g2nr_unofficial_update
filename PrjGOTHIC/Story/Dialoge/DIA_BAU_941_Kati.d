
instance DIA_Kati_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Kati_AskedForHelp;

instance DIA_Kati_SLDNOCHDA(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_SLDNOCHDA_Condition;
	information = DIA_Kati_SLDNOCHDA_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Kati_SLDNOCHDA_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 4))
	{
		if(!C_AkilFarmIsFree())
		{
			return TRUE;
		};
	};
};

func void DIA_Kati_SLDNOCHDA_Info()
{
	if(Kati_AskedForHelp == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//��� ���������� �������� ����� ����! �� ������� �������� ��������, ��������� ������, � ��� �������� ����� �������� ���!
		Kati_AskedForHelp = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//�� �� ���� �� �����. ������ ���-������! ������ ���!
	if(Akils_SLDStillthere == FALSE)
	{
		Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
		B_LogEntry(TOPIC_AkilsSLDStillthere,"������� ����� �������� ��������.");
		Akils_SLDStillthere = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Kati_HALLO(C_Info)
{
	npc = BAU_941_Kati;
	nr = 5;
	condition = DIA_Kati_HALLO_Condition;
	information = DIA_Kati_HALLO_Info;
	permanent = FALSE;
	description = "� ����� ��� � �������?";
};


func int DIA_Kati_HALLO_Condition()
{
	if(C_AkilFarmIsFree())
	{
		return TRUE;
	};
};

func void DIA_Kati_HALLO_Info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//� ����� ��� � �������?
	if(Npc_IsDead(Akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//(������) ��� ������� ��� �����! ��, �����, �� ��� �� ���� ��� �����������?!
		TOPIC_END_AkilsSLDStillthere = TRUE;
		B_GivePlayerXP(XP_Akil_Tot);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//��, � � �������, �������.
	};
	Npc_ExchangeRoutine(self,"Start");
//	self.flags = 0;
	if(Hlp_IsValidNpc(Akil) && !Npc_IsDead(Akil))
	{
		B_StartOtherRoutine(Akil,"Start");
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		B_StartOtherRoutine(Randolph,"Start");
		Randolph.flags = 0;
	};
};


instance DIA_Kati_ESSEN(C_Info)
{
	npc = BAU_941_Kati;
	nr = 12;
	condition = DIA_Kati_ESSEN_Condition;
	information = DIA_Kati_ESSEN_Info;
	permanent = FALSE;
	description = "���� �������, ��� �� ������ ��������� ����.";
};


func int DIA_Kati_ESSEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HALLO) && (Kati_Mahlzeit == TRUE) && !Npc_IsDead(Akil))
	{
		return TRUE;
	};
};

func void DIA_Kati_ESSEN_Info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//���� �������, ��� �� ������ ��������� ����.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//� ��� ���, ��� ������ ������, ��� ��� ������� ������� �������. ���� ����� ����� �����������.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//���, ����� ������ ����� � ������� ������ � ������� ����. ������, �� ��� ���, ��� �� ����� ����������.
	Npc_RemoveInvItem(self,ItFo_Bread);
	CreateInvItem(other,ItFo_Bread);
	Npc_RemoveInvItem(self,ItFo_Milk);
	CreateInvItem(other,ItFo_Milk);
	Npc_RemoveInvItem(self,ItFo_Water);
	CreateInvItem(other,ItFo_Water);
	AI_PrintScreen("���� ��������",-1,40,FONT_ScreenSmall,2);
	AI_PrintScreen("������ ��������",-1,43,FONT_ScreenSmall,2);
	AI_PrintScreen("���� ��������",-1,46,FONT_ScreenSmall,2);
};


instance DIA_Kati_Baltram(C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_Baltram_Condition;
	information = DIA_Kati_Baltram_Info;
	permanent = FALSE;
	description = "���� ������� ��������. � ������ ������� ������� ��� ����.";
};


func int DIA_Kati_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HALLO) && Npc_IsDead(Akil) && (MIS_Baltram_ScoutAkil == LOG_Running) && (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_Baltram_Info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//���� ������� ��������. � ������ ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//��, �������. ���, � ��� ��������� ��.
	B_GetBaltramPaket();
};


instance DIA_Kati_BAUERNAUFSTAND(C_Info)
{
	npc = BAU_941_Kati;
	nr = 6;
	condition = DIA_Kati_BAUERNAUFSTAND_Condition;
	information = DIA_Kati_BAUERNAUFSTAND_Info;
	permanent = FALSE;
	description = "������ �� �� ������������� ������� �����?";
};


func int DIA_Kati_BAUERNAUFSTAND_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_BAUERNAUFSTAND_Info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//������ �� �� ������������� ������� �����?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//��� ��������, ������� � ������, ��� ����� �����. �� ����� ���� �� ������� ���������, ��� ���������� �� ��������� �����.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//� ������ �������, ���� ������ � �����, ������� ������ ��������� �� ����� ����, ��� ����� �������� �� ������.
};


instance DIA_Kati_ANDEREHOEFE(C_Info)
{
	npc = BAU_941_Kati;
	nr = 7;
	condition = DIA_Kati_ANDEREHOEFE_Condition;
	information = DIA_Kati_ANDEREHOEFE_Info;
	permanent = FALSE;
	description = "��� ��������� ����� ������� � ������?";
};


func int DIA_Kati_ANDEREHOEFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//��� ��������� ����� ������� � ������?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//���������� �� ����� ���������. ��� �� ������ ������, � �� ������� ��.
};


instance DIA_Kati_HIERWEG(C_Info)
{
	npc = BAU_941_Kati;
	nr = 9;
	condition = DIA_Kati_HIERWEG_Condition;
	information = DIA_Kati_HIERWEG_Info;
	permanent = FALSE;
	description = "� �� �� ������ � ���, ����� ������ ������?";
};


func int DIA_Kati_HIERWEG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//� �� �� ������ � ���, ����� ������ ������?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//�� ���-�� ������ ������ �� ���� ����� ������. ��� ��� ����� �������� ������ �������, ������������ ���.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//��������� ������ ����� ������ ����� ������ �������� ��� ����� ������ ������.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//��� ��� �� �� ����� ��������� ���� ������ ����� �� �������, � ������ �������� - ��� �����, ������ �� ������������, �� ��������� ���������� �����.
};


instance DIA_Kati_PASS(C_Info)
{
	npc = BAU_941_Kati;
	nr = 10;
	condition = DIA_Kati_PASS_Condition;
	information = DIA_Kati_PASS_Info;
	permanent = FALSE;
	description = "��� �� ������ � �������?";
};


func int DIA_Kati_PASS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//��� �� ������ � �������?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//���� � ��� ������� �� ����. �� � ����, ��� �� ���-�� ���������� �� ����� ������� �� ������������ ���������.
};


instance DIA_Kati_PERMKAP1(C_Info)
{
	npc = BAU_941_Kati;
	nr = 11;
	condition = DIA_Kati_PERMKAP1_Condition;
	information = DIA_Kati_PERMKAP1_Info;
	permanent = TRUE;
	description = "������ ������ ����.";
};


func int DIA_Kati_PERMKAP1_Condition()
{
	if(!C_NpcIsDown(Akil) && Npc_KnowsInfo(other,DIA_Kati_HALLO) && Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND) && Npc_KnowsInfo(other,DIA_Kati_ANDEREHOEFE) && Npc_KnowsInfo(other,DIA_Kati_HIERWEG) && Npc_KnowsInfo(other,DIA_Kati_PASS) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//������ ������ ����.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//� �������� ��� ���� ���.
	AI_StopProcessInfos(self);
};


instance DIA_Kati_PERM(C_Info)
{
	npc = BAU_941_Kati;
	nr = 3;
	condition = DIA_Kati_PERM_Condition;
	information = DIA_Kati_PERM_Info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int DIA_Kati_PERM_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERM_Info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//� ����� ��� � �������?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//�� ���������. ��� ������ �� ����, ������� ��� ��� �������� ������� ���� �������� � ������.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//� ��� ����� �� ������. ��� ������� ������ ���� � ����� ���� ���� ���.
};

