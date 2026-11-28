/datum/squad/marine/rust_rat
	name = SQUAD_RUST_RAT
	equipment_color = "#62666b"
	chat_color = "#b5a36a"
	minimap_color = "#b5a36a"
	radio_freq = FREELANCER_FREQ
	access = list(ACCESS_MARINE_PREP)
	faction = FACTION_FREELANCER
	usable = TRUE
	active = TRUE
	roundstart = TRUE
	omni_squad_vendor = TRUE

/datum/squad/marine/rust_rat/get_role_label(canonical_role)
	switch(canonical_role)
		if(JOB_SQUAD_LEADER)
			return JOB_RUST_RAT_WARLORD
		if(JOB_SQUAD_TEAM_LEADER)
			return JOB_RUST_RAT_RIGHT_HAND
	return ..()
