// Freelancer personal equipment vendor.
/obj/item/clothing/suit/storage/marine/light/vest/rust_rat
	storage_slots = 0

/obj/item/clothing/suit/storage/marine/veteran/ua_riot/rust_rat
	storage_slots = 0

/obj/item/clothing/suit/storage/marine/faction/freelancer/rust_rat
	storage_slots = 0

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/freelancer
	name = "ColMarTech Freelancer Equipment Vendor"
	desc = "An automated USCM-style rack of personal equipment for Freelancer personnel."
	icon_state = "uscm_gear"
	req_access = list()
	req_one_access = list()
	listed_products = list()
	hackable = TRUE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/freelancer/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Freelancer Fatigues", 15, /obj/item/clothing/under/marine/veteran/freelancer, VENDOR_ITEM_REGULAR),
		list("Marine Combat Boots", 15, /obj/item/clothing/shoes/marine/knife, VENDOR_ITEM_REGULAR),
		list("Rust Rat Radio Headset", 15, /obj/item/device/radio/headset/almayer/freelancer, VENDOR_ITEM_REGULAR),
		list("M5 Pattern Camera Unit", 10, /obj/item/device/overwatch_camera, VENDOR_ITEM_REGULAR),
		list("Black Fingerless Combat Gloves", 15, /obj/item/clothing/gloves/marine/fingerless, VENDOR_ITEM_REGULAR),
		list("Black Gloves", 15, /obj/item/clothing/gloves/black, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("M3-VL Ballistics Vest", 3, /obj/item/clothing/suit/storage/marine/light/vest/rust_rat, VENDOR_ITEM_REGULAR),
		list("UA-M1 Body Armor", 3, /obj/item/clothing/suit/storage/marine/veteran/ua_riot/rust_rat, VENDOR_ITEM_REGULAR),
		list("Freelancer Cuirass", 5, /obj/item/clothing/suit/storage/marine/faction/freelancer/rust_rat, VENDOR_ITEM_REGULAR),
		list("UA Riot Control Helmet", 3, /obj/item/clothing/head/helmet/marine/veteran/ua_riot, VENDOR_ITEM_REGULAR),

		list("HEADWEAR", -1, null, null),
		list("Freelancer Beret", 4, /obj/item/clothing/head/freelancer/beret, VENDOR_ITEM_REGULAR),
		list("Snow Boonie Hat", 2, /obj/item/clothing/head/cmcap/boonie/snow, VENDOR_ITEM_REGULAR),
		list("Gray Headband", 2, /obj/item/clothing/head/headband/gray, VENDOR_ITEM_REGULAR),
		list("Snow Utility Cap", 2, /obj/item/clothing/head/cmcap/snow, VENDOR_ITEM_REGULAR),
		list("Classic Utility Cap", 2, /obj/item/clothing/head/cmcap/classic, VENDOR_ITEM_REGULAR),
		list("Armored Freelancer Cap", 4, /obj/item/clothing/head/freelancer, VENDOR_ITEM_REGULAR),
		list("Skullcap", 2, /obj/item/clothing/head/skullcap, VENDOR_ITEM_REGULAR),
		list("Civilian UPP Cap", 2, /obj/item/clothing/head/uppcap/civi, VENDOR_ITEM_REGULAR),

		list("ARMOR WEBBING", -1, null, null),
		list("M3 Pattern Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Magazine Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/mag, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Shotgun Shell Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/shotgun, VENDOR_ITEM_REGULAR),
		list("M3 Pattern M40 Webbing", 1, /obj/item/clothing/accessory/storage/webbing/m3/m40, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Small Pouch Webbing", 2, /obj/item/clothing/accessory/storage/webbing/m3/small, VENDOR_ITEM_REGULAR),
		list("Shoulder Pouch", 4, /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Thigh Pouch", 4, /obj/item/clothing/accessory/storage/smallpouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 1, /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("BACKPACKS", -1, null, null),
		list("Black Four-Slot Engineer Pack", 2, /obj/item/storage/backpack/marine/engineerpack/ert/black/four_slot, VENDOR_ITEM_REGULAR),
		list("Ammo Rack Backpack", 1, /obj/item/storage/backpack/marine/ammo_rack, VENDOR_ITEM_REGULAR),
		list("Black Five-Slot Light Pack", 3, /obj/item/storage/backpack/lightpack/black/five_slot, VENDOR_ITEM_REGULAR),
		list("Five-Slot Light Pack", 5, /obj/item/storage/backpack/lightpack/five_slot, VENDOR_ITEM_REGULAR),
		list("Army MOLLE Pack", 3, /obj/item/storage/backpack/molle/army, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Ammo Load Rig", 15, /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 15, /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig (Full)", 15, /obj/item/storage/belt/knifepouch, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 15, /obj/item/storage/belt/gun/m39, VENDOR_ITEM_REGULAR),
		list("M276 General Revolver Holster Rig", 15, /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 15, /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 15, /obj/item/storage/belt/shotgun, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", 15, /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig (Empty)", 15, /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null),
		list("Bayonet Sheath (Full)", 15, /obj/item/storage/pouch/bayonet, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 15, /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 15, /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 15, /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 15, /obj/item/storage/pouch/flare/full, VENDOR_ITEM_RECOMMENDED),
		list("Magazine Pouch", 15, /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 15, /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 15, /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 15, /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 15, /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL MARINE POUCHES", -1, null, null),
		list("Machete Scabbard (Full)", 15, /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 15, /obj/item/storage/pouch/machete/full, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 5, /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 15, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 15, /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),

		list("ADDITIONAL POUCHES", -1, null, null),
		list("Construction Pouch", 2, /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", 2, /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", 3, /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", floor(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", 2, /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 2, /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Incinerator Fuel Tank Pouch", 2, /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 2, /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),

		list("MASKS", -1, null, null),
		list("Heat Absorbent Coif", 3, /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Rebreather", 5, /obj/item/clothing/mask/rebreather, VENDOR_ITEM_REGULAR),
		list("Tactical Wrap", 5, /obj/item/clothing/mask/rebreather/scarf/tacticalmask, VENDOR_ITEM_REGULAR),
		list("Blue Keffiyeh", 3, /obj/item/clothing/mask/rebreather/scarf/keffiyeh/blue, VENDOR_ITEM_REGULAR),

		list("PATCHES", -1, null, null),
		list("Freelancer Guild Patch", 10, /obj/item/clothing/accessory/patch/freelancer_patch, VENDOR_ITEM_REGULAR),
		list("Old Freelancer Guild Patch", 10, /obj/item/clothing/accessory/patch/merc_patch, VENDOR_ITEM_REGULAR),
	)

// Freelancer squad utility and sidearm vendor, based on the USCM squad utility vendor.
/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/freelancer
	name = "ColMarTech Freelancer Utilities Vendor"
	desc = "An automated supply rack of food, medical supplies, tools, and sidearms for Freelancer personnel."
	req_access = list()
	req_one_access = list()
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/freelancer/populate_product_list(scale)
	listed_products = list(
		list("FOOD", -1, null, null),
		list("Emergency MRE Box", 2, /obj/item/ammo_box/magazine/misc/mre/emergency, VENDOR_ITEM_REGULAR),
		list("Weyland-Yutani Cookie Brick", 10, /obj/item/mre_food_packet/wy/cookie_brick, VENDOR_ITEM_REGULAR),

		list("MEDICAL", -1, null, null),
		list("Gauze", round(scale * 15), /obj/item/stack/medical/bruise_pack, VENDOR_ITEM_REGULAR),
		list("Ointment", round(scale * 15), /obj/item/stack/medical/ointment, VENDOR_ITEM_REGULAR),
		list("Splints", round(scale * 15), /obj/item/stack/medical/splint, VENDOR_ITEM_REGULAR),
		list("Emergency Autoinjector", round(scale * 15), /obj/item/reagent_container/hypospray/autoinjector/emergency, VENDOR_ITEM_REGULAR),
		list("Bicaridine Autoinjector", round(scale * 15), /obj/item/reagent_container/hypospray/autoinjector/bicaridine/skillless, VENDOR_ITEM_REGULAR),
		list("Kelotane Autoinjector", round(scale * 15), /obj/item/reagent_container/hypospray/autoinjector/kelotane/skillless, VENDOR_ITEM_REGULAR),
		list("Tricordrazine Autoinjector", round(scale * 15), /obj/item/reagent_container/hypospray/autoinjector/tricord/skillless, VENDOR_ITEM_REGULAR),
		list("Tramadol Injector", round(scale * 15), /obj/item/reagent_container/hypospray/autoinjector/tramadol/skillless, VENDOR_ITEM_REGULAR),

		list("TOOLS", -1, null, null),
		list("Entrenching Tool (ET)", round(scale * 2), /obj/item/tool/shovel/etool/folded, VENDOR_ITEM_REGULAR),
		list("Screwdriver", round(scale * 5), /obj/item/tool/screwdriver, VENDOR_ITEM_REGULAR),
		list("Wirecutters", round(scale * 5), /obj/item/tool/wirecutters, VENDOR_ITEM_REGULAR),
		list("Crowbar", round(scale * 5), /obj/item/tool/crowbar, VENDOR_ITEM_REGULAR),
		list("Wrench", round(scale * 5), /obj/item/tool/wrench, VENDOR_ITEM_REGULAR),
		list("Multitool", round(scale * 1), /obj/item/device/multitool, VENDOR_ITEM_REGULAR),
		list("Welding Tool", round(scale * 1), /obj/item/tool/weldingtool, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", -1, null, null),
		list("Plastic Explosives (C4)", 2, /obj/item/explosive/plastic, VENDOR_ITEM_REGULAR),

		list("FLARES", -1, null, null),
		list("Box of Flares", 1, /obj/item/ammo_box/magazine/misc/flares, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", 10, /obj/item/storage/box/flare, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null),
		list("HG-44 'Automag' Pistol", 3, /obj/item/weapon/gun/pistol/highpower/automag, VENDOR_ITEM_REGULAR),
		list("M1911 Pistol", 3, /obj/item/weapon/gun/pistol/m1911, VENDOR_ITEM_REGULAR),
		list("Webley Mk VI Revolver", 3, /obj/item/weapon/gun/revolver/m44/custom/webley, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("HG-44 'Automag' Magazine (.44)", 10, /obj/item/ammo_magazine/pistol/highpower/automag, VENDOR_ITEM_REGULAR),
		list("M1911 Magazine (.45)", 10, /obj/item/ammo_magazine/pistol/m1911, VENDOR_ITEM_REGULAR),
		list("Webley Speedloader (.455)", 10, /obj/item/ammo_magazine/revolver/webley, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null),
		list("Extinguisher", round(scale * 5), /obj/item/tool/extinguisher, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", round(scale * 1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Roller Bed", round(scale * 2), /obj/item/roller, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", round(scale * 5), /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Tactical Monocular", round(scale * 2), /obj/item/device/binoculars/range/monocular, VENDOR_ITEM_REGULAR),
		list("AN/PSQ-55 Sentry Console", round(scale * 1), /obj/item/device/sentry_computer, VENDOR_ITEM_REGULAR),
		list("Spare PDT/L Battle Buddy Kit", round(scale * 3), /obj/item/storage/box/pdt_kit/advanced, VENDOR_ITEM_REGULAR),
		list("Rail Flashlight", round(scale * 5), /obj/item/attachable/flashlight, VENDOR_ITEM_REGULAR),
		list("Two-point Sling", round(scale * 5), /obj/item/attachable/sling, VENDOR_ITEM_REGULAR),
		list("FIL Marine Knife", round(scale * 25), /obj/item/weapon/knife/marine/fil, VENDOR_ITEM_REGULAR),
	)

// Rust Rat Stitcher clothing vendor, adapted from the Marine medic vendor.
GLOBAL_LIST_INIT(cm_vending_clothing_freelancer_stitcher, list(
	list("ARMOR PAINT (CHOOSE 1)", 0, null, null, null),
	list("Red Cross Paint", 0, /obj/item/clothing/accessory/paint/medic, MARINE_CAN_BUY_PAINT, VENDOR_ITEM_RECOMMENDED),

	list("MEDIC HUD (CHOOSE 1)", 0, null, null, null),
	list("Health HUD", 0, /obj/item/clothing/glasses/hud/health, MARINE_CAN_BUY_GLASSES, VENDOR_ITEM_REGULAR),

	list("BACKPACK (CHOOSE 1)", 0, null, null, null),
	list("Black Medical Backpack", 0, /obj/item/storage/backpack/lightpack/black/medic, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

	list("BELT (CHOOSE 1)", 0, null, null, null),
	list("M276 Medical Storage Rig (Full)", 0, /obj/item/storage/belt/medical/full, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),

	list("POUCHES (CHOOSE 2)", 0, null, null, null),
	list("Autoinjector Pouch", 0, /obj/item/storage/pouch/autoinjector, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
	list("Medical Kit Pouch", 0, /obj/item/storage/pouch/medkit, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
	list("Pressurized Reagent Canister Pouch (Bicaridine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/bicaridine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
	list("Pressurized Reagent Canister Pouch (Kelotane)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/kelotane, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
	list("Pressurized Reagent Canister Pouch (Tricordrazine)", 0, /obj/item/storage/pouch/pressurized_reagent_canister/tricordrazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
	list("Vial Pouch (Full)", 0, /obj/item/storage/pouch/vials/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

	list("ACCESSORIES (CHOOSE 1)", 0, null, null, null),
	list("M3 Pattern Webbing", 0, /obj/item/clothing/accessory/storage/webbing/m3, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	list("M3 Pattern Magazine Webbing", 0, /obj/item/clothing/accessory/storage/webbing/m3/mag, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	list("M3 Pattern Shotgun Shell Webbing", 0, /obj/item/clothing/accessory/storage/webbing/m3/shotgun, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	list("M3 Pattern M40 Webbing", 0, /obj/item/clothing/accessory/storage/webbing/m3/m40, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	list("M3 Pattern Small Pouch Webbing", 0, /obj/item/clothing/accessory/storage/webbing/m3/small, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_RECOMMENDED),
	list("Shoulder Holster", 0, /obj/item/clothing/accessory/storage/holster, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
	list("Drop Pouch", 0, /obj/item/clothing/accessory/storage/droppouch, MARINE_CAN_BUY_ACCESSORY, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/clothing/medic/freelancer
	name = "Rust Rat Stitcher Gear Rack"
	desc = "An automated medical clothing rack for Rust Rat Stitchers."
	req_access = list()
	vendor_role = list()

/obj/structure/machinery/cm_vending/clothing/medic/freelancer/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_freelancer_stitcher

GLOBAL_LIST_INIT(cm_vending_gear_freelancer_rigger, list(
	list("RIGGER SUPPORT (LIMITED STOCK)", 0, null, null, null),
	list("Mercenary Radio Telephone Satchel", 1, /obj/item/storage/backpack/marine/satchel/rto/merc, null, VENDOR_ITEM_REGULAR),
	list("Combat Toolbelt Rig", 1, /obj/item/storage/belt/gun/utility, null, VENDOR_ITEM_REGULAR),
	list("UPP Heavy Sentry Case", 1, /obj/item/storage/box/guncase/heavy/sentryupp, null, VENDOR_ITEM_REGULAR),
))

/obj/structure/machinery/cm_vending/gear/engi/freelancer
	name = "Rust Rat Rigger Gear Rack"
	desc = "A limited equipment rack for Rust Rat riggers."
	req_access = list()
	vendor_role = list(JOB_RUST_RAT_RIGGER)
	use_points = FALSE
	show_points = FALSE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND

/obj/structure/machinery/cm_vending/gear/engi/freelancer/Initialize(mapload)
	. = ..()
	listed_products = list()
	for(var/list/product as anything in GLOB.cm_vending_gear_freelancer_rigger)
		listed_products += list(product.Copy())

/obj/structure/machinery/cm_vending/gear/engi/freelancer/get_listed_products(mob/user)
	return listed_products

/obj/structure/machinery/cm_vending/gear/engi/freelancer/ui_static_data(mob/user)
	. = ..(user)
	.["vendor_type"] = "sorted"

// Allow utility-slot load-bearing accessories to attach instead of falling into the built-in pockets.
/obj/item/clothing/under/marine/veteran/freelancer
	suit_restricted = null

/obj/item/clothing/suit/storage/marine/light/vest
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_GASMASK, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_UTILITY)
	restricted_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY)

/obj/item/clothing/suit/storage/marine/veteran/ua_riot
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_GASMASK, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_UTILITY)
	restricted_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY)

/obj/item/clothing/suit/storage/marine/faction/freelancer
	valid_accessory_slots = list(ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_PONCHO, ACCESSORY_SLOT_GASMASK, ACCESSORY_SLOT_M3UTILITY, ACCESSORY_SLOT_UTILITY)
	restricted_accessory_slots = list(ACCESSORY_SLOT_M3UTILITY)
