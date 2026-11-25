/// LV-624 weedable grass uses the same atlas as the standard LV grass.
/turf/open/auto_turf/lv_grass_weedable
	name = "jungle grass"
	icon = 'icons/turf/floors/auto_lv_turf.dmi'
	icon_state = "grass_0"
	icon_prefix = "grass"
	layer_name = list("ground", "lush thick grass")
	desc = "grass, dirt, mud, and other assorted high moisture cave flooring."

/turf/open/auto_turf/lv_grass_weedable/layer0
	bleed_layer = 0
	variant_prefix_name = "matted grass"

/turf/open/auto_turf/lv_grass_weedable/layer0_mud
	name = "thick mud"
	icon_state = "grass_0_mud"
	bleed_layer = 0
	variant = "mud"
	variant_prefix_name = "muddy"

/turf/open/auto_turf/lv_grass_weedable/layer0_mud_alt
	name = "cave mud"
	icon_state = "grass_0_mud_alt"
	bleed_layer = 0
	variant = "mud_alt"

/turf/open/auto_turf/lv_grass_weedable/layer1
	icon_state = "grass_1"
	bleed_layer = 1