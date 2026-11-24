/// Moves an observer to the adjacent ground Z-level at the same x/y position.
/mob/dead/observer/proc/move_to_adjacent_ground_level(direction)
	var/turf/current_turf = get_turf(src)
	if(!current_turf)
		return FALSE

	var/list/ground_levels = SSmapping.levels_by_trait(ZTRAIT_GROUND)
	var/current_index = ground_levels.Find(current_turf.z)
	if(!current_index)
		return FALSE

	var/target_index = current_index + direction
	if(target_index < 1 || target_index > length(ground_levels))
		to_chat(src, SPAN_WARNING("There is no ground level in that direction."))
		return FALSE

	var/turf/destination = locate(current_turf.x, current_turf.y, ground_levels[target_index])
	if(!destination)
		to_chat(src, SPAN_WARNING("There is no matching location on that ground level."))
		return FALSE

	following = null
	forceMove(destination)
	return TRUE

/atom/movable/screen/ghost/ground_level
	icon = 'icons/mob/hud/screen1.dmi'
	icon_state = "centred_arrow"

/atom/movable/screen/ghost/ground_level/MouseEntered()
	return

/atom/movable/screen/ghost/ground_level/below
	name = "Move to Ground Level Below"
	dir = SOUTH

/atom/movable/screen/ghost/ground_level/below/Click()
	var/mob/dead/observer/ghost = usr
	ghost.move_to_adjacent_ground_level(-1)

/atom/movable/screen/ghost/ground_level/above
	name = "Move to Ground Level Above"
	dir = NORTH

/atom/movable/screen/ghost/ground_level/above/Click()
	var/mob/dead/observer/ghost = usr
	ghost.move_to_adjacent_ground_level(1)
