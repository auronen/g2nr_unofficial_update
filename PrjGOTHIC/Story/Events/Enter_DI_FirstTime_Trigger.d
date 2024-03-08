
var int EnterDI_Kapitel6;

func void Enter_DI_FirstTime_Trigger()
{
	if(EnterDI_Kapitel6 == FALSE)
	{
		var C_Npc player;
		player = Hlp_GetNpc(PC_Hero);
		if(player.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};
		if(!Npc_HasItems(player,ItMi_InnosEye_MIS))
		{
			Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
			if(!Npc_HasItems(player,ItMi_InnosEye_Discharged_MIS))
			{
				Wld_InsertItem(ItSe_XardasNotfallBeutel_MIS,"FP_ITEM_SHIP_12");
				SC_InnosEyeVergessen_DI = TRUE;
				B_LogEntry(TOPIC_HallenVonIrdorath,"������� ����� ��� ��������� ���. �� ���� ������� �������, �� �������� ���� ������� � ������������� ����� �� �������, ����� ������� ���-��� � ����. ��� ����� �������, �� � ������ �� ��� ����� �������.");
			};
			if(!Npc_HasItems(player,ItAt_IcedragonHeart) && !Npc_HasItems(player,ItAt_RockdragonHeart) && !Npc_HasItems(player,ItAt_FiredragonHeart) && !Npc_HasItems(player,ItAt_SwampdragonHeart))
			{
				CreateInvItems(AntiPaladin_DI,ItAt_RockdragonHeart,1);
			};
		};
		if(PedroGotLostInnosStatue == TRUE)
		{
			CreateInvItems(AntiPaladin_DI,ItMi_LostInnosStatue_Daron,1);
		};
		Log_CreateTopic(TOPIC_MyCrew,LOG_NOTE);
		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"������, ��� �������, ����� ����� �� ������� ����� �����������.");
		}
		else if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"������, ��� �������, ����� ����� �� ������� � ��������� ��� �� ����� ����� ����������. �� ����� ����� ������ ��� �������� ��� ���� � ��������.");
		}
		else if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"����, ��� �������, ����� ����� �� ������� ����� �����������. ������, �� ������� �������. �������, �� ������� ���� � ����. �� ����� ���.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"�� ����� ����������� �������� � ��� ����������. �� ����� ����� ������ ��� ��������� ����� ������� ��������� � ���������� �������.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			if(player.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"������ ����� ������ ��� � ���������� ���� � ��������� ����� ���.");
			}
			else
			{
				Log_AddEntry(TOPIC_MyCrew,"������ ����� ������ ��� �������� ��� ����.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"� ���� ����� �����������, ��� ��������� ������� ������ ���������� �� ���� �������� �������.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ���� ������� �������. �� ������ ����� �� ����� � ��� ����� �� ���� ����� �� ������ �� �����.");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ������� ���� �������� �� �������� � ����.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			if(player.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"������ �������� � ����� �����. �� ����� ������ ���� � ����� ��������� �������� ������������� �����. ����� � ��� ������� � ����� �������� ���� ���� �����.");
			}
			else
			{
				Log_AddEntry(TOPIC_MyCrew,"������ �������� � ����� �����. �� ����� ������ ���� � ����� ��������� �������� ������������� �����.");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ ������ ���� ���������� ����, ���� � ������. ����� �� ����� ������ ��� �������� ��� ����.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ������� ���, ���� � �� ����, ��� ������, ����� � ���� ���� �������� ��� ����. �� ����� ������� ���� ������������ ��������� � ����� �������� �� ���� � ��������.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"���� �� ���� �� ������ �� ����� ������ �����������. �� ����� ������������� �� ��������. � �����, ������� ����� � �������� �����. ����� ���� ����� ������ ��� ��������� ����� ������� ��������� �������.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ������ ������� ���� �������� � ��������� ���������� �������. ����� ����� �� ����� �������� ��� ��������.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"���� ������� ����� �� �����, ��� ��������. ��� ������ ��������������.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"����� ����� ���������. ��� �������, ��� ��� �������, � �� ������� ����-������ ��������� ��� �������.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"������ ����������. ��� ����������� ��������. � �� ������������ ���������� ���. ��� ����� ����������� ���.");
		};
		IntroduceChapter(KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav",6000);
		EnterDI_Kapitel6 = TRUE;
	};
};

