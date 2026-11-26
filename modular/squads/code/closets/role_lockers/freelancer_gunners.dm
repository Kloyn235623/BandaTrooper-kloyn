// Secure Rust Rat Gunner lockers, using the smartgunner locker access convention.
/obj/structure/closet/secure_closet/freelancer_gunner
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_SMARTPREP)

/obj/structure/closet/secure_closet/freelancer_gunner/isr
	name = "Gunner locker - ISR"
	desc = "A secure Rust Rat gunner locker containing an ISR light machine gun and magazines."

/obj/structure/closet/secure_closet/freelancer_gunner/isr/Initialize()
	. = ..()
	new /obj/item/weapon/gun/rifle/isr/modded(src)
	for(var/i in 1 to 5)
		new /obj/item/ammo_magazine/rifle/isr(src)

/obj/structure/closet/secure_closet/freelancer_gunner/r81m1d
	name = "Gunner locker - R81M1D"
	desc = "A secure Rust Rat gunner locker containing an R81M1D light machine gun and drum magazines."

/obj/structure/closet/secure_closet/freelancer_gunner/r81m1d/Initialize()
	. = ..()
	new /obj/item/weapon/gun/rifle/r81m1a/m1d(src)
	for(var/i in 1 to 5)
		new /obj/item/ammo_magazine/rifle/r81m1/drum(src)
