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
