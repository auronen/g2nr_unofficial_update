
var int DIA_Myxir_Teach_NoPerm;

func void B_Myxir_WillYouTeachMe()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//�� ������ ������� ���� ����� ������?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//�������, ������ ���? � � �������� �������� � ����� ������ ��������.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntries(TOPIC_Addon_Stoneplates,LogText_Addon_MyxirTeach);
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogNextEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
	Myxir_Addon_TeachPlayer = TRUE;
};

func void B_BuildLearnDialog_Myxir()
{
	Info_ClearChoices(DIA_Myxir_Teach);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	{
		Info_AddChoice(DIA_Myxir_Teach,Dialog_Back,DIA_Myxir_Teach_BACK);
		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//��, ������ � ����-������ ��������. � ������ ������� �������� ������ ��������.
			Info_AddChoice(DIA_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Myxir_Teach_LANGUAGE_1);
		}
		else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//�� ��� ������ � ������ ��������. ���� ������ ������� ����� ������.
			Info_AddChoice(DIA_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Myxir_Teach_LANGUAGE_2);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//������� ����� ������ ������ ������. �� � � �������� ����� ���� ���.
			Info_AddChoice(DIA_Myxir_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Myxir_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//������ ��� ������ ���� ��������. �� ������ ���� ������.
		DIA_Myxir_Teach_NoPerm = TRUE;
	};
};

instance DIA_Myxir_Teach(C_Info)
{
	nr = 90;
	condition = DIA_Myxir_Teach_Condition;
	information = DIA_Myxir_Teach_Info;
	permanent = TRUE;
	description = "����� ���� ����� �����.";
};


func int DIA_Myxir_Teach_Condition()
{
	if((Myxir_Addon_TeachPlayer == TRUE) && (DIA_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Myxir_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//����� ���� ����� �����.
	Myxir_Merke_Language = Npc_GetTalentSkill(other,NPC_TALENT_FOREIGNLANGUAGE);
	B_BuildLearnDialog_Myxir();
};

func void DIA_Myxir_Teach_BACK()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_FOREIGNLANGUAGE) > Myxir_Merke_Language)
	{
		AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//����� � ������� ���� ����� ������. �� �������, ��� ��������� ����� ������ ������ �� �������� ��� ���� ������.
	};
	Info_ClearChoices(DIA_Myxir_Teach);
};

func void DIA_Myxir_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//��� �������, ������, ���������� �� ����� ��������, ������� � ����� �����, � ������ ���������, ��� ������, ������, ������ ����.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//��� - �������� ���� ������. �� ������� �������� ����������� �������, ������� ������� �����, ���� ��� �������.
		B_BuildLearnDialog_Myxir();
	};
};

func void DIA_Myxir_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//������, ���������� �� ����� ������, � �������� �������� ���� � ������. �� ������� ���-��� ��������.
		B_BuildLearnDialog_Myxir();
	};
};

func void DIA_Myxir_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//������ �������, ��������� �����, ����������� ������� � ����� ����������, �������� �� ����� ������.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//������ �� ���� ������� - ��������� ���������, ����, �������, �� ������� ��� ������.
		B_BuildLearnDialog_Myxir();
	};
};

func void B_AssignMyxirTeach(var C_Npc slf)
{
	DIA_Myxir_Teach.npc = Hlp_GetInstanceID(slf);
};

