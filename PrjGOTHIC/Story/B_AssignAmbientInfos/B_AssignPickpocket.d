
func string B_BuildPickpocketString()
{
	var string text;
	if(self.aivar[AIV_DexToSteal] <= 20)
	{
		text = "(��� ������ �����, ��� ������� ";
	}
	else
	{
		text = "(������� ";
	};
	if(self.aivar[AIV_Gender] == FEMALE)
	{
		text = ConcatStrings(text,"ee ");
	}
	else
	{
		text = ConcatStrings(text,"e�� ");
	};
	Npc_GetInvItem(self,self.aivar[AIV_ItemToSteal]);
	if(Hlp_StrCmp(item.name,NAME_Amulett))
	{
		text = ConcatStrings(text,"������");
	}
	else if(Hlp_StrCmp(item.name,NAME_Key) || (self.aivar[AIV_HiddenTradeItem] != 0))
	{
		text = ConcatStrings(text,"����");
	}
	else if(Hlp_StrCmp(item.name,NAME_Trank))
	{
		text = ConcatStrings(text,"�����");
	}
	else if(Hlp_StrCmp(item.name,NAME_InnosStatue))
	{
		text = ConcatStrings(text,"���������");
	}
	else if(Hlp_StrCmp(item.name,NAME_Spruchrolle))
	{
		text = ConcatStrings(text,"������");
	}
	else if(Hlp_IsItem(item,ItMi_Nugget))
	{
		text = ConcatStrings(text,"����� ����");
	}
	else if(Hlp_IsItem(item,ItWr_Map_OldWorld))
	{
		text = ConcatStrings(text,"�����");
	}
	else if(Hlp_IsItem(item,ItWr_Schuldenbuch) || Hlp_IsItem(item,ItWr_CorneliusTagebuch_Mis))
	{
		text = ConcatStrings(text,"�����");
	}
	else if(Hlp_IsItem(item,ItWr_Manowar))
	{
		text = ConcatStrings(text,"��������");
	}
	else if(Hlp_IsItem(item,ItMi_ArrowPack))
	{
		text = ConcatStrings(text,"������");
	}
	else if(Hlp_IsItem(item,ItMi_SilverRing))
	{
		text = ConcatStrings(text,"������");
	}
	else
	{
		text = ConcatStrings(text,"�������");
	};
	if(self.aivar[AIV_DexToSteal] <= 20)
	{
		text = ConcatStrings(text,")");
	}
	else if(self.aivar[AIV_DexToSteal] <= 40)
	{
		text = ConcatStrings(text," ����� �������� ������)");
	}
	else if(self.aivar[AIV_DexToSteal] <= 60)
	{
		text = ConcatStrings(text," ����� �������� ����������)");
	}
	else if(self.aivar[AIV_DexToSteal] <= 80)
	{
		text = ConcatStrings(text," ����� �������� ������)");
	}
	else if(self.aivar[AIV_DexToSteal] <= 100)
	{
		text = ConcatStrings(text," ����� ��������� ������)");
	}
	else
	{
		text = ConcatStrings(text," ����������� ����������)");
	};
	return text;
};

instance DIA_Pickpocket(C_Info)
{
	nr = 998;
	condition = DIA_Pickpocket_Condition;
	information = DIA_Pickpocket_Info;
	permanent = TRUE;
	description = DIALOG_PICKPOCKET;
};


func int DIA_Pickpocket_Condition()
{
	if(C_CanStealFromNpc())
	{
		DIA_Pickpocket.description = B_BuildPickpocketString();
		return TRUE;
	};
};

func void DIA_Pickpocket_Info()
{
	Info_ClearChoices(DIA_Pickpocket);
	Info_AddChoice(DIA_Pickpocket,Dialog_Back,DIA_Pickpocket_BACK);
	Info_AddChoice(DIA_Pickpocket,DIALOG_PICKPOCKET,DIA_Pickpocket_DoIt);
};

func void DIA_Pickpocket_DoIt()
{
	B_StealItem();
	Info_ClearChoices(DIA_Pickpocket);
};

func void DIA_Pickpocket_BACK()
{
	Info_ClearChoices(DIA_Pickpocket);
};

func void B_AssignPickpocket(var C_Npc slf)
{
	DIA_Pickpocket.npc = Hlp_GetInstanceID(slf);
};

