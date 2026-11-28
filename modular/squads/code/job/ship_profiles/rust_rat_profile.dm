/datum/modular_ship_platoon_profile/rust_rat
	platoon_type = /datum/squad/marine/rust_rat

/datum/modular_ship_platoon_profile/rust_rat/initialize_profile()
	preview_presets = list(
		// Support both role-authority preference buckets and the displayed ship-role titles.
		JOB_SO = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_LEADER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_TEAM_LEADER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_ENGI = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_MEDIC = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_SMARTGUN = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_SQUAD_MARINE = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_HANDLER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_WARLORD = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_RIGHT_HAND = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_RIGGER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_STITCHER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_GUNNER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_FREELANCER = /datum/equipment_preset/uscm/rust_rat_preview,
		JOB_RUST_RAT_TIN = /datum/equipment_preset/synth/uscm/rust_rat,
	)
	role_mappings = list(
		/datum/job/command/bridge/ai/rust_rat = JOB_SO,
		/datum/job/marine/leader/ai/rust_rat = JOB_SQUAD_LEADER,
		/datum/job/marine/tl/ai/rust_rat = JOB_SQUAD_TEAM_LEADER,
		/datum/job/marine/engineer/ai/rust_rat = JOB_SQUAD_ENGI,
		/datum/job/marine/medic/ai/rust_rat = JOB_SQUAD_MEDIC,
		/datum/job/marine/smartgunner/ai/rust_rat = JOB_SQUAD_SMARTGUN,
		/datum/job/marine/standard/ai/rust_rat = JOB_SQUAD_MARINE,
		/datum/job/marine/standard/ai/rust_rat/tin = JOB_RUST_RAT_TIN,
	)
	lowpop_roles = list(
		JOB_RUST_RAT_HANDLER,
		JOB_RUST_RAT_WARLORD,
		JOB_RUST_RAT_RIGHT_HAND,
		JOB_RUST_RAT_RIGGER,
		JOB_RUST_RAT_STITCHER,
		JOB_RUST_RAT_GUNNER,
		JOB_RUST_RAT_FREELANCER,
		JOB_RUST_RAT_TIN,
	)
	distress_roles = lowpop_roles + GLOB.ROLES_GROUND
	platoon_label = "Rust Rat"
