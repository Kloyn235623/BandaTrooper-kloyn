// Rust Rat role-specific minimap markers.
/datum/equipment_preset/proc/get_rust_rat_minimap_icon(mob/living/carbon/human/user, icon_state)
	var/image/background = mutable_appearance('icons/ui_icons/map_blips.dmi', "background")
	if(user.assigned_squad)
		background.color = user.assigned_squad.minimap_color
	else
		background.color = MINIMAP_ICON_BACKGROUND_CIVILIAN
	var/mutable_appearance/role_icon = image('modular/squads/icons/HUD.dmi', icon_state = icon_state)
	role_icon.appearance_flags = RESET_COLOR
	background.overlays += role_icon
	return background

/datum/equipment_preset/uscm_ship/so/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "handler")

/datum/equipment_preset/uscm/leader/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "leader")

/datum/equipment_preset/uscm/tl/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "right_hand")

/datum/equipment_preset/uscm/engineer/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "rigger")

/datum/equipment_preset/uscm/medic/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "stitcher")

/datum/equipment_preset/uscm/sg/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "gunner")

/datum/equipment_preset/uscm/pfc/rust_rat/get_minimap_icon(mob/living/carbon/human/user)
	return get_rust_rat_minimap_icon(user, "freelancer")

// Tin keeps the synthetic icon, distinct from all seven human role markers.
/datum/equipment_preset/synth/uscm/rust_rat
	minimap_icon = "synth"

// Rust Rat skill variants and role presets.
/datum/skills/rust_rat/right_hand
	name = "Rust Rat Right Hand"
	skills = list(
		SKILL_JTAC = SKILL_JTAC_TRAINED,
		SKILL_LEADERSHIP = SKILL_LEAD_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_TRAINED,
	)

/datum/skills/rust_rat/warlord
	name = "Rust Rat Warlord"
	skills = list(
		SKILL_CQC = SKILL_CQC_TRAINED,
		SKILL_LEADERSHIP = SKILL_LEAD_TRAINED,
		SKILL_MEDICAL = SKILL_MEDICAL_MEDIC,
		SKILL_SURGERY = SKILL_SURGERY_TRAINED,
		SKILL_ENDURANCE = SKILL_ENDURANCE_MASTER,
		SKILL_JTAC = SKILL_JTAC_TRAINED,
		SKILL_INTEL = SKILL_INTEL_TRAINED,
		SKILL_PILOT = SKILL_PILOT_EXPERT,
	)

/datum/skills/rust_rat/rigger
	name = "Rust Rat Rigger"
	skills = list(
		SKILL_ENDURANCE = SKILL_ENDURANCE_TRAINED,
		SKILL_ENGINEER = SKILL_ENGINEER_ENGI,
		SKILL_CONSTRUCTION = SKILL_CONSTRUCTION_ENGI,
	)

// Preset-level opt-in: Rust Rat players may use loadout items from any origin.
/datum/equipment_preset
	var/allow_cross_faction_loadout = FALSE

/datum/equipment_preset/uscm_ship/so/rust_rat
	name = "Rust Rat Handler"
	assignment = JOB_RUST_RAT_HANDLER
	rank = JOB_RUST_RAT_HANDLER
	paygrades = list(PAY_SHORT_RR_HANDLER = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/leader/rust_rat
	name = "Rust Rat Warlord"
	assignment = JOB_RUST_RAT_WARLORD
	rank = JOB_RUST_RAT_WARLORD
	paygrades = list(PAY_SHORT_RR_WARLORD = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/warlord
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/tl/rust_rat
	name = "Rust Rat Right Hand"
	assignment = JOB_RUST_RAT_RIGHT_HAND
	rank = JOB_RUST_RAT_RIGHT_HAND
	paygrades = list(PAY_SHORT_RR_RIGHT_HAND = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/right_hand
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/engineer/rust_rat
	name = "Rust Rat Rigger"
	assignment = JOB_RUST_RAT_RIGGER
	rank = JOB_RUST_RAT_RIGGER
	paygrades = list(PAY_SHORT_RR_RIGGER = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/rigger
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/medic/rust_rat
	name = "Rust Rat Stitcher"
	assignment = JOB_RUST_RAT_STITCHER
	rank = JOB_RUST_RAT_STITCHER
	paygrades = list(PAY_SHORT_RR_STITCHER = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/combat_medic
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/sg/rust_rat
	name = "Rust Rat Gunner"
	assignment = JOB_RUST_RAT_GUNNER
	rank = JOB_RUST_RAT_GUNNER
	paygrades = list(PAY_SHORT_RR_GUNNER = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP, ACCESS_MARINE_SMARTPREP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/pfc/rust_rat
	name = "Rust Rat Freelancer"
	assignment = JOB_RUST_RAT_FREELANCER
	rank = JOB_RUST_RAT_FREELANCER
	paygrades = list(PAY_SHORT_RR_FREELANCER = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/synth/uscm/rust_rat
	name = "Rust Rat Tin"
	assignment = JOB_RUST_RAT_TIN
	rank = JOB_RUST_RAT_TIN
	paygrades = list(PAY_SHORT_RR_TIN = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	access = list(ACCESS_RUST_RAT_SHIP)
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/synth/uscm/rust_rat/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_GEN_ONE)
