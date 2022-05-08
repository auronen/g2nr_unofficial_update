
instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	information = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40_Key;
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if(Npc_HasItems(self,ItKe_City_Tower_02))
	{
		return C_CanStealFromNpc(30);
	};
	return FALSE;
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	B_StealItem(30,ItKe_City_Tower_02,1);
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hallo(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent = FALSE;
	description = "��, ��� ����?";
};


func int DIA_Rangar_Hallo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") >= 500) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") >= 500))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//��, ��� ����?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//���� � ��������� ��� ������� ������� ��� ����, � ���� ������������ � ������ �����. � ��� ��� ������? (����������)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//�� ��������� �� ���������?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//��, � ���������� �� � �������� � ������. � ��������� ������ ��� ��������.
};


func void B_AskRangarAboutCityOrk()
{
	if((Knows_Ork == TRUE) && !Npc_IsDead(CityOrc) && (RangarToldAboutOrc == FALSE))
	{
		AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//�������, ����� ������ � ������ ������.
		AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//��, �����, ������� ��� ����� ������. ���� ��� - ��������� ������. �� ����� ������� �� �����.
		AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//��������, �� ������ ����� ���� ��� ����� ������, ���� �� �������� ������ � ������. �����?
		AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//�����.
		RangarToldAboutOrc = TRUE;
	};
};

instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "� ��� �������� � ������?";
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") >= 500) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") >= 500))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//� ��� �������� � ������?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//��� ������ ��� ������������ - ��������� ������ � �������� ������ �������� ��� ���������.
	if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//��� �������� ����� � ������ ���� ������ ���. �� �������� �� ����� � ��� �������. ��!
	};
	if(MIS_Garvell_Infos == FALSE)
	{
		B_AskRangarAboutCityOrk();
	};
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "������ ��� ����?";
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Ork) && (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") >= 500) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") >= 500))
	{
		if(MIS_Garvell_Infos == LOG_Running)
		{
			return TRUE;
		}
		else if((MIS_Garvell_Infos == FALSE) && (Knows_Ork == TRUE) && !Npc_IsDead(CityOrc) && (RangarToldAboutOrc == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//������ ��� ����?
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if((RangarToldAboutPaladins == FALSE) && (MIS_Garvell_Infos == LOG_Running))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//��, ��� ������ �����, ��� �������� ���.
			B_UseItem(self,ItFo_Beer);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//������, ������� ��������� �����, �������� �������� ���� �����. �� ��� �������.
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//�� ���-�� ����� ������� ������ �����...
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//��, ��, �����. ���� �� ������������ ������ ��� ������.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//��� �������� � ������ ��������. � ������ ���������� ����������.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//���� ������ ��� �� ���������� ���.
			RangarToldAboutPaladins = TRUE;
		}
		else if((RangarToldAboutPaladins == TRUE) || (MIS_Garvell_Infos == FALSE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//� �� �� ��������� ��� �� ����� �����.
			B_UseItem(self,ItFo_Beer);
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//������� ��� - ���������� ������.
			B_AskRangarAboutCityOrk();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//�... (�����) ���� ��� ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rangar_Erwischt(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 5;
	condition = DIA_Addon_Rangar_Erwischt_Condition;
	information = DIA_Addon_Rangar_Erwischt_Info;
	description = "��� �� ����� �������?";
};


func int DIA_Addon_Rangar_Erwischt_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Erwischt_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(���������) �-�-�... �... ��� �� ���� ����! ����������!
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//������ ����� ������ ��������, ����� � ��������, ��� �������� � �����, ���� ��� ���.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(��������) �����, ��� ������. � ����� ������.
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GotRangar = TRUE;
};


instance DIA_Addon_Rangar_nachhaken(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Addon_Rangar_nachhaken_Condition;
	information = DIA_Addon_Rangar_nachhaken_Info;
	permanent = TRUE;
	description = "�� ������������� �������, ��� ���� ��� ������ � ���?";
};


func int DIA_Addon_Rangar_nachhaken_Condition()
{
	if((SC_GotRangar == TRUE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_nachhaken_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//�� ������������� �������, ��� ���� ��� ������ � ���?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(�����������) �� �������� ������� ���� ��-�� ������ ����� �����.
};

