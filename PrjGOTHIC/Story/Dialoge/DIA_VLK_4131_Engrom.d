
instance DIA_Engrom_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_HALLO(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 5;
	condition = DIA_Engrom_HALLO_Condition;
	information = DIA_Engrom_HALLO_Info;
	description = "��� ����?";
};


func int DIA_Engrom_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//�������!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//���!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//� ��� ��� � ���� �������? ��� ��� � ���� � ���� ������ ��� ������� ����.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//���� ������� �� ����� ������, ������� - �� ������, � ������ ���� � �� ������ ���� ��������. � ��� �� ���� �������� ��� ���!
};


instance DIA_Engrom_WhatAboutLeaving(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_WhatAboutLeaving_Condition;
	information = DIA_Engrom_WhatAboutLeaving_Info;
	description = "� �� �� ����� � ���, ����� ��������� ������?";
};


func int DIA_Engrom_WhatAboutLeaving_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_WhatAboutLeaving_Info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//� �� �� ����� � ���, ����� ��������� ������?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//��, �������. � ���� ��� ������� �������.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//������� ��� ����� ��������� ���� ������ ����� ���� �����, ���������������� ���� ��������� ��������, ������� ��� ���� ������, � ����� ����������� ����� ������!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//��� ����� ���� �����!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//� �� ������ ����.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//�� ������ ������� ���, ��� �� ������ ��� ������ ����� ������?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//��, � ����� ��!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//������, ���� �������. ���� ������ �������� ����� ������, � � ����� �� ��������.
};


instance DIA_Engrom_Jagd(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 6;
	condition = DIA_Engrom_Jagd_Condition;
	information = DIA_Engrom_Jagd_Info;
	permanent = TRUE;
	description = "��� �����?";
};


func int DIA_Engrom_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_HALLO) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Engrom_Jagd_Info()
{
	B_WasMachtJagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//����� - ��� ������������ ������. �� ��� �� �������� ���� ������ ������ ���������� ����, � �� ���� �������������� ��������.
};


instance DIA_Engrom_KAP3_EXIT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 999;
	condition = DIA_Engrom_KAP3_EXIT_Condition;
	information = DIA_Engrom_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engrom_KAP3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Engrom_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Engrom_B_NpcObsessedByDMT(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 32;
	condition = DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information = DIA_Engrom_B_NpcObsessedByDMT_Info;
	description = "��� � �������?";
};


func int DIA_Engrom_B_NpcObsessedByDMT_Condition()
{
	if((NpcObsessedByDMT_Engrom == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info()
{
	DIA_Common_IsEverythingOk();
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT(self);
};


instance DIA_Engrom_BESSEN(C_Info)
{
	npc = VLK_4131_Engrom;
	nr = 55;
	condition = DIA_Engrom_BESSEN_Condition;
	information = DIA_Engrom_BESSEN_Info;
	permanent = TRUE;
	description = "�� ������� ����.";
};


func int DIA_Engrom_BESSEN_Condition()
{
	if((NpcObsessedByDMT_Engrom == TRUE) && (NpcObsessedByDMT == FALSE) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Engrom_BESSEN_Info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//�� ������� ����.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//�����, � ������ ����.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(�����) �� ������ ����!
	B_NpcClearObsessionByDMT(self);
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,ZS_Flee,0,"");
	}
	else
	{
		Npc_ExchangeRoutine(self,"FleePass");
		if(Engrom_Orc_Spawned == FALSE)
		{
			Wld_InsertNpc(OrcWarrior_Scout,"START");
			Engrom_Orc_Spawned = TRUE;
		};
	};
};

