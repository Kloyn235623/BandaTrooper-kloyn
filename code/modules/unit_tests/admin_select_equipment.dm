/datum/unit_test/admin_select_equipment_hig_vv

/datum/unit_test/admin_select_equipment_hig_vv/Run()
	var/mob/living/carbon/human/human = allocate(/mob/living/carbon/human)
	var/datum/equipment_preset/preset = GLOB.gear_name_presets_list["Survivor - Lasalle-Bionational - HIG"]
	TEST_ASSERT_NOTNULL(preset, "The base HIG preset must be available in Select Equipment.")
	TEST_ASSERT_NOTNULL(GLOB.origins[preset.origin_override], "HIG origin must be registered before the preset is applied.")

	arm_equipment(human, preset)

	TEST_ASSERT_EQUAL(human.assigned_equipment_preset, preset, "arm_equipment must accept the preset datum passed by VV.")
	TEST_ASSERT(locate(/obj/item/clothing/under/marine/veteran/lb_merc) in human, "The base HIG preset must equip its uniform.")
	TEST_ASSERT(locate(/obj/item/clothing/suit/storage/marine/veteran/lb_merc) in human, "The base HIG preset must equip its armor.")
	TEST_ASSERT(locate(/obj/item/clothing/head/helmet/marine/veteran/lb_merc) in human, "The base HIG preset must equip its helmet.")
