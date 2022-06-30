
instance DIA_Keroloth_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_EXIT_Condition;
	information = DIA_Keroloth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Keroloth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


func void B_Keroloth_GetLost()
{
	AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//�� ���������� ����! ����������!
	AI_StopProcessInfos(self);
};

instance DIA_Keroloth_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 2;
	condition = DIA_Keroloth_HELLO_Condition;
	information = DIA_Keroloth_HELLO_Info;
	permanent = FALSE;
	description = "�� ���������� �����?";
};


func int DIA_Keroloth_HELLO_Condition()
{
	return TRUE;
};

func void DIA_Keroloth_HELLO_Info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//�� ���������� �����?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//��. ����� ��� ���� ���, ��� ��� ����, �������, ������� �����, ��� ����������� ������ ���.
};


instance DIA_Keroloth_WantTeach(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 3;
	condition = DIA_Keroloth_WantTeach_Condition;
	information = DIA_Keroloth_WantTeach_Info;
	permanent = FALSE;
	description = "�� ������ ������� � ����?";
};


func int DIA_Keroloth_WantTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_HELLO))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_WantTeach_Info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//�� ������ ������� � ����?
	if(Keroloths_BeutelLeer == FALSE)
	{
		AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//�������. � �������� ����.
		AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//��, ����� �������, ���� ����������� ������� ������, ���� �� ������ ������ �����.
		AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//�������� � ������ �������. �� �������� ����.
		Keroloth_TeachPlayer = TRUE;
		if(!Npc_KnowsInfo(other,DIA_Sengrath_Perm) && !Npc_KnowsInfo(other,DIA_Garond_Equipment) && !Npc_KnowsInfo(other,DIA_Tandor_Hallo) && !Npc_KnowsInfo(other,DIA_Dobar_Waffe))
		{
			Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
			B_LogEntries(TOPIC_Teacher_OC,"������� ��������� �������� � �����.");
			Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
			B_LogNextEntry(TOPIC_Trader_OC,"������ ������� ������ � �����.");
		}
		else
		{
			if(!Npc_KnowsInfo(other,DIA_Sengrath_Perm))
			{
				Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
				B_LogEntry(TOPIC_Teacher_OC,"������� ��������� �������� � �����.");
			};
			if(!Npc_KnowsInfo(other,DIA_Garond_Equipment) && !Npc_KnowsInfo(other,DIA_Tandor_Hallo) && !Npc_KnowsInfo(other,DIA_Dobar_Waffe))
			{
				Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
				B_LogEntry(TOPIC_Trader_OC,"������ ������� ������ � �����.");
			};
		};
	}
	else
	{
		B_Keroloth_GetLost();
	};
};


var int DIA_Keroloth_Teacher_permanent;
var int DIA_Keroloth_TeachState_1H;
var int DIA_Keroloth_TeachState_2H;

func void B_Keroloth_TeachNoMore()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//������ ����� ������� ������ ������ ������ ���� ������.
};

func void B_BuildLearnDialog_Keroloth()
{
	Info_ClearChoices(DIA_Keroloth_Teacher);
	Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
	if(VisibleTalentValue(NPC_TALENT_2H) < TeachLimit_2H_Keroloth)
	{
		Info_AddChoice(DIA_Keroloth_Teacher,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Keroloth_Teacher_2H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Keroloth_Teacher_2H_5);
		DIA_Keroloth_TeachState_2H = 1;
	}
	else
	{
		if(DIA_Keroloth_TeachState_2H != 2)
		{
			if((VisibleTalentValue(NPC_TALENT_2H) < 100) && (DIA_Keroloth_TeachState_1H != 2))
			{
				if(DIA_Keroloth_TeachState_2H != 0)
				{
					PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_2H_Keroloth)),-1,53,FONT_Screen,2);
					B_Keroloth_TeachNoMore();
				};
			};
		};
		DIA_Keroloth_TeachState_2H = 2;
	};
	if(VisibleTalentValue(NPC_TALENT_1H) < TeachLimit_1H_Keroloth)
	{
		Info_AddChoice(DIA_Keroloth_Teacher,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
		DIA_Keroloth_TeachState_1H = 1;
	}
	else
	{
		if(DIA_Keroloth_TeachState_1H != 2)
		{
			if((VisibleTalentValue(NPC_TALENT_1H) < 100) && (DIA_Keroloth_TeachState_2H != 2))
			{
				if(DIA_Keroloth_TeachState_1H != 0)
				{
					PrintScreen(ConcatStrings(PRINT_NoLearnMAXReached,IntToString(TeachLimit_1H_Keroloth)),-1,53,FONT_Screen,2);
					B_Keroloth_TeachNoMore();
				};
			};
		};
		DIA_Keroloth_TeachState_1H = 2;
	};
	if((RealTalentValue(NPC_TALENT_1H) >= TeachLimit_1H_Keroloth) && (RealTalentValue(NPC_TALENT_2H) >= TeachLimit_2H_Keroloth))
	{
		DIA_Keroloth_Teacher_permanent = TRUE;
	};
	if((DIA_Keroloth_TeachState_1H == 2) && (DIA_Keroloth_TeachState_2H == 2))
	{
		PrintScreen(PRINT_NoLearnTotalMAXReached,-1,53,FONT_Screen,2);
		AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//�� ����� �����. ��� ������ ������ ����� ����.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Keroloth_Teacher(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 99;
	condition = DIA_Keroloth_Teacher_Condition;
	information = DIA_Keroloth_Teacher_Info;
	permanent = TRUE;
	description = "� ���� �������������!";
};


func int DIA_Keroloth_Teacher_Condition()
{
	if((Keroloth_TeachPlayer == TRUE) && (DIA_Keroloth_Teacher_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Teacher_Info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//� ���� �������������!
	if(Keroloths_BeutelLeer == FALSE)
	{
		B_BuildLearnDialog_Keroloth();
	}
	else
	{
		B_Keroloth_GetLost();
	};
};

func void DIA_Keroloth_Teacher_Back()
{
	Info_ClearChoices(DIA_Keroloth_Teacher);
};

func void DIA_Keroloth_Teacher_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,TeachLimit_1H_Keroloth))
	{
		B_BuildLearnDialog_Keroloth();
	};
};

func void DIA_Keroloth_Teacher_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,TeachLimit_1H_Keroloth))
	{
		B_BuildLearnDialog_Keroloth();
	};
};

func void DIA_Keroloth_Teacher_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,TeachLimit_2H_Keroloth))
	{
		B_BuildLearnDialog_Keroloth();
	};
};

func void DIA_Keroloth_Teacher_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,TeachLimit_2H_Keroloth))
	{
		B_BuildLearnDialog_Keroloth();
	};
};

instance DIA_Keroloth_Udar(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 4;
	condition = DIA_Keroloth_Udar_Condition;
	information = DIA_Keroloth_Udar_Info;
	permanent = FALSE;
	description = "��� ������ �������� ���?";
};


func int DIA_Keroloth_Udar_Condition()
{
	if(Keroloth_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Udar_Info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//��� ������ �������� ���?
	if(Keroloths_BeutelLeer == FALSE)
	{
		AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//��� ������ ����?
		AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//�� ������ ������� ���� ���?
		AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//���, �� �� ������ ��������� �����. �� ������� - ���, �� ������ ����������, ��������� � ����.
		Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC,"���� �� ����� ������ �������� ����� ��� �� ���������.");
	}
	else
	{
		B_Keroloth_GetLost();
	};
};


instance DIA_Keroloth_KAP4_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 40;
	condition = DIA_Keroloth_KAP4_HELLO_Condition;
	information = DIA_Keroloth_KAP4_HELLO_Info;
	description = "� ���� ����� ������������ ���...";
};


func int DIA_Keroloth_KAP4_HELLO_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_HELLO_Info()
{
	DIA_Common_YouLookSoSad();
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(�����������) ���� ��� ��������. ��� ���� �����: ���� �� ������� �� ����� �����.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//���� �����������, � ��� - ������� ��� �����. ��� �������!
//	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,Dialog_Back,DIA_Keroloth_KAP4_HELLO_ende);
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"���������! ������� �� ������ ��� ������ �������� �� ����.",DIA_Keroloth_KAP4_HELLO_ruhig);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"� ���� ���-�� ������?",DIA_Keroloth_KAP4_HELLO_bestohlen);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"��� �� �������?",DIA_Keroloth_KAP4_HELLO_pack);
};


func void DIA_Keroloth_KAP4_HELLO_ende()
{
	DIA_Common_IHaveToGo_v2();
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//����� � �������� �� ����...
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//� ���� ���-�� ������?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//���. ��� �������� 20 ������� � ��� ������. ������� ��, ���� ��������, ��, �����!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//������, ��� ����� � �������� �� ���� �������...
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"��� ��� � ���� �������?",DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,Dialog_Ende_v2,DIA_Keroloth_KAP4_HELLO_ende);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//��� ��� � ���� �������?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//��� �������, �� ����� ����� ������������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//��� ������!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//�� ���-������ ��������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//����� � �������� �� ����...
	Log_CreateTopic(TOPIC_KerolothsGeldbeutel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel,LOG_Running);
	B_LogEntry(TOPIC_KerolothsGeldbeutel,"������� ������� ������� ���� �������. �� ����������, ��� ��� ������ �������� �� ��������.");
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//��� �� �������?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//��, ���������, �������� �� ��������, �������. ��� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//���� �����, ���������� ���� ���������� �� ��������, �������. � ���� ���, ��� �� �������, � ���� ����� � ����?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(���� ��� ���) ����� ���� ����������, ��� � ���� ������.
};

func void DIA_Keroloth_KAP4_HELLO_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//���������! ������� �� ������ ��� ������ �������� �� ����.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//�� � �� ���� �������������. ��� ���� ��� ��� ����������, ����!
};


instance DIA_Keroloth_KAP4_GELDGEFUNDEN(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 42;
	condition = DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information = DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;
	description = "� �����, � ����� ���� �������.";
};


func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_KAP4_HELLO) && (Npc_HasItems(other,ItMi_KerolothsGeldbeutel_MIS) || Npc_HasItems(other,ItMi_KerolothsGeldbeutelLeer_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//� �����, � ����� ���� �������.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP(XP_KerolothsGeldbeutel);
	if(B_GiveInvItems(other,self,ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//������� ����. ����� ������ ������� ���?
		Keroloths_BeutelLeer = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//���? ���? ����� ������� ������ ���?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"�������. � ��� ������ �������?",DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn);
	};
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"���. �� ��� ��� ���, � �������.",DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"� ���������� ������ �������� �� ��������.",DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"������ ��� �����?",DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//������ ��� �����?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//�� ��������� ������ ����? ��� ���� ��� ��, ���������.
		Info_ClearChoices(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"� ���������� ������ �������� �� ��������.",DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"������� ��� �������.",DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//������ ��� ��� �����!
		DIA_Common_YeahJustRelax();
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//�� � �� ���� �������������. ��� ���� ��� ��� ����������, ����!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//� ��� ��� ������.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//������� ��� �������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//� ������ ����, ��� �������� � ������� �����!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//� ���������� ������ �������� �� ��������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//(���) � ���� ���.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//��, �������, � ������ ���� ������...
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//(�����) �� ������ �� ������ ������� � �����.
	};
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	if(!Npc_IsDead(Ferros))
	{
		if(Npc_GetDistToNpc(self,Ferros) <= 2000)
		{
			B_Attack(self,Ferros,AR_NONE,1);
		};
	}
	else if(!Npc_IsDead(Jan))
	{
		if(Npc_GetDistToNpc(self,Jan) <= 2000)
		{
			B_Attack(self,Jan,AR_NONE,1);
		};
	}
	else if(!Npc_IsDead(Rethon))
	{
		if(Npc_GetDistToNpc(self,Rethon) <= 2000)
		{
			B_Attack(self,Rethon,AR_NONE,1);
		};
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//���. �� ��� ��� ���, � �������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//���? � �������? ��, ������ ����, ����� ��� �� ������� ������-������ �������� �� ��������. ������ �� ������ ���, ��� ��� �� ���.
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//�������. � ��� ������ �������?
	if(Keroloths_BeutelLeer == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//��� ���� ��������� �����. ��, ������, ����� �� ������� �� �����, �?
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//�-��. ������. ��� ��������� �����. � ������ ����� ���, ��� ������ ���?
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};


instance DIA_Keroloth_KAP4_BELOHNUNG(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 43;
	condition = DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information = DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent = TRUE;
	description = "� ���� �������� ������� ������������ �� ��� �������.";
};


func int DIA_Keroloth_KAP4_BELOHNUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_KAP4_GELDGEFUNDEN) && (Keroloth_HasPayed == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//� ���� �������� ������� ������������ �� ��� �������.
	if((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//��, � �������� �������� ���� � �������!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//��� ���, ��� ���� �����? ��� ���� �����. � ������ ����������.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};


instance DIA_Keroloth_KAP4_ENTSPANNDICH(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 44;
	condition = DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information = DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent = TRUE;
	description = "����������.";
};


func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Keroloth_KAP4_GELDGEFUNDEN) && (Kapitel >= 4)) || (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//����������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//��, ������. � ���������.
	}
	else if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//� �� ���� �������� ���, �� ��� �������, ��� �� ���������, ������� ������ ������.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//�� ��������� �� ���!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//�� ���� ������� ���� ������� �����, ����� ���?
		B_Keroloth_GetLost();
	};
};

