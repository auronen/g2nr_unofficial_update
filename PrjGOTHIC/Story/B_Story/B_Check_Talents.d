
func void B_Check_Talents()
{
	//������� � 27 ������ �� ���������� � INIT_Global ��� ������ ��������
	var C_Item weapon;
	B_InitTalentSystem();
	if(Npc_HasEquippedMeleeWeapon(hero))
	{
		weapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsValidItem(weapon))
		{
			B_UnEquipHeroItem(Hlp_GetInstanceID(weapon));
		};
	};
	B_UnEquipHeroItem(ItRi_Addon_MorgansRing_Mission);
	B_InitTalentSystem();
};

