
instance ItKe_Xardas(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� �������,";
	text[1] = "�������������� ��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Canthars_KomproBrief;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������ ��� ��� ������, �����";
	text[1] = "� ��������� �� �������� ����.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Canthars_KomproBrief()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     ��������� ��������������");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"        � ��� ��������� ��� ��������� ����,");
	Doc_PrintLines(nDocID,0,"        �������� ���� ��������,");
	Doc_PrintLines(nDocID,0,"        ��� ��� ������ ���������� ������,");
	Doc_PrintLines(nDocID,0,"        ���������� � ���� ������ �����.");
	Doc_PrintLines(nDocID,0,"        ���� � ������ �� ������ �� ���� �������");
	Doc_PrintLines(nDocID,0,"        ������, ����, � ���� �������� ��������");
	Doc_PrintLines(nDocID,0,"        ���� ��������� � ����. �������,");
	Doc_PrintLines(nDocID,0,"        �� �������� ���� �����!!!!!!!!!!!!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ����");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItMw_2h_Rod(C_Item)
{
	name = NAME_2h_Rod;
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = Value_Sld2hSchwert;
	damageTotal = Damage_Rod;
	damagetype = DAM_EDGE;
	range = Range_Sld2hSchwert;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Rod;
	visual = "ItMw_035_2h_sld_sword_02.3DS";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMw_2h_Rod_Fake(C_Item)
{
	name = NAME_2h_Rod;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMw_035_2h_sld_sword_02.3DS";
	scemeName = "INSPECTWEAPON";
	material = MAT_METAL;
	description = name;
};

instance ItMi_CoragonsSilber(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_CoragonsSilber.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_TheklasPaket(C_Item)
{
	name = "����� ��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_TheklasPacket;
	description = name;
	text[0] = "������ ����� � ������� �������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_TheklasPacket()
{
	CreateInvItems(hero,ItPl_Mana_Herb_01,3);
	CreateInvItems(hero,ItPl_Health_Herb_02,1);
	CreateInvItems(hero,ItPl_Speed_Herb_01,1);
	CreateInvItems(hero,ItPl_Blueplant,2);
	Print(PRINT_GotPlants);
};


instance ItMi_MariasGoldPlate(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_MariasGoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ���� ����� �������������";
	text[1] = "�����: ���� � �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Edge_01_Valentino(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_ProtEdge;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Edge_01;
	on_unequip = UnEquip_ItRi_Prot_Edge_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "������ �������� ����";
	text[0] = "��� ������ ����������� ���������.";
	text[2] = NAME_Prot_Edge;
	count[2] = Ri_ProtEdge;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItKe_Dexter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� �������,";
	text[1] = "�������������� ��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Kraeuterliste(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Kraeuterliste;
	scemeName = "MAP";
	description = "������ ���� �����������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void Use_Kraeuterliste()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������������ �����:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ��������");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"�������� �������");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"�������-�����");
	Doc_PrintLine(nDocID,0,"������� �����");
	Doc_PrintLine(nDocID,0,"������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����������: ����� �������� � ������� ������� ��� ����� ��� ����. ��� �������� ��������� ��� �����������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"� ���������, �����");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_ManaRezept(C_Item)
{
	name = "������ ���������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Recipe.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ManaRezept;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_ManaRezept()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ������� ���������� �����, �������� �������� ����������:");
	Doc_PrintLine(nDocID,0,"�������� �������");
	Doc_PrintLine(nDocID,0,"�������� �����");
	Doc_PrintLine(nDocID,0,"�������� ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"����� ��� �����������:");
	Doc_PrintLine(nDocID,0,"������� �����");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������ ������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_Passierschein(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassierschein;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������ �������� ���";
	text[1] = "������ ���� ���������� � �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePassierschein()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"     �������");
	Doc_PrintLine(nDocID,0,"            �������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLines(nDocID,0,"        ���� �������� ���� �����");
	Doc_PrintLines(nDocID,0,"        ���������� ������� �� ����� �������");
	Doc_PrintLines(nDocID,0,"        �������� �� �������������� ������ �������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"            ����������� ����������");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	Player_KnowsLariusAsGovernor = TRUE;
};


instance ItMi_HerbPaket(C_Item)
{
	name = "��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_HerbPaket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "�������, ������ ���,";
	text[1] = "�������� �������� ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Storage(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� ��������� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};


instance ItFo_HalvorFish_MIS(C_Item)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = Use_HalvorFish;
	description = name;
	text[0] = "���-�� � ���� ����� �� ���.";
	text[1] = "������, ��� ���� ������...";
};


func void Use_HalvorFish()
{
	Snd_Play("CS_IHL_WO_WA");
	CreateInvItems(hero,ItWr_HalvorMessage,1);
	Print(PRINT_FishLetter);
};


instance ItWr_HalvorMessage(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseHalvorMessage;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������� ���� �������� � ����.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseHalvorMessage()
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
	Doc_PrintLines(nDocID,0,"    �� �������������, �����!");
	Doc_PrintLines(nDocID,0,"    ��������� ���������� ��������������.");
	Doc_PrintLines(nDocID,0,"    �� �������������� ������,");
	Doc_PrintLines(nDocID,0,"    ���� � �� ��� ����� � ����!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"    ������");
	Doc_Show(nDocID);
	Knows_Halvor = TRUE;
};


instance ItMw_AlriksSword_MIS(C_Item)
{
	name = "��� �������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = Value_Alrik;
	damageTotal = Damage_Alrik;
	damagetype = DAM_EDGE;
	range = Range_Alrik;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_Alrik;
	visual = "ItMw_025_1h_Sld_Sword_02.3DS";
	on_equip = Equip_1H_10;
	on_unequip = UnEquip_1H_10;
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = Waffenbonus_10;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItWr_VatrasMessage(C_Item)
{
	name = NAME_LetterSealed;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessageSealed;
	scemeName = "MAPSEALED";
	description = name;
	text[0] = "������ ������� ����� ����.";
};


func void UseVatrasMessage()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������� �������,");
	Doc_PrintLines(nDocID,0,"� ������ ��� ����������� ����������� ������ ����.");
	Doc_PrintLines(nDocID,0,"��� ����, ������ ��������� ���. ����� �� ���� ���, ��� ������� ������� ��� ������?");
	Doc_PrintLines(nDocID,0,"� ���� ���������, �� � �������, ��� ���� �������� ������ �� ����������� � ���� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� �� ��������� ���� ������� ��� ������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"������");
	Doc_Show(nDocID);
};


func void UseVatrasMessageSealed()
{
	Snd_Play("PICKLOCK_BROKEN");
	CreateInvItems(self,ItWr_VatrasMessage_Open,1);
	UseVatrasMessage();
};


instance ItWr_VatrasMessage_Open(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseVatrasMessage;
	scemeName = "MAP";
	description = name;
	text[0] = "������ ������� ����� ����.";
	text[1] = "������ �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};

instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� ���� ������� ������� ������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Innos_MIS(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ����� � ��������� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterSchatz(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ������������ ������������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterStore(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ������������ ��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KDFPlayer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ������������ �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_KlosterBibliothek(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� ������������ ����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItFo_Schafswurst(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = Value_Sausage;
	visual = "ItFo_Schafswurst.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Schafswurst;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Sausage;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Sausage);
};


instance ItPo_Perm_LittleMana(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_UltharsHolyWater.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_LittleMana;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = "�������� ����";
	text[1] = NAME_Bonus_ManaMax;
	count[1] = 3;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItPo_LittleMana()
{
	B_RaiseAttributeByPermBonus(self,ATR_MANA_MAX,3);
};


instance Holy_Hammer_MIS(C_Item)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = Value_HolyHammer;
	owner = Nov_608_Garwig;
	damageTotal = Damage_HolyHammer;
	damagetype = DAM_BLUNT;
	range = Range_HolyHammer;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_HolyHammer;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = NAME_DamageUnknown;
	text[3] = NAME_Unknown_needed;
	text[4] = NAME_TwoHanded;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_MagicChest(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "������ �������� ����.";
	text[1] = "��������, ��� ����";
	text[2] = "�� �������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Passage_MIS(C_Item)
{
	name = "����������� ���� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePassage;
	scemeName = "MAP";
	description = name;
	text[0] = "��� ������� ������ ������ ���";
	text[1] = "����������� � ������ �������.";
};


func void UsePassage()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"���������������� ���� �����,");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�� ��� ��������� �����, � ����� �������� �� ����������. �, �������� ��������������, � ��������� ��������� ����������:");
	Doc_PrintLines(nDocID,0,"�� ������� ���� ����� ������ ��������� ������ ����� ������� � �������.");
	Doc_PrintLines(nDocID,0,"������ �� ���������� ��� ���� ������ � ������� ������ � ����������� ������.");
	Doc_PrintLines(nDocID,0,"����� ����, � ����� �������� �� ���, ����� ��� ���� ��������� �������� �� ������� ���� - �� �����������, �����������, ����� �����, ��� �� ���������������.");
	Doc_PrintLines(nDocID,0,"� ����, ��� �� �������, �� ������� �� ����������� ����������� �� �������, ������ ���������� �����, ��� ��� ����, ��� � ��� ���� ��������� �����. ����� �� ��������� ������, � ���� ���� ���� �� �����.");
	Doc_PrintLines(nDocID,0,"� ������ ���: ������� ������� �� ���� �������� ��� ���������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�������:   ������� ��");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_BanditLetter_MIS(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBanditLetter;
	scemeName = "MAP";
	description = name;
	text[0] = "� ������ ��� � ������ �� �������� �����.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UseBanditLetter()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������������ ����, ������������ � ���.");
	Doc_PrintLines(nDocID,0,"������ ��������, ��� ����� ������");
	Doc_PrintLines(nDocID,0," ���������� ������ ������.");
	Doc_PrintLines(nDocID,0,"�� ����� ��� �������� ��� -");
	Doc_PrintLines(nDocID,0,"    ��� ����� ������� ������.");
	Doc_PrintLines(nDocID,0,"�������������� �� ���.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������, �������, �������� �� ����,");
	Doc_PrintLines(nDocID,0,"    ������ � ��� �� �����.");
	Doc_PrintLines(nDocID,0,"� ���� ������� � ������� ���");
	Doc_PrintLines(nDocID,0,"    �������� ������� ����������.");
	Doc_PrintLines(nDocID,0,"� ��� ��� �������� ������,");
	Doc_PrintLines(nDocID,0,"    ��� ����� ����� ��������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"��������� ��� ������ � ������ �����");
	Doc_PrintLines(nDocID,0,"    ����� �������� ��������������.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"�.");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
	if(MIS_Steckbriefe == FALSE)
	{
		Log_CreateTopic(Topic_Bandits,LOG_MISSION);
		Log_SetTopicStatus(Topic_Bandits,LOG_Running);
		B_LogEntry(Topic_Bandits,"�� ���� �������� �������. ���������, ��� ��� ��� ������.");
		MIS_Steckbriefe = LOG_Running;
	};
};


instance ItWr_Poster_MIS(C_Item)
{
	name = "���������� � �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePoster;
	scemeName = "MAP";
	description = name;
	text[0] = "��� �����������!";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void UsePoster()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Gesucht.TGA",0);
	Doc_Show(nDocID);
};


instance ItKe_Bandit(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� ���� ����������� �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItRw_Bow_L_03_MIS(C_Item)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = Value_Jagdbogen;
	damageTotal = Damage_Jagdbogen;
	damagetype = DAM_POINT;
	munition = ItRw_Arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = Condition_Jagdbogen;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[0] = "���� ��� ����������� �������.";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = Value_Ri_ProtPoint;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Prot_Point_01;
	on_unequip = UnEquip_ItRi_Prot_Point_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "������ ���������� ����";
	text[0] = "��� ������ ����������� �����������.";
	text[2] = NAME_Prot_Point;
	count[2] = Ri_ProtPoint;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_EddasStatue(C_Item)
{
	name = NAME_InnosStatue;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ������ ������� ���������� �����:";
	text[1] = "'�����, ��� ����������,";
	text[2] = "���������� � ������� ����,";
	text[3] = "� ������ ���� �� ����'.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_EVT_CRYPT_01(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� ������� �� ������ �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� ������� �� ������ �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� ������� �� ������� �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITAR_PAL_Skel(C_Item)
{
	name = "������ ������� ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = 500;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_Skel.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ArmorSet;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Valentino(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� �������,";
	text[1] = "�������������� ���������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_Buerger(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ����� �� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Richter(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ���� �� �������,";
	text[1] = "�������������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Salandril(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� �������, ��������������";
	text[1] = "�������� ����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItKe_PaladinTruhe(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� �������� ������";
	text[1] = "�� ���� ���������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_ThiefTreasure(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_Key_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ItKe_Fingers(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "������ ���� �� �����";
	text[1] = "� �����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItWr_Schuldenbuch(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "����������� ���������� ������.";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseSchuldBuch;
};


func void UseSchuldBuch()
{
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"������ � �����");
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�, ������ ������, ������� ��������, ������ ����������������� ������ 200 ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             ������");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"�, �������, ���������� ��������, ������ ����������������� ������ 150 ������� �����.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"             �������");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,FONT_Book);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"�, �����, ��������� ����� ��������, ������ ����������������� ������ 250 ������� �����.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"               �����");
	Doc_Show(nDocID);
	SchuldBuchNamesKnown = TRUE;
};


instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name = "��������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MISSION;
	value = Value_Strength_Herb_01;
	visual = "ItPl_Sagitta_Herb.3DS";
	material = MAT_LEATHER;
	scemeName = "FOOD";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItKe_Orlan_HotelZimmer(C_Item)
{
	name = NAME_Key;
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = Value_Key_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "���� �� �������";
	text[1] = "� ������� '������� ������'.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name = "������� ���������";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 1000;
	damageTotal = 65;
	damagetype = DAM_POINT;
	munition = ItRw_Bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_LeichteArmbrust;
	visual = "ItRw_Crossbow_Mission_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GregsSilverPlate(C_Item)
{
	name = "���������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 130;
	visual = "ItMi_GregsSilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

