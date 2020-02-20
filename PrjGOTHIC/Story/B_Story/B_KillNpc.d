
func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	npc = Hlp_GetNpc(npcInstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		B_ClearRuneInv(npc);
		CreateInvItem(npc,ItMi_OldCoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		if((npc.guild == GIL_PAL) && (RandomGoblinBerries == FALSE))
		{
			Npc_RemoveInvItems(npc,ItPl_Dex_Herb_01,Npc_HasItems(npc,ItPl_Dex_Herb_01));
		};
	};
};

