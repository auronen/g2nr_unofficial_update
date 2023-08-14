
instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello_FirstMeet(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_FirstMeet_Condition;
	information = DIA_MiltenNW_KAP3_Hello_FirstMeet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_FirstMeet_Condition()
{
	if((Kapitel == 3) && !Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_FirstMeet_Info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//����������, ��� ��������! ��� ����� ��-�� �������!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(�� ����) � �� ���� �������� � ���. �� ������������� ���� ���������?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//������ �� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(� �������) ���� �����, ��� ��, ���������� ����������, �� ����������� ������� ����� ������� ��� ������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//�����-�� ������� ����� ��� ���� �� ��������.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//� ����, ��� ����� ��������� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//����� �����?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//��� �� ������������� � ��������� �� ���������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//��, �� ������� �� ��� ��������� ������. ��� �� �����, �� ���������� �� ���� ����� ����, � ������ ��� ����� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//��� ���?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//� ���, �������, � ���� �� ����, ��� �� ���������, ��� ���� ������ ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//�� ����� ������ ������, ��?
	};
	Info_ClearChoices(DIA_MiltenNW_KAP3_Hello_FirstMeet);
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_MiltenNW_KAP3_Hello_FirstMeet,"�������� �� ������ � �����.",DIA_MiltenNW_KAP3_Hello_FirstMeet_YES);
	}
	else
	{
		Info_AddChoice(DIA_MiltenNW_KAP3_Hello_FirstMeet,"��� ����� � �������.",DIA_MiltenNW_KAP3_Hello_FirstMeet_YES);
	};
	Info_AddChoice(DIA_MiltenNW_KAP3_Hello_FirstMeet,"� ������ ����� ����?",DIA_MiltenNW_KAP3_Hello_FirstMeet_NO);
};


func void DIA_MiltenNW_KAP3_Hello_FirstMeet_YES()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//�������� �� ������ � �����.
	}
	else
	{
		DIA_Common_EverythingWillBeAlright();
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//� ����, �� ��� ����� ������, ��� �� �� ����� �������.
		DIA_Common_Yeah();
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//��� �� ������� �����, � ���������? ��� � ������. �� ������ ���� ����������� � ��������� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//��������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//� ���� ��� - ����� ����� ���� ���������� � ��������, �� �������� �� ���, ���������. �� ������� ��� ����� ��������.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//� ����, ��, ��� �� �����, ��� ���������� ��������. � �� ������ �����.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//�� ������� �������. ��� ���� ����� ������������ ���� ������ �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//��, �����.
		Knows_Milten = TRUE;
	};
	Info_ClearChoices(DIA_MiltenNW_KAP3_Hello_FirstMeet);
};


func void DIA_MiltenNW_KAP3_Hello_FirstMeet_NO()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//� ������ ����� ����?
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//�� ������ �����, ��? ��� �, ������� ������� � ����� � �������� ���� ����� �������� ����.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//���� � ���� � ��� �������� ��������.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Hello_FirstMeet);
};


//////////////////////////////////////////////////////////////////

instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if(((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(�� ����) � �� ���� �������� � ���. �� ������������� ���� ���������?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//������ �� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(� �������) ���� �����, ��� ��, ���������� ����������, �� ����������� ������� ����� ������� ��� ������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//�����-�� ������� ����� ��� ���� �� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//�������� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//� ����, �� ��� ����� ������, ��� �� �� ����� �������.
		DIA_Common_Yeah();
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//��� �� ������� �����, � ���������? ��� � ������. �� ������ ���� ����������� � ��������� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//��������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//� ���� ��� - ����� ����� ���� ���������� � ��������, �� �������� �� ���, ���������. �� ������� ��� ����� ��������.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//� ����, ��� ����� ��������� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//����� �����?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//��� �� ������������� � ��������� �� ���������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//��, �� ������� �� ��� ��������� ������. ��� �� �����, �� ���������� �� ���� ����� ����, � ������ ��� ����� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//��� ���?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//� ���, �������, � ���� �� ����, ��� �� ���������, ��� ���� ������ ������� ����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//���� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//� ����, ��, ��� �� �����, ��� ���������� ��������. � �� ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//�� ������� �������. ��� ���� ����� ������������ ���� ������ �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//��, �����.
	};
};


instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = "��� �� ���� ��������� �� ��������� ��� ������?";
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if((Kapitel == 3) && Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//��� �� ���� ��������� �� ��������� ��� ������?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//������ ����� ������? � ������������ ����� ������ � ���������� ����� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//������ ��������, ��� ��� ���� �������� - ���� �� ���� ��������, ��� ���������� �� ��� ������� �� ������, �� ������� ��������� ��� �� ������, ��� � ������.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = "�� ������, ��� ���������?";
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if((Kapitel == 3) && ((Knows_Milten == TRUE) || (Knows_Diego == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//�� ������, ��� ���������?
	if(!Npc_IsDead(GornNW_vor_DJG))
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//����, ������, ������ �� ��������� ����� ���������� � ������ �������.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//��� ��� ������� ���������?
			if(Npc_KnowsInfo(other,DIA_DiegoOw_Gorn))
			{
				AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//��� �������� ������� �������, ��� ��� �� ���� ��� ���������.
				AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//�� ��� ������ ����� ����, �������?
				AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//���� �� �������.
			}
			else
			{
				AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//����� ������� ����� - ������, ��� ������ ������� � ���.
			};
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//� ����� ������, �� ����� ����������� � �� � ����������, ��� ���������� �� �����.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//����� ��������� � �������, ��, ��������, ������ �������� ���������� ������ � ���� � ���������� �� ��������� �������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//���� �� �������.
	};
	AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//����� �������� ���-�� � ��������. �� � ������� �� ����, ��� �� ����� ������� ����.
	AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//�� � ����������, ��� �� ������ � ������. �� ������ ��� - �� ������ ���, ��� ����� ����������.
	if(!Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//������ �����, ������� - � � ������� �� ����, ��� �� ������ ���������.
		if(Npc_KnowsInfo(other,DIA_Lester_Hello) || Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
		{
			if(Npc_KnowsInfo(other,DIA_Lester_SEND_XARDAS) || Npc_KnowsInfo(other,DIA_Lester_BACKINTOWN))
			{
				AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//� �������� ������� - �� ������ � ���������.
			}
			else
			{
				AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03_add");	//� �������� �������. �� � �������.
			};
			AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//��, ���� �����-�� ������� �������.
		}
		else
		{
			AI_Output(other,self,"Extro_Tempel_15_04");	//��, ��� �� ��?
		};
	};
};


func void B_MiltenNW_GiveMonasteryKey()
{
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	if(!Npc_IsDead(Gorax))
	{
		if(Npc_HasItems(Gorax,ItKe_Innos_MIS))
		{
			Npc_RemoveInvItem(Gorax,ItKe_Innos_MIS);
		};
	};
	MiltenNW_GivesMonasteryKey = TRUE;
};

instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = "��� ����� ������� � ���������. ��� ������!";
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (MiltenNW_GivesMonasteryKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//��� ����� ������� � ���������. ��� ������!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//��, �������. ��� ����.
		B_MiltenNW_GiveMonasteryKey();
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//� �� ���� ������� ���� � ���������. � ���� ����� �������� � ������ �������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//��� ���������� ��������� ����� � ������ �� ���� ������� � ���������.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"�� ��� �����!",DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS))
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"� ���� ���� ������ �� ����� ������.",DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//�� ��� �����!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//��� �� �������. ������� ������� ��� ������ �� ���.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//� ���� ���� ������ �� ����� ������.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//������.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_ReadFakeItem(self,other,Fakescroll,1);
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//�� ����� ������ ������, ��?
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(���������) ������. ��� ���� �� ���������. �� ������� �������� � ������.
	B_MiltenNW_GiveMonasteryKey();
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = "�� ������, ��� �����?";
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//�� ������, ��� �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//�� �������, � ����� �� �����, ���� �� ����, ��� ���������� ���� ���������?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//�� ������ ��������� �� ��, ��� ������. � �������, ��� ������� ������� ����.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//�� ������ ������ ���. ����� ��� � ������� ����� ���� ������.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ����� � ������ �����?";
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//�� ������ ���-������ � ����� � ������ �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//���, �� � ���� ������ ������������ ������ ��.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//���� ���������, ���� ���������� �� ���.
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = "���� �������?";
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//���� �������?
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//��� � ������ ���� ����������. �� ��� ����� ����� �����������.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//������ ����� �������� ����������� ��������� ��� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//���-������ ���?
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//��������� ����� ��� ������ ��������� � ��������� �����, ���� �� ��������� ������ ��������.
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//��� ��� ��� �� �������� - � �� �����, ��� � ��� �������� ����� �������.
		}
		else if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//������ ������� � ��������� ���������� ������� � ��� �����.
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//� �� ����, ��� ��� ��� ������, �� � �����, ��� ���� ���-�� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//�� �������� ��� ������ ��������� �� ��������� �����. ���� ���� �����, ����������� �������, ��� � ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//���, �������� ��� ��� ����� ���������. ���, ��� ��� �������� - ��� ������ � ������.
	};
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = "� ���� ���� ��������.";
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//� ���� ���� ��������.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//������? ������, ���� ��� �������� ������� �� ���������. ������ ���, ��� ��� �������� - ��� �������� ������ ���.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//���� �� ������������� ������ ���, �� ����������� ������� � ���� �����.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//�?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//������� ��, ��. ��� �� ���?
	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//�� ������ ��������� ��� ����� ������, ����� ����� ����� ������� ������.
	};
};


instance DIA_MiltenNW_SCWasInLib(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_SCWasInLib_Condition;
	information = DIA_MiltenNW_SCWasInLib_Info;
	important = TRUE;
};


func int DIA_MiltenNW_SCWasInLib_Condition()
{
	if(MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_SCWasInLib_Info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//��, � ������, �� ������ ����� ������� � ������������ �������. ��� �� ����� ���?
};


instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "� ����, ��� ���������� ����. �� ��������� �������, �������� ������.";
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MiltenNW_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//� ����, ��� ���������� ����. �� ��������� �������, �������� ������.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//��� ��� ����. �� ������ ������������ ���� ���������� � ���������� ��� ��� � ��������.
	if(!Npc_IsDead(DiegoNW))
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//�� ������� � �����? � �����, �� ���������� �������������� � ����.
		if(SCToldDiegoHeKnowWhereEnemy == FALSE)
		{
			B_LogEntry(Topic_Crew,"����� ����� ��������� ��������. �� ������� ������� �� ������������� �� ����� �����.");
			SCToldDiegoHeKnowWhereEnemy = TRUE;
		};
	};
	if(!Npc_IsDead(GornNW_nach_DJG))
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//� ��� ������ �����? �������� � ���. � ������, �� �������� �� ������ ��������.
		if(SCToldGornHeKnowWhereEnemy == FALSE)
		{
			B_LogEntry(Topic_Crew,"����, �����������, ����� ��������� ��������. ������� �� �������� ����� �� ����� ������� ������ ����������� �����. ��������, �� ������ ����������� ����.");
			SCToldGornHeKnowWhereEnemy = TRUE;
		};
	};
	if(!Npc_IsDead(Lester))
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//� �� ������ �������. ���� �� �� �������� ��� �� ������, �� ������ ���.
		if(SCToldLesterHeKnowWhereEnemy == FALSE)
		{
			if(Npc_KnowsInfo(other,DIA_Lester_SEND_XARDAS))
			{
				B_LogEntry(Topic_Crew,"������ ����� �������� ������ �����������. ��� ������� ��������� ��� � ����� ��������.");
			}
			else
			{
				B_LogEntry(Topic_Crew,"���� � �� ������ ������� � �����, ��� ������� �� ��������� �� ��� ������.");
			};
			SCToldLesterHeKnowWhereEnemy = TRUE;
		};
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//� ����� ���� ���� ���� �� ���� ����. � ���� �������� ���� ���� � ������ � �������� ���. ����� �� ���������?
	if(SCToldMiltenHeKnowWhereEnemy == FALSE)
	{
		B_LogEntry(Topic_Crew,"���� ������ ���������� � ���� �� ����, �� ����� ������� ���� ��������� ���� � �������� ��� ����.");
		SCToldMiltenHeKnowWhereEnemy = TRUE;
	};
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//�� ��� ������, � ���� ��� ���������� �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//�� ������, � ������ ����� ����� � �����. ���� �����������, ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//�����, �� �� ������� ���� ����� ��� ����� ������.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"������ � �� ���� ����� ���� �����.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"����� ���������� �� ����!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//����� ���������� �� ����!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//���������� � ������. ��� ���� ���.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//������. � ���� ���, ����� �� ������ �����.
	B_JoinShip(self);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//������ � �� ���� ����� ���� �����.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//�� ������, ��� � ����� ���� � ����� �� �����. ���� �����������, ������ �����.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = "��� ��� ����� ��������?";
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//��� ��� ����� ��������?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//������ �������. �� ���� �����. ��, ������ ����, ��� ��� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//�� ���� �� �� ������ ������, �������� ������������ �� ������ ��� � ������, ����� ����, �������� �������, ��������� ��������� ����� ��������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//����� ����� ���������� � �� ��� ������������ � ������ ��������. ������ ������ ������ ��� � ������ �� ��������.
	B_LogEntry(Topic_Captain,"��������, ����� ����� � ����� ������� � �������� ��������. �� ��� ��� ������ ���� � ���������. ����, ����� ���� ���� � ������ ��������� �� ������ � � ������. ��������, ��� ����� ���������� � �� ��� ������������ � ������.");
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "� �� ���� ����� ���� � �����.";
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//� �� ���� ����� ���� � �����.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//�� ����� ������, ��� ���� �����. ���� �����������, � ���� ����� ���� � ���������.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count -= 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "�� ����� ���.";
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if(((MiltenNW_IsOnBoard == LOG_OBSOLETE) || (MiltenNW_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	DIA_Common_INeedYou();
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//���� ������� ������ ��� �����. ������, �� �� ����� ������ �����!
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//� ����������� � ����. ���������� ���.
	B_JoinShip(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = "� ���� ������� ���-����� ����������.";
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//� ���� ������� ���-����� ����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0)
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
		{
			if(PLAYER_TALENT_RUNES[SPL_Light] == FALSE)
			{
				Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_Light,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Light)),DIA_MiltenOW_Teach_Light);
			};
			if(PLAYER_TALENT_RUNES[SPL_LightHeal] == FALSE)
			{
				Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_LightHeal,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightHeal)),DIA_MiltenOW_Teach_Heal);
			};
		};
		if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
		{
			if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
			{
				Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),DIA_MiltenOW_Teach_Windfist);
			};
			if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
			{
				Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
			};
			if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
			{
				Info_AddChoice(DIA_MiltenNW_Teach,B_BuildLearnString(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),DIA_MiltenOW_Teach_Eispfeil);
			};
		};
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

var int Milten_NW_TeachMANA_NoPerm;

func void B_BuildLearnDialog_Milten_NW()
{
	if(RealAttributeValue(ATR_MANA_MAX) >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
		Milten_NW_TeachMANA_NoPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04");	//� ��������, ��� ����� �������.
		Info_ClearChoices(DIA_MiltenNW_Mana);
		Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
		Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(ATR_MANA_MAX,1)),DIA_MiltenNW_Mana_1);
		Info_AddChoice(DIA_MiltenNW_Mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(ATR_MANA_MAX,5)),DIA_MiltenNW_Mana_5);
	};
};

instance DIA_MiltenNW_Mana(C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = "� ���� �������� ���� ���������� �����������.";
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(((other.guild == GIL_KDF) || ((GuildlessMode == TRUE) && (other.guild == GIL_NOV))) && (Milten_NW_TeachMANA_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//� ���� �������� ���� ���������� �����������.
	B_BuildLearnDialog_Milten_NW();
};

func void DIA_MiltenNW_Mana_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED))
	{
		B_BuildLearnDialog_Milten_NW();
	};
};

func void DIA_MiltenNW_Mana_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED))
	{
		B_BuildLearnDialog_Milten_NW();
	};
};

