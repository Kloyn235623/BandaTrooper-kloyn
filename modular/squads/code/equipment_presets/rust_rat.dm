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
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/leader/rust_rat
	name = "Rust Rat Warlord"
	assignment = JOB_RUST_RAT_WARLORD
	rank = JOB_RUST_RAT_WARLORD
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/warlord
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/tl/rust_rat
	name = "Rust Rat Right Hand"
	assignment = JOB_RUST_RAT_RIGHT_HAND
	rank = JOB_RUST_RAT_RIGHT_HAND
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/right_hand
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/engineer/rust_rat
	name = "Rust Rat Rigger"
	assignment = JOB_RUST_RAT_RIGGER
	rank = JOB_RUST_RAT_RIGGER
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/rust_rat/rigger
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/medic/rust_rat
	name = "Rust Rat Stitcher"
	assignment = JOB_RUST_RAT_STITCHER
	rank = JOB_RUST_RAT_STITCHER
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	skills = /datum/skills/combat_medic
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/sg/rust_rat
	name = "Rust Rat Gunner"
	assignment = JOB_RUST_RAT_GUNNER
	rank = JOB_RUST_RAT_GUNNER
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/uscm/pfc/rust_rat
	name = "Rust Rat Freelancer"
	assignment = JOB_RUST_RAT_FREELANCER
	rank = JOB_RUST_RAT_FREELANCER
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/synth/uscm/rust_rat
	name = "Rust Rat Tin"
	assignment = JOB_RUST_RAT_TIN
	rank = JOB_RUST_RAT_TIN
	idtype = /obj/item/card/id/dogtag
	faction = FACTION_FREELANCER
	faction_group = list(FACTION_FREELANCER)
	allow_cross_faction_loadout = TRUE

/datum/equipment_preset/synth/uscm/rust_rat/load_race(mob/living/carbon/human/new_human)
	new_human.set_species(SYNTH_GEN_ONE)
