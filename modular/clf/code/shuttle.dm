/obj/structure/machinery/computer/shuttle/dropship/flight/rasputin
	shuttleId = DROPSHIP_RASPUTIN
	is_remote = FALSE
	can_change_shuttle = FALSE

/obj/structure/machinery/computer/shuttle/dropship/flight/rasputin/alternative_shuttles()
	return list()

/turf/open/space/transit/dropship/rasputin
	shuttle_tag = DROPSHIP_RASPUTIN
	dir = SOUTH

/obj/docking_port/mobile/marine_dropship/rasputin/get_transit_path_type()
	return /turf/open/space/transit/dropship/rasputin
