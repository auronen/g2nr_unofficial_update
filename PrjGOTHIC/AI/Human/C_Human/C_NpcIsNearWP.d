
func int C_NpcIsNearWP(var C_Npc slf,var string wp)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(slf),wp))
	{
		return TRUE;
	};
	return FALSE;
};

