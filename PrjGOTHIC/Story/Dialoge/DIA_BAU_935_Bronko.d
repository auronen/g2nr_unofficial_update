
instance DIA_Bronko_EXIT(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 999;
	condition = DIA_Bronko_EXIT_Condition;
	information = DIA_Bronko_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bronko_HALLO(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 1;
	condition = DIA_Bronko_HALLO_Condition;
	information = DIA_Bronko_HALLO_Info;
	important = TRUE;
};


func int DIA_Bronko_HALLO_Condition()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Bronko_HALLO_Info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(��������) � ���� ��� �� ������������, �?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//� �� ���, ����� �������?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//������ � ����� ��������, ��������.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//���� �� ������ �������� ������ �� ���� �����, �� ������ ��������� ��� 5 �������, ��� ���� �� ���� �������!
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO,"������ �� ����. �� ������ �� �������� �� ����.",DIA_Bronko_HALLO_vergisses);
	Info_AddChoice(DIA_Bronko_HALLO,"������, � ���� ��� ������ - ��� ���� ������.",DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO,"����� �����? �� ���, ������� ������?",DIA_Bronko_HALLO_deinland);
};

func void DIA_Bronko_HALLO_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//����� �����? �� ���, ������� ������?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//�����������. � ������ ��� �� ������ ������� ��� �������?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//� �� ��������, ���� �� ������������� ��������� ��� ���. ��-��!
	AI_StopProcessInfos(self);
};

func void DIA_Bronko_HALLO_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//������, � ���� ��� ������ - ��� ���� ������.
	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(���������) �������. �������� ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//� ���� ��� ���� 5 �����. �� ������ ������ ����?
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void DIA_Bronko_HALLO_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//������ �� ����. �� ������ �� �������� �� ����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//���� �� �������, ��� �� ���. ���� �������� ���������. �������?
	}
	else
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//� ���, ������ �� ��������� ������, ����� � ���������, ��?
		};
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//�����, �����, ��� �������� ������ ���� �����.
	};
	Info_ClearChoices(DIA_Bronko_HALLO);
	Info_AddChoice(DIA_Bronko_HALLO,"������, � ���� ��� ������ - ��� ���� ������.",DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO,"����� ��������, ������ �� ���.",DIA_Bronko_HALLO_attack);
};

func void DIA_Bronko_HALLO_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//����� ��������, ������ �� ���.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//��, ��� �� ���...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Bronko_KEINBAUER(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 2;
	condition = DIA_Bronko_KEINBAUER_Condition;
	information = DIA_Bronko_KEINBAUER_Info;
	permanent = TRUE;
	description = "��?! ������?! �� ����� ����. �� �� ������ �����.";
};


var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition()
{
	if(((MIS_Sekob_Bronko_eingeschuechtert == LOG_Running) || (Babera_BronkoKeinBauer == TRUE)) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) && (DIA_Bronko_KEINBAUER_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bronko_KEINBAUER_Info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//��?! ������?! �� ����� ����. �� �� ������ �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//������? ������ �������� �� �����?
	Info_ClearChoices(DIA_Bronko_KEINBAUER);
	if(Babera_BronkoKeinBauer == TRUE)
	{
		Info_AddChoice(DIA_Bronko_KEINBAUER,"(���������� ������ ����������)",DIA_Bronko_KEINBAUER_SLD);
	};
	if(MIS_Sekob_Bronko_eingeschuechtert == LOG_Running)
	{
		Info_AddChoice(DIA_Bronko_KEINBAUER,"������ ����� - �����, � �� ������ ������ �����.",DIA_Bronko_KEINBAUER_sekobderbauer);
	};
	Info_AddChoice(DIA_Bronko_KEINBAUER,"��... ����� ���������, ��� �� ������.",DIA_Bronko_KEINBAUER_attack);
	Info_AddChoice(DIA_Bronko_KEINBAUER,"������!",DIA_Bronko_KEINBAUER_schongut);
};

func void DIA_Bronko_KEINBAUER_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//��... ����� ���������, ��� �� ������.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//� ��������, ��� �� ������� ���.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Bronko_KEINBAUER_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//������ ����� - �����, � �� ������ ������ �����, ������� �������� ������� �������� ������ �� ��������� ������� �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//��� ��� ������?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//� ������. ����� �����, ����� �� �������� � ������, � �� ������ ����� ��� ����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//� ���? ��� �� ������ ������ ������?
};

func void DIA_Bronko_KEINBAUER_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//������!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//����������!
	AI_StopProcessInfos(self);
};

func void DIA_Bronko_KEINBAUER_SLD()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//������, �����, �������, ��� �������� ������� �����, ��� ����� ���� ������ ������, ������� ������������ ������� �����.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//����. ������� �������. ���� ������ ���� ���������.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//� ���?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//������, ������. � ��� ���� ���, ��� �� ��������, �� ������ �� �������� � ��� ���� ���������, ������?
	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//���, � ���� ����� ���� ��� ��� ������.
	};
	if(Wld_IsTime(8,0,22,0))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//� � ������� � ���� � ���� ��������. ���, ��� ������, ������ �� ���� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//� ���� ������� � ������, ������?
	};
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	if((Kapitel == 3) && (TOPIC_END_SekobDMT == FALSE))
	{
		Npc_ExchangeRoutine(self,"FLEEDMT_FIELD");
	}
	else
	{
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_Bronko_FLEISSIG(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 3;
	condition = DIA_Bronko_FLEISSIG_Condition;
	information = DIA_Bronko_FLEISSIG_Info;
	permanent = FALSE;
	description = "��� ����? ������� ��������� ��� �� �������?";
};


func int DIA_Bronko_FLEISSIG_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (MIS_Sekob_Bronko_eingeschuechtert != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bronko_FLEISSIG_Info()
{
	AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//��� ����? ������� ��������� ��� �� �������?
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//�� ��� ����, ����������.
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//� ���� ������� � ������, ������?
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	if((Kapitel == 3) && (TOPIC_END_SekobDMT == FALSE))
	{
		Npc_ExchangeRoutine(self,"FLEEDMT_FIELD");
	}
	else
	{
		Npc_ExchangeRoutine(self,"START");
	};
};


instance DIA_Bronko_FLEISSIG2(C_Info)
{
	npc = BAU_935_Bronko;
	nr = 3;
	condition = DIA_Bronko_FLEISSIG2_Condition;
	information = DIA_Bronko_FLEISSIG2_Info;
	permanent = TRUE;
	description = "��� ����? ��������� ��� ������, ��?";
};


func int DIA_Bronko_FLEISSIG2_Condition()
{
	if(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Bronko_FLEISSIG2_Info()
{
	AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//��� ����? ��������� ��� ������, ��?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//�� �������, ��? � ��� �� ����������.
	}
	else if(DIA_Bronko_KEINBAUER_noPerm == TRUE)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(� ������) �� ���� �� ��������� ���� ���� ���������, ��?
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//�� ��� ����, ����������.
	};
	AI_StopProcessInfos(self);
};

