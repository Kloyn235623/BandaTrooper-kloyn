/datum/unit_test/space_reservation_multiz

/datum/unit_test/space_reservation_multiz/Run()
	var/runtime_count_before = length(GLOB.STUI.runtime)
	var/datum/turf_reservation/reservation = SSmapping.request_turf_block_reservation(2, 2, 2)
	if(!reservation)
		return Fail("Could not allocate a two-level turf reservation", __FILE__, __LINE__)

	var/turf/lower_bound = reservation.bottom_left_turfs[1]
	var/turf/upper_bound = reservation.bottom_left_turfs[2]
	var/turf/lower_turf = locate(lower_bound.x, lower_bound.y, lower_bound.z)
	var/turf/upper_turf = locate(upper_bound.x, upper_bound.y, upper_bound.z)
	var/turf/linked_below = SSmapping.get_turf_below(lower_turf)
	var/turf/linked_above = SSmapping.get_turf_above(upper_turf)
	var/layers_linked = (linked_below == upper_turf) && (linked_above == lower_turf)
	qdel(reservation)

	TEST_ASSERT(layers_linked, "Reserved Z blocks did not resolve through the multiz mapping helpers")
	TEST_ASSERT_EQUAL(length(GLOB.STUI.runtime), runtime_count_before, "Two-level reservation added a runtime")
