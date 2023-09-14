
func void evt_oc_maingate_func_s1()
{
	if(MIS_OCGateOpen == FALSE)
	{
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(OrcShaman_Sit,"OC_TO_GUARD");
		Wld_InsertNpc(OrcElite_Roam,"OC_TO_GUARD");
		Wld_InsertNpc(Warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(Warg,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_GUARD_ENTRANCE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_TRAIN_04");
		Wld_InsertNpc(OrcElite_Roam,"OC_TRAIN_04");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(Warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(Warg,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(OrcElite_Roam,"OC_CAMPFIRE_OUT_01");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_02");
		Wld_InsertNpc(OrcElite_Roam,"OC_CENTER_02");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_CENTER_03");
		Wld_InsertNpc(OrcElite_Roam,"OC_CENTER_03");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcShaman_Sit,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcElite_Roam,"OC_KITCHEN_ENTRANCE");
		Wld_InsertNpc(OrcWarrior_Roam,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(OrcShaman_Sit,"OC_EBR_HALL_THRONE");
		Wld_InsertNpc(Warg,"OC_EBR_HALL_THRONE");
		B_KillNpc(VLK_4145_Waffenknecht);
		B_KillNpc(VLK_4146_Waffenknecht);
		B_KillNpc(VLK_4147_Waffenknecht);
		B_KillNpc(VLK_4101_Waffenknecht);
		B_KillNpc(VLK_4102_Waffenknecht);
		B_KillNpc(VLK_4103_Waffenknecht);
		B_KillNpc(VLK_4104_Waffenknecht);
		B_KillNpc(VLK_4105_Waffenknecht);
		if(!Npc_IsDead(HaupttorWache_4143))
		{
			AI_Teleport(HaupttorWache_4143,"OC_WALL_05");
			B_StartOtherRoutine(HaupttorWache_4143,"OrcAttack");
			B_KillNpc(VLK_4143_HaupttorWache);
		};
		if(!Npc_IsDead(Engor))
		{
			AI_Teleport(Engor,"OC_GUARD_IN_01");
			B_StartOtherRoutine(Engor,"OrcAttack");
			B_KillNpc(VLK_4108_Engor);
			B_ClearDeadTrader(Engor);
		};
		if(!Npc_IsDead(Brutus))
		{
			Brutus.flags = NPC_FLAG_IMMORTAL;
		};
		if(!Npc_IsDead(Garond))
		{
			Garond.flags = 0;
		};
		PlayVideo("ORCATTACK.BIK");
		MIS_OCGateOpen = TRUE;
	};
};

