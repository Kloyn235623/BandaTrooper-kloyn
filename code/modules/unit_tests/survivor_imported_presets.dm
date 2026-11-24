/datum/unit_test/survivor_imported_presets

/datum/unit_test/survivor_imported_presets/Run()
	var/list/preset_paths = list(
		/datum/equipment_preset/survivor/abyssal/civilian,
		/datum/equipment_preset/survivor/abyssal/engineer,
		/datum/equipment_preset/survivor/abyssal/security_officer,
		/datum/equipment_preset/survivor/abyssal/colonial_marshal,
		/datum/equipment_preset/survivor/abyssal/scientist,
		/datum/equipment_preset/survivor/abyssal/doctor,
		/datum/equipment_preset/survivor/conam,
		/datum/equipment_preset/survivor/abyssal/captain,
		/datum/equipment_preset/survivor/engineer/soro_industry_contractor,
		/datum/equipment_preset/survivor/engineer/soro_reactor_tech,
		/datum/equipment_preset/survivor/peoples_armed_police,
		/datum/equipment_preset/survivor/upp/army,
		/datum/equipment_preset/survivor/doctor/soro,
		/datum/equipment_preset/survivor/scientist/soro,
		/datum/equipment_preset/survivor/upp_colonist,
		/datum/equipment_preset/survivor/upp_fire_fighter,
		/datum/equipment_preset/survivor/upp_miner,
		/datum/equipment_preset/survivor/hyperdyne,
	)
	var/mob/living/carbon/human/human = allocate(/mob/living/carbon/human)
	for(var/preset_path as anything in preset_paths)
		arm_equipment(human, preset_path)
		TEST_ASSERT_EQUAL(human.assigned_equipment_preset.type, preset_path, "[preset_path] was not registered or did not finish applying.")
		var/has_equipped_clothing = FALSE
		for(var/obj/item/clothing/equipped_clothing in human.contents)
			has_equipped_clothing = TRUE
			break
		TEST_ASSERT(has_equipped_clothing, "[preset_path] did not equip any clothing.")
