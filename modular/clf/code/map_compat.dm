/obj/item/paper/crumpled/bloody/beast

/obj/item/device/radio/intercom/rasputin
	name = "Rasputin intercom"
	frequency = DS3_FREQ

/obj/structure/sign/banners/clf_flag
	name = "\improper CLF flag"
	icon_state = "clfflag"

/obj/structure/sign/banners/clf_worn
	name = "\improper Worn CLF flag"
	icon_state = "clfflag_worn"

/obj/structure/prop/almayer/liberty/deck_turret
	name = "deck turret"
	icon = 'core_ru/code/stuff/deck_turret.dmi'
	icon_state = "deck_turret"

/obj/structure/window/framed/upp/grey/hull
	not_damageable = TRUE
	not_deconstructable = TRUE
	unslashable = TRUE
	unacidable = TRUE
	health = 1000000

/obj/structure/ladder/multiz/LateInitialize()
	. = ..()
	up = locate(/obj/structure/ladder) in SSmapping.get_turf_above(get_turf(src))
	down = locate(/obj/structure/ladder) in SSmapping.get_turf_below(get_turf(src))
	update_icon()

/turf/open_space
	name = "open space"
	icon = 'icons/turf/floors/floors.dmi'
	icon_state = "transparent"
	plane = OPEN_SPACE_PLANE_START
	density = FALSE
	opacity = FALSE
	baseturfs = /turf/open_space

/turf/open_space/Initialize(mapload, ...)
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/turf/open_space/LateInitialize()
	. = ..()
	update_vis_contents()

/turf/open_space/Entered(atom/movable/entered_movable, atom/old_loc)
	. = ..()
	if(istype(entered_movable, /mob/hologram/look_up))
		return
	var/turf/below = SSmapping.get_turf_below(src)
	while(istype(below, /turf/open_space))
		below = SSmapping.get_turf_below(below)
	if(below && !below.density)
		entered_movable.forceMove(below)

/turf/closed/void/space

/turf/open/floor/plating/catwalk/lattice
	icon = 'icons/obj/structures/props/smoothlattice.dmi'
	icon_state = "lattice0"

/turf/open/floor/almayer_hull/corner
	icon_state = "blackfull_corner"

/turf/open/floor/almayer_hull/corner/northeast
	dir = NORTHEAST

/turf/open/floor/almayer_hull/corner/northwest
	dir = NORTHWEST

/turf/open/floor/almayer_hull/corner/southeast
	dir = SOUTHEAST

/turf/open/floor/almayer_hull/corner/southwest
	dir = SOUTHWEST

/turf/open/floor/corsat/spiral_liberty
	icon = 'core_ru/code/stuff/turfs.dmi'
	icon_state = "spiral_other"

/turf/open/floor/corsat/spiral_other
	icon = 'core_ru/code/stuff/turfs.dmi'
	icon_state = "spiral_other"

/turf/open/floor/strata/liberty
	icon_state = "floor"

// SS220 EDIT - START: restore Sorokyne Strata CLF insert map types and UPP fence sprites.
/obj/structure/fence/slim/upp
	name = "fence"
	desc = "A large metal mesh strewn between two poles. Intended as a cheap way to separate areas, while allowing one to see through it."
	icon = 'icons/obj/structures/props/fences/upp_fence.dmi'

/obj/structure/fence/slim/upp/door
	name = "fence door"
	desc = "A sturdy chainlink door set between two metal poles. A cheap way to section off areas while still allowing visibility through it."
	icon_state = "door_closed"
	door = TRUE
	forms_junctions = FALSE
	icon = 'icons/obj/structures/props/fences/upp_fence_door.dmi'

/obj/effect/landmark/corpsespawner/clf/burst
	name = "Burst Colonial Liberation Front Soldier"
	equip_path = /datum/equipment_preset/corpse/clf/burst

/obj/item/paper/soro/clf
	name = "TOP SECRET: FOR CELL LEAD ONLY"
	info = "Your request for extraction has been received. We have no assets in the region available. Await further instruction."
// SS220 EDIT - END
