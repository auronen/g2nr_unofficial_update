
instance DIA_Ulf_EXIT(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 999;
	condition = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Hallo(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 2;
	condition = DIA_Ulf_Hallo_Condition;
	information = DIA_Ulf_Hallo_Info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int DIA_Ulf_Hallo_Condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF) && (MIS_Schnitzeljagd == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Hallo_Info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//��� �� ������� �����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//���� ���� ��������� ��� �����, � �������� ������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//� ��������� � ���������. � �������� ������� �����, � ����� ���������.
	};
	AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//� �������� ���� ������������ ������ ���� �� ���������.
};


instance DIA_Ulf_Wirte(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Wirte_Condition;
	information = DIA_Ulf_Wirte_Info;
	permanent = FALSE;
	description = "��� ��� ���� ������������?";
};


func int DIA_Ulf_Wirte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Wirte_Info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//��� ��� ���� ������������?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//���� �� ��� - ��� ���� ������ ������� �� ���������.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//����� ��� ������� - ������ ������� �� �������� �������, � ������ - �������� ���� � �������� ������.
};


instance DIA_Ulf_Kloster(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Kloster_Condition;
	information = DIA_Ulf_Kloster_Info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ���������?";
};


func int DIA_Ulf_Kloster_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Kloster_Info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//��� �� ������ ���������� ��� � ���������?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//��, ����������, ���� ����������� � �������� ������ � �������� ��������� ���� ��� ������������ �����.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//�� ������ �� ��� ��, ��� ������ ������, � ������� ���� � �������� � �����.
};


instance DIA_Ulf_Bringen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 4;
	condition = DIA_Ulf_Bringen_Condition;
	information = DIA_Ulf_Bringen_Info;
	permanent = FALSE;
	description = "������ ���� � ���������.";
};


func int DIA_Ulf_Bringen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Bringen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//������ ���� � ���������.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//������ �� ����. �� ������, ������� ��������� ������� ������ ����������� ��� �� ����?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//����� � ����� ��� ���� ���� �������� �����, ������ � ��������, � ���, ��� ��� ������ �� ����� ���� �����.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//����� ����, ���� ��� ����� �� ������ � ���������.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//������?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//���� � ��������� �������� ������ �����, ��������� � �����������.
};


instance DIA_Ulf_Aufnahme(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 3;
	condition = DIA_Ulf_Aufnahme_Condition;
	information = DIA_Ulf_Aufnahme_Info;
	permanent = FALSE;
	description = "� ��� ��� ����� �����������?";
};


func int DIA_Ulf_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Bringen) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//� ��� ��� ����� �����������?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//���� ������� ��������� �������� �������...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//��! ������ ����� ���, ������ �������.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//�� ������ �������� ����. ���� �...
	B_Say_Gold(self,other,Summe_Kloster);
	B_KlosterTributInfo();
};


instance DIA_Ulf_Gold(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 8;
	condition = DIA_Ulf_Gold_Condition;
	information = DIA_Ulf_Gold_Info;
	permanent = FALSE;
	description = "��� ��� ��������� ����� �������� �����?";
};


func int DIA_Ulf_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Aufnahme) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Gold_Info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//��� ��� ��������� ����� �������� �����?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//��� ��� ��������, ��� �� �� ������ ������, ��� �� ��� ��������� �� ����, ���� ������ ����� ���������� ��.
};


instance DIA_Ulf_Schaf(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Schaf_Condition;
	information = DIA_Ulf_Schaf_Info;
	permanent = FALSE;
	description = "� ��� � ���� ����� ����?";
};


func int DIA_Ulf_Schaf_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ulf_Aufnahme) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Schaf_Info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//� ��� � ���� ����� ����?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//� ��������, ������� ��. �� �� �� �������� �� �����.
	B_LogEntry(Topic_Kloster,"� ���� ��������� ���� � ��������.");
};


instance DIA_Ulf_Suche(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Suche_Condition;
	information = DIA_Ulf_Suche_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Suche_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Suche_Info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//��, �� ������ �������?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//�� ��� ������.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//�����. � ��� ��� ����� ��������, ������ ��������� ����, ����� ��-�� ���� ����� ����� � ������ ���, ��� � ��� ������.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//��� �� ��� ��������? ���� ������ �����������. � ��� ������� ���� ����?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//� ���������� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//��� ����������! ������, �������� � ���� ������ �� ���������. ��� ������, ��� �� ���� ������ ������ '��, ��� �������� ������� � ����� ����'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//������ �� ���.
};


instance DIA_Ulf_Rausgefunden(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Rausgefunden_Condition;
	information = DIA_Ulf_Rausgefunden_Info;
	permanent = FALSE;
	description = "�� ��� ������ �� �����?";
};


func int DIA_Ulf_Rausgefunden_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Rausgefunden_Info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//�� ��� ������ �� �����?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//��, � ������� ���� �� ������ - �� � ������� ���.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//� ��� �� ������? ��� ��� �������? ������ ������ ������. �� � �� ������� ��� ������� � �����...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//��� ��� � �������� ���� ������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_Ulf_Folgen(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Folgen_Condition;
	information = DIA_Ulf_Folgen_Info;
	permanent = FALSE;
	description = "��, �� ���, ����� �� ����?";
};


func int DIA_Ulf_Folgen_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden) && !Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Folgen_Info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//��, �� ���, ����� �� ����?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//����. ������ � �������� ��� � ��� �� �����������, ��� � ��.
	AI_StopProcessInfos(self);
};


instance DIA_Ulf_Stop(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Stop_Condition;
	information = DIA_Ulf_Stop_Info;
	permanent = FALSE;
	description = "������ ������ �� ����!";
};


func int DIA_Ulf_Stop_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Folgen) && !Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Stop_Info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//������ ������ �� ����!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//� �� ��� �� �����. ��, ����������, ���� ���� ��� ������� - � ����� ������ �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_Ulf_Abrechnung(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 1;
	condition = DIA_Ulf_Abrechnung_Condition;
	information = DIA_Ulf_Abrechnung_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Abrechnung_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV))
	{
		if(C_FireContestRuneFound())
		{
			return TRUE;
		};
	};
};

func void DIA_Ulf_Abrechnung_Info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//�� ����� �����������. � ����� ���������. � ����, ��� ������� ����� ����� ������ �� ���.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//�� - �� ����� �����...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//� ���� ��� ������. ����� ���������� �� �� ���.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//� ������ ����� �����. ����� ����� ��� ������ ������. � ������ � ������ ��, ��� ������ ������������ ���.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//�� ������ ������� ��������� �����?
	Info_ClearChoices(DIA_Ulf_Abrechnung);
	Info_AddChoice(DIA_Ulf_Abrechnung,"��������, � �� ���� ������� ����.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice(DIA_Ulf_Abrechnung,"��, ��������, ���-�� �� ��������� - ��� ����� ��������� � ���������.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice(DIA_Ulf_Abrechnung,"� ���� ��� ������ ��������?",DIA_Ulf_Abrechnung_Rauch);
};

func void DIA_Ulf_Abrechnung_Lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//��������, � �� ���� ������� ����.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//����. �� �� ������, ��� � ���� ��� �� ������� ����� ������ ����! ��������!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//��, ��������, ���-�� �� ��������� - ��� ����� ��������� � ���������.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//���� ������ ������ �� ����� ����!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};

func void DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//� ���� ��� ������ ��������?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//���� �������. ��� ��� � ���� ���-��� ����.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//�����, �������.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Ulf_Troll(C_Info)
{
	npc = NOV_602_Ulf;
	nr = 9;
	condition = DIA_Ulf_Troll_Condition;
	information = DIA_Ulf_Troll_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ulf_Troll_Condition()
{
	if((MIS_Schnitzeljagd == LOG_Running) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Ulf_Rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)) && !Npc_KnowsInfo(other,DIA_Ulf_Abrechnung))
	{
		return TRUE;
	};
};

func void DIA_Ulf_Troll_Info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//��, �� ������������� �������, ��� �� ���� ���������� �������? ������ ����� �����.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//� �����, ��� ����� ���� � ������ �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};

