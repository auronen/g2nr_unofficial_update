
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLP,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	if(PremiumTeachersEnabled == TRUE)
	{
		if(!B_GiveInvItems(oth,slf,ItMi_Gold,kosten * PremiumTeachersPrice))
		{
			PrintScreen(Print_NotEnoughGold,-1,-1,FONT_Screen,2);
			DIA_Common_WeWillGetToThatLater();
			return FALSE;
		};
	};
	oth.lp -= kosten;
	if(!Npc_GetTalentSkill(oth,NPC_TALENT_ALCHEMY))
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		Log_AddEntry(TOPIC_TalentAlchemy,"����� ������� �����, ��� ����� ������ �������� � ����������� ��� ����� ����� �����������. �� ���� ������������ � ���� ����������� ����� �� ������������ �����.");
	};
	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ��������': 2 �������� ����� � 1 ������� �����.");
	}
	else if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '��������� ���������': 2 �������� �������� � 1 ������� �����.");
	}
	else if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '��������� ��������': 2 �������� ����� � 1 ������� �����.");
	}
	else if(potion == POTION_Health_04)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� ��������': 1 ������� ����� � 3 �������� ��������.");
	}
	else if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 2 �������� ������� � 1 ������� �����.");
	}
	else if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '��������� ����': 2 �������� ����� � 1 ������� �����.");
	}
	else if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 2 �������� ����� � 1 ������� �����.");
	}
	else if(potion == POTION_Mana_04)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������ ����': 1 ������� ����� � 3 �������� ����.");
	}
	else if(potion == POTION_MegaDrink)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� ��������': 10 ��������� ���, 1 ������ ��������� � 1 ����.");
	}
	else if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '����� ���������': 1 �������-����� � 1 ������� �����.");
	}
	else if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 1 �������� ������ � 1 ������� ������.");
	}
	else if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ��������': 1 ���������� ����� � 1 ������� ������.");
	}
	else if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����': 1 �������� ������ � 1 ������� ������.");
	}
	else if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� �����': 1 �������� ������ � 1 ������� ������.");
	};
	if((Opened_LousHammer == TRUE) && (Knows_LousHammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������ ��': 1 ����, 2 ����, 1 �������� �����, 1 ��� �������� ����� � 1 ���.");
		Knows_LousHammer = TRUE;
	};
	if((Opened_Schlafhammer == TRUE) && (Knows_Schlafhammer == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� �������� '������ ��': 1 '����� ��' � 1 ���.");
		Knows_Schlafhammer = TRUE;
	};
	if((Opened_SchnellerHering == TRUE) && (Knows_SchnellerHering == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� �������': 1 ����, 1 ���, 1 ���� � 1 �������-�����.");
		Knows_SchnellerHering = TRUE;
	};
	if((Opened_MushroomMana == TRUE) && (Knows_MushroomMana == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ���������': 50 ������ ������ � 1 ������� �����.");
		Knows_MushroomMana = TRUE;
	};
	if((Opened_AppleSTR == TRUE) && (Knows_AppleSTR == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '��������� ���������': 25 ����� � 1 ������ �����.");
		Knows_AppleSTR = TRUE;
	};
	if((Opened_MegaDrink == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE))
	{
		B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� ��������': 10 ��������� ���, 1 ������ ��������� � 1 ����.");
		PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
	};
	PrintScreen(PRINT_LearnAlchemy,-1,-1,FONT_Screen,2);
	return TRUE;
};

