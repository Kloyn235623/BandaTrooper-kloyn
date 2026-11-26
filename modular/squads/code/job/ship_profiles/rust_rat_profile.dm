/datum/modular_ship_platoon_profile/rust_rat
	platoon_type = /datum/squad/marine/rust_rat

/datum/modular_ship_platoon_profile/rust_rat/initialize_profile()
	role_mappings = list(
		/datum/job/command/bridge/ai/rust_rat = JOB_RUST_RAT_HANDLER,
		/datum/job/marine/leader/ai/rust_rat = JOB_RUST_RAT_WARLORD,
		/datum/job/marine/tl/ai/rust_rat = JOB_RUST_RAT_RIGHT_HAND,
		/datum/job/marine/engineer/ai/rust_rat = JOB_RUST_RAT_RIGGER,
		/datum/job/marine/medic/ai/rust_rat = JOB_RUST_RAT_STITCHER,
		/datum/job/marine/smartgunner/ai/rust_rat = JOB_RUST_RAT_GUNNER,
		/datum/job/marine/standard/ai/rust_rat = JOB_RUST_RAT_FREELANCER,
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
