// Rust Rat radio equipment. The encryption key intentionally exposes one channel only.
/obj/item/device/encryptionkey/freelancer
	name = "Rust Rat Radio Encryption Key"
	icon_state = "stripped_key"
	channels = list(RADIO_CHANNEL_FREELANCER = TRUE)

/obj/item/device/radio/headset/almayer/freelancer
	name = "Rust Rat Radio Headset"
	desc = "A gray headset keyed to the Rust Rat squad channel."
	icon_state = "generic_headset"
	frequency = FREELANCER_FREQ
	has_hud = TRUE
	map_tracking = TRUE
	minimap_type = MINIMAP_FLAG_FREELANCER
	hud_type = list(MOB_HUD_FACTION_FREELANCER)
	inbuilt_tracking_options = list(
		"Handler" = TRACKER_RUST_RAT_HANDLER,
		"Warlord" = TRACKER_RUST_RAT_WARLORD,
		"Right Hand" = TRACKER_RUST_RAT_RIGHT_HAND,
	)
	initial_keys = list(/obj/item/device/encryptionkey/freelancer)
	maximum_keys = 1
