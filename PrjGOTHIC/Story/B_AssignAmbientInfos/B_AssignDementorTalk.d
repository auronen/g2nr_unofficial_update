
instance DIA_AmbientDementor_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_AmbientDementor_EXIT_Condition;
	information = DIA_AmbientDementor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AmbientDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	B_SCIsObsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if(self.aivar[AIV_SubGuild] == GIL_SUB_VinoRitual)
	{
		if(!Npc_IsDead(DMT_Vino1))
		{
			DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino2))
		{
			DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino3))
		{
			DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(DMT_Vino4))
		{
			DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
		};
		if(!Npc_IsDead(Vino))
		{
			Npc_SetTarget(Vino,other);
			AI_StartState(Vino,ZS_Flee,0,"");
		};
	}
	else
	{
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
	};
};


instance DIA_AmbientDementor(C_Info)
{
	nr = 1;
	condition = DIA_AmbientDementor_Condition;
	information = DIA_AmbientDementor_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_AmbientDementor_Condition()
{
	if(!Npc_RefuseTalk(self))
	{
		return TRUE;
	};
};

func void DIA_AmbientDementor_Info()
{
	var int randy;
	randy = Hlp_Random(4);
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if((self.aivar[AIV_SubGuild] == GIL_SUB_VinoRitual) && !Npc_IsDead(Vino))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//�� ������ ���������� ��� ������? ��� ���� ����������� ���. ���� �� ������ ���, ���.
		if(!Npc_IsDead(DMT_Vino4))
		{
			DMT_Vino4.start_aistate = ZS_Stand_Dementor;
		};
		B_StartOtherRoutine(Vino,"RUNFROMRITUAL");
		AI_EquipBestMeleeWeapon(Vino);
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//(�������) �� ������, ����� ������� ����� ��� � ���� ������? �� ������� �� ���������.
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//������ ��� �� ��������� ������ � ��� �����. ����������� �����. ���� ������� �� ��������� �� ��������� �������� ��������.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//�� ��� ����� ������� ������, ���������� �����. ���� ������� �� ��������� �� ����������� ���������.
			}
			else if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//����, ��� ������. �� ���� ������!
			}
			else if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//��, ���� ������� ��������� ����, �� ���� ���� ���� �� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//�� ������, ����� ������� ����� �������, �� ������� ���� �������� ������ ���� ����.
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//������ ���, ���� ������� �� ���������� � ����� �������.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//�� ������ ���� �����, ����� ������������� ���. ����� ���. �� ���� ��� ���� �� �������.
		}
		else if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//���� ������ �����, ���� �� ���������� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//��� ������ �������� ����. ���� ������ ����� �� ������ ����.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//������ �� ���� �������, ���� ��� ������. ���� ������ �� ����.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//������ �� �������� ���� �������. ���� �� ���� �� ����.
		}
		else if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//������ ����� �������� ���� ������. ����� �� ������ ���� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//�� ������� ���� � �������, � ������ ��������� ����.
		};
	};
	if(DementorsDialogeAutoEndDisabled == FALSE)
	{
		AI_StartState(self,DIA_AmbientDementor_EXIT_Info,1,"");
	};
};

func void B_AssignDementorTalk(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) && (slf.npcType == NPCTYPE_AMBIENT))
	{
		DIA_AmbientDementor_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc = Hlp_GetInstanceID(slf);
	};
};

