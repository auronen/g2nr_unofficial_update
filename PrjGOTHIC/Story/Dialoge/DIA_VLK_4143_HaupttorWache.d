
instance DIA_Haupttorwache_EXIT(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 999;
	condition = DIA_Haupttorwache_EXIT_Condition;
	information = DIA_Haupttorwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_AUFGABE(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 4;
	condition = DIA_Haupttorwache_AUFGABE_Condition;
	information = DIA_Haupttorwache_AUFGABE_Info;
	permanent = TRUE;
	description = "��� �� ����������� �����?";
};


func int DIA_Haupttorwache_AUFGABE_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//��� �� ����������� �����?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//��� ������ ������. � ������ �������, ����� ���� �� ������������ �����, ��� �� 30 ����� � �������.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//���� �� ����������� ������� �������, � ������� �������. ��� � ���.
};


instance DIA_Haupttorwache_TOROEFFNEN(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 5;
	condition = DIA_Haupttorwache_TOROEFFNEN_Condition;
	information = DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent = TRUE;
	description = "��� ����� �������, ����� ������� ������� ������?";
};


func int DIA_Haupttorwache_TOROEFFNEN_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_TOROEFFNEN_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//��� ����� �������, ����� ������� ������� ������?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//���� ����� �������! ����� ���� ����� ���?
	self.flags = 0;
	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"� ���������� � ������������ �����.",DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"�� � ������ ��� �������.",DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//� ���������� � ������������ �����.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//� ����, ������ ���.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//� ����� �������������� ��������, � ������ ���� ������� ��� ���� �� �������������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(�����) ��� ������� ���������������. � ���� ������� ������� ���. � �������� � ���� �������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//��. ������ ���������, ��� ���-������ ������ � �������� �����, ����� ������� ������, � ��� ������ ������ ������� ����� ��������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//����� ����� �� ������ ������� ��� ������. ��� ���� ������ �� �������, ��� ���������� ������. ������, ��� ����� �� �����, ��� � ���� ���� ����.
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//�� � ������ ��� �������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//� ��������� ��� �����, ��� �����������. � ���� ����� ���� ������� �������� ��-�� �����. ��� ������, ����� ������ �������. � ������ �����. � �����.
	AI_StopProcessInfos(self);
};

