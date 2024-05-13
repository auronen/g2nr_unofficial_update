
func void ZS_Smith_Fire()
{
	B_SetLastUsedMobsi(self,MOBSI_SmithWeapon);
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smith_Fire_Loop()
{
	B_UseAvailableMob(self,"BSFIRE");
	return LOOP_CONTINUE;
};

func void ZS_Smith_Fire_End()
{
	AI_UseMob(self,"BSFIRE",-1);
};

