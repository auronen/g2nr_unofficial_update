
func int C_PeckIsInBarracks()
{
	if(Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)
	{
		return TRUE;
	};
	if(Npc_GetDistToWP(self,"NW_CITY_BARRACK02_BED_PECK") <= 2000)
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_Peck_EXIT(C_Info)
{
	npc = MIL_324_Peck;
	nr = 999;
	condition = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Peck_HEY(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_HEY_Condition;
	information = DIA_Peck_HEY_Info;
	permanent = TRUE;
	description = "��, �� ��� ������� ���?";
};


func int DIA_Peck_HEY_Condition()
{
	if(MIS_Andre_Peck != LOG_Running)
	{
		if(!C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//��, �� ��� ������� ���?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//��������, � �����. ������ ���� � �����.
	AI_StopProcessInfos(self);
};


instance DIA_Peck_FOUND_PECK(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FOUND_PECK_Condition;
	information = DIA_Peck_FOUND_PECK_Info;
	permanent = FALSE;
	description = "��, ���� ���� ������������ �����.";
};


func int DIA_Peck_FOUND_PECK_Condition()
{
	if(MIS_Andre_Peck == LOG_Running)
	{
		if(!C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//��, ���� ���� ������������ �����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//��� ���� �����? �� ����� �� ������, � �����?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//��� ����� ������, ��� ��� ����������� � �������.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//����, ���� ������ ����� ���������.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//�����, ����� ��� ���� ���� ����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//��-�-�... ����. �����, � ��� ��� - �� ����� ������ ����������� �����, �� ������ ���, ��� � ��� �����.
	self.aivar[AIV_IgnoresFakeGuild] = FALSE;
	self.aivar[AIV_ToughGuy] = FALSE;
	self.aivar[AIV_ToughGuyNewsOverride] = FALSE;
	self.aivar[AIV_IGNORE_Murder] = FALSE;
	self.aivar[AIV_IGNORE_Theft] = FALSE;
	self.aivar[AIV_IGNORE_Sheepkiller] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	B_StartOtherRoutine(Vanja,"ALONE");
};


var int DIA_Peck_WEAPON_perm;
var int DIA_Peck_WEAPON2_perm;

func void B_GetWeaponFromPeckCh3()
{
	AI_Output(self,other,"DIA_Peck_Add_12_03");	//������, ��� �� �������. ��� ��������� ��������� ����� ������� ������� �� ��������� �����.
	AI_Output(self,other,"DIA_Peck_Add_12_04");	//��� �� ������ �� �����������. (������� ����)
	AI_Output(self,other,"DIA_Peck_Add_12_05");	//���, ������.
	if(MIS_Andre_Peck == LOG_FAILED)
	{
		B_GiveInvItems(self,other,ItMw_Schwert2,1);
	}
	else
	{
		B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
	};
	DIA_Peck_WEAPON_perm = TRUE;
	DIA_Peck_WEAPON2_perm = TRUE;
};

instance DIA_Peck_WEAPON(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON_Condition;
	information = DIA_Peck_WEAPON_Info;
	permanent = TRUE;
	description = "� ������ �� �������.";
};


func int DIA_Peck_WEAPON_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//� ������ �� �������.
	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//����� ������� � ����� � ������ ���.
	}
	else if(MIS_Andre_Peck == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//����������, ��� ������. ��� ����� ����. � ��� ����� ���.
		AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//�� �� ������ �����, ��� � ��� � ������� ������. ������, �� ���������� ������. ���, ����� ���� ���.
		AI_Output(self,other,"DIA_Peck_Add_12_00");	//��� ������, ��� � ���� ����.
		B_GiveInvItems(self,other,ItMw_Schwert1,1);
		DIA_Peck_WEAPON_perm = TRUE;
	}
	else if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//� �� ������ ���� �����. ��� ������ �����, ��� � ��� � ������� ������, �?
		AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//� ������ �� ������ �������� �� ���� ���... ������, �� �������� ���. ���. � ������ ����� � �����!
		B_GiveInvItems(self,other,ItMw_1h_MISC_Sword,1);
		DIA_Peck_WEAPON_perm = TRUE;
	}
	else if(Kapitel >= 3)
	{
		B_GetWeaponFromPeckCh3();
	};
	AI_StopProcessInfos(self);
};

func void B_Peck_LeckMich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//������� ��� �������!
};

instance DIA_Peck_WEAPON2(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON2_Condition;
	information = DIA_Peck_WEAPON2_Info;
	permanent = TRUE;
	description = "� ���� ��� ������ ������� ��� ����?";
};


func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//� ���� ��� ������ ������� ��� ����?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//� �� �����, ��� �� ����� �� ���� ����� �����.
		B_Peck_LeckMich();
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//���� ���...
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//���� ���� ����� ������ �������, ��� � ��������� �� �����.
	}
	else
	{
		B_GetWeaponFromPeckCh3();
	};
};


func int C_PeckCanSellArmor()
{
	if(MIS_Addon_Andre_MissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func int B_GetPeckArmorPrice()
{
	var int value;
	value = 4500;
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		value += 500;
	};
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (MIS_Andre_REDLIGHT == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Andre_LOBART_SUCCESS))
	{
		value -= 500;
	};
	if(Rengaru_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Halvor_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Nagur_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Sarah_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Canthar_Ausgeliefert == TRUE)
	{
		value -= 100;
	};
	if(Fernando_ImKnast == TRUE)
	{
		value -= 100;
	};
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		value -= 100;
	};
	if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	{
		value -= 1000;
	}
	else if(Andre_FoundThieves_Reported == TRUE)
	{
		value -= 500;
	};
	return value;
};

instance DIA_Peck_ARMOR(C_Info)
{
	npc = MIL_324_Peck;
	nr = 3;
	condition = DIA_Peck_ARMOR_Condition;
	information = DIA_Peck_ARMOR_Info;
	permanent = TRUE;
	description = "� ��� ������ �������� �������?";
};


func int DIA_Peck_ARMOR_Condition()
{
	if((other.guild == GIL_MIL) && (DIA_MIL_ARMOR_M_perm == FALSE))
	{
		if(C_PeckIsInBarracks())
		{
			return TRUE;
		};
	};
};

func void DIA_Peck_ARMOR_Info()
{
	DIA_Common_WhatAboutBetterArmor();
	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//����� ������� � ����� � ������ ���.
	}
	else if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		B_Say(self,other,"$CITY_CRIME");
	}
	else
	{
		if(C_PeckCanSellArmor())
		{
			if(MIS_Andre_Peck == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//������.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_Add_12_00");	//��� ������, ��� � ���� ����.
			};
			Info_ClearChoices(DIA_Peck_ARMOR);
			Info_AddChoice(DIA_Peck_ARMOR,Dialog_Back,DIA_Peck_ARMOR_Back);
			Info_AddChoice(DIA_Peck_ARMOR,B_BuildPriceString("������ ������� ������� ���������. ������: 70/70/10/10.",B_GetPeckArmorPrice()),DIA_Peck_ARMOR_BUY);
		}
		else
		{
			if(MIS_Andre_Peck == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(������) ���!
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_Add_12_02");	//���� ���...
			};
		};
	};
};

func void DIA_Peck_ARMOR_Back()
{
	Info_ClearChoices(DIA_Peck_ARMOR);
};

func void DIA_Peck_ARMOR_BUY()
{
	DIA_Common_GiveMeThatArmor();
	if(B_GiveInvItems(other,self,ItMi_Gold,B_GetPeckArmorPrice()))
	{
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//���, ������.
		B_GiveArmor(ITAR_MIL_M);
		DIA_MIL_ARMOR_M_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(�������) �����������, ����� � ���� ����� ������.
	};
	Info_ClearChoices(DIA_Peck_ARMOR);
};

instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 800;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int DIA_Peck_PERM_Condition()
{
	if(C_PeckIsInBarracks())
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//� ����� ��� � �������?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		B_Peck_LeckMich();
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//��, � � �����?
	}
	else
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//�� ������. ���� ������� ��� ��������. � ���� �������, ��� ����� ���������� ���������� ������ ������ �� ������ �����.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//��� ���-�� �� ����� ������� ��������� ������ ����� ������� ������.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//�������! �� ������ �� �����. ���� ����� ���� �������, ��� ����� ������������ �� ������� �������.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//� ����, ��� �� �������, �� � ���� �� ��������� ���� ������ � ���� �����������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//� ����� ���, ��� ��� ���� �� �������� ������ �������.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//������?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//�������� ������ ��� �� ��������� ��. ��� �� �� ����� ������ ����� ���� � �������� ��������� �� ���, ��� �� ������� ������ �� ���.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//��� ���� ����� ������� �� �����. � ���� ������ �� ���� � ���, � ���� ��� ����� ��������.
		};
	};
};

