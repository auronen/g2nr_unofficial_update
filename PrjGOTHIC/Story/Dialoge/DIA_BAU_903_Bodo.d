
instance DIA_Bodo_EXIT(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 999;
	condition = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Bodo_Hallo(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 1;
	condition = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent = TRUE;
	description = "��� ����?";
};


func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//��� ����?
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//������. ���� ������� ���������, ����� �� ������� ������.
	}
	else if((VisibleGuild(other) == GIL_NOV) || (VisibleGuild(other) == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//������. �� �������� � ����� �����.
	}
	else if((VisibleGuild(other) == GIL_MIL) || (VisibleGuild(other) == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//����������� ������ �� ����� �� ���� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//������ �����, ��������, �� ��������� ���������� � �����, �� ������������ ���� �� ���� �� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//��������� ���������� ������ ����� �����. ������, ����� �� ����� ������� ��������, ��� �� ��������� ���� ���������� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//������, ��������, ������, ��� ����� ��������� ���� ���. �� �� ������ �� ����� ������� ���!
	};
};


instance DIA_Bodo_Bauernaufstand(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 2;
	condition = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent = FALSE;
	description = "� ������ ������� � ��������� ��������!";
};


func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//� ������ ������� � ��������� ��������!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//����. �� �� ������ ������ ������. ������ �������� ��, ��� ���������� ������� ������.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//�������� ������, ��� ����� ������������ �� ������ ��������. �� ���� ������ �� ���������� ������ ������ � ��������, ��� ������ ���� ���� �����.
};


instance DIA_Bodo_Bett(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 3;
	condition = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent = FALSE;
	description = "���� � ���-������ ����� ���������?";
};


func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//���� � ���-������ ����� ���������?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//���� �� �����, ��� ����� �������, ��� � �����. �� ������ �� ������ �� ������ �� ������� ��������.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//���� ������, ����� ��� �� ������� ���, ��������, �� ��� �� �������� �������, �� ���������� �� �����. � ���� �������� ����� ������ ���, ��� ��������.
	};
};


instance DIA_Bodo_Cipher(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 4;
	condition = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...";
};


func int DIA_Bodo_Cipher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cipher_TradeWhat) && (Dar_Dieb == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//�?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//�� ������, ��� ��� ������ ��.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//��, ��� ������ ���� ������ ��� ����� ��� ������� �� ����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//� �������� ���� � ��� ����������� ����������� ��������� �����, ������ ���, ������, ��� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//�� � ������ �� ���� ��������. � �������� ��������� ���, � �� � ����� ������� ���, ��� ����� ����� ����� ����.
};


instance DIA_Bodo_WeedOrElse(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 5;
	condition = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent = FALSE;
	description = "����� ��� ��� ����� ���...";
};


func int DIA_Bodo_WeedOrElse_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bodo_Cipher) && (Dar_Dieb == FALSE))
	{
		if(Mob_HasItems("CHEST_ANDRE_WAREHOUSE_PACKET",ItMi_HerbPaket))
		{
			return TRUE;
		};
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//����� ��� ��� ����� ���...
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//��������, ���, ��� � ���� ���� - ��� ���� ����� �� �������� �����. ������ ��� � ������ ���� � �����.
	B_GiveInvItems(self,other,ItMi_Joint,1);
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//�� ������, ��� �������� ����� �������� ���, �?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//��� ��� ���� �� ������� ������� �����-������ ��������!
	};
};


instance DIA_Bodo_WeedPERM(C_Info)
{
	npc = BAU_903_Bodo;
	nr = 6;
	condition = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent = TRUE;
	description = "� �� ���� �� ������ ������ �����. ����� ��� ��� �����!";
};


func int DIA_Bodo_WeedPERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bodo_WeedOrElse) && (Dar_Dieb == FALSE))
	{
		if(Mob_HasItems("CHEST_ANDRE_WAREHOUSE_PACKET",ItMi_HerbPaket))
		{
			return TRUE;
		};
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//� �� ���� �� ������ ������ �����. ����� ��� ��� �����!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//� ���� �� ���. ������.
};

