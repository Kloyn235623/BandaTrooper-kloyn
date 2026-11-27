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
	initial_keys = list(/obj/item/device/encryptionkey/freelancer)
	maximum_keys = 1
