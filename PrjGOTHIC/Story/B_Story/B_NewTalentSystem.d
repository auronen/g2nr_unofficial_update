
/*const int TS_Training = 0;
const int TS_TempBonus = 1;
const int TS_PermBonus = 2;
const int TS_Max = 3;

const int TAL_Max = 5;

var int TAL_Training[TAL_Max];
var int TAL_TempBonus[TAL_Max];
var int TAL_PermBonus[TAL_Max];

const int TAL_MinValue[TAL_Max] =
{
	0,
	0,
	0,
	0,
	0
};

const int TAL_MaxValue[TAL_Max] =
{
	0,
	100,
	100,
	100,
	100
};

const int TAL_CostFlags[TS_Max] =
{
	1,
	0,
	1
};

func int GetMin(var int x,var int y)
{
	if(x < y)
	{
		return x;
	};
	return y;
};

func int GetMax(var int x,var int y)
{
	if(x > y)
	{
		return x;
	};
	return y;
};

func int CoerceInRange(var int value,var int min,var int max)
{
	value = GetMax(value,min);
	return GetMin(value,max);
};

func void UpdateHeroOverlay(var int oldSkill,var int newSkill,var string mds1,var string mds2)
{
	if(oldSkill == newSkill)
	{
		return;
	};
	if(oldSkill == 1)
	{
		Mdl_RemoveOverlayMds(hero,mds1);
	}
	else if(oldSkill == 2)
	{
		Mdl_RemoveOverlayMds(hero,mds2);
	};
	if(newSkill == 1)
	{
		Mdl_ApplyOverlayMds(hero,mds1);
	}
	else if(newSkill == 2)
	{
		Mdl_ApplyOverlayMds(hero,mds2);
	};
};

func int GetInGameTalent(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_1H] + TAL_TempBonus[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H],
			TAL_MinValue[NPC_TALENT_1H],
			TAL_MaxValue[NPC_TALENT_1H]
		);
	}
	else if(talent == NPC_TALENT_2H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_2H] + TAL_TempBonus[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H],
			TAL_MinValue[NPC_TALENT_2H],
			TAL_MaxValue[NPC_TALENT_2H]
		);
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_BOW] + TAL_TempBonus[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW],
			TAL_MinValue[NPC_TALENT_BOW],
			TAL_MaxValue[NPC_TALENT_BOW]
		);
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_CROSSBOW] + TAL_TempBonus[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW],
			TAL_MinValue[NPC_TALENT_CROSSBOW],
			TAL_MaxValue[NPC_TALENT_CROSSBOW]
		);
	}
	else
	{
		Print(PRINT_WrongParameter);
		return 0;
	};
	return 0;
};

func int B_GetInTrainingTalent(var int talent)
{
//	var int sum;
//	sum = 0;
	if(talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_PermBonus];		
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_PermBonus];
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
//	return sum;
	return 0;
};

func void B_ChangeTalent(var int talent,var int value,var int source)
{
	var int oldSkill;
	var int newSkill;
	if(talent == NPC_TALENT_1H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_1H] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_1H] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_1H] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_1H] = GetInGameTalent(NPC_TALENT_1H);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_1H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_1H] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_1hST1.MDS","humans_1hST2.MDS");
	}
	else if(talent == NPC_TALENT_2H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_2H] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_2H] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_2H] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_2H] = GetInGameTalent(NPC_TALENT_2H);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_2H);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_2H] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_2hST1.MDS","humans_2hST2.MDS");
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_BOW] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_BOW] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_BOW] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_BOW] = GetInGameTalent(NPC_TALENT_BOW);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_BOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_BOW] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_bowT1.MDS","humans_bowT2.MDS");
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_CROSSBOW] += value;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_CROSSBOW] += value;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_CROSSBOW] += value;
		}
		else
		{
			Print(PRINT_WrongParameter);
		};
		hero.HitChance[NPC_TALENT_CROSSBOW] = GetInGameTalent(NPC_TALENT_CROSSBOW);
		oldSkill = Npc_GetTalentSkill(hero,NPC_TALENT_CROSSBOW);
		newSkill = GetMin(hero.HitChance[NPC_TALENT_CROSSBOW] / 30, 2);
		Npc_SetTalentSkill(hero,talent,newSkill);
		UpdateHeroOverlay(oldSkill,newSkill,"humans_cbowT1.MDS","humans_cbowT2.MDS");
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
};

func int GetTalentPointCost(var int talent,var int value)
{
	if(talent >= NPC_TALENT_1H && talent <= NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(value / 30 + 1, 1, 5);
	}
	else
	{
		Print(PRINT_WrongParameter);
	};
//	return ?;
};

func int GetTalentChangeCostImpl(var int talent,var int value,var int change,var int result)
{
	if(change == 0)
	{
		return result;
	};
	return GetTalentChangeCostImpl(talent,value + 1,change - 1,result + GetTalentPointCost(talent,value));
};

func int B_GetTalentChangeCost(var int talent,var int change)
{
	if(change < 0)
	{
		Print(PRINT_WrongParameter);
		return 0;
	};
	return GetTalentChangeCostImpl(talent,B_GetInTrainingTalent(talent),change,0);
};

func int B_IsTalentSupported(var C_NPC npc,var int talent)
{
//	if(C_NpcIsHero(npc) && (talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return TRUE;
	};
	return FALSE;
};

func int B_GetTalentMax(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return TAL_MaxValue[NPC_TALENT_1H];
	};
	if(talent == NPC_TALENT_2H)
	{
		return TAL_MaxValue[NPC_TALENT_2H];
	};
	if(talent == NPC_TALENT_BOW)
	{
		return TAL_MaxValue[NPC_TALENT_BOW];
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		return TAL_MaxValue[NPC_TALENT_CROSSBOW];
	};
	Print(PRINT_WrongParameter);
	return 0;
};

// New Game
func void B_InitTalentSystem()
{
	B_ChangeTalent(NPC_TALENT_1H,hero.HitChance[NPC_TALENT_1H],TS_Training);
	B_ChangeTalent(NPC_TALENT_2H,hero.HitChance[NPC_TALENT_2H],TS_Training);
	B_ChangeTalent(NPC_TALENT_BOW,hero.HitChance[NPC_TALENT_BOW],TS_Training);
	B_ChangeTalent(NPC_TALENT_CROSSBOW,hero.HitChance[NPC_TALENT_CROSSBOW],TS_Training);
};*/

// Talent Sources
const int TS_Training = 0;
const int TS_TempBonus = 1;
const int TS_PermBonus = 2;
const int TS_Max = 3;

// Talents number controlled by the system
const int TAL_Max = 5;

// Prohibit 29 to 34 learn cost abuse
const int BARRIER_ANTIABUSE = 1;

// Values of talents, gained from different sources
var int TAL_Training[TAL_Max];
var int TAL_TempBonus[TAL_Max];
var int TAL_PermBonus[TAL_Max];

// in-game talent limits
const int TAL_MinValue[TAL_Max] = { 0, 0, 0, 0, 0 };
const int TAL_MaxValue[TAL_Max] = { 0, 100, 100, 100, 100 };

// learn price depends on (training / equipment / permanent bonuses)
const int TAL_CostFlags[TS_Max] = { 1, 0, 1 };

// teacher over limiting depends on (training / equipment / permanent bonuses)
const int TAL_TeachLimitFlags[TS_Max] = { 1, 1, 1 };

// Teach Limit Reasons
const int TLR_AlreadyMax = 5; // talent >= 100
const int TLR_WillBeOverMax = 4; // talent + percent > 100
const int TLR_AlreadySame = 3; // talent == teacherMax
const int TLR_AlreadyBetter = 2; // talent > teacherMax
const int TLR_WillBeBetter = 1; // talent + percent > teacherMax
const int TLR_None = 0;

// secondary talent last change
var int SecondaryChange;

// gets minimum of two numbers
func int GetMin(var int x,var int y)
{
	if(x < y)
	{
		return x;
	};
	return y;
};

// gets maximum of two numbers
func int GetMax(var int x,var int y)
{
	if(x > y)
	{
		return x;
	};
	return y;
};

// return nearest to value number from segment [min..max]
func int CoerceInRange(var int value,var int min,var int max)
{
	value = GetMax(value,min);
	return GetMin(value,max);
};

func int IsHero(var C_NPC npc)
{
	if(Npc_IsPlayer(npc) && (Hlp_StrCmp(npc.name[0], "�") == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void ValidateNpc(var C_NPC npc)
{
	if(!Hlp_IsValidNpc(npc))
	{
		Print("Talent System Error: invalid npc"); 
	};
};

func void ValidateTalent(var int talent)
{
	var string text; 
	if((talent < NPC_TALENT_1H) || (talent > NPC_TALENT_CROSSBOW))
	{
		text = "Talent System Error: invalid talent (";
		text = ConcatStrings(text,IntToString(talent));
		text = ConcatStrings(text,")");
		Print(text);
	};
};

func int GetTalent(var C_NPC npc,var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return npc.HitChance[NPC_TALENT_1H];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return npc.HitChance[NPC_TALENT_2H];
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return npc.HitChance[NPC_TALENT_BOW];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return npc.HitChance[NPC_TALENT_CROSSBOW];
	};
	return 0;
};

// removes and applies overlays when talent skill changed
func void UpdateOverlay(var C_NPC npc,var int oldSkill,var int newSkill,var string mds1,var string mds2)
{
	if (oldSkill == newSkill)
	{
		return;
	};
	if(oldSkill == 1)
	{
		Mdl_RemoveOverlayMds(npc,mds1);
	}
	else if(oldSkill == 2)
	{
		Mdl_RemoveOverlayMds(npc,mds2);
	};
	if(newSkill == 1)
	{
		Mdl_ApplyOverlayMds(npc,mds1);
	}
	else if(newSkill == 2)
	{
		Mdl_ApplyOverlayMds(npc,mds2);
	};
};

// calculates talent value, which should be used by the game
func int GetTalentPart_Game_Hero(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_1H] + TAL_TempBonus[NPC_TALENT_1H] + TAL_PermBonus[NPC_TALENT_1H],
			TAL_MinValue[NPC_TALENT_1H],
			TAL_MaxValue[NPC_TALENT_1H]
		);
	}
	else if(talent == NPC_TALENT_2H)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_2H] + TAL_TempBonus[NPC_TALENT_2H] + TAL_PermBonus[NPC_TALENT_2H],
			TAL_MinValue[NPC_TALENT_2H],
			TAL_MaxValue[NPC_TALENT_2H]
		);
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_BOW] + TAL_TempBonus[NPC_TALENT_BOW] + TAL_PermBonus[NPC_TALENT_BOW],
			TAL_MinValue[NPC_TALENT_BOW],
			TAL_MaxValue[NPC_TALENT_BOW]
		);
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return CoerceInRange(
			TAL_Training[NPC_TALENT_CROSSBOW] + TAL_TempBonus[NPC_TALENT_CROSSBOW] + TAL_PermBonus[NPC_TALENT_CROSSBOW],
			TAL_MinValue[NPC_TALENT_CROSSBOW],
			TAL_MaxValue[NPC_TALENT_CROSSBOW]
		);
	};
	return 0;
};

// calculates talent value, which determines learning cost value
func int GetTalentPart_Cost_Hero(var int talent)
{
	if (talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_CostFlags[TS_PermBonus];		
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_CostFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_CostFlags[TS_PermBonus];
	};
	return 0;
};

// calculates talent value, comparable with teacher limit
func int GetTalentPart_TeachLimit_Hero(var int talent)
{
	if(talent == NPC_TALENT_1H)
	{
		return 
			TAL_Training[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_1H] * TAL_TeachLimitFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_2H)
	{
		return 
			TAL_Training[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_2H] * TAL_TeachLimitFlags[TS_PermBonus];		
	}
	else if(talent == NPC_TALENT_BOW)
	{
		return 
			TAL_Training[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_BOW] * TAL_TeachLimitFlags[TS_PermBonus];
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		return 
			TAL_Training[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_Training] + 
			TAL_TempBonus[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_TempBonus] +
			TAL_PermBonus[NPC_TALENT_CROSSBOW] * TAL_TeachLimitFlags[TS_PermBonus];
	};
	return 0;
};

// check hero talent value to start training
func int TeacherCanTrainTalent(var int talent,var int teacherMin)
{
	var int teachPart;
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	if(teachPart >= teacherMin)
	{
		return TRUE;
	};
	return FALSE;
};

func void UpdateTalent(var C_NPC npc,var int talent,var int value)
{
	var int oldSkill;
	var int newSkill;
	if(talent == NPC_TALENT_1H)
	{
		npc.HitChance[NPC_TALENT_1H] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_1H);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_1H] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_1hST1.MDS","humans_1hST2.MDS");
	}
	else if(talent == NPC_TALENT_2H)
	{
		npc.HitChance[NPC_TALENT_2H] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_2H);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_2H] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_2hST1.MDS","humans_2hST2.MDS");
	}
	else if(talent == NPC_TALENT_BOW)
	{
		npc.HitChance[NPC_TALENT_BOW] = value;
		oldSkill = Npc_GetTalentSkill(npc,NPC_TALENT_BOW);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_BOW] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_bowT1.MDS","humans_bowT2.MDS");
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		npc.HitChance[NPC_TALENT_CROSSBOW] = value;
		oldSkill = Npc_GetTalentSkill(npc, NPC_TALENT_CROSSBOW);
		newSkill = GetMin(npc.HitChance[NPC_TALENT_CROSSBOW] / 30, 2);
		Npc_SetTalentSkill(npc,talent,newSkill);
		UpdateOverlay(npc,oldSkill,newSkill,"humans_cbowT1.MDS","humans_cbowT2.MDS");
	}
	else
	{
		Print("ERROR");
	};
};

// updates talent's in-game value
func void UpdateTalent_Hero(var int talent)
{
	UpdateTalent(hero, talent, GetTalentPart_Game_Hero(talent));
};

// cuts the value, when talent's teach limit part exceeds allowed range
func int CutChange_Hero(var int talent,var int change,var int source)
{
	var int minChange;
	minChange = -10000;
	var int maxChange;
	maxChange = 10000;
	var int teachPart;
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	var int isPositive;
	isPositive = FALSE;
	if(change > 0)
	{
		isPositive = TRUE;
	};
	if(
		((source == TS_Training) && (TAL_TeachLimitFlags[TS_Training] == 0)) ||
		((source == TS_TempBonus) && (TAL_TeachLimitFlags[TS_TempBonus] == 0)) ||
		((source == TS_PermBonus) && (TAL_TeachLimitFlags[TS_PermBonus] == 0))
	)
	{
		// source doesn't affect teach limit (don't cut)
		return change;
	};
	if(talent == NPC_TALENT_1H)
	{
		minChange = TAL_MinValue[NPC_TALENT_1H] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_1H] - teachPart;
	}
	else if(talent == NPC_TALENT_2H)
	{
		minChange = TAL_MinValue[NPC_TALENT_2H] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_2H] - teachPart;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		minChange = TAL_MinValue[NPC_TALENT_BOW] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_BOW] - teachPart;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		minChange = TAL_MinValue[NPC_TALENT_CROSSBOW] - teachPart;
		maxChange = TAL_MaxValue[NPC_TALENT_CROSSBOW] - teachPart;
	};
	change = CoerceInRange(change,minChange,maxChange);
	if(isPositive == TRUE)
	{
		return GetMax(0,change);
	};
	return GetMin(0,change);
};

// changes talent by the value with specified Talent Source
// returns talent's real change, also set SecondaryChange variable
func int ChangeTalent(var C_NPC npc,var int talent,var int change,var int source)
{
	SecondaryChange = 0;
	if(talent == NPC_TALENT_1H)
	{
		UpdateTalent(npc, talent, npc.HitChance[NPC_TALENT_1H] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_1H] - npc.HitChance[NPC_TALENT_2H] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			UpdateTalent(npc, NPC_TALENT_2H, npc.HitChance[NPC_TALENT_2H] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_2H)
	{
		UpdateTalent(npc, talent, npc.HitChance[NPC_TALENT_2H] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_2H] - npc.HitChance[NPC_TALENT_1H] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			UpdateTalent(npc, NPC_TALENT_1H, npc.HitChance[NPC_TALENT_1H] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_BOW)
	{
		UpdateTalent(npc, talent, npc.HitChance[NPC_TALENT_BOW] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_BOW] - npc.HitChance[NPC_TALENT_CROSSBOW] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			UpdateTalent(npc, NPC_TALENT_CROSSBOW, npc.HitChance[NPC_TALENT_CROSSBOW] + SecondaryChange);
		};
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		UpdateTalent(npc, talent, npc.HitChance[NPC_TALENT_CROSSBOW] + change);
		if(source == TS_Training)
		{
			SecondaryChange = npc.HitChance[NPC_TALENT_CROSSBOW] - npc.HitChance[NPC_TALENT_BOW] - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			UpdateTalent(npc, NPC_TALENT_BOW, npc.HitChance[NPC_TALENT_BOW] + SecondaryChange);
		};
	};
	return change;
};

// changes talent by the value with specified Talent Source
// returns talent's real change, also set SecondaryChange variable
func int ChangeTalent_Hero(var int talent,var int change,var int source)
{
	SecondaryChange = 0;
	if(source != TS_TempBonus)
	{
		change = CutChange_Hero(talent, change, source);
	};
	if(talent == NPC_TALENT_1H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_1H] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_1H) - GetTalentPart_Cost_Hero(NPC_TALENT_2H) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			TAL_Training[NPC_TALENT_2H] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_1H] += change;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_1H] += change;
		}
		else 
		{
			Print("ERROR");
		};
		
		UpdateTalent_Hero(NPC_TALENT_1H);
		UpdateTalent_Hero(NPC_TALENT_2H);
		return change;
	}
	else if(talent == NPC_TALENT_2H)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_2H] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_2H) - GetTalentPart_Cost_Hero(NPC_TALENT_1H) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange, 0, change);
			TAL_Training[NPC_TALENT_1H] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_2H] += change;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_2H] += change;
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_2H);
		UpdateTalent_Hero(NPC_TALENT_1H);
		return change;
	}
	else if(talent == NPC_TALENT_BOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_BOW] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_BOW) - GetTalentPart_Cost_Hero(NPC_TALENT_CROSSBOW) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_CROSSBOW] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_BOW] += change;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_BOW] += change;
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_BOW);
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
		return change;
	}
	else if(talent == NPC_TALENT_CROSSBOW)
	{
		if(source == TS_Training)
		{
			TAL_Training[NPC_TALENT_CROSSBOW] += change;
			SecondaryChange = GetTalentPart_Cost_Hero(NPC_TALENT_CROSSBOW) - GetTalentPart_Cost_Hero(NPC_TALENT_BOW) - 30;
			SecondaryChange = CoerceInRange(SecondaryChange,0,change);
			TAL_Training[NPC_TALENT_BOW] += SecondaryChange;
		}
		else if(source == TS_TempBonus)
		{
			TAL_TempBonus[NPC_TALENT_CROSSBOW] += change;
		}
		else if(source == TS_PermBonus)
		{
			TAL_PermBonus[NPC_TALENT_CROSSBOW] += change;
		}
		else 
		{
			Print("ERROR");
		};
		UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
		UpdateTalent_Hero(NPC_TALENT_BOW);
		return change;
	};
	return 0;
};

// gets cost of one point of talent, which cost-part equals to value
func int GetTalentPointCost(var int talent,var int value)
{
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return CoerceInRange(value / 30 + 1, 1, 1000);
	};
	return 0;
};

// gets next cost barrier for talent, which cost-part equals to value
func int GetNextTalentBarrier(var int talent,var int value)
{
	if((talent >= NPC_TALENT_1H) && (talent <= NPC_TALENT_CROSSBOW))
	{
		return CoerceInRange(value / 30 * 30 + 30, 30, 90);
	};
	return 0;
};

// calculates lp-cost of increasing talent by `change`
func int GetTalentTrainCost_Impl(var int talent,var int value,var int change)
{	
	var int barrier;
	barrier = GetNextTalentBarrier(talent, value);

	var int costBefore;
	costBefore = GetTalentPointCost(talent,value);

	var int costAfter;
	costAfter = GetTalentPointCost(talent, barrier);

	var int pointsBefore;
	pointsBefore = GetMin(barrier - value, change);

	if((BARRIER_ANTIABUSE == FALSE) || (TAL_CostFlags[TS_Training] == 0))
	{
		return change * costBefore;
	};
	
	return pointsBefore * costBefore + (change - pointsBefore) * costAfter;
};

// calculates lp-cost of increasing talent by `change`
func int GetTalentTrainCost_Hero(var int talent,var int change)
{
	return GetTalentTrainCost_Impl(talent,GetTalentPart_Cost_Hero(talent),change);
};

// calculates lp-cost of increasing talent by `change`
func int GetTalentTrainCost(var C_NPC npc,var int talent,var int change)
{
	return GetTalentTrainCost_Impl(talent,GetTalent(npc,talent),change);
};

// gets maximum in-game value of talent
func int GetTalentMax(var int talent)
{
	if (talent == NPC_TALENT_1H)
	{
		return TAL_MaxValue[NPC_TALENT_1H];
	};
	if (talent == NPC_TALENT_2H)
	{
		return TAL_MaxValue[NPC_TALENT_2H];
	};
	if (talent == NPC_TALENT_BOW)
	{
		return TAL_MaxValue[NPC_TALENT_BOW];
	};
	if (talent == NPC_TALENT_CROSSBOW)
	{
		return TAL_MaxValue[NPC_TALENT_CROSSBOW];
	};
	Print("ERROR");
	return 0;
};

// returns the reason the teacher can't teach talent
func int GetTeachLimitReason_Hero(var int talent,var int change,var int teacherMax)
{
	change *= TAL_TeachLimitFlags[TS_Training];
	var int teachPart;
	teachPart = GetTalentPart_TeachLimit_Hero(talent);
	var int talentMax;
	talentMax = GetTalentMax(talent);
	
	if(teachPart >= GetTalentMax(talent))
	{
		return TLR_AlreadyMax;
	};
	if(teachPart + change > GetTalentMax(talent))
	{
		return TLR_WillBeOverMax;
	};
	if(teachPart == teacherMax)
	{
		return TLR_AlreadySame;
	};
	if(teachPart > teacherMax)
	{
		return TLR_AlreadyBetter;
	};
	if(teachPart + change > teacherMax)
	{
		return TLR_WillBeBetter;
	};
	return TLR_None;
};

func int GetTeachLimitReason(var C_NPC npc,var int talent,var int change,var int teacherMax)
{
	var int value;
	value = GetTalent(npc, talent);
	if(value >= GetTalentMax(talent))
	{
		return TLR_AlreadyMax;
	};
	if(value + change > GetTalentMax(talent))
	{
		return TLR_WillBeOverMax;
	};
	if(value == teacherMax)
	{
		return TLR_AlreadySame;
	};
	if(value > teacherMax)
	{
		return TLR_AlreadyBetter;
	};
	if(value + change > teacherMax)
	{
		return TLR_WillBeBetter;
	};
	return TLR_None;
};

//===============================INTERFACE============================================

// initialize the talent system (must not be called twice)
func void B_InitTalentSystem()
{
	ValidateNpc(hero);
	TAL_Training[NPC_TALENT_1H] = hero.HitChance[NPC_TALENT_1H];
	TAL_Training[NPC_TALENT_2H] = hero.HitChance[NPC_TALENT_2H];
	TAL_Training[NPC_TALENT_BOW] = hero.HitChance[NPC_TALENT_BOW];
	TAL_Training[NPC_TALENT_CROSSBOW] = hero.HitChance[NPC_TALENT_CROSSBOW];
	UpdateTalent_Hero(NPC_TALENT_1H);
	UpdateTalent_Hero(NPC_TALENT_2H);
	UpdateTalent_Hero(NPC_TALENT_BOW);
	UpdateTalent_Hero(NPC_TALENT_CROSSBOW);
};

// returns the reason the teacher can't teach talent
func int B_GetTeachLimitReason(var C_NPC npc,var int talent,var int change,var int teacherMax)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return GetTeachLimitReason_Hero(talent,change,teacherMax);
	};
	return GetTeachLimitReason(npc,talent,change,teacherMax);
};

func int B_GetTalentTrainCost(var C_NPC npc,var int talent,var int change)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return GetTalentTrainCost_Hero(talent,change);
	};
	return GetTalentTrainCost(npc,talent,change);
};

func int B_ChangeTalent(var C_NPC npc,var int talent,var int change,var int source)
{
	ValidateNpc(npc);
	ValidateTalent(talent);
	if(IsHero(npc))
	{
		return ChangeTalent_Hero(talent,change,source);
	};
	return ChangeTalent(npc,talent,change,source);
};

