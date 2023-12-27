
instance ItWr_Addon_Hinweis_02(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[0] = "�� ������� � ���������� ������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Hinweis_02()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�����,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ������ � �������. ��������, ��� ����� �������� �����.");
	Doc_PrintLines(nDocID,0,"�� ��� ��� ���� - ���� �� ����� ������ ������ � ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ������ ���, ������ ������� ���� ��.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����");
	Doc_Show(nDocID);
	EnteredBanditsCamp = TRUE;
};


instance ItWr_Addon_Health_04(C_Item)
{
	name = "������ ����� ������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = name;
	text[0] = "��� �������� ����� �������� �����";
	text[1] = "���������� ������ ������� ��������� ��������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Heilrezept_04()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ��������� �����:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ���� ������� ����� � ��� �������� ��������.");
	Doc_PrintLines(nDocID,0,"���������� � ������ �������� ������� ��������� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ������� ������ �������, ������� ������ ��������� ��������.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� ��������': 1 ������� ����� � 3 �������� ��������.");
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
		};
	};
};


instance ItWr_Addon_Mana_04(C_Item)
{
	name = "������ ����� ������ ����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1500;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = name;
	text[0] = "��� �������� ����� �������� �����";
	text[1] = "���������� ������ ������� �������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Manarezept_04()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ����� ����:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ���� ������� ����� � ��� �������� ����.");
	Doc_PrintLines(nDocID,0,"���������� � ������ �������� ������� �������� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ������� ������ �������, ������� ������ �������� ����.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������ ����': 1 ������� ����� � 3 �������� ����.");
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
		};
	};
};


instance ItWr_Addon_Hinweis_01(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[0] = "������������� � ������ � �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Hinweis_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�����,");
	Doc_PrintLines(nDocID,0,"� ���� �������� ��������� ���������������� �����.");
	Doc_PrintLines(nDocID,0,"�� ������������ ��� ����. �� ��������������� �� ����� ������ � ������ ������� �������������");
	Doc_PrintLines(nDocID,0,"� � �������� ��������.");
	Doc_PrintLines(nDocID,0,"�������, ��� ����� �������������� ����� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������");
	Doc_Show(nDocID);
};


instance ItWr_Addon_William_01(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[0] = "������� �� ���� ������ �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_William_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������,");
	Doc_PrintLines(nDocID,0,"� ���������� � ������� ������.");
	Doc_PrintLines(nDocID,0,"���������� ��������� ������, �� ���� ���������!");
	Doc_PrintLines(nDocID,0,"���� �� ������� �� ������, �� ������� ����� �� �����.");
	Doc_PrintLines(nDocID,0,"������ ������� ��������� �� ������ ������� ������ �� ������.");
	Doc_PrintLines(nDocID,0,"������ �� ������� ��������� ����� �� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� �����.");
	Doc_Show(nDocID);
	if(FoundDeadWilliam == FALSE)
	{
		if(Sklaven_Flucht == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
		};
		B_LogEntry(TOPIC_Addon_MissingPeople,"����� �� �������� ������ �����. � ����� ��� ���� � ���������.");
		FoundDeadWilliam = TRUE;
	};
};


instance ItWr_Addon_MCELIXIER_01(C_Item)
{
	name = "������ �������� ��������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ����� �������� ������������ ������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_MCELIXIER_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,NAME_Geist);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� �������� ����� �������� ��������� ������ �� ��� ���� �������� ���.");
	Doc_PrintLines(nDocID,0,"� ���� ����� �������� ���� �������� ���� � ���� �������� ��������.");
	Doc_PrintLines(nDocID,0,"����������, ���������� � �������� ������� ������ �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ����� ����� ����������� ������ ������� �������, ��������� ������� ��������������� ������� �� ��� �������� ���.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Knows_MCELIXIER == FALSE)
		{
			Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ��������� ��������': 2 ���� �������� ����, 1 �������� ����, 1 �������� �������� � 1 ������� ������ �����.");
			Knows_MCELIXIER = TRUE;
		};
	};
};


instance ItWr_Addon_Pirates_01(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[0] = "������� � ������� ������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Pirates_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������,");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ��������� �������, ��������������� ��� ���.");
	Doc_PrintLines(nDocID,0,"����� ��������� �� � ���� ������. � ������� ��� ���.");
	Doc_PrintLines(nDocID,0,"� ������� �� ��� ������� ������� ����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �������.");
	Doc_PrintLine(nDocID,0,"���");
	Doc_Show(nDocID);
};


instance ItWr_Addon_Joint_01(C_Item)
{
	name = "������ '�������� ����������'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[0] = "������� �� ������� �������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Joint_Rezept_01()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� ���������");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(...) ������ ����� �������� ������, �� � �������� ������ ��� ���������� ��� �� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� � ������ �������� ���� �������� ���� � ������� ������� �����, ��������� ����� � �������� '�������� ����������'.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"'������� ���������' �������� �� ����� ���� � ����������� �����.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Green_Extrem == FALSE)
		{
			Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ����������': 2 �������� ����� � 1 ������� �����.");
			EnteredBanditsCamp = TRUE;
			Green_Extrem = TRUE;
		};
	};
};


instance ItWr_Addon_Lou_Rezept(C_Item)
{
	name = "������ '������ ��'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 70;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLouRezept()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"����� ��");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����������� ��� ������������� ������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ������� ����, ��� ���� � ������� �������� �����.");
	Doc_PrintLines(nDocID,0,"�������� ����������� ��� �������� �����.");
	Doc_PrintLines(nDocID,0,"��������� ��� � �������, �������� ���� � ����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ������, ������������ ��� ���� ������, ������������, ��� ����� �� ������ ����������� ����� �����!");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_LousHammer == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������ ��': 1 ����, 2 ����, 1 �������� �����, 1 ��� �������� ����� � 1 ���.");
			Knows_LousHammer = TRUE;
		};
		Opened_LousHammer = TRUE;
	};
};


instance ItWr_Addon_Lou_Rezept2(C_Item)
{
	name = "������ �������� '������ ��'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 140;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLouRezept2()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� '����� ��'");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ������ ������ '����� ��' � ���������� ��� ��� ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ������� �������� ����������� ������ ����� ������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� �� ��� ��������� ��������, �� ������� ��������� � ���� �������� �����.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_Schlafhammer == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� �������� '������ ��': 1 '����� ��' � 1 ���.");
			Knows_Schlafhammer = TRUE;
		};
		Opened_Schlafhammer = TRUE;
	};
};


instance ItWr_Addon_Piratentod(C_Item)
{
	name = "������ '������� �������'";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseRezeptPiratentod()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"������� �������");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"����� ��� ��������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��� ������, ���������� ������� ����. �������� ������� ���� � ������ ����.");
	Doc_PrintLines(nDocID,0,"��� ������ �������� ������ ������, ������ ���� � �������� ����� �������������� �������-�����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���������! ��� ����� �������� ����� ������� ��������.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_SchnellerHering == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '������� �������': 1 ����, 1 ���, 1 ���� � 1 �������-�����.");
			Knows_SchnellerHering = TRUE;
		};
		Opened_SchnellerHering = TRUE;
	};
};


instance ItWr_MushroomMana(C_Item)
{
	name = "������ �������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseMushroomManaRecipe;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseMushroomManaRecipe()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� �������� ���������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ ����� ������� ���� �� ����, �� �������� ��������� �������� ������� �� �������� � ������� ����� ����������� ������ ����������.");
	Doc_PrintLines(nDocID,0,"���������� 50 ������ ������ � ���� ������� �����.");
	Doc_PrintLines(nDocID,0,"����� ��������� �� ����� � ������� ����� ����. ���������� ����� ����������� � � ���� ����������� ���������� � ������������ ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ����� ���������� ����� � ������� �� ����� ������, �� ��� ������� ���������.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_MushroomMana == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '�������� ���������': 50 ������ ������ � 1 ������� �����.");
			Knows_MushroomMana = TRUE;
		};
		Opened_MushroomMana = TRUE;
	};
};


instance ItWr_AppleSTR(C_Item)
{
	name = "������ ��������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAppleSTRRecipe;
	scemeName = "MAP";
	description = name;
	text[0] = PRINT_RequiresAlchemyTalent;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseAppleSTRRecipe()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������� ��������� ���������:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������, ������ ���� �� ���� ������� ��� ��������, �� ������� ��� ������� ����� ����� ������� �� �������� � ������� �� �� ������ ������ ��������.");
	Doc_PrintLines(nDocID,0,"���������� 25 ����� � ���� ������ �����.");
	Doc_PrintLines(nDocID,0,"������ ��������� �� ������ � �������, ����������� �� ������ ������ � ������� ����� ��������. ����� � ����� ���� �������� ��� �������������� ������ �����.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if(Npc_GetTalentSkill(hero,NPC_TALENT_ALCHEMY) && (Knows_AppleSTR == FALSE))
		{
			B_LogEntry(TOPIC_TalentAlchemy,"����������� ��� '��������� ���������': 25 ����� � 1 ������ �����.");
			Knows_AppleSTR = TRUE;
		};
		Opened_AppleSTR = TRUE;
	};
};


instance Fakescroll_Addon(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "����� ����������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ��� ������������ �����";
	text[1] = "������ ����� ���������� ����.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseAxtAnleitung()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,NAME_ItMw_Banditenaxt);
	Doc_SetFont(nDocID,0,FONT_Book);
//	Doc_PrintLine(nDocID,0,"������ ������ �����");
//	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"���� ����� ����� �������� �����, �������� � �������� ���������� ����.");
	Doc_PrintLines(nDocID,0,"���������� ��� ����� ����������� ����� �����, ���� ����� ���� � ��� ���� �����, �������� ��� ��������� �� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� �� ���������� ���� � ���� ������ �� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ����� ����� ����� � ������� ������������ ����.");
	Doc_Show(nDocID);
	if(Npc_IsPlayer(self))
	{
		if((Npc_GetTalentSkill(self,NPC_TALENT_SMITH) > 0) && (Knows_Banditenaxt == FALSE))
		{
			B_LogEntry(TOPIC_TalentSmith,"��� ����������� ������ ��� ����� 1 ����� ����, 3 ���� � 1 �������������� �������� ���������.");
			Knows_Banditenaxt = TRUE;
		};
		Opened_Banditenaxt = TRUE;
	};
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "����� �����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[0] = "� ������� ����� ������ ����� ������� �����������.";
};


func void UseSummonAncientGhost()
{
	if(SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			B_InitNpcGlobals();
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_CannotUse_Addon();
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ItWr_Map_AddonWorld(C_Item)
{
	name = "������� ������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_AW.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Map_AddonWorld()
{
	if(Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_AddonWorld);
	};
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(nDocID,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(nDocID,-47783,36300,43949,-32300);
	Doc_Show(nDocID);
};

