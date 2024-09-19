
const int STRDEX_PotionOfDeath = 5;
const int AM_AmulettOfDeathProt = 30;

instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_XardasLetterToOpenBook()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"� �������, ��� ���� �� �������� � ������ �������� ������� ���������� ���.");
	Doc_PrintLines(nDocID,0,"� ��������.");
	Doc_PrintLines(nDocID,0,"���� ��� ������ ���, ��� � �����������, �� ������ ������ ������ ������� ��������.");
	Doc_PrintLines(nDocID,0,"� �����, ��� �� ����� ��������, ���������� ��� ����������� ���� ���������.");
	Doc_PrintLines(nDocID,0,"� ������ ��� ����������, ������ ������ ��� ������ ���������� ��.");
	Doc_PrintLines(nDocID,0,"�� ������ ������� �� ����!");
	Doc_PrintLines(nDocID,0,"��� ����� ��������� ����� '����� �������'. ������ �� ������ �� ����!");
	Doc_PrintLines(nDocID,0,"� ���� ������ ���� ����� ������ ����.");
	Doc_PrintLines(nDocID,0,"� �� ����� ������ ���� � ����� ��������� ������. ������ �� ������ ���������� �������� ���.");
	Doc_PrintLines(nDocID,0,"�� ��� ����������!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"                             �������");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ���� ������ ������� ������� ��� �����, ����������� ����� ������� ��������.");
		MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
	};
};


instance ItKe_MonastarySecretLibrary_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ����� '������� ��������'.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItWr_HallsofIrdorath_MIS(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	on_state[0] = Use_HallsofIrdorath;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_MIS,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_MIS,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_MIS,1);
		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ���� ������� ����� ��������. � ��� ���������� ��������� ��������� � �������� ����. ��� �����, ��� ��� ����� ����� � � ������������ ��������.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_MIS,1);
		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_MIS(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_HallsofIrdorath_Open;
};


func void Use_HallsofIrdorath_Open()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... � � ������ ���� � ���������� ��������� ������, ����� �������� ��� ������ � ������ �������.");
	Doc_PrintLines(nDocID,0,"���� �� ��� ������ ������ �� ���� �������, ��� ������, ��������, ���������� �� ��.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"� ������ ��� ����� ������ ��, ��� ��� ����� �����-�� ������������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�� ������ ������, � ������ ���������� ���� �������� ��� ����������.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"���� ���� ��������� ��������� �����.");
	Doc_Show(nDocID);
	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"� ������ ����� ��������. � ��� ����������� ��������� ����������. ��� ������ ���� ���-�� �����, � �������� ���������.");
		ItWr_SCReadsHallsofIrdorath = TRUE;
	};
};


instance ItWr_XardasSeamapBook_MIS(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_XardasSeamapBook_MIS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = Use_XardasSeamapBook_MIS;
};


func void Use_XardasSeamapBook_MIS()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"... ������ � ����� ������, ��� ������, � ������� ���� ���� - ������� ��������. ��� ��������� �� �������, �������� �� ������ ��������. ������� ������� � ���� ������ ������ �������� ...");
	Doc_PrintLine(nDocID,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"... ��� ��� �������, ���, ������, ��� ���� ���� �� �������� ��� ����-������. ��� ���������� �������� ����� ������, � � ���� ����� ������ ����������. ���� �� ��� ����� � ��� ����. ��� �������� ������ ���������, ��� ������ �� ����������� ��� ����������� ����� ...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"... ���������� �������, ������, �� �� ��� �� ���������. � ����� ��� ������� � ��������� ��� ���� � ������ �������. ����� � ��� ����� ������� ������ �������. � ������ ���� ������������, ����������� ������������� ����. ���������� �� ����������� �� ��������� � ���������, ��� ��������� ������ ����� �� ...");
	}
	else if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"... � �������� ���� �������� ���������� ���������! ����� ��������� ������, ��� ����������� ��� ������, ������� �� ������ ����. ������ ��� ����� �����. ��� ������� ��������� ��������� ������ ����������, ������� � ������� �����, �� ������ ������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"� �������, ��� ��������� ����� �������� �� ����� �����, ������� � ������� � ���� ��������� ���������� ��� ����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... ������ � ������. �� �� ����� ����������� ������. ��� ������ ������ �����������, ��� ���������� �����, �� ���������� � ���������� ����� ������ ��������� ����� � ���� ����. � ������ ����� ����������, ����� ��� ���� �����.");
	}
	else if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"... � ����� �����, ����� �� ������ ����. ������, ������ � ���� ���� ���������������� ��� ��������. ��� ������ ����, ������, ���������� ��. ��������� ������, � ��� ���������� ��������� � ������ �����. ��� ����� ����� ��� ��� ���, �� �� �����, ������, ��� ������.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLines(nDocID,1,"� �� �� ���� ������, ����� ���� � ��������� �� ���, ��� ������ ����� ������ ���� � ���� ����.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"... � ������ ������� �������� � ����� � ���, ��� ������� ����������� ������ ������� ����������� ��������. ������, � ������� �� ����, ��� ��������� ����������� �����������. � ������� ������ � ���������, ���, �� ������ ������. ��� �����, ����� ����� �������� � ����� ������� - ����� ����, ���� ��������.");
	};
	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_MIS(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_MIS;
	scemeName = "MAP";
	description = name;
	text[0] = "�� ����� '������� ��������'.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseItWr_UseLampIdiot_MIS()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"               ����� ����� ����");
	Doc_PrintLine(nDocID,0,"               ������ �������.");
	Doc_Show(nDocID);
};


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = "������� ����� ������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_DI.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Seamap_Irdorath()
{
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",TRUE);
	Doc_Show(nDocID);
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Crew,LOG_MISSION);
		Log_SetTopicStatus(Topic_Crew,LOG_Running);
		B_LogEntries(Topic_Crew,"��� ����������� �� ������� � ��������� �������� ��� ����� �������.");
		Log_CreateTopic(Topic_Captain,LOG_MISSION);
		Log_SetTopicStatus(Topic_Captain,LOG_Running);
		B_LogNextEntry(Topic_Captain,"��� ���������� �������� ��� ����� ������� �������, ������� ����������� �� ���� � ������� �����������.");
		if(MIS_ShipIsFree == FALSE)
		{
			Log_CreateTopic(Topic_Ship,LOG_MISSION);
			Log_SetTopicStatus(Topic_Ship,LOG_Running);
			B_LogNextEntry(Topic_Ship,"������, � ������ ��������� �� ����� ��������� ���������� �������. �� ��� ����� ��� ����� �������.");
		};
		if(Kapitel < 6)
		{
			B_Say(self,self,"$IRDORATHTHEREYOUARE");
		};
		MIS_SCKnowsWayToIrdorath = TRUE;
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
};


instance ItWr_ForgedShipLetter_MIS(C_Item)
{
	name = "����������� �������������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = name;
	text[0] = "������ � ������������� ����������";
	text[1] = "�� ������������ �������� ���������.";
};


func void UseItWr_ForgedShipLetter_MIS()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�������������� ����������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"���� �������� �������� ������������ ������ �������� ������������� ����������� ������� ������� ����� ������ � ������� ��������������� ������� �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    ����������� ������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItKe_OC_MainGate_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� ����� ������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Ship_Levelchange_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� ����������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItPo_PotionOfDeath_01_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItPo_Special_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "����� ������";
	text[1] = PRINT_UnknownEffect;
};


func void UseItPo_PotionOfDeath()
{
	if(self.guild == GIL_KDF)
	{
		if(C_NpcIsHero(self))
		{
			ATR_PermBonus[ATR_STRENGTH] += STRDEX_PotionOfDeath;
			ATR_PermBonus[ATR_DEXTERITY] += STRDEX_PotionOfDeath;
		};
		self.attribute[ATR_STRENGTH] += STRDEX_PotionOfDeath;
		PrintScreen(ConcatStrings(PRINT_LearnSTR,IntToString(STRDEX_PotionOfDeath)),-1,43,FONT_Screen,3);
		self.attribute[ATR_DEXTERITY] += STRDEX_PotionOfDeath;
		PrintScreen(ConcatStrings(PRINT_LearnDEX,IntToString(STRDEX_PotionOfDeath)),-1,48,FONT_Screen,3);
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed,-1,53,FONT_Screen,3);
		Mdl_ApplyOverlayMdsTimed(self,"Humans_Sprint.mds",Time_Speed);
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",self,self,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	}
	else
	{
		self.aivar[AIV_ReadyForPainfulDeath] = TRUE;
		AI_StartState(self,ZS_MagicFreeze,0,"");
	};
};


instance ItPo_PotionOfDeath_02_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItPo_Special_03.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "����� ������";
	text[0] = "��� ����� �������� ����� ���� ������� �������������.";
	text[1] = "����� ������ ��������� ���, ������ ���� ������.";
};

instance ItAm_AmulettOfDeath_MIS(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_AmulettOfDeath_MIS.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_MIS;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_MIS;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "������������ ���� ������";
	text[0] = "���� ������ �������� ��������� �� ���� ���� �����.";
	text[1] = NAME_Prot_Edge;
	count[1] = AM_AmulettOfDeathProt;
	text[2] = NAME_Prot_Point;
	count[2] = AM_AmulettOfDeathProt;
	text[3] = NAME_Prot_Fire;
	count[3] = AM_AmulettOfDeathProt;
	text[4] = NAME_Prot_Magic;
	count[4] = AM_AmulettOfDeathProt;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void Equip_ItAm_AmulettOfDeath_MIS()
{
	self.protection[PROT_EDGE] += AM_AmulettOfDeathProt;
	self.protection[PROT_BLUNT] += AM_AmulettOfDeathProt;
	self.protection[PROT_POINT] += AM_AmulettOfDeathProt;
	self.protection[PROT_FIRE] += AM_AmulettOfDeathProt;
	self.protection[PROT_MAGIC] += AM_AmulettOfDeathProt;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_MIS()
{
	self.protection[PROT_EDGE] -= AM_AmulettOfDeathProt;
	self.protection[PROT_BLUNT] -= AM_AmulettOfDeathProt;
	self.protection[PROT_POINT] -= AM_AmulettOfDeathProt;
	self.protection[PROT_FIRE] -= AM_AmulettOfDeathProt;
	self.protection[PROT_MAGIC] -= AM_AmulettOfDeathProt;
};


instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItPo_HealRandolph.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "��������� �� ��������";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};

