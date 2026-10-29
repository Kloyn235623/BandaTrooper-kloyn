/obj/docking_port/stationary/marine_dropship/ss_liberty
	name = "SS Liberty Hangar"
	id = "ss_liberty_hangar"
	auto_open = TRUE
	roundstart_template = /datum/map_template/shuttle/rasputin

/obj/docking_port/mobile/marine_dropship/rasputin
	name = "Rasputin"
	id = DROPSHIP_RASPUTIN

/datum/map_template/shuttle/rasputin
	name = "Rasputin"
	shuttle_id = DROPSHIP_RASPUTIN

/turf/open/space/transit/dropship/rasputin
	shuttle_tag = DROPSHIP_RASPUTIN
	dir = SOUTH

/obj/docking_port/mobile/marine_dropship/rasputin/get_transit_path_type()
	return /turf/open/space/transit/dropship/rasputin
