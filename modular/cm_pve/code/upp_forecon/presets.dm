// UPP RTO presets and AI registration for the Fox Stalkers port.

// upp_militia_rto
/datum/equipment_preset/upp/militia/rto
	name = "UPP People's Territorial Guardsman RTO"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "People's Territorial Guard Radio Transmissions Operator"
	role_comm_title = "PTG-RTO"
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0, PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_1)

/datum/equipment_preset/upp/militia/rto/load_gear(mob/living/carbon/human/new_human)

	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/ushanka, WEAR_HEAD)
	new_human.undershirt = "Territorial Guard Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/upp_net/small, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/hatchet, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/fancy/cigar/matchbook/brown, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/flare/upp, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/flare/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp/territorial, WEAR_L_EAR)
	//head
	var/random_hat= rand(1,3)
	switch(random_hat)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap, WEAR_HEAD)
		if(2 to 3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/uppcap/boonie, WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/upp/uniform = new()
	var/random_uniform = rand(1,2)
	switch(random_uniform)
		if(1)
			uniform.roll_suit_jacket(new_human)
		if(2)
			uniform.roll_suit_sleeves(new_human)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/upp, WEAR_ACCESSORY)
	var/random_storage = pick(/obj/item/clothing/accessory/storage/webbing, /obj/item/clothing/accessory/storage/droppouch)
	new_human.equip_to_slot_or_del(new random_storage, WEAR_ACCESSORY)
	//jacket
	var/random_jacket= rand(1,5)
	switch(random_jacket)
		if(1 to 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/upp/jacket, WEAR_JACKET)
		if(3 to 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/lamp, WEAR_JACKET)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/upp/light, WEAR_JACKET)
	if(prob(95))
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71, WEAR_J_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot, WEAR_IN_ACCESSORY)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/upp, WEAR_J_STORE)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard, WEAR_FEET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/compass, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/upp/folded, WEAR_IN_R_STORE)

// upp_rto
/datum/equipment_preset/upp/rto
	name = "UPP Squad Radio Transmissions Operator (Equipped, Type 71)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE
	assignment = JOB_SQUAD_UPP_RTO
	role_comm_title = "RTO"
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/pfc
	access = list(ACCESS_UPP_GENERAL)

/datum/equipment_preset/upp/rto/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/upp_net(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp/impact, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp, WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
	//head
	add_upp_head(new_human)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/upp/standard, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/type71/preloaded, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/type71, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)


/datum/equipment_preset/upp/rto/ag80
	name = "UPP Squad Radio Transmissions Operator (Equipped, AG80)"

/datum/equipment_preset/upp/rto/ag80/load_gear(mob/living/carbon/human/new_human)

	new_human.undershirt = "Naval Infantry Telnyashka"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/upp_net(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive/upp/impact, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/upp, WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/upp, WEAR_L_EAR)
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf, WEAR_FACE)
	//head
	add_upp_head(new_human)
	//uniform
	add_upp_uniform(new_human)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/upp/standard, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/ag80/preloaded, WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/arnold/weak, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ag80, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ag80, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ag80, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

// ai_upp_rto
/datum/human_ai_equipment_preset/upp/rto
	name = "UPP Squad RTO"
	desc = "The standard UPP soldier, but with a radio backpack. These guys are equipped well enough to fight most forces."
	path = /datum/equipment_preset/upp/rto

/datum/human_ai_equipment_preset/upp/rto/ag80
	name = "UPP Squad RTO - AG80"
	desc = "The standard UPP soldier, but with a radio backpack. These guys are equipped well enough to fight most forces."
	path = /datum/equipment_preset/upp/rto/ag80

// ai_militia_rto
/datum/human_ai_equipment_preset/upp/militia/rto
	name = "UPP People's Territorial Guardsman RTO"
	desc = "The auxiliary troop of the UPP, armed with second hand equipment for more basic work. This one is a radio transmissions operator."
	path = /datum/equipment_preset/upp/militia/rto

// Generic UPP RTO job adapted to BandaTroopers' /ai/rto/upp hierarchy.
/datum/job/marine/standard/ai/rto/upp
	title = JOB_SQUAD_UPP_RTO
	gear_preset = /datum/equipment_preset/upp/rto
	gear_preset_secondary = /datum/equipment_preset/upp/rto/ag80
	job_options = list(RIFLEMAN_VARIANT = "Rifleman", PULSE_RIFLEMAN_VARIANT = "Pulse Rifleman")

/obj/effect/landmark/start/marine/rto/upp
	name = JOB_SQUAD_UPP_RTO
	squad = SQUAD_UPP
	job = /datum/job/marine/standard/ai/rto/upp

// Keep the existing generic preset reusable and give Fox Stalkers explicit rank subtypes.
/datum/equipment_preset/uscm/rto/upp
	name = "UPP Radio Transmissions Operator"
	assignment = JOB_SQUAD_UPP_RTO

/datum/equipment_preset/uscm/rto/upp/forecon
	name = "UPP Recon Radio Transmissions Operator"
	assignment = JOB_SQUAD_RTO_FORECON_UPP

/datum/equipment_preset/uscm/rto/upp/forecon/corporal
	name = parent_type::name + " (E3 Rank)"
	paygrades = list(PAY_SHORT_UE3 = JOB_PLAYTIME_TIER_0)

/datum/equipment_preset/uscm/rto/upp/forecon/senior_private
	name = parent_type::name + " (E2 Rank)"
	paygrades = list(PAY_SHORT_UE2 = JOB_PLAYTIME_TIER_0)
