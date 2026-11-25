/// Mineable mineral rock adapted to the existing CM ore, pickaxe, and satchel types.
/turf/closed/mineral/attackby(obj/item/used_item, mob/living/user)
	if(!istype(used_item, /obj/item/tool/pickaxe))
		return ..()

	var/obj/item/tool/pickaxe/pickaxe = used_item
	user.visible_message(SPAN_NOTICE("[user] starts mining [src] with [pickaxe]."))
	if(!do_after(user, pickaxe.digspeed, INTERRUPT_ALL, BUSY_ICON_GENERIC) || !src || !user)
		return

	var/ore_roll = rand(1, 115)
	var/obj/item/ore/ore_type
	switch(ore_roll)
		if(1 to 25)
			ore_type = /obj/item/ore/phoron
		if(26 to 45)
			ore_type = /obj/item/ore/iron
		if(46 to 60)
			ore_type = /obj/item/ore/coal
		if(61 to 75)
			ore_type = /obj/item/ore/silver
		if(76 to 90)
			ore_type = /obj/item/ore/gold
		if(91 to 100)
			ore_type = /obj/item/ore/uranium
		if(101 to 110)
			ore_type = /obj/item/ore/osmium
		if(111 to 115)
			ore_type = /obj/item/ore/diamond
	var/turf/open/gm/dirt/exposed_ground = ChangeTurf(/turf/open/gm/dirt)
	var/obj/item/ore/harvested_ore = new ore_type(exposed_ground)
	user.visible_message(SPAN_NOTICE("[user] uncovers [harvested_ore] from the rock."))

	if(user.gender == MALE && prob(1))
		playsound(user, 'modular/mining/assets/sound/rock-and-stone.mp3', 75, TRUE, 10)

/// Shared small volatile blast for Phoron crystal veins and harvested crystals.
/obj/proc/detonate_phoron_crystal(mob/living/user)
	if(!reagents)
		qdel(src)
		return
	if(user)
		reagents.source_mob = WEAKREF(user)
	reagents.handle_volatiles()
	qdel(src)

/obj/item/ore/phoron
	icon = 'icons/obj/structures/props/mining.dmi'
	icon_state = "phoron1"

/obj/item/ore/phoron/Initialize()
	. = ..()
	create_reagents(120)
	reagents.add_reagent("fuel", 120)

/obj/item/ore/phoron/attackby(obj/item/used_item, mob/living/user)
	if(iswelder(used_item))
		var/obj/item/tool/weldingtool/welder = used_item
		if(welder.welding)
			detonate_phoron_crystal(user)
			return TRUE
	return ..()

/obj/item/ore/phoron/fire_act(exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C + 500)
		detonate_phoron_crystal()
		return
	return ..()

/obj/item/ore/phoron/flamer_fire_act(damage, datum/cause_data/flame_cause_data)
	if(flame_cause_data?.weak_mob)
		reagents.source_mob = flame_cause_data.weak_mob
	detonate_phoron_crystal()

/obj/item/ore/phoron/bullet_act(obj/projectile/projectile)
	detonate_phoron_crystal()
	return TRUE

/obj/structure/crystal
	name = "Phoron crystal vein"
	desc = "A cluster of volatile Phoron crystals embedded in the surface. It can be mined with a pickaxe."
	icon = 'icons/obj/structures/props/mining.dmi'
	icon_state = "phoron1"
	anchored = TRUE
	density = TRUE
	health = 5
	var/being_mined = FALSE

/obj/structure/crystal/Initialize()
	. = ..()
	create_reagents(120)
	reagents.add_reagent("fuel", 120)

/obj/structure/crystal/attackby(obj/item/used_item, mob/living/user)
	if(istype(used_item, /obj/item/tool/pickaxe))
		if(being_mined)
			return TRUE
		being_mined = TRUE
		var/obj/item/tool/pickaxe/pickaxe = used_item
		user.visible_message(SPAN_NOTICE("[user] starts mining [src] with [pickaxe]."))
		if(!do_after(user, pickaxe.digspeed, INTERRUPT_ALL, BUSY_ICON_GENERIC, src) || !src || !user)
			if(src)
				being_mined = FALSE
			return TRUE
		var/turf/harvest_turf = get_turf(src)
		new /obj/item/ore/phoron(harvest_turf)
		user.visible_message(SPAN_NOTICE("[user] extracts Phoron crystals from [src]."))
		if(user.gender == MALE && prob(1))
			playsound(user, 'modular/mining/assets/sound/rock-and-stone.mp3', 75, TRUE, 10)
		qdel(src)
		return TRUE
	if(iswelder(used_item))
		var/obj/item/tool/weldingtool/welder = used_item
		if(welder.welding)
			detonate_phoron_crystal(user)
			return TRUE
	return ..()

/obj/structure/crystal/fire_act(exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C + 500)
		detonate_phoron_crystal()
		return
	return ..()

/obj/structure/crystal/flamer_fire_act(damage, datum/cause_data/flame_cause_data)
	if(flame_cause_data?.weak_mob)
		reagents.source_mob = flame_cause_data.weak_mob
	detonate_phoron_crystal()

/obj/structure/crystal/bullet_act(obj/projectile/projectile)
	detonate_phoron_crystal()
	return TRUE

/obj/structure/crystal/phoron
	name = "Phoron crystal cluster"

/obj/structure/crystal/wall/phoron
	name = "Hanging Phoron crystal cluster"
	icon_state = "phoron_wall1"
