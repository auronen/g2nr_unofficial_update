
instance DIA_Addon_Myxir_EXIT(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 999;
	condition = DIA_Addon_Myxir_EXIT_Condition;
	information = DIA_Addon_Myxir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_Hallo(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Hallo_Condition;
	information = DIA_Addon_Myxir_Hallo_Info;
	description = "��� � �������?";
};


func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//��������� ���� ���� � ����� ������� ����� ������ ���������.
};


instance DIA_Addon_Myxir_WasMachstDu(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_WasMachstDu_Condition;
	information = DIA_Addon_Myxir_WasMachstDu_Info;
	description = "��� �� ����� �����������?";
};


func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//��� �� ����� �����������?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//� ������ ���� ������.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//���� - ��� ���� � ����, ����� ������ ���� �����.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//������ �� ��� ������ ������� ���� ����, ����� ���������� ����������, ���� �� ���������.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//������ �������� ���� ������ �� �������� ���������. � ���������, ������ �� ��� ����� ������� ��� ��������.
};


instance DIA_Addon_Myxir_Steintafeln(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 5;
	condition = DIA_Addon_Myxir_Steintafeln_Condition;
	information = DIA_Addon_Myxir_Steintafeln_Info;
	description = "��� �� ����� ������ �� ���� ��������?";
};


func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Steintafeln_15_00");	//��� �� ����� ������ �� ���� ��������?
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_01");	//�� ��� �������� ������ �������� ������.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_02");	//��������� �� ��� ��������� ������� ����������� ���������� ��� ������ �����������.
	AI_Output(self,other,"DIA_Addon_Myxir_Steintafeln_12_03");	//��� ���, ��� �������� �� ��������, ��� �������� ��������� ����������.
	if(TOPIC_End_Stoneplates == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	};
	B_LogEntry(TOPIC_Addon_Stoneplates,"�� �������� ��������� �������� ������� ������ ������. ��������� �� ��� ����� ��������� ������� ��������� �������� � ������� �������� ��� �����. ������ �� ����� ��� ������ ���������.");
};


instance DIA_Addon_Myxir_WillYouTeachMe(C_Info)
{
	npc = KDW_1403_Addon_Myxir_NW;
	nr = 10;
	condition = DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information = DIA_Addon_Myxir_WillYouTeachMe_Info;
	description = "�� ������ ������� ���� ����� ������?";
};


func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	B_Myxir_WillYouTeachMe();
};

