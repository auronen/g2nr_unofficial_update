
/*func int stove_cond()
{
	if(Npc_IsPlayer(self))
	{
		if(!Npc_HasItems(self,ItMi_Pan) || !Npc_HasItems(self,ItFoMuttonRaw))
		{
			AI_PlayAni(self,"T_DONTKNOW");
			if(!Npc_HasItems(self,ItMi_Pan) && !Npc_HasItems(self,ItFoMuttonRaw))
			{
				AI_PrintScreen("��������� ��������� � ����� ����!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			}
			else if(!Npc_HasItems(self,ItMi_Pan))
			{
				AI_PrintScreen("��������� ���������!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			}
			else if(!Npc_HasItems(self,ItFoMuttonRaw))
			{
				AI_PrintScreen("��������� ����� ����!",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
			};
			return FALSE;
		};
	};
	return TRUE;
};*/

func void stove_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PAN;
		AI_ProcessInfos(self);
	};
};

func void pan_s1()
{
	if(C_NpcIsHero(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PAN;
		AI_ProcessInfos(self);
	};
};

func void cook_s1()
{
};

instance PC_Pan_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Pan_1_condition;
	information = PC_Pan_1_info;
	permanent = TRUE;
	description = "�������� ��� ����� ������ ����";
};


func int PC_Pan_1_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PAN)
	{
		return TRUE;
	};
};

func void PC_Pan_1_info()
{
	var int amount;
	amount = Npc_HasItems(self,ItFoMuttonRaw);
	if(amount <= 10)
	{
		AI_Wait(self,1);
	}
	else if(amount <= 30)
	{
		AI_Wait(self,3);
	}
	else if(amount <= 50)
	{
		AI_Wait(self,5);
	}
	else if(amount > 50)
	{
		AI_Wait(self,7);
	};
	Npc_RemoveInvItems(self,ItFoMuttonRaw,amount);
	CreateInvItems(self,ItFoMutton,amount);
	AI_PrintScreen("���� ��������",-1,YPOS_GoldGiven,FONT_ScreenSmall,2);
	B_EndProductionDialog();
};

instance PC_Pan_Cancel(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Pan_Cancel_Condition;
	information = PC_Pan_Cancel_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int PC_Pan_Cancel_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_PAN)
	{
		return TRUE;
	};
};

func void PC_Pan_Cancel_Info()
{
	B_EndProductionDialog();
};

