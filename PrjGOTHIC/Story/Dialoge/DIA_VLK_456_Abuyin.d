
instance DIA_Abuyin_EXIT(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 999;
	condition = DIA_Abuyin_EXIT_Condition;
	information = DIA_Abuyin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Abuyin_Hallo(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Hallo_Condition;
	information = DIA_Abuyin_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Abuyin_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(���������) ...��� �������... ��� �������, �� � ����� ��� �����������, ������...
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_BENCH_02") < 600)
	{
		AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//��� �... ������ ������� ������ ����... �, ����� �������� ��� ��������, ��� ��������, � ���� �� ��������������� ����.
		AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//����� ����������, ���� ���, ������� �� ��� �������� ����� � ������ ������, ����������� ������.
	};
};


instance DIA_Abuyin_du(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_du_Condition;
	information = DIA_Abuyin_du_Info;
	permanent = FALSE;
	description = "��� ��?";
};


func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//���� ����� ����� ��� ������ ��� ���� ����� ��� ����� ��� ������. � ������ � �������������, �������� � �������� �������.
};


instance DIA_Abuyin_Kraut(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Kraut_Condition;
	information = DIA_Abuyin_Kraut_Info;
	permanent = FALSE;
	description = "��� �� ����� �� �����������?";
};


func int DIA_Abuyin_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//��� �� ����� �� �����������?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//��� ������ ������ ������, ���������� �������� �������.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_BENCH_02") < 600)
	{
		AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//�������, ��� ������, ��� �����������.
	};
};


instance DIA_Abuyin_anderen(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_anderen_Condition;
	information = DIA_Abuyin_anderen_Info;
	permanent = FALSE;
	description = "� � ���� ���� ������ �����?";
};


func int DIA_Abuyin_anderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//� � ���� ���� ������ �����?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//� ��������� ������ ������ �����. ��� �������� ����� - �������� ���� ������ - ����� ��������.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//��, ������� ��, � ������ ����� ����������� ������ ���� ������ - ���� ���-������ ������ ����������� ������������� ������� �����.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//� ��� ��� ��������?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//������ �� ������ �������� �����. � �������� ��������� � ���� ��������� �����������.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//��� �������� �� ������������ �����, ����, ������� �� ������ ������ � �������.
};


instance DIA_Abuyin_Woher(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Woher_Condition;
	information = DIA_Abuyin_Woher_Info;
	permanent = FALSE;
	description = "��� ��� ����� �������� �����?";
};


func int DIA_Abuyin_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Woher_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//��� ��� ����� �������� �����?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//� ��� ���� ��� ������. � ��� ����� � ����, ��� ���� ���������.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//���� ���� ����������� ��� �����, �� ������� ���� ����� � ������, ������� �����. �� ���������� ���� ����� � ������� ���.
	B_GiveInvItems(self,other,ItMi_ApfelTabak,2);
};

func void B_TabakProbieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//������� ��� ����������� ���� �����.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//���, ���� ������ ��� �� ����� ��������. ��, ����� ����, �� ������� ����-������, ��� ������ ���... �-�... ������������.
};


instance DIA_Abuyin_Mischung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 10;
	condition = DIA_Abuyin_Mischung_Condition;
	information = DIA_Abuyin_Mischung_Info;
	permanent = TRUE;
	description = "� ������ ����� ���� ������...";
};


func int DIA_Abuyin_Mischung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen) && (Abuyin_Honigtabak == FALSE) && (Npc_HasItems(other,ItMi_SumpfTabak) || Npc_HasItems(other,ItMi_PilzTabak) || Npc_HasItems(other,ItMi_DoppelTabak) || Npc_HasItems(other,ItMi_Honigtabak)))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//� ������ ����� ���� ������...
	Info_ClearChoices(DIA_Abuyin_Mischung);
	Info_AddChoice(DIA_Abuyin_Mischung,Dialog_Back,DIA_Abuyin_Mischung_BACK);
	if(Npc_HasItems(other,ItMi_SumpfTabak))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if(Npc_HasItems(other,ItMi_PilzTabak))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if(Npc_HasItems(other,ItMi_DoppelTabak))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if(Npc_HasItems(other,ItMi_Honigtabak))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};

func void DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Sumpf()
{
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Pilz()
{
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Doppel()
{
	B_GiveInvItems(other,self,ItMi_DoppelTabak,1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Super()
{
	B_GiveInvItems(other,self,ItMi_Honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//����� � �������� ���� �����.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//��� ����������! � ����� ������ ��������� �� ��������!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//��� �� ���������� ���?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//� ������ ������� ����� � �����.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//�� ������ ���������, �, ���� ��������� ��������. � � ���������� ������������� ����� �� ���� ���������� ������.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//��, �����.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//������� ����, �, ��� �����������. �� ���� ������ ����� �� ��������� � ����� ���������. � ����� �������� ���, ��� �� ������� �������� ���.
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Info_ClearChoices(DIA_Abuyin_Mischung);
};


instance DIA_Abuyin_Trade(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Trade_Condition;
	information = DIA_Abuyin_Trade_Info;
	permanent = TRUE;
	description = "� ������ ���� �������� ������.";
};


func int DIA_Abuyin_Trade_Condition()
{
	if((Abuyin_Honigtabak == TRUE) && Npc_HasItems(other,ItMi_Honigtabak))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	var int count;
	count = Npc_HasItems(other,ItMi_Honigtabak);
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//� ������ ���� �������� ������.
	B_GiveInvItems(other,self,ItMi_Honigtabak,count);
	Npc_RemoveInvItems(self,ItMi_Honigtabak,count);
	B_GiveInvItems(self,other,ItMi_Gold,count * VALUE_ItMi_HonigTabak);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//��� ���� �������� ������������ ����� � ����� ����.
};


instance DIA_Abuyin_Herb(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Herb_Condition;
	information = DIA_Abuyin_Herb_Info;
	permanent = FALSE;
	description = "���� �� ������������ ���� ��� �����?";
};


func int DIA_Abuyin_Herb_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && Npc_HasItems(other,ItMi_HerbPaket))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//���� �� ������������ ���� ��� �����?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//��� ���� - ��� �� �������� �����, ���? ��, ����� ��, �, ��� ����������������.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//���� ��������� ������ ������ �� � ����, ��� ������ ���� � ������ - � ���� ����� ����� �� ������ ������!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//���� ���� ��� ������� ������� ��� �����, �������� ����� ������ - ������ ���� �����.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//�������� ���������� �� ��� ���-������ �� ��������� ��������� ����. � �����... ���� ����� ���� � ��� ���� �������� ����.
};


instance DIA_Abuyin_Weissagung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung_Condition;
	information = DIA_Abuyin_Weissagung_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int DIA_Abuyin_Weissagung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//�� ������ ������� �����������?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//� � ����� ������� �� �������� ��������������, �, ���� ��������.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//������� �� ������?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//�� �����-�� 25 ����� � ������ ��������� ��� ���� � �������.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//�� ����� - ������� ������ �������������. ���, ��� � ���� ����� - ��� ������� ���� ��������� ��������� �������.
};


func void B_Abuyin_StartTrance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	Abuyin_Zukunft = Kapitel;
	B_GivePlayerXP(XP_Ambient * 4);
	B_RemoveEveryInvItem(self,ItMi_Gold);
};

instance DIA_Abuyin_Zukunft(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft_Condition;
	information = DIA_Abuyin_Zukunft_Info;
	permanent = TRUE;
	description = B_BuildPriceString("�������� ��� � �������.",25);
};


func int DIA_Abuyin_Zukunft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung) && (Abuyin_Zukunft < Kapitel) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//�������� ��� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//������, �, �������� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft,"� �����!",DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//�, ���� �����, � ����� � ���� 25 ������� � ����� �� ������ � �������� �������.
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	B_Abuyin_StartTrance();
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(� ������) ����... ��� �������� ����... ������ �������... ������ ��������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(� ������) ���� � ���������� ��������... ���... ���� ���� � ����... �� ���� ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(� ������) �����! ���������... �������� ��������... �����... ������... ��������...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(� ������) ...��� ���?.. �����... �����... ���������� �� ���������...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(� ������) ...�� ��� �������... ���������� �� ���������!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//������ - ������� ���������. ������ � ������ �� ���� �������.
	Info_ClearChoices(DIA_Abuyin_Zukunft);
};


instance DIA_Abuyin_Nochmal(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Nochmal_Condition;
	information = DIA_Abuyin_Nochmal_Info;
	permanent = TRUE;
	description = "�� ������ ���� ��� ��� ���� �����������?";
};


func int DIA_Abuyin_Nochmal_Condition()
{
	if(Abuyin_Zukunft == Kapitel)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//�� ������ ���� ��� ��� ���� �����������?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//�, ��� ����������� ��������, ������ � �� � ����� ���������� ������ �������.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//������ ����� ����� ������ ��� ��������� ����, � ����� ������ ���� ��� ���.
	if(Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//� ����� ��� �����?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//����� ������� ������ ���������, � �� ���������� ���� ����.
		Abuyin_Erzaehlt = TRUE;
	};
};

func void B_Abuyin_Weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//�� ������ ������� �����������?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//��, ����� ���� ������, � � ���� ������� ��� ���� �����������, ���� � ���� �������� ��������� �����.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//�������?
};


instance DIA_Abuyin_Weissagung2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung2_Condition;
	information = DIA_Abuyin_Weissagung2_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int DIA_Abuyin_Weissagung2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//�� �����-�� 100 ����� � ������ ��������� ��� ���� � �������.
};


instance DIA_Abuyin_Zukunft2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft2_Condition;
	information = DIA_Abuyin_Zukunft2_Info;
	permanent = TRUE;
	description = B_BuildPriceString("�������� ��� � �������.",100);
};


func int DIA_Abuyin_Zukunft2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung2) && (Abuyin_Zukunft < Kapitel) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//�������� ��� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//������, �, ��� ��������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2,"� �����!",DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//�, ���� �����, � ����� � ���� 100 ������� � ����� �� ������ � �������� �������.
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	B_Abuyin_StartTrance();
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(� ������) �������... ��� ����� ��... ������� ��������... ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(� ������) �������� �����������... ��� ����... ���� ����... ����� �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(� ������) ...�� ���� ������ ������������... ������ ����� �� �������� ��, ��� ������ ������������ ����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	Info_ClearChoices(DIA_Abuyin_Zukunft2);
};


instance DIA_Abuyin_Weissagung3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung3_Condition;
	information = DIA_Abuyin_Weissagung3_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int DIA_Abuyin_Weissagung3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//�� �����-�� 250 ����� � ������ ��������� ��� ���� � �������.
};


instance DIA_Abuyin_Zukunft3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft3_Condition;
	information = DIA_Abuyin_Zukunft3_Info;
	permanent = TRUE;
	description = B_BuildPriceString("�������� ��� � �������.",250);
};


func int DIA_Abuyin_Zukunft3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung3) && (Abuyin_Zukunft < Kapitel) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//�������� ��� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3,"� �����!",DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//�, ���� �����, � ����� � ���� 250 ������� � ����� �� ������ � �������� �������.
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	B_Abuyin_StartTrance();
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(� ������) �� ������ ���������... ��� ������� ������ ����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(� ������) ...������ ����� � ����... ������ ��� � �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(� ������) ���� � �������� ��������... ������... �����... ��� ���� ����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	Info_ClearChoices(DIA_Abuyin_Zukunft3);
};


instance DIA_Abuyin_Weissagung4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung4_Condition;
	information = DIA_Abuyin_Weissagung4_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int DIA_Abuyin_Weissagung4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//�� �����-�� 500 ����� � ������ ��������� ��� ���� � �������.
};


instance DIA_Abuyin_Zukunft4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft4_Condition;
	information = DIA_Abuyin_Zukunft4_Info;
	permanent = TRUE;
	description = B_BuildPriceString("�������� ��� � �������.",500);
};


func int DIA_Abuyin_Zukunft4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung4) && (Abuyin_Zukunft < Kapitel) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//�������� ��� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4,"� �����!",DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//�, ���� �����, � ����� � ���� 500 ������� � ����� �� ������ � �������� �������.
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	B_Abuyin_StartTrance();
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(� ������) ����� ������... ������ ������... ������ ����� ������-������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(� ������) ������������ ��������... �� ������ ������� �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(� ������) ����... ����� ������� � ������� �������... �������� �������...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	Info_ClearChoices(DIA_Abuyin_Zukunft4);
};


instance DIA_Abuyin_Weissagung5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung5_Condition;
	information = DIA_Abuyin_Weissagung5_Info;
	permanent = FALSE;
	description = "�� ������ ������� �����������?";
};


func int DIA_Abuyin_Weissagung5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//�� �����-�� 1000 ����� � ������ ��������� ��� ���� � �������.
};


instance DIA_Abuyin_Zukunft5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft5_Condition;
	information = DIA_Abuyin_Zukunft5_Info;
	permanent = TRUE;
	description = B_BuildPriceString("�������� ��� � �������.",1000);
};


func int DIA_Abuyin_Zukunft5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung5) && (Abuyin_Zukunft < Kapitel) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//�������� ��� � �������.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//������, �, ��� ������. � ������ ����� � ��������� ������. �� �����?
		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5,"� �����!",DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//�, ���� �����, � ����� � ���� 1000 ������� � ����� �� ������ � �������� �������.
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	B_Abuyin_StartTrance();
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(� ������) ���� ���������� �� �����... ��� �����������...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(� ������) ������ ��������� ����� ������ �����...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(� ������) �� ���������, �� �� ������� �����...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//��� ���. ������ � ������ �� ���� �������.
	Info_ClearChoices(DIA_Abuyin_Zukunft5);
};

