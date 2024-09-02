
const int Value_SwordBlade = 10;
const int Value_SwordBladeHot = 10;
const int Value_SwordRawHot = 10;
const int Value_SwordRaw = 10;
const int Value_Brush = 3;
const int Value_Flask = 3;
const int Value_Stomper = 3;
const int Value_Pan = 20;
const int Value_Saw = 20;
const int Value_Broom = 10;
const int Value_Rake = 10;
const int Value_Hammer = 10;
const int Value_Scoop = 3;
const int Value_Nugget = 200;
const int Value_Joint = 30;
const int Value_Alarmhorn = 10;
const int Value_Lute = 10;
const int Value_Gold = 1;
const int Value_RuneBlank = 100;
const int Value_Sulfur = 20;
const int Value_Quartz = 20;
const int Value_Pitch = 10;
const int Value_Rockcrystal = 30;
const int Value_Aquamarine = 100;
const int Value_HolyWater = 20;
const int Value_DarkPearl = 1000;
const int VALUE_ItMi_ApfelTabak = 10;
const int VALUE_ItMi_PilzTabak = 25;
const int VALUE_ItMi_SumpfTabak = 25;
const int VALUE_ItMi_DoppelTabak = 20;
const int VALUE_ItMi_HonigTabak = 45;
const int Value_SilverRing = 120;
const int Value_SilverNecklace = 200;
const int Value_SilverCandleHolder = 50;
const int Value_SilverPlate = 100;
const int Value_SilverCup = 100;
const int Value_SilverChalice = 250;
const int Value_GoldPlate = 200;
const int Value_GoldRing = 250;
const int Value_GoldNecklace = 300;
const int Value_GoldCandleHolder = 120;
const int Value_GoldCup = 350;
const int Value_BloodCup = 400;
const int Value_GoldChalice = 500;
const int Value_GoldChest = 750;
const int Value_JeweleryChest = 1000;
const int Value_InnosStatue = 100;
const int Value_Sextant = 1500;

instance ItMi_Stomper(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stomper;
	visual = "ItMi_Stomper.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_RuneBlank(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_RuneBlank;
	visual = "ItMi_RuneBlank.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Pliers(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Hammer;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Flask(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flask;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Hammer(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Hammer;
	visual = "ItMi_Hammer.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Scoop(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Scoop;
	visual = "ItMi_Scoop.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Pan(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pan;
	visual = "ItMi_Pan.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_PanFull(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pan;
	visual = "ItMi_PanFull.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Saw(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Saw;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordraw(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRaw;
	visual = "ItMiSwordraw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordrawhot(C_Item)
{
	name = "����������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRawHot;
	visual = "ItMiSwordrawhot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "����������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBladeHot;
	visual = "ItMiSwordbladehot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordblade(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMiSwordblade.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Rake(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rake;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemeName = "RAKE";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ItMi_Broom(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Broom;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemeName = "BROOM";
	on_state[0] = Use_Broom;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_Broom()
{
	if(Npc_IsPlayer(self))
	{
		if((Wld_GetPlayerPortalGuild() == GIL_NOV) && (MIS_ParlanFegen == LOG_Running))
		{
			B_Say(self,self,"$NOSWEEPING");
			Print(PRINT_NoSweeping);
		};
	};
};


instance ItMi_Lute(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lute;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Brush(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Brush;
	visual = "ItMi_Brush.3ds";
	material = MAT_WOOD;
	scemeName = "BRUSH";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Joint(C_Item)
{
	name = NAME_Joint;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint;
	visual = "ItMi_Joint.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Joint;
	description = "����� �� �������� �����";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 200;
};


func void Use_Joint()
{
	if(Npc_IsPlayer(self))
	{
		Wld_StopEffect("SLOW_TIME");
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ItMi_Pocket(C_Item)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Pocket.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UsePocket;
	description = name;
	text[0] = "������ �������.";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UsePocket()
{
	B_PlayerFindItem(ItMi_Gold,10);
};


instance ItMi_Nugget(C_Item)
{
	name = "����� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Nugget;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 200;
};

instance ItMi_Gold(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Gold;
	visual = "ItMi_Gold.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_OldCoin(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_GoldCandleHolder(C_Item)
{
	name = "������� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldCandleHolder;
	visual = "ItMi_GoldCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldNecklace(C_Item)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_GoldNecklace;
	visual = "ItMi_GoldNecklace_Chain.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_SilverRing(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_SilverRing;
	visual = "ItMi_SilverRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_SilverCup(C_Item)
{
	name = "���������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverPlate(C_Item)
{
	name = "���������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverPlate;
	visual = "ItMi_SilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldPlate(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldCup(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_BloodCup_MIS(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BloodCup;
	visual = "ItMi_BloodCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldRing(C_Item)
{
	name = "������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_GoldRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ItMi_SilverChalice(C_Item)
{
	name = "���������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverChalice;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_JeweleryChest(C_Item)
{
	name = "�������� � ���������������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldChalice(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldChalice;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_GoldChest(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldChest;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_InnosStatue(C_Item)
{
	name = NAME_InnosStatue;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Sextant(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sextant;
	visual = "ItMi_Sextant.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverCandleHolder(C_Item)
{
	name = "���������� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SilverCandleHolder;
	visual = "ItMi_SilverCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_SilverNecklace(C_Item)
{
	name = "���������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_SilverNecklace;
	visual = "ItMi_SilverNecklace_Chain.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_Sulfur(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sulfur;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ItMi_Quartz(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quartz;
	visual = "ItMi_Quartz.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 300;
};

instance ItMi_Pitch(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pitch;
	visual = "ItMi_Pitch.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Rockcrystal(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rockcrystal;
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Aquamarine(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Aquamarine;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_HolyWater(C_Item)
{
	name = "������ ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Coal(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_Coal.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_DarkPearl(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_DarkPearl;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_ApfelTabak(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_ApfelTabak;
	visual = "ItMi_TabakPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����� � �������� �������.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_PilzTabak(C_Item)
{
	name = PRINT_PILZ;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_PilzTabak;
	visual = "ItMi_TabakPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "������ �������-������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_DoppelTabak(C_Item)
{
	name = PRINT_DOPPEL;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_DoppelTabak;
	visual = "ItMi_TabakPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "�� ���� ������ �� ������...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_Honigtabak(C_Item)
{
	name = PRINT_HONIG;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_HonigTabak;
	visual = "ItMi_TabakPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "������� �������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_SumpfTabak(C_Item)
{
	name = PRINT_KRAUT;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_TabakPocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����� �� �������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = 190;
};

instance ItMi_AlarmHorn(C_Item)
{
	name = "���������� ���";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Alarmhorn;
	visual = "ItMi_AlarmHorn.3ds";
	scemeName = "HORN";
	material = MAT_STONE;
	on_state[0] = Use_AlarmHorn;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void Use_AlarmHorn()
{
	Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,self);
};

instance ItMi_ArrowPack(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeil * 50;
	visual = "ItMi_ArrowPack.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_ArrowPack;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

func void Use_ArrowPack()
{
	B_PlayerFindItem(ItRw_Arrow,50);
};

