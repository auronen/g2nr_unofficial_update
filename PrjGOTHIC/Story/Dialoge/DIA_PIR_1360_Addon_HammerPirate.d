
instance DIA_Addon_HammerPirate_EXIT(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 999;
	condition = DIA_Addon_HammerPirate_EXIT_Condition;
	information = DIA_Addon_HammerPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_HammerPirate_Hello(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 1;
	condition = DIA_Addon_HammerPirate_Hello_Condition;
	information = DIA_Addon_HammerPirate_Hello_Info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//��� � �������?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_TowerBanditsDead())
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//�������. �� �� ������������ � ����� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//����� �������� � ����!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//���! ��� �� ��� ����.
	};
};


instance DIA_Addon_HammerPirate_Anheuern(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 11;
	condition = DIA_Addon_HammerPirate_Anheuern_Condition;
	information = DIA_Addon_HammerPirate_Anheuern_Info;
	permanent = FALSE;
	description = "�� ������ ��� ������.";
};


func int DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if(Henry_GetPartyMember == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Anheuern_Info()
{
	DIA_Common_YouGottaHelpMe();
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//������ �� ������, ��� �� ������, ����� � ����� � ����� � ����� ���� ����������� � ���������!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//�����.
	if(!Npc_IsDead(SawPirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//������ �� ���� �� ����� �����, ������� ����� �����?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//��� ������ �� ��� ����...
};


instance DIA_Addon_HammerPirate_ComeOn(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 12;
	condition = DIA_Addon_HammerPirate_ComeOn_Condition;
	information = DIA_Addon_HammerPirate_ComeOn_Info;
	permanent = TRUE;
	description = "������ �� ����.";
};


func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Henry_FreeBDTTower == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_HammerPirate_Anheuern))
	{
		if(!C_TowerBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//������ �� ����.
	if(SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//���� �� ��� ������ �������� �����...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//������� ����� �������� ������� � ������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//����!
		GotPartyMemberForTowerBandits = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_HammerPirate_GoHome(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 13;
	condition = DIA_Addon_HammerPirate_GoHome_Condition;
	information = DIA_Addon_HammerPirate_GoHome_Info;
	permanent = TRUE;
	description = "�� ��� ������ �� �����.";
};


func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//�� ��� ������ �� �����.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//��� �������...
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_TooFar(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_HammerPirate_TooFar_Condition;
	information = DIA_Addon_HammerPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//���� �� ������� ������, �� � ���� �� ��������...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//�����, � ����� �����.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_HammerPirate_Success(C_Info)
{
	npc = PIR_1360_Addon_Pirat;
	nr = 14;
	condition = DIA_Addon_HammerPirate_Success_Condition;
	information = DIA_Addon_HammerPirate_Success_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_HammerPirate_Success_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(C_TowerBanditsDead())
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//������, ���? � ��� �������... � ��, �������, �� ����� �� � ������ ������.
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//�����, � ����������� � ������. ��������!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

