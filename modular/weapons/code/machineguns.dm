/datum/ammo/bullet/mg42
	name = "7.92x57mm machinegun bullet"
	parent_type = /datum/ammo/bullet/m60
	damage = 70
	penetration = ARMOR_PENETRATION_TIER_8

/datum/ammo/bullet/mg3
	name = "7.62x51mm machinegun bullet"
	parent_type = /datum/ammo/bullet/m60
	damage = 60
	penetration = ARMOR_PENETRATION_TIER_6

/obj/item/ammo_magazine/machinegun/mg42
	name = "MG42 belt box (7.92x57mm)"
	desc = "A 100-round belt box for the MG42."
	icon = 'modular/weapons/icons/machineguns/mg42.dmi'
	icon_state = "mg"
	item_state = "mg"
	item_icons = list(
		WEAR_L_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
		WEAR_R_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
	)
	caliber = "7.92x57mm"
	default_ammo = /datum/ammo/bullet/mg42
	max_rounds = 100
	gun_type = /obj/item/weapon/gun/mg42
	reload_delay = 8
	w_class = SIZE_MEDIUM

/obj/item/ammo_magazine/machinegun/mg3
	name = "MG3 belt box (7.62x51mm)"
	desc = "A 100-round belt box for the MG3."
	icon = 'modular/weapons/icons/machineguns/mg42.dmi'
	icon_state = "mg"
	item_state = "mg"
	item_icons = list(
		WEAR_L_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
		WEAR_R_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
	)
	caliber = "7.62x51mm"
	default_ammo = /datum/ammo/bullet/mg3
	max_rounds = 100
	gun_type = /obj/item/weapon/gun/mg3
	reload_delay = 8
	w_class = SIZE_MEDIUM

/obj/item/ammo_box/rounds/mg42
	name = "MG42 ammunition box (7.92x57mm)"
	desc = "A box of 600 rounds for MG42 belt boxes."
	icon_state = "base_type71"
	default_ammo = /datum/ammo/bullet/mg42
	caliber = "7.92x57mm"

/obj/item/ammo_box/rounds/mg3
	name = "MG3 ammunition box (7.62x51mm)"
	desc = "A box of 600 rounds for MG3 belt boxes."
	icon_state = "base_m41"
	default_ammo = /datum/ammo/bullet/mg3
	caliber = "7.62x51mm"

/obj/item/weapon/gun/machinegun
	name = "machine gun"
	desc = "A belt-fed general-purpose machine gun."
	icon = 'modular/weapons/icons/machineguns/mg.dmi'
	icon_state = "mg42"
	item_state = "mg42"
	firesound_volume = 35
	mouse_pointer = 'icons/effects/mouse_pointer/lmg_mouse.dmi'
	w_class = SIZE_LARGE
	force = 25
	has_empty_icon = TRUE
	flags_gun_features = GUN_WIELDED_FIRING_ONLY|GUN_CAN_POINTBLANK|GUN_AUTO_EJECT_CASINGS|GUN_AMMO_COUNTER
	gun_category = GUN_CATEGORY_HEAVY
	start_semiauto = FALSE
	start_automatic = TRUE
	var/held_sprite = "mg42"

/obj/item/weapon/gun/machinegun/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0)
		load_into_chamber()

/obj/item/weapon/gun/machinegun/get_icon_state(mob/user_mob, slot)
	if(slot == WEAR_L_HAND)
		return "[held_sprite]_left[(flags_item & WIELDED) ? "_wield" : ""]"
	if(slot == WEAR_R_HAND)
		return "[held_sprite]_right[(flags_item & WIELDED) ? "_wield" : ""]"
	return ..()

/obj/item/weapon/gun/machinegun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_10)
	set_burst_amount(BURST_AMOUNT_TIER_5)
	set_burst_delay(FIRE_DELAY_TIER_10)
	accuracy_mult = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_10
	burst_scatter_mult = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/mg42
	parent_type = /obj/item/weapon/gun/machinegun
	name = "MG42 machine gun"
	desc = "A belt-fed general-purpose machine gun chambered in 7.92x57mm."
	item_icons = list(
		WEAR_BACK = 'modular/weapons/icons/machineguns/mg42.dmi',
		WEAR_L_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
		WEAR_R_HAND = 'modular/weapons/icons/machineguns/mg42.dmi',
	)
	item_state_slots = list(WEAR_BACK = "mg42_back")
	current_mag = /obj/item/ammo_magazine/machinegun/mg42
	accepted_ammo = list(/obj/item/ammo_magazine/machinegun/mg42)
	fire_sound = 'modular/weapons/sound/machineguns/mg42_fire.wav'

/obj/item/weapon/gun/mg3
	parent_type = /obj/item/weapon/gun/machinegun
	name = "MG3 machine gun"
	desc = "A belt-fed general-purpose machine gun chambered in 7.62x51mm."
	icon_state = "mg3"
	item_state = "mg3"
	item_icons = list(
		WEAR_BACK = 'modular/weapons/icons/machineguns/mg3.dmi',
		WEAR_J_STORE = 'modular/weapons/icons/machineguns/mg3.dmi',
		WEAR_L_HAND = 'modular/weapons/icons/machineguns/mg3.dmi',
		WEAR_R_HAND = 'modular/weapons/icons/machineguns/mg3.dmi',
	)
	item_state_slots = list(WEAR_BACK = "mg3_on_suit", WEAR_J_STORE = "mg3_on_suit")
	current_mag = /obj/item/ammo_magazine/machinegun/mg3
	accepted_ammo = list(/obj/item/ammo_magazine/machinegun/mg3)
	fire_sound = 'modular/weapons/sound/machineguns/mg3_fire.wav'
	firesound_volume = 35
	held_sprite = "mg3"

/obj/item/weapon/gun/mg3/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_12)
	set_burst_delay(FIRE_DELAY_TIER_12)
