
instance PC_Rockefeller(Npc_Default)
{
	name[0] = "���������";
	npcType = NPCTYPE_MAIN;
	guild = GIL_NONE;
	level = 100;
	voice = 15;
	id = 0;
	attribute[ATR_STRENGTH] = 1000;
	attribute[ATR_DEXTERITY] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 1000;
	exp = B_GetCurrentLevelExp(self);
	exp_next = B_GetNextLevelExp(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Player,BodyTex_Player_G1,ITAR_PAL_H);
	Npc_SetTalentSkill(self,NPC_TALENT_MAGE,6);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SNEAK,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ACROBAT,0);
	Npc_SetTalentSkill(self,NPC_TALENT_PICKPOCKET,1);
	Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
	Npc_SetTalentSkill(self,NPC_TALENT_RUNES,1);
	Npc_SetTalentSkill(self,NPC_TALENT_ALCHEMY,1);
	Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALFUR,1);
	PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
	PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Light] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Icebolt] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_InstantFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonWolf] = TRUE;
	PLAYER_TALENT_RUNES[SPL_WindFist] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Sleep] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MediumHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_LightningFlash] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeFireball] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonSkeleton] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Fear] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceCube] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ChargeZap] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonGolem] = TRUE;
	PLAYER_TALENT_RUNES[SPL_DestroyUndead] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Pyrokinesis] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firestorm] = TRUE;
	PLAYER_TALENT_RUNES[SPL_IceWave] = TRUE;
	PLAYER_TALENT_RUNES[SPL_SummonDemon] = TRUE;
	PLAYER_TALENT_RUNES[SPL_FullHeal] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Firerain] = TRUE;
	PLAYER_TALENT_RUNES[SPL_BreathOfDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_MassDeath] = TRUE;
	PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] = TRUE;
	PLAYER_TALENT_RUNES[SPL_Shrink] = TRUE;
	B_SetFightSkills(self,100);
	B_GiveAllClassicWeapons(self);
	CreateInvItem(self,ITAR_Governor);
	CreateInvItem(self,ITAR_Smith);
	CreateInvItem(self,ITAR_Barkeeper);
	CreateInvItem(self,ITAR_Judge);
	CreateInvItem(self,ITAR_Vlk_L);
	CreateInvItem(self,ITAR_Vlk_M);
	CreateInvItem(self,ITAR_Vlk_H);
	CreateInvItem(self,ITAR_VlkBabe_L);
	CreateInvItem(self,ITAR_VlkBabe_M);
	CreateInvItem(self,ITAR_VlkBabe_H);
	CreateInvItem(self,ITAR_MIL_L);
	CreateInvItem(self,ITAR_MIL_M);
	CreateInvItem(self,ITAR_PAL_M);
	CreateInvItem(self,ITAR_PAL_H);
	CreateInvItem(self,ITAR_Bau_L);
	CreateInvItem(self,ITAR_Bau_M);
	CreateInvItem(self,ITAR_BauBabe_L);
	CreateInvItem(self,ITAR_BauBabe_M);
	CreateInvItem(self,ITAR_SLD_L);
	CreateInvItem(self,ITAR_SLD_M);
	CreateInvItem(self,ITAR_SLD_H);
	CreateInvItem(self,ITAR_NOV_L);
	CreateInvItem(self,ITAR_KDF_L);
	CreateInvItem(self,ITAR_KDF_H);
	CreateInvItem(self,ITAR_Leather_L);
	CreateInvItem(self,ITAR_BDT_M);
	CreateInvItem(self,ITAR_BDT_H);
	CreateInvItem(self,ITAR_DJG_L);
	CreateInvItem(self,ITAR_DJG_M);
	CreateInvItem(self,ITAR_DJG_H);
	CreateInvItem(self,ITAR_DJG_Crawler);
//	CreateInvItem(self,ITAR_DJG_Babe);
	CreateInvItem(self,ITAR_Xardas);
	CreateInvItem(self,ITAR_PSI_M);
	CreateInvItem(self,ITAR_PSI_H);
	CreateInvItem(self,ITAR_Diego);
	CreateInvItem(self,ITAR_CorAngar);
	CreateInvItem(self,ITAR_KDW_H);
	CreateInvItem(self,ITAR_Dementor);
	CreateInvItem(self,ITAR_Prisoner);
	CreateInvItem(self,ITAR_PIR_L_Addon);
	CreateInvItem(self,ITAR_PIR_M_Addon);
	CreateInvItem(self,ITAR_PIR_H_Addon);
	CreateInvItem(self,ITAR_Thorus_Addon);
	CreateInvItem(self,ITAR_Raven_Addon);
	CreateInvItem(self,ITAR_OreBaron_Addon);
	CreateInvItem(self,ITAR_RANGER_Addon);
	CreateInvItem(self,ITAR_KDW_L_Addon);
	CreateInvItem(self,ITAR_Bloodwyn_Addon);
	CreateInvItem(self,ItRu_PalLight);
	CreateInvItem(self,ItRu_PalHeal_01);
	CreateInvItem(self,ItRu_PalHolyBolt);
	CreateInvItem(self,ItRu_PalHeal_02);
	CreateInvItem(self,ItRu_PalRepelEvil);
	CreateInvItem(self,ItRu_PalHeal_03);
	CreateInvItem(self,ItRu_PalDestroyEvil);
	CreateInvItem(self,ItRu_Light);
	CreateInvItem(self,ItRu_FireBolt);
	CreateInvItem(self,ItRu_Icebolt);
	CreateInvItem(self,ItRu_LightHeal);
	CreateInvItem(self,ItRu_SumGobSkel);
	CreateInvItem(self,ItRu_InstantFireball);
	CreateInvItem(self,ItRu_Zap);
	CreateInvItem(self,ItRu_SumWolf);
	CreateInvItem(self,ItRu_Windfist);
	CreateInvItem(self,ItRu_Sleep);
	CreateInvItem(self,ItRu_MediumHeal);
	CreateInvItem(self,ItRu_LightningFlash);
	CreateInvItem(self,ItRu_ChargeFireball);
	CreateInvItem(self,ItRu_SumSkel);
	CreateInvItem(self,ItRu_Fear);
	CreateInvItem(self,ItRu_IceCube);
	CreateInvItem(self,ItRu_ThunderBall);
	CreateInvItem(self,ItRu_SumGol);
	CreateInvItem(self,ItRu_HarmUndead);
	CreateInvItem(self,ItRu_Pyrokinesis);
	CreateInvItem(self,ItRu_Firestorm);
	CreateInvItem(self,ItRu_IceWave);
	CreateInvItem(self,ItRu_SumDemon);
	CreateInvItem(self,ItRu_FullHeal);
	CreateInvItem(self,ItRu_Firerain);
	CreateInvItem(self,ItRu_BreathOfDeath);
	CreateInvItem(self,ItRu_MassDeath);
	CreateInvItem(self,ItRu_MasterOfDisaster);
	CreateInvItem(self,ItRu_ArmyOfDarkness);
	CreateInvItem(self,ItRu_Shrink);
	CreateInvItem(self,ItSc_PalLight);
	CreateInvItem(self,ItSc_PalHeal_01);
	CreateInvItem(self,ItSc_PalHolyBolt);
	CreateInvItem(self,ItSc_PalHeal_02);
	CreateInvItem(self,ItSc_PalRepelEvil);
	CreateInvItem(self,ItSc_PalHeal_03);
	CreateInvItem(self,ItSc_PalDestroyEvil);
	CreateInvItems(self,ItSc_Charm,10);
	CreateInvItem(self,ItSc_Light);
	CreateInvItem(self,ItSc_Firebolt);
	CreateInvItem(self,ItSc_Icebolt);
	CreateInvItem(self,ItSc_LightHeal);
	CreateInvItem(self,ItSc_SumGobSkel);
	CreateInvItem(self,ItSc_InstantFireball);
	CreateInvItem(self,ItSc_Zap);
	CreateInvItem(self,ItSc_SumWolf);
	CreateInvItem(self,ItSc_Windfist);
	CreateInvItem(self,ItSc_Sleep);
	CreateInvItem(self,ItSc_MediumHeal);
	CreateInvItem(self,ItSc_LightningFlash);
	CreateInvItem(self,ItSc_ChargeFireBall);
	CreateInvItem(self,ItSc_SumSkel);
	CreateInvItem(self,ItSc_Fear);
	CreateInvItem(self,ItSc_IceCube);
	CreateInvItem(self,ItSc_ThunderBall);
	CreateInvItem(self,ItSc_SumGol);
	CreateInvItem(self,ItSc_HarmUndead);
	CreateInvItem(self,ItSc_Pyrokinesis);
	CreateInvItem(self,ItSc_Firestorm);
	CreateInvItem(self,ItSc_IceWave);
	CreateInvItem(self,ItSc_SumDemon);
	CreateInvItem(self,ItSc_FullHeal);
	CreateInvItem(self,ItSc_Firerain);
	CreateInvItem(self,ItSc_BreathOfDeath);
	CreateInvItem(self,ItSc_MassDeath);
	CreateInvItem(self,ItSc_ArmyOfDarkness);
	CreateInvItem(self,ItSc_Shrink);
	CreateInvItems(self,ItSc_TrfSheep,10);
	CreateInvItems(self,ItSc_TrfScavenger,10);
	CreateInvItems(self,ItSc_TrfGiantRat,10);
	CreateInvItems(self,ItSc_TrfGiantBug,10);
	CreateInvItems(self,ItSc_TrfWolf,10);
	CreateInvItems(self,ItSc_TrfWaran,10);
	CreateInvItems(self,ItSc_TrfSnapper,10);
	CreateInvItems(self,ItSc_TrfWarg,10);
	CreateInvItems(self,ItSc_TrfFireWaran,10);
	CreateInvItems(self,ItSc_TrfLurker,10);
	CreateInvItems(self,ItSc_TrfShadowbeast,10);
	CreateInvItems(self,ItSc_TrfDragonSnapper,10);
	CreateInvItem(self,ItFo_Apple);
	CreateInvItem(self,ItFo_Cheese);
	CreateInvItem(self,ItFo_Bacon);
	CreateInvItem(self,ItFo_Bread);
	CreateInvItem(self,ItFo_Fish);
	CreateInvItem(self,ItFoMuttonRaw);
	CreateInvItem(self,ItFo_Stew);
	CreateInvItem(self,ItFo_FishSoup);
	CreateInvItem(self,ItFo_Sausage);
	CreateInvItem(self,ItFo_Honey);
	CreateInvItem(self,ItFo_Water);
	CreateInvItem(self,ItFo_Beer);
	CreateInvItem(self,ItFo_Booze);
	CreateInvItem(self,ItFo_Wine);
	CreateInvItem(self,ItFo_Milk);
	CreateInvItem(self,ItPl_SwampHerb);
	CreateInvItem(self,ItPl_Mana_Herb_01);
	CreateInvItem(self,ItPl_Mana_Herb_02);
	CreateInvItem(self,ItPl_Mana_Herb_03);
	CreateInvItem(self,ItPl_Health_Herb_01);
	CreateInvItem(self,ItPl_Health_Herb_02);
	CreateInvItem(self,ItPl_Health_Herb_03);
	CreateInvItem(self,ItPl_Dex_Herb_01);
	CreateInvItem(self,ItPl_Strength_Herb_01);
	CreateInvItem(self,ItPl_Speed_Herb_01);
	CreateInvItem(self,ItPl_Mushroom_01);
	CreateInvItem(self,ItPl_Mushroom_02);
	CreateInvItem(self,ItPl_Forestberry);
	CreateInvItem(self,ItPl_Blueplant);
	CreateInvItem(self,ItPl_Planeberry);
	CreateInvItem(self,ItPl_Temp_Herb);
	CreateInvItem(self,ItPl_Perm_Herb);
//	CreateInvItem(self,ItKe_Key_01);
//	CreateInvItem(self,ItKe_Key_02);
//	CreateInvItem(self,ItKe_Key_03);
	CreateInvItem(self,ItKe_Lockpick);
	CreateInvItems(self,ItLsTorch,50);
	CreateInvItem(self,ItMi_Pan);
	CreateInvItem(self,ItMi_Saw);
	CreateInvItem(self,ItMi_Brush);
	CreateInvItem(self,ItMi_Flask);
	CreateInvItem(self,ItMi_Stomper);
	CreateInvItem(self,ItMi_Broom);
	CreateInvItem(self,ItMi_Rake);
	CreateInvItem(self,ItMi_Hammer);
	CreateInvItem(self,ItMi_Scoop);
	CreateInvItem(self,ItMi_Nugget);
	CreateInvItem(self,ItMi_Joint);
	CreateInvItem(self,ItMi_Lute);
	CreateInvItems(self,ItMi_Gold,1000);
	CreateInvItem(self,ItMiSwordraw);
	CreateInvItem(self,ItMiSwordrawhot);
	CreateInvItem(self,ItMiSwordbladehot);
	CreateInvItem(self,ItMiSwordblade);
	CreateInvItem(self,ItMi_RuneBlank);
	CreateInvItem(self,ItMi_Sulfur);
	CreateInvItem(self,ItMi_Quartz);
	CreateInvItem(self,ItMi_Pitch);
	CreateInvItem(self,ItMi_Rockcrystal);
	CreateInvItem(self,ItMi_Aquamarine);
	CreateInvItem(self,ItMi_HolyWater);
	CreateInvItem(self,ItMi_Coal);
	CreateInvItem(self,ItMi_DarkPearl);
	CreateInvItem(self,ItMi_GoldCandleHolder);
	CreateInvItem(self,ItMi_GoldNecklace);
	CreateInvItem(self,ItMi_GoldCup);
	CreateInvItem(self,ItMi_GoldChalice);
	CreateInvItem(self,ItMi_GoldChest);
	CreateInvItem(self,ItMi_GoldRing);
	CreateInvItem(self,ItMi_SilverChalice);
	CreateInvItem(self,ItMi_JeweleryChest);
	CreateInvItem(self,ItMi_InnosStatue);
	CreateInvItem(self,ItMi_SilverRing);
	CreateInvItem(self,ItMi_SilverCup);
	CreateInvItem(self,ItMi_SilverPlate);
	CreateInvItem(self,ItMi_SilverNecklace);
	CreateInvItem(self,ItMi_SilverCandleHolder);
	CreateInvItem(self,ItMi_Sextant);
	CreateInvItems(self,ItBE_Addon_Leather_01,1);
	CreateInvItems(self,ItBE_Addon_SLD_01,1);
	CreateInvItems(self,ItBE_Addon_NOV_01,1);
	CreateInvItems(self,ItBE_Addon_MIL_01,1);
	CreateInvItems(self,ItBE_Addon_KDF_01,1);
	CreateInvItems(self,ItBE_Addon_MC,1);
	CreateInvItems(self,ItBe_Addon_STR_5,1);
	CreateInvItems(self,ItBe_Addon_STR_10,1);
	CreateInvItems(self,ItBe_Addon_DEX_5,1);
	CreateInvItems(self,ItBe_Addon_DEX_10,1);
	CreateInvItems(self,ItBe_Addon_Prot_EDGE,1);
	CreateInvItems(self,ItBe_Addon_Prot_Point,1);
	CreateInvItems(self,ItBe_Addon_Prot_MAGIC,1);
	CreateInvItems(self,ItBe_Addon_Prot_FIRE,1);
	CreateInvItems(self,ItBe_Addon_Prot_EdgPoi,1);
	CreateInvItems(self,ItBe_Addon_Prot_TOTAL,1);
	CreateInvItem(self,ItAm_Dex_01);
	CreateInvItem(self,ItAm_Strg_01);
	CreateInvItem(self,ItAm_Hp_01);
	CreateInvItem(self,ItAm_Mana_01);
	CreateInvItem(self,ItAm_Dex_Strg_01);
	CreateInvItem(self,ItAm_Hp_Mana_01);
	CreateInvItem(self,ItAm_Prot_Fire_01);
	CreateInvItem(self,ItAm_Prot_Mage_01);
	CreateInvItem(self,ItAm_Prot_Edge_01);
	CreateInvItem(self,ItAm_Prot_Point_01);
	CreateInvItem(self,ItAm_Prot_Total_01);
	CreateInvItem(self,ItRi_Dex_01);
	CreateInvItem(self,ItRi_Dex_02);
	CreateInvItem(self,ItRi_HP_01);
	CreateInvItem(self,ItRi_HP_02);
	CreateInvItem(self,ItRi_Str_01);
	CreateInvItem(self,ItRi_Str_02);
	CreateInvItem(self,ItRi_Mana_01);
	CreateInvItem(self,ItRi_Mana_02);
	CreateInvItem(self,ItRi_Dex_Strg_01);
	CreateInvItem(self,ItRi_Hp_Mana_01);
	CreateInvItem(self,ItRi_Prot_Fire_01);
	CreateInvItem(self,ItRi_Prot_Fire_02);
	CreateInvItem(self,ItRi_Prot_Edge_01);
	CreateInvItem(self,ItRi_Prot_Edge_02);
	CreateInvItem(self,ItRi_Prot_Mage_01);
	CreateInvItem(self,ItRi_Prot_Mage_02);
	CreateInvItem(self,ItRi_Prot_Point_01);
	CreateInvItem(self,ItRi_Prot_Point_02);
	CreateInvItem(self,ItRi_Prot_Total_01);
	CreateInvItem(self,ItRi_Prot_Total_02);
	CreateInvItems(self,ItPo_Mana_01,10);
	CreateInvItems(self,ItPo_Mana_02,10);
	CreateInvItems(self,ItPo_Mana_03,10);
	CreateInvItems(self,ItPo_Mana_Addon_04,10);
	CreateInvItems(self,ItPo_Health_01,10);
	CreateInvItems(self,ItPo_Health_02,10);
	CreateInvItems(self,ItPo_Health_03,10);
	CreateInvItems(self,ItPo_Health_Addon_04,10);
	CreateInvItems(self,ItPo_Perm_STR,10);
	CreateInvItems(self,ItPo_Perm_DEX,10);
	CreateInvItems(self,ItPo_Perm_Health,10);
	CreateInvItems(self,ItPo_Perm_Mana,10);
	CreateInvItems(self,ItPo_Speed,10);
	CreateInvItem(self,ItAt_Meatbugflesh);
	CreateInvItem(self,ItAt_SheepFur);
	CreateInvItem(self,ItAt_WolfFur);
	CreateInvItem(self,ItAt_BugMandibles);
	CreateInvItem(self,ItAt_Claw);
	CreateInvItem(self,ItAt_LurkerClaw);
	CreateInvItem(self,ItAt_Teeth);
	CreateInvItem(self,ItAt_CrawlerMandibles);
	CreateInvItem(self,ItAt_Wing);
	CreateInvItem(self,ItAt_Sting);
	CreateInvItem(self,ItAt_LurkerSkin);
	CreateInvItem(self,ItAt_WargFur);
	CreateInvItem(self,ItAt_CrawlerPlate);
	CreateInvItem(self,ItAt_ShadowFur);
	CreateInvItem(self,ItAt_SharkSkin);
	CreateInvItem(self,ItAt_TrollFur);
	CreateInvItem(self,ItAt_WaranFiretongue);
	CreateInvItem(self,ItAt_ShadowHorn);
	CreateInvItem(self,ItAt_SharkTeeth);
	CreateInvItem(self,ItAt_TrollTooth);
	CreateInvItem(self,ItAt_GoblinBone);
	CreateInvItem(self,ItAt_SkeletonBone);
	CreateInvItem(self,ItAt_DemonHeart);
	CreateInvItem(self,ItAt_StoneGolemHeart);
	CreateInvItem(self,ItAt_FireGolemHeart);
	CreateInvItem(self,ItAt_IceGolemHeart);
	//����������� � ���� ��������
	CreateInvItem(self,ItRu_ConcussionBolt);
	CreateInvItem(self,ItRu_DeathBolt);
	CreateInvItem(self,ItRu_DeathBall);
	CreateInvItem(self,ItRu_Inflate);
};


