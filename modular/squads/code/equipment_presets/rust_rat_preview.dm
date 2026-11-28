// Menu-only appearance preset. Live Rust Rat spawn presets remain unchanged.
/datum/equipment_preset/uscm/rust_rat_preview
	name = "Rust Rat Character Preview"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_RUST_RAT_FREELANCER
	rank = JOB_RUST_RAT_FREELANCER
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)

/datum/equipment_preset/uscm/rust_rat_preview/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction/freelancer(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/freelancer/beret(new_human), WEAR_HEAD)
