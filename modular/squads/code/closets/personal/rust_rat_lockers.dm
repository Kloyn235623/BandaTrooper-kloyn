// Personal loadout lockers for SS Petr. Selected items are stored here so the
// crew can wake without wearing their gear.
/obj/structure/closet/secure_closet/marine_personal/rifleman/rust_rat
	squad_type = SQUAD_RUST_RAT


/obj/structure/closet/secure_closet/marine_personal/rifleman/rust_rat/freelancer
	job = JOB_RUST_RAT_FREELANCER

/obj/structure/closet/secure_closet/marine_personal/rifleman/rust_rat/tin
	job = JOB_RUST_RAT_TIN

/obj/structure/closet/secure_closet/marine_personal/platoon_commander/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_HANDLER

/obj/structure/closet/secure_closet/marine_personal/platoon_leader/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_WARLORD

/obj/structure/closet/secure_closet/marine_personal/squad_leader/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_RIGHT_HAND

/obj/structure/closet/secure_closet/marine_personal/engineer/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_RIGGER

/obj/structure/closet/secure_closet/marine_personal/corpsman/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_STITCHER

/obj/structure/closet/secure_closet/marine_personal/smartgunner/rust_rat
	squad_type = SQUAD_RUST_RAT
	job = JOB_RUST_RAT_GUNNER


/obj/structure/closet/secure_closet/marine_personal/proc/replace_rust_rat_uniform()
	for(var/obj/item/clothing/under/uniform in contents)
		qdel(uniform)
	new /obj/item/clothing/under/marine/veteran/freelancer(src)

/obj/structure/closet/secure_closet/marine_personal/rifleman/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/platoon_commander/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/platoon_leader/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/squad_leader/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/engineer/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/corpsman/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()

/obj/structure/closet/secure_closet/marine_personal/smartgunner/rust_rat/spawn_gear()
	. = ..()
	replace_rust_rat_uniform()
