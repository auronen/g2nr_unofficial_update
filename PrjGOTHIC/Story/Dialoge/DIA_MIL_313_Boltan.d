
instance DIA_Boltan_EXIT(C_Info)
{
	npc = MIL_313_Boltan;
	nr = 999;
	condition = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende_v2;
};


func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	DIA_Common_IHaveToGo_v2();
	AI_WaitTillEnd(self,other);
	AI_StopProcessInfos(self);
};

func int C_PrisonIsEmpty()
{
	if((MIS_Andre_REDLIGHT == LOG_SUCCESS) && !Npc_IsDead(Borka))
	{
		return FALSE;
	};
	if(!Npc_IsDead(Canthar))
	{
		if(Npc_GetDistToWP(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU") <= 600)
		{
			return FALSE;
		};
	};
	if((Sarah_Ausgeliefert == TRUE) && !Npc_IsDead(Sarah))
	{
		return FALSE;
	};
	if((Rengaru_Ausgeliefert == TRUE) && !Npc_IsDead(Rengaru))
	{
		return FALSE;
	};
	if((Nagur_Ausgeliefert == TRUE) && !Npc_IsDead(Nagur))
	{
		return FALSE;
	};
	if((Halvor_Ausgeliefert == TRUE) && !Npc_IsDead(Halvor))
	{
		return FALSE;
	};
	if((Fernando_ImKnast == TRUE) && !Npc_IsDead(Fernando))
	{
		return FALSE;
	};
	if((MIS_RescueBennet != LOG_SUCCESS) && (Kapitel == 3))
	{
		return FALSE;
	};
	if((MIS_RescueBennet == LOG_SUCCESS) && (CorneliusFlee == FALSE) && !Npc_IsDead(Cornelius))
	{
		return FALSE;
	};
	return TRUE;
};


instance DIA_Boltan_HALLO(C_Info)
{
	npc = MIL_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HALLO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Boltan_HalloBennet) || Npc_KnowsInfo(other,DIA_Boltan_HalloCanthar))
	{
		return FALSE;
	};
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return FALSE;
	};
	if((Kapitel >= 3) && (Canthar_Ausgeliefert == TRUE) && !Npc_IsDead(Canthar))
	{
		return FALSE;
	};
	return TRUE;
};

func void DIA_Boltan_HALLO_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//��� ���� �����?
};


instance DIA_Boltan_ToConvicts(C_Info)
{
	npc = MIL_313_Boltan;
	nr = 2;
	condition = DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent = TRUE;
	description = "� ���� ������� �����������.";
};


func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//� ���� ������� �����������.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//��, ��� ���������� �� ����� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//�� ���������� ��� ������, ��� ����� �������� ������.
		};
	}
	else if(C_PrisonIsEmpty())
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//��� ������ ������ �����.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//������, ��������.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//�������.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//���, �� �� ������������ ��� ������� �����, �������?
	};
};


instance DIA_Boltan_HalloBennet(C_Info)
{
	npc = MIL_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloBennet_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//�� ���� ������ �� �����, ����� ��������� ������ ������ ��������, ���?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//������ �� ����! ��� ������ � ������� �������, ����� ����� ����� � ��������� ���!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//� ����� �� ������� �� ���� �������! (������� ����)
};


instance DIA_Boltan_HalloCanthar(C_Info)
{
	npc = MIL_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloCanthar_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD) && !Npc_KnowsInfo(other,DIA_Boltan_HalloBennet))
	{
		return FALSE;
	};
	if((Kapitel >= 3) && (Canthar_Ausgeliefert == TRUE) && !Npc_IsDead(Canthar))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//��, �� ��� ������, ��� ������� ������ �� �������, ��������.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//����� ����� ���������, ����� ����������� �� ����. ��������� �����.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//������ ����, ��������� �����-�� �������������. ����� ������.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//� ������� ���� ����� ���������� ��������, ���� �� ������ ����� � ������.
};

