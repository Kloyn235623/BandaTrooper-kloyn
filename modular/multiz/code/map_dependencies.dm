// Map dependencies that were referenced by the imported multiz and colony maps
// but did not have concrete types in the local codebase.

/turf/open/floor/interior/sun_emblem/northwest
	dir = NORTHWEST

/turf/closed/shuttle/dropship_clf
	name = "CLF dropship wreckage"
	icon = 'icons/turf/dropship_clf.dmi'
	icon_state = "1"

/turf/closed/shuttle/dropship_clf/Fire/transparent
	opacity = FALSE

/obj/item/storage/box/clf
	name = "CLF supply box"
	desc = "A cardboard box marked with the insignia of the Colonial Liberation Front."

// LV-624 and map-imported corpse landmarks.
/obj/effect/landmark/corpsespawner/pmc
	name = "Corpse - Weyland-Yutani PMC"
	equip_path = /datum/equipment_preset/corpse/pmc

/obj/effect/landmark/corpsespawner/wysec
	name = "Corpse - Weyland-Yutani Corporate Security"
	equip_path = /datum/equipment_preset/corpse/pmc/hybrisa_goon

/obj/effect/landmark/corpsespawner/security/marshal
	name = "Corpse - Corporate Marshal"
	equip_path = /datum/equipment_preset/corpse/pmc/hybrisa_goon/lead

/obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon_lead
	parent_type = /obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon
	equipment = /datum/equipment_preset/colonist/security/weyland/tactical/lead

/obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon_engi
	parent_type = /obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon
	equipment = /datum/equipment_preset/colonist/security/weyland/tactical

/obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon_medic
	parent_type = /obj/effect/landmark/survivor_spawner/lv624_corporate_dome_goon
	equipment = /datum/equipment_preset/colonist/security/weyland

/obj/effect/landmark/objective_landmark
	name = "objective landmark"

/obj/effect/landmark/objective_landmark/close
	name = "close objective landmark"

/obj/effect/landmark/objective_landmark/medium
	name = "medium objective landmark"

/obj/effect/landmark/objective_landmark/science
	name = "science objective landmark"

/obj/effect/landmark/objective_landmark/far
	name = "distant objective landmark"

/obj/item/pamphlet/skill/science
	name = "research instructional pamphlet"
	desc = "A training pamphlet that teaches basic research skills."
	icon_state = "pamphlet_reading"
	trait = /datum/character_trait/skills/science

/datum/character_trait/skills/science
	trait_name = "Research Training"
	trait_desc = "Boosts research skill. The crewmember received basic research training."
	skill = SKILL_RESEARCH
	skill_increment = 1
	skill_cap = SKILL_RESEARCH_TRAINED

/obj/structure/machinery/defenses/sentry/premade/lowammo
	ammo = new /obj/item/ammo_magazine/sentry/premade/lowammo

/obj/structure/machinery/defenses/sentry/premade/lowammo/random
	name = "modified UA-577 Gauss Turret"
	desc = "A modified gauss turret loaded with a reduced ammunition supply."

/obj/structure/machinery/defenses/sentry/premade/lowammo/random/dumb
	faction_group = null
