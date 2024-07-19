
instance StatsBook(C_Item)
{
	name = "����� ����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_Stats.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_StatsBook;
};


func void Use_StatsBook()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Blue_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Blue_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,0,270,20,30,20,1);
	Doc_PrintLine(nDocID,0,ConcatStrings("�����:              ����� ",IntToString(Kapitel)));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_Draconian)," �����-������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_Dementor)," ������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_OrcElite)," ������� �����"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Stats_Killed_OrcCommander)," ������������� �����"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(MadKillerCount)," �������� �����"));
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������������:");
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalApplesEaten)," �����"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalMushroomsEaten)," ������ ������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalDexEaten)," ���������� ����"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalStrEaten)," ��������� ������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalPermEaten)," ������� �������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Shell_Opener)," ���������"));
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������:");
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalStoneplatesForVatras)," �������� �������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(OldCoinCounter)," ����� �������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalSwampHerbsForFortuno)," �������� ���� �������"));
	Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(TotalSilverForHalvor)," ������� �������"));
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(BusterTrophyCounter)," ����� �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(DragonEggCounter)," ��� �������"));
	}
	else if(hero.guild == GIL_KDF)
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(AlmanachCounter)," ���������� ��������"));
	}
	else if(hero.guild == GIL_PAL)
	{
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(OrkRingCounter)," ����� ������"));
	};
	Doc_PrintLine(nDocID,0,"");
	if(Player_IsApprentice == APP_Constantino)
	{
		Doc_PrintLine(nDocID,0,"������� (�����������):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Constantino_DunkelpilzCounter)," ������ ������ �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(Constantino_BigMushroomsCounter)," ���� �������� �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	}
	else if(Player_IsApprentice == APP_Bosper)
	{
		Doc_PrintLine(nDocID,0,"������� (������):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(BosperFurCounter)," ���� �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	}
	else if(Player_IsApprentice == APP_Harad)
	{
		Doc_PrintLine(nDocID,0,"������� (�����):");
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(AnyAnvilUsed)," ����� ��������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(HaradSwordsCounter)," ����� �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ApprenticeGoldCounter),PRINT_GoldTaken));
	};
	Doc_SetMargins(nDocID,-1,10,20,275,20,1);
	Doc_PrintLine(nDocID,1,"������� ������:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_GoldGiven),PRINT_GoldGiven));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_Str)," ���� ��������"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_Dex)," �������� ��������"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_MaxHp)," ����. �������� ��������"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Blessings_MaxMana)," ����. ���� ��������"));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"������� �������:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_HpGiven)," ����. �������� ������"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_ManaGiven)," ����. ���� ������"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_GoldTaken),PRINT_GoldTaken));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"��������� �����:");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(Stats_Beliar_ClawMaxHp)," ����. �������� ������"));
	if(Saturas_KlaueInsMeer == FALSE)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(BeliarWeapCurrentLvL)," �������"));
	}
	else
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(BeliarWeapCurrentLvL)," ������� (���������)"));
	};
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalThefts)," �������� ����"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftXP)," ����� � ����"));
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalTheftGold)," ������� ��������"));
	if(UnionActivated == TRUE)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalLocksPicked)," ������ ��������"));
	};
	Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TotalOldCampCrimes + TotalCityCrimes + TotalMonasteryCrimes + TotalFarmCrimes)," ������� ���������"));
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,ConcatStrings("������: ",B_BuildFullVersionString(FIX_VERSION,FIX_DATE_DAY,FIX_DATE_MONTH,FIX_DATE_YEAR)));
	if(FIX_VERSION_SAVE == FALSE)
	{
		if(Addon_zuerst == TRUE)
		{
			Doc_PrintLine(nDocID,1,"���� ������ � ���������");
		}
		else
		{
			Doc_PrintLine(nDocID,1,"���� ������ ��� ������");
		};
	}
	else
	{
		Doc_PrintLine(nDocID,1,ConcatStrings("����������: ",B_BuildFullVersionString(FIX_VERSION_SAVE,FIX_DATE_DAY_SAVE,FIX_DATE_MONTH_SAVE,FIX_DATE_YEAR_SAVE)));
	};
	if(UnionActivated == FALSE)
	{
		Doc_PrintLine(nDocID,1,"Union �� �������");
	};
	if(Wasteland_Seeded == TRUE)
	{
		Doc_PrintLine(nDocID,1,"��� Wasteland �������");
	};
	if(HardModeXPModifier > 0)
	{
		Doc_PrintLine(nDocID,1,ConcatStrings(ConcatStrings("���� ������ �� ",IntToString(HardModeXPModifier)),"%"));
	};
	Doc_Show(nDocID);
};

instance AttBook(C_Item) //TODO ��������� � StatsBook
{
	name = "����� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_GregsLogbuch_MIS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = UseAttributesBook;
};


func void UseAttributesBook()
{
	if(C_NpcIsHero(self))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,FONT_Book);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("����: ",IntToString(hero.attribute[ATR_STRENGTH])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_STRENGTH])," - �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_STRENGTH])," - ���������� ������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_STRENGTH])," - ��������� ������"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("��������: ",IntToString(hero.attribute[ATR_DEXTERITY])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_DEXTERITY])," - �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_DEXTERITY])," - ���������� ������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_DEXTERITY])," - ��������� ������"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("����. ����: ",IntToString(hero.attribute[ATR_MANA_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_MANA_MAX])," - �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_MANA_MAX])," - ���������� ������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_MANA_MAX])," - ��������� ������"));
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,ConcatStrings("����. ��������: ",IntToString(hero.attribute[ATR_HITPOINTS_MAX])));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_Training[ATR_HITPOINTS_MAX])," - �������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_PermBonus[ATR_HITPOINTS_MAX])," - ���������� ������"));
		Doc_PrintLine(nDocID,0,ConcatStrings(IntToString(ATR_TempBonus[ATR_HITPOINTS_MAX])," - ��������� ������"));
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,FONT_Book);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("���������� ������: ",IntToString(hero.HitChance[NPC_TALENT_1H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_1H])," - �������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_1H])," - ���������� ������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_1H])," - ��������� ������"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("��������� ������: ",IntToString(hero.HitChance[NPC_TALENT_2H])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_2H])," - �������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_2H])," - ���������� ������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_2H])," - ��������� ������"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("����: ",IntToString(hero.HitChance[NPC_TALENT_BOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_BOW])," - �������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_BOW])," - ���������� ������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_BOW])," - ��������� ������"));
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,ConcatStrings("��������: ",IntToString(hero.HitChance[NPC_TALENT_CROSSBOW])));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_Training[NPC_TALENT_CROSSBOW])," - �������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_PermBonus[NPC_TALENT_CROSSBOW])," - ���������� ������"));
		Doc_PrintLine(nDocID,1,ConcatStrings(IntToString(TAL_TempBonus[NPC_TALENT_CROSSBOW])," - ��������� ������"));
		Doc_Show(nDocID);
	};
};

instance PickPocketSyncer(C_Item)
{
	name = "���� ����������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[0] = "�������� �������� ��� �����.";
	on_state[0] = UsePickPocketSyncer;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePickPocketSyncer()
{
	B_SyncItemsToSteal();
	PrintScreen("�������� ��� ����� ���������",-1,55,FONT_Screen,4);
};

instance Helmets(C_Item)
{
	name = NAME_Bag;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UseHelmets;
	description = name;
	text[0] = "����� �������� ������������������";
	text[1] = "��������� � �������!";
};


func void UseHelmets()
{
	CreateInvItem(self,ITAR_DJGN_M);
	CreateInvItem(self,ITAR_DJGN_H);
	CreateInvItem(self,ITAR_PALN_M);
	CreateInvItem(self,ITAR_PALN_H);
	CreateInvItem(self,ITAR_OHT);
	CreateInvItem(self,ITAR_DHT);
	CreateInvItem(self,ITHE_DJG_M);
	CreateInvItem(self,ITHE_DJG_H);
	CreateInvItem(self,ITHE_PAL_M);
	CreateInvItem(self,ITHE_PAL_H);
	CreateInvItem(self,ITHE_OHT);
	CreateInvItem(self,ITHE_DHT);
	Print("������� ����� ������ �������� � ������!");
};

