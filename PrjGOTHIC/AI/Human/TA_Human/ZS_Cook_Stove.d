
func void ZS_Cook_Stove()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_NpcIsOnRoutineWP(self))
	{
		AI_GotoWP(self,self.wp);
	};
	if(!Npc_HasItems(self,ItFoMuttonRaw))
	{
		CreateInvItem(self,ItFoMuttonRaw);
	};
};

func int ZS_Cook_Stove_Loop()
{
	B_UseAvailableMob(self,"STOVE");
	return LOOP_CONTINUE;
};

func void ZS_Cook_Stove_End()
{
	AI_UseMob(self,"STOVE",-1);
	if(Npc_HasItems(self,ItFoMutton))
	{
		Npc_RemoveInvItems(self,ItFoMutton,1);
	};
};

