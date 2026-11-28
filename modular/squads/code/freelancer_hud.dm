// Rust Rat role glyphs use the supplied HUD sheet, separately from tactical-map blips.
/datum/faction/freelancer
	faction_tag = FACTION_FREELANCER

/datum/faction/freelancer/modify_hud_holder(image/holder, mob/living/carbon/human/H)
	if(!istype(H.assigned_squad, /datum/squad/marine/rust_rat))
		return

	var/role = H.job
	if(!role)
		var/obj/item/card/id/ID = H.get_idcard()
		role = ID?.rank

	var/icon_state
	switch(role)
		if(JOB_RUST_RAT_HANDLER)
			icon_state = "handler"
		if(JOB_RUST_RAT_WARLORD)
			icon_state = "leader"
		if(JOB_RUST_RAT_RIGHT_HAND)
			icon_state = "right_hand"
		if(JOB_RUST_RAT_RIGGER)
			icon_state = "rigger"
		if(JOB_RUST_RAT_STITCHER)
			icon_state = "stitcher"
		if(JOB_RUST_RAT_GUNNER)
			icon_state = "gunner"
		if(JOB_RUST_RAT_FREELANCER)
			icon_state = "freelancer"

	if(icon_state)
		holder.overlays += image('modular/squads/icons/HUD.dmi', H, icon_state)
