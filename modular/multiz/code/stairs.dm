/obj/structure/stairs/multiz
	icon_state = "rampbottom"
	var/direction
	layer = OBJ_LAYER // Cannot be obstructed by weeds
	var/list/blockers = list()

/obj/structure/stairs/multiz/Initialize(mapload, ...)
	. = ..()
	RegisterSignal(loc, COMSIG_TURF_ENTERED, PROC_REF(on_turf_entered))
	RegisterSignal(src, COMSIG_ATOM_TURF_CHANGE, PROC_REF(on_turf_changed))
	for(var/turf/blocked_turf in range(1, src))
		blockers += new /obj/effect/build_blocker(blocked_turf, src)
		new /obj/structure/blocker/anti_cade(blocked_turf)
	return INITIALIZE_HINT_LATELOAD

/obj/structure/stairs/multiz/Destroy()
	QDEL_LIST(blockers)
	return ..()

/obj/structure/stairs/multiz/proc/on_turf_changed()
	SIGNAL_HANDLER
	RegisterSignal(loc, COMSIG_TURF_ENTERED, PROC_REF(on_turf_entered))

/obj/structure/stairs/multiz/proc/on_turf_entered(turf/source, atom/movable/enterer)
	SIGNAL_HANDLER
	if(!istype(enterer, /mob))
		return

	RegisterSignal(enterer, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(on_premove))
	RegisterSignal(enterer, COMSIG_MOVABLE_MOVED, PROC_REF(on_leave))

/obj/structure/stairs/multiz/proc/on_leave(atom/movable/mover, atom/oldloc, newDir)
	SIGNAL_HANDLER
	if(mover.loc == loc)
		return
	UnregisterSignal(mover, list(COMSIG_MOVABLE_PRE_MOVE, COMSIG_MOVABLE_MOVED))

/obj/structure/stairs/multiz/proc/on_premove(atom/movable/mover, atom/newLoc)
	SIGNAL_HANDLER

	if(direction == UP && get_dir(src, newLoc) != dir || direction == DOWN && get_dir(src, newLoc) != REVERSE_DIR(dir))
		return

	var/turf/target_turf = get_step(src, direction == UP ? dir : REVERSE_DIR(dir))
	var/turf/actual_turf
	if(direction == UP)
		actual_turf = SSmapping.get_turf_above(target_turf)
	else
		actual_turf = SSmapping.get_turf_below(target_turf)
		mover.plane = ABOVE_BLACKNESS_PLANE
		addtimer(VARSET_CALLBACK(mover, plane, GAME_PLANE), 0.5 SECONDS)

	if(actual_turf)
		if(actual_turf.density)
			to_chat(mover, SPAN_WARNING("Something is blocking the way."))
			return COMPONENT_CANCEL_MOVE
		if(istype(mover, /mob))
			var/mob/mover_mob = mover
			mover_mob.trainteleport(actual_turf)
		else
			mover.forceMove(actual_turf)
		if(!(mover.flags_atom & DIRLOCK))
			mover.setDir(direction == UP ? dir : REVERSE_DIR(dir))

	return COMPONENT_CANCEL_MOVE

/obj/structure/stairs/multiz/up
	direction = UP

	var/datum/staircase/staircase

/obj/structure/stairs/multiz/up/LateInitialize()
	. = ..()

	if(staircase)
		return

	var/stairs = list(src)

	for(var/direction in list(turn(dir, 90), turn(dir, -90)))
		var/adjacent_turf = get_step(src, direction)
		while(adjacent_turf)
			var/obj/structure/stairs/multiz/up/up_ladder = locate() in adjacent_turf
			if(!up_ladder || up_ladder.staircase || up_ladder.dir != dir)
				break

			stairs += up_ladder
			adjacent_turf = get_step(adjacent_turf, direction)

	staircase = new(stairs, dir)

/datum/staircase

	/// The direction that this staircase is going in
	var/dir

	/// A mapping of turf -> list of client images shown when stepped on
	var/alist/from_turf_to_images = alist()

	/// Mobs that we are currently displaying images to
	var/in_range_mob = list()

/datum/staircase/New(list/obj/structure/stairs/multiz/up/stairs, dir)
	src.dir = dir

	var/alist/destination_turf_images = alist()
	var/alist/source_vectors = alist()
	var/alist/destination_vectors = alist()
	var/alist/stair_vectors = alist()
	for(var/obj/structure/stairs/multiz/up/stair as anything in stairs)
		stair.staircase = src
		// we don't need to track which stair it is, just the position

		var/turf/under_the_stairs = get_step(stair, stair.dir)
		for(var/turf/from_turf in view(under_the_stairs))
			if((dir == NORTH && from_turf.y > stair.y) || (dir == EAST && from_turf.x > stair.x) || (dir == SOUTH && from_turf.y < stair.y) || (dir == WEST && from_turf.x < stair.x))
				continue
			LAZYADD(stair_vectors[from_turf], vector(under_the_stairs.x - from_turf.x, under_the_stairs.y - from_turf.y))
			source_vectors[from_turf] = vector(from_turf.x, from_turf.y)

		for(var/turf/target_turf in view(SSmapping.get_turf_above(under_the_stairs)))
			if((dir == NORTH && target_turf.y <= stair.y) || (dir == EAST && target_turf.x <= stair.x) || (dir == SOUTH && target_turf.y >= stair.y) || (dir == WEST && target_turf.x >= stair.x))
				continue
			// Do not skip transparent turfs: their contents include the floor edge and any lights or objects above it.
			destination_turf_images[target_turf] = create_vis_contents_screen(stair.loc, target_turf)
			destination_vectors[target_turf] = vector(target_turf.x, target_turf.y)

	for(var/from_turf, from_vector in source_vectors)
		for(var/to_turf, to_vector in destination_vectors)
			if(from_vector ~= to_vector)
				continue
			var/vector/turf_to_target = (to_vector - from_vector)
			var/distance_to_target = turf_to_target.size
			for(var/vector/turf_to_stair in stair_vectors[from_turf])
				var/vector/cross_product = turf_to_stair.Cross(turf_to_target)
				if((abs(cross_product.z) / distance_to_target) >= 0.5)
					continue
				LAZYADD(from_turf_to_images[from_turf], destination_turf_images[to_turf])
				break
		if(length(from_turf_to_images[from_turf]))
			RegisterSignal(from_turf, COMSIG_TURF_ENTERED, PROC_REF(handle_entered), override=TRUE)
			RegisterSignal(from_turf, COMSIG_PRE_TURF_CHANGE, PROC_REF(handle_pre_turf_change), override=TRUE)

/datum/staircase/proc/handle_pre_turf_change(turf/source, path, list/new_baseturfs, flags, list/post_change_callbacks)
	SIGNAL_HANDLER
	post_change_callbacks += CALLBACK(src, PROC_REF(re_register_from_turf_signals), source)

/datum/staircase/proc/re_register_from_turf_signals(turf/new_turf)
	SHOULD_NOT_SLEEP(TRUE)
	RegisterSignal(new_turf, COMSIG_TURF_ENTERED, PROC_REF(handle_entered))
	RegisterSignal(new_turf, COMSIG_PRE_TURF_CHANGE, PROC_REF(handle_pre_turf_change))

/datum/staircase/proc/handle_entered(turf/originator, atom/what_did_it)
	SIGNAL_HANDLER
	var/mob/mover = what_did_it
	if(!istype(mover) || mover in in_range_mob)
		return

	RegisterSignal(mover, COMSIG_MOVABLE_MOVED, PROC_REF(handle_movement))
	RegisterSignal(mover, COMSIG_PARENT_QDELETING, PROC_REF(handle_deleted))
	handle_movement(mover, originator)
	in_range_mob += mover

/datum/staircase/proc/handle_movement(mob/mover, old_loc, direction)
	SIGNAL_HANDLER
	var/turf/where_from = get_turf(old_loc)
	if(length(from_turf_to_images[where_from]))
		for(var/image in from_turf_to_images[where_from])
			mover.client?.images -= image

	var/turf/where_to = get_turf(mover)
	if(length(from_turf_to_images[where_to]))
		for(var/image in from_turf_to_images[where_to])
			mover.client?.images += image
		return

	in_range_mob -= mover
	UnregisterSignal(mover, list(COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING))

/datum/staircase/proc/handle_deleted(atom/updater)
	SIGNAL_HANDLER
	in_range_mob -= updater

/proc/create_vis_contents_screen(atom/appear_where, turf/clone_what)
	var/image/clone = image('icons/turf/floors/floors.dmi', appear_where, "transparent")
	clone.pixel_x = (clone_what.x - appear_where.x) * world.icon_size
	clone.pixel_y = (clone_what.y - appear_where.y) * world.icon_size
	clone.vis_contents += clone_what
	clone.vis_contents += GLOB.above_blackness_backdrop
	clone.plane = ABOVE_BLACKNESS_PLANE
	return clone

GLOBAL_DATUM_INIT(above_blackness_backdrop, /atom/movable/above_blackness_backdrop, new)

/atom/movable/above_blackness_backdrop
	name = "above_blackness_backdrop"
	anchored = TRUE
	icon = 'icons/turf/floors/floors.dmi'
	icon_state = "grey"
	plane = ABOVE_BLACKNESS_BACKDROP_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/structure/stairs/multiz/down
	direction = DOWN
