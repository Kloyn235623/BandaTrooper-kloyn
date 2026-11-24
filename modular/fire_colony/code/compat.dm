/turf/open/fire_colony/hot_lava/is_weedable()
	return NOT_WEEDABLE

/turf/open/fire_colony/lava_no_burn/is_weedable()
	return NOT_WEEDABLE

/obj/item/clothing/suit/storage/marine
	var/lamp_icon = "lamp"
	var/lamp_light_color

/datum/mob_hud/faction/lasalle_bionational
	faction_to_check = FACTION_LASALLE_BIONATIONAL

/obj/item/reagent_container/pill/kelo_oxy_mix
	pill_desc = "A Kelotane-Oxycodone (2:1) pill. Heals burns and relieves pain."
	pill_initial_reagents = list("kelotane" = 10, "oxycodone" = 5)
	pill_icon_class = "kelo"

/obj/structure/closet/firecloset/alt/full/Initialize()
	. = ..()
	contents = list()
	new /obj/item/clothing/suit/storage/marine/cbrn/lava(src)
	new /obj/item/clothing/head/helmet/marine/fireproof_hood(src)
	new /obj/item/clothing/gloves/marine/fireproof_gloves(src)
	new /obj/item/clothing/shoes/marine/fireproof_boots(src)
	new /obj/item/reagent_container/glass/canister/oxygen(src)
	new /obj/item/tool/extinguisher/mini(src)
	new /obj/item/storage/box/m94(src)

// SS220 EDIT: calendar_faction and fence.door are declared by their shared upstream types.
/obj/structure/inflatable
	var/icon_suffix = ""
	var/origin = /obj/item/inflatable
	var/poped_type = /obj/structure/inflatable/popped

/obj/effect/landmark/ambient_sound/proc/play_random_sound()
	if(QDELETED(src))
		return
	if(prob(play_chance) && length(sound_list))
		playsound(loc, pick(sound_list), rand(min_volume, volume), vary, sound_radius)
	if(play_once)
		return
	addtimer(CALLBACK(src, PROC_REF(play_random_sound)), rand(min_delay, max_delay))

/obj/item/trash/hotdog/alt
	name = "Hotdog wrapper"
	icon_state = "unbranded_hotdog"
	desc = "A musty plastic film that once held a hotdog."

// SS220 EDIT: generic timed-event procs are supplied by code/modules/mapping/mapping_helpers.dm.
/obj/effect/vehicle_spawner/rt01/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/rt01/van = new(loc)
	load_misc(van)
	load_hardpoints(van)
	handle_direction(van)
	load_damage(van)
	van.update_icon()

/obj/effect/vehicle_spawner/rt01/decrepit/load_hardpoints(obj/vehicle/multitile/rt01/van)
	van.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels/rt01)

/obj/effect/vehicle_spawner/rt01/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/rt01/van = new(loc)
	load_misc(van)
	load_hardpoints(van)
	handle_direction(van)
	van.update_icon()

/obj/effect/vehicle_spawner/rt01/fixed/load_hardpoints(obj/vehicle/multitile/rt01/van)
	van.add_hardpoint(new /obj/item/hardpoint/locomotion/van_wheels/rt01)
