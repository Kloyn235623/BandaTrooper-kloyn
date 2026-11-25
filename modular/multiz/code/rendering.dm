// Render only the levels visible through an opening with depth blur.
GLOBAL_DATUM_INIT(openspace_backdrop_one_for_all, /atom/movable/openspace_backdrop, new)

/atom/movable/openspace_backdrop
	name = "openspace_backdrop"
	anchored = TRUE
	icon = 'icons/turf/floors/floors.dmi'
	icon_state = "grey"
	plane = OPENSPACE_BACKDROP_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/vis_contents_holder
	plane = OPEN_SPACE_PLANE_START
	vis_flags = VIS_HIDE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT

/obj/vis_contents_holder/Initialize(mapload, turf/below, z_offset, show_backdrop = TRUE)
	. = ..()
	plane -= z_offset
	if(show_backdrop)
		vis_contents += GLOB.openspace_backdrop_one_for_all
	vis_contents += below
	name = null

/turf/open_space/LateInitialize()
	. = ..()
	update_vis_contents()

/// Cleanables are held as turf overlays for performance; open-space VIS contents relay those overlays even when the decal atom is hidden.
/obj/effect/decal/cleanable/proc/multiz_cleanable_should_draw_as_atom()
	if(!cleanable_turf)
		return FALSE
	var/turf/above = SSmapping.get_turf_above(cleanable_turf)
	return istype(above, /turf/open_space)

/// Map cleanables may have become turf overlays before the Z links were ready; restore them to their source turf before relaying it.
/turf/proc/multiz_keep_cleanables_on_authored_level()
	if(!cleanables)
		return
	for(var/cleanable_type in cleanables)
		var/obj/effect/decal/cleanable/C = cleanables[cleanable_type]
		if(!C || QDELETED(C))
			continue
		C.clear_overlay()
		C.vis_flags |= VIS_HIDE
		if(C.loc != src)
			C.forceMove(src)

/atom/movable/screen/plane_master/open_space
	name = "open space plane"
	plane = OPEN_SPACE_PLANE_START

/atom/movable/screen/plane_master/open_space/Initialize(mapload, z_offset)
	name = "open space plane [z_offset]"
	plane -= z_offset
	. = ..()
	add_filter("multizblur", 1, gauss_blur_filter(0.5 + 0.25 * (z_offset + 1)))

/atom/movable/screen/plane_master/openspace_backdrop
	name = "open space backdrop plane"
	plane = OPENSPACE_BACKDROP_PLANE
	appearance_flags = PLANE_MASTER
	blend_mode = BLEND_MULTIPLY
	alpha = 255

/atom/movable/screen/plane_master/openspace_backdrop/Initialize()
	. = ..()
	filters = list(
		filter(type = "drop_shadow", color = "#04080FAA", size = -10),
		filter(type = "drop_shadow", color = "#04080FAA", size = -15),
		filter(type = "drop_shadow", color = "#04080FAA", size = -20),
	)
