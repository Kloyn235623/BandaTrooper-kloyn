// Rust Rat-only tactical map and role locator integration.
GLOBAL_DATUM_INIT(rust_rat_tacmap_status, /datum/tacmap/drawing/status_tab_view/rust_rat, new)

/datum/tacmap/drawing/status_tab_view/rust_rat/New()
	. = ..()
	allowed_flags = MINIMAP_FLAG_FREELANCER

/obj/structure/machinery/computer/overwatch/freelance
	minimap_type = MINIMAP_FLAG_FREELANCER

/mob/living/carbon/human/proc/locate_rust_rat_member(tracker_setting)
	if(!hud_used?.locate_leader || !istype(assigned_squad, /datum/squad/marine/rust_rat))
		return

	var/target_job
	switch(tracker_setting)
		if(TRACKER_RUST_RAT_HANDLER)
			target_job = JOB_RUST_RAT_HANDLER
		if(TRACKER_RUST_RAT_WARLORD)
			target_job = JOB_RUST_RAT_WARLORD
		if(TRACKER_RUST_RAT_RIGHT_HAND)
			target_job = JOB_RUST_RAT_RIGHT_HAND

	var/mob/living/carbon/human/tracked_member
	for(var/mob/living/carbon/human/member as anything in assigned_squad.marines_list)
		if(member.job == target_job)
			tracked_member = member
			break

	hud_used.locate_leader.icon_state = "trackoff"
	if(!tracked_member || tracked_member.z != z)
		return
	if(tracked_member == src || get_dist(src, tracked_member) < 1)
		hud_used.locate_leader.icon_state = "trackondirect"
		return
	hud_used.locate_leader.setDir(Get_Compass_Dir(src, tracked_member))
	hud_used.locate_leader.icon_state = "trackon"
