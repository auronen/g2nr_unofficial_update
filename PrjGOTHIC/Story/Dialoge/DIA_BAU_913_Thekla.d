
var int Thekla_GaveStew_Guild;
var int Thekla_GaveStew_Bullco;
var int Thekla_GaveStew_Sagitta;
var int Thekla_GaveStew_Bennet;
var int Thekla_GaveStew_Dragons;
var int Thekla_PromisedStew;

func int C_TheklaCanGiveStew_Guild()
{
	if(Thekla_GaveStew_Guild == FALSE)
	{
		if((other.guild != GIL_NONE) && (other.guild != GIL_MIL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_TheklaCanGiveStew_Bullco()
{
	if(Thekla_GaveStew_Bullco == FALSE)
	{
		if(Kapitel <= 3)
		{
			if(!Npc_IsDead(Bullco))
			{
				if(SLD_Bullco_Defeated == TRUE)
				{
					return TRUE;
				};
				if(SLD_Bullco_Defeated_SC == TRUE)
				{
					return TRUE;
				};
			};
			if(SLD_Sylvio_Defeated_SC == TRUE)
			{
				return TRUE;
			};
		};
	};
	return FALSE;
};

func int C_TheklaCanGiveStew_Dragons()
{
	if(Thekla_GaveStew_Dragons == FALSE)
	{
		if((MIS_Thekla_Paket == LOG_SUCCESS) && (Kapitel >= 5))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int TheklaStewsGiven()
{
	return Thekla_GaveStew_Guild + Thekla_GaveStew_Bullco + Thekla_GaveStew_Sagitta + Thekla_GaveStew_Bennet + Thekla_GaveStew_Dragons;
};

func int C_Thekla_BennetNews()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Thekla_PromisedStew == FALSE))
	{
		if(other.guild == GIL_SLD)
		{
			return TRUE;
		};
		if(TheklaStewsGiven() > 0)
		{
			return TRUE;
		};
	};
	if((Kapitel <= 4) && (MIS_RescueBennet == LOG_SUCCESS) && (Thekla_GaveStew_Bennet == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void B_Thekla_BennetNews()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (Thekla_PromisedStew == FALSE))
	{
		if((other.guild == GIL_SLD) || (TheklaStewsGiven() > 0))
		{
			AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//��� ������� �� ��������� ������� ������� �� �������.
			AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//����� ��� ������, ������� ��� ������, ������? � ��� �������� � ����� ��� ���� ����� ������� ��������.
			Thekla_PromisedStew = TRUE;
			if(MIS_RescueBennet != LOG_Running)
			{
				MIS_RescueBennet = LOG_Running;
				Log_CreateTopic(TOPIC_RescueBennet,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_RescueBennet,LOG_Running);
				B_LogEntry(TOPIC_RescueBennet,"������ ������ ��������� ���������� � ������.");
			};
		};
	}
	else if((Kapitel <= 4) && (MIS_RescueBennet == LOG_SUCCESS) && (Thekla_GaveStew_Bennet == FALSE))
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//� �������, �� ����� ������� ��������� �� ������. �������� ������, ������.
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew_Bennet = TRUE;
	};
};

instance DIA_Thekla_EXIT(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 999;
	condition = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thekla_EXIT_Info()
{
	if(C_Thekla_BennetNews())
	{
		B_Thekla_BennetNews();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Thekla_HALLO(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 1;
	condition = DIA_Thekla_HALLO_Condition;
	information = DIA_Thekla_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_HALLO_Condition()
{
	if(!C_TheklaCanGiveStew_Bullco() && !C_Thekla_BennetNews() && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
		{
			return TRUE;
		};
	};
};

func void DIA_Thekla_HALLO_Info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//��� �� ����� �������, �� ���� �����?
};


instance DIA_Thekla_Lecker(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 2;
	condition = DIA_Thekla_Lecker_Condition;
	information = DIA_Thekla_Lecker_Info;
	permanent = FALSE;
	description = "��� � ���� ����� ������ ������!";
};


func int DIA_Thekla_Lecker_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//��� � ���� ����� ������ ������!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//�� ������������! ���� � �����, ��� ��, ��� �����������! ��� �� ������� ������ ������!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//������� �� ��������� ��������������, � �����, ����� �� ��� ���-�� �����, �� ������ �� �������!
};


instance DIA_Thekla_Arbeit(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_Arbeit_Condition;
	information = DIA_Thekla_Arbeit_Info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int DIA_Thekla_Arbeit_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//�� ������ �������� �����, �� �����?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//���� ������ ����� ������ ������ ����. ��� ����� ���, ��� � ��� ������.
};


instance DIA_Thekla_WannaJoin(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 5;
	condition = DIA_Thekla_WannaJoin_Condition;
	information = DIA_Thekla_WannaJoin_Info;
	permanent = FALSE;
	description = "������-�� � ���������� �������������� � ���������...";
};


func int DIA_Thekla_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//������-�� � ���������� �������������� � ���������...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//��� �� ��� � ���������� �� �������?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//����� �� ����������! ������ ���� � �����! ����� ������ ����� ��� � ��� �������!
};


instance DIA_Thekla_Schlafen(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 6;
	condition = DIA_Thekla_Schlafen_Condition;
	information = DIA_Thekla_Schlafen_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int DIA_Thekla_Schlafen_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//���� �� ����� ����� � ���� �����. ����� ���� ����� � �����.
};


instance DIA_Thekla_Problem(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Problem_Condition;
	information = DIA_Thekla_Problem_Info;
	permanent = FALSE;
	description = "������ �� �� ������ ���������?";
};


func int DIA_Thekla_Problem_Condition()
{
	if((MIS_ReadyforChapter4 == FALSE) && Npc_KnowsInfo(other,DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//������ �� �� ������ ���������?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//��� ������� ��������� ��� �� �����! �������� ������� � ��� ������ �������� ������.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//��� ���� ����� ��� ���, � ����, ������ ����� �������� � ��������� ��� �����.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//�� ��� �� ������� �������, �� ���� ������� �������, �� � ��� ���� ��������...
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//� ������ �� ������ �� ������� � ����?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//� ��� � ���� �������, ������ ������-��������? ������� �� ����� �������? ��, � ��������� ��� ��������, �� ���� ��� �������, ������� �����, ������� �����!
	};
};


instance DIA_Thekla_Manieren(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_Manieren_Condition;
	information = DIA_Thekla_Manieren_Info;
	permanent = FALSE;
	description = "������, � ����� ���� ����� ������� �������?";
};


func int DIA_Thekla_Manieren_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Thekla_Problem) && (MIS_ReadyforChapter4 == FALSE))
	{
		if(!Npc_IsDead(Bullco))
		{
			if(SLD_Bullco_Defeated == FALSE)
			{
				return TRUE;
			};
		};
	};
};

func void DIA_Thekla_Manieren_Info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//������, � ����� ���� ����� ������� �������?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//���� ����� �� ����������� � ����. ��� � ����, � ������� ���������� �������. ��� ������ ��������.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//� ��� ������ ������?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//���� ������ ����� ��� ���. ���� �� ����� ���������� �� �����, ��� ������� ��������� ������ ���� ��� �������.
};


instance DIA_Thekla_AfterFight(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 7;
	condition = DIA_Thekla_AfterFight_Condition;
	information = DIA_Thekla_AfterFight_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Thekla_AfterFight_Condition()
{
	if(C_TheklaCanGiveStew_Bullco())
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info()
{
	if(SLD_Bullco_Defeated == TRUE)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//�� ������������� ���� ������ ���� �� ����� ������.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//������ ����, �� ����� �����, ���� ������� ��� ������ ������.
		if(Npc_KnowsInfo(other,DIA_Thekla_Manieren))
		{
			B_GivePlayerXP(XP_Thekla_BlameSylvio);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//�� ���, ������� �� ������ ���������?
		if(Npc_KnowsInfo(other,DIA_Thekla_Manieren))
		{
			AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//� �� ���� �������������! ������ �� ���������, ��� � ����� � ����?
		};
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//� ���, ��� �������� ���� ���� ������������.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//�� ������������� ���. �� ������ �� ������, ��� ��������� �� ���� �������.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//���, ����� �������. ��� ����������� ���� ����.
	AI_WaitTillEnd(other,self);
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	Thekla_GaveStew_Bullco = TRUE;
};


instance DIA_Thekla_SagittaPaket(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 4;
	condition = DIA_Thekla_SagittaPaket_Condition;
	information = DIA_Thekla_SagittaPaket_Info;
	permanent = TRUE;
	description = "��� ����� �� �������.";
};


func int DIA_Thekla_SagittaPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_TheklasPaket) && (MIS_Thekla_Paket == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info()
{
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//��� ����� �� �������.
	B_GiveInvItems(other,self,ItMi_TheklasPaket,1);
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//�������� �������. �� ���� ���� ���� �����-�� ������ � ������� �� ������.
	//AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//�?
	AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//������. � ������� ��� �����. ���, �����. �� ���� ��������, ��� �� �������� �� ������ � ���� �� ������.
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	Thekla_GaveStew_Sagitta = TRUE;
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_TheklasPaket);
};


instance DIA_Thekla_BennetNews(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 9;
	condition = DIA_Thekla_BennetNews_Condition;
	information = DIA_Thekla_BennetNews_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Thekla_BennetNews_Condition()
{
	if(C_Thekla_BennetNews())
	{
		return TRUE;
	};
};

func void DIA_Thekla_BennetNews_Info()
{
	B_Thekla_BennetNews();
};


instance DIA_Thekla_PERM(C_Info)
{
	npc = BAU_913_Thekla;
	nr = 900;
	condition = DIA_Thekla_PERM_Condition;
	information = DIA_Thekla_PERM_Info;
	permanent = TRUE;
	description = "�� ��� �� ���� ��� ����� ��������?";
};


func int DIA_Thekla_PERM_Condition()
{
	if(!TheklaStewsGiven())
	{
		DIA_Thekla_PERM.description = "� �������!";
	}
	else
	{
		DIA_Thekla_PERM.description = "�� ��� �� ���� ��� ����� ��������?";
	};
	return TRUE;
};

func void DIA_Thekla_PERM_Info()
{
	if(!TheklaStewsGiven())
	{
		AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//� �������!
	}
	else
	{
		AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//�� ��� �� ���� ��� ����� ��������?
	};
	if(C_TheklaCanGiveStew_Guild())
	{
		if((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//��� � ���� �������� ��������� ������?
		}
		else
		{
			AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//��� ���� ���.
		};
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew_Guild = TRUE;
	}
	else if(C_Thekla_BennetNews())
	{
		B_Thekla_BennetNews();
	}
	else if(C_TheklaCanGiveStew_Dragons())
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//�� ���, ������ ����� ��������? � ��� �� ����� ��� ��� �����?
		AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//� ��������� ���������� ��������.
		AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//��! ����� ���� ������������� �� �������� ����� ������� ��������.
		B_GiveInvItems(self,other,ItFo_XPStew,1);
		Thekla_GaveStew_Dragons = TRUE;
	}
	else if(!TheklaStewsGiven())
	{
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//� �� ������ ������. � ������ ������ ���, ��� ��������.
			AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(������������) � ���� �����, ���������, �������.
		}
		else if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//�� �� ����������� ����� ���������.
		};
	}
	else if(MIS_Thekla_Paket == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//��� �����������.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//�� �������� ���� ��������� �����?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//���.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//� ���� � �������� ������, �?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//��������!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//���� ���� ��� ����������� ��� ��������, ���� �������� ������� ���-���, ����� �������� ��.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//���?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//����� � �������, ��������, ��� ����� �� ������ ������, � ������� ��� �� ��� ����� � ������.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//���� �� ��������� ��� ��� �����, � ����� �������� ��� ����.
		MIS_Thekla_Paket = LOG_Running;
		Log_CreateTopic(TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_TheklaEintopf,LOG_Running);
		B_LogEntry(TOPIC_TheklaEintopf,"���� � ������� ����� ����� �� �������� �������, ��� ������ ��� ���� �������� ��� ����. ������� ����� �� ������ ������.");
	}
	else if(MIS_Thekla_Paket == LOG_Running)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//��� ���� - ��� ��������, �������?
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//��, ��, ��! �� ���� ����� ������! � ��� ���� �����, ���� � ���� �������� ��� ������ ��� ����.
		AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//� ����� �� �������� ��� ���� ��������, �������?
	}
	else if(Kapitel <= 4)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//� ���� ������ �� ��������. ������ �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//���! �������� �����������.
	};
};

