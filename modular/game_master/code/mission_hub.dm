// Persistent ship mission hub, GM placement tools, player stash, and trader.
// Stash entries use stable item type paths and small primitive state records;
// mission and placement state are stored in the server-side campaign savefile.

#define GM_HUB_MAX_MISSIONS 12


/datum/hub_campaign_state
	/// IDs of missions queued by the GM for the next campaign sequence.
	var/list/mission_queue = list()
	var/list/mission_briefs = list()
	/// Per-player selections among the GM-approved mission queue.
	var/list/mission_votes = list()
	/// Mission currently active in the shared ship campaign.
	var/current_hub_mission = null
	/// GM-defined trader offers: stable item type path text mapped to price.
	var/list/hub_trader_offers = list()
	/// GM placed trader and locker locations by map and coordinates.
	var/list/placed_hub_assets = list()

GLOBAL_DATUM_INIT(hub_campaign_state, /datum/hub_campaign_state, new)

/datum/hub_campaign_state/proc/record_asset(type_path, turf/T, mob/living/carbon/human/hub_trader/trader)
	if(!T || (!ispath(type_path, /obj/structure) && !ispath(type_path, /mob/living/carbon/human)))
		return FALSE
	var/map_file = SSmapping.configs[GROUND_MAP]?.map_file
	var/key = "[map_file]:[T.x],[T.y],[T.z]"
	var/list/asset_record = list("type" = "[type_path]", "map" = map_file, "x" = T.x, "y" = T.y, "z" = T.z)
	if(trader)
		asset_record["name"] = trader.real_name
		asset_record["appearance"] = trader.get_hub_appearance()
	placed_hub_assets[key] = asset_record
	save()
	return TRUE

/datum/hub_campaign_state/proc/restore_assets()
	var/map_file = SSmapping.configs[GROUND_MAP]?.map_file
	for(var/key in placed_hub_assets)
		var/list/entry = placed_hub_assets[key]
		if(entry["map"] != map_file)
			continue
		var/turf/T = locate(entry["x"], entry["y"], entry["z"])
		var/type_path = text2path(entry["type"])
		if(!T || (!ispath(type_path, /obj/structure) && !ispath(type_path, /mob/living/carbon/human)))
			continue
		var/found = FALSE
		for(var/atom/movable/existing in T)
			if(existing.type == type_path)
				found = TRUE
				break
		if(!found)
			var/atom/movable/restored_asset = new type_path(T)
			if(istype(restored_asset, /mob/living/carbon/human/hub_trader))
				var/mob/living/carbon/human/hub_trader/restored_trader = restored_asset
				restored_trader.restore_hub_identity(entry["name"], entry["appearance"])
				if(!entry["name"] || !islist(entry["appearance"]))
					record_asset(type_path, T, restored_trader)

/datum/hub_campaign_state/New()
	. = ..()
	var/savefile/S = new /savefile("data/mission_hub_gm.sav")
	var/list/saved_queue
	var/list/saved_briefs
	var/list/saved_offers
	var/list/saved_assets
	var/list/saved_votes
	S["mission_queue"] >> saved_queue
	S["mission_briefs"] >> saved_briefs
	S["hub_trader_offers"] >> saved_offers
	S["placed_hub_assets"] >> saved_assets
	S["mission_votes"] >> saved_votes
	if(islist(saved_queue))
		mission_queue = saved_queue.Copy()
	if(islist(saved_briefs))
		mission_briefs = saved_briefs.Copy()
	if(islist(saved_offers))
		hub_trader_offers = saved_offers.Copy()
	if(islist(saved_assets))
		placed_hub_assets = saved_assets.Copy()
	if(islist(saved_votes))
		mission_votes = saved_votes.Copy()
	S["current_hub_mission"] >> current_hub_mission
	// Migrate the original shared offer table into the Quartermaster catalog.
	var/list/legacy_offers = list()
	for(var/offer_key in hub_trader_offers)
		if(ispath(offer_key, /obj/item))
			legacy_offers[offer_key] = hub_trader_offers[offer_key]
	if(length(legacy_offers))
		hub_trader_offers = list("Quartermaster" = legacy_offers)
		save()

/datum/hub_campaign_state/proc/save()
	var/savefile/S = new /savefile("data/mission_hub_gm.sav")
	S["mission_queue"] << mission_queue
	S["mission_briefs"] << mission_briefs
	S["hub_trader_offers"] << hub_trader_offers
	S["placed_hub_assets"] << placed_hub_assets
	S["mission_votes"] << mission_votes
	S["current_hub_mission"] << current_hub_mission

/datum/hub_campaign_state/proc/get_group_stash()
	var/savefile/S = new /savefile("data/mission_hub_group_stash.sav")
	var/list/items
	S["items"] >> items
	return islist(items) ? items : list()

/datum/hub_campaign_state/proc/save_group_stash(list/items)
	var/savefile/S = new /savefile("data/mission_hub_group_stash.sav")
	S["items"] << items

/datum/hub_campaign_state/proc/serialize_group_item(obj/item/item, depth = 0)
	if(!item || depth > 10)
		return null
	var/list/record = list("type" = "[item.type]")
	var/list/state = list()
	var/list/unsafe_vars = list("type", "parent_type", "loc", "contents", "vars", "verbs", "vis_contents", "overlays", "underlays", "components", "datum_components", "reagents", "atom_storage", "hud_list", "actions", "fingerprints", "fingerprintslast", "client", "key", "ckey")
	for(var/variable in item.vars)
		if(variable in unsafe_vars)
			continue
		var/value = item.vars[variable]
		if((isnum(value) || istext(value) || ispath(value)) && value != initial(item.vars[variable]))
			state[variable] = value
	if(length(state))
		record["state"] = state
	if(istype(item, /obj/item/spacecash))
		var/obj/item/spacecash/cash = item
		record["worth"] = cash.worth
	var/list/contents = list()
	for(var/obj/item/contained_item in item.contents)
		var/list/child_record = serialize_group_item(contained_item, depth + 1)
		if(child_record)
			contents += list(child_record)
	if(length(contents))
		record["contents"] = contents
	return record

/datum/hub_campaign_state/proc/restore_group_item(list/record, atom/location)
	var/item_path = text2path(record?["type"])
	if(!ispath(item_path, /obj/item))
		return null
	var/obj/item/restored = new item_path(location)
	var/list/state = record["state"]
	if(islist(state))
		for(var/variable in state)
			if(!(variable in restored.vars) || variable in list("type", "parent_type", "loc", "contents", "vars", "verbs", "reagents", "atom_storage"))
				continue
			var/value = state[variable]
			if(isnum(value) || istext(value) || ispath(value))
				restored.vars[variable] = value
	if(istype(restored, /obj/item/spacecash) && isnum(record["worth"]))
		var/obj/item/spacecash/cash = restored
		cash.worth = record["worth"]
		cash.update_value()
		cash.update_icon()
	var/list/contents = record["contents"]
	if(islist(contents))
		for(var/list/child_record as anything in contents)
			restore_group_item(child_record, restored)
	return restored

/datum/hub_campaign_state/proc/get_group_stash_summary()
	var/list/summary = list()
	var/list/counts = list()
	for(var/list/stored as anything in get_group_stash())
		var/item_type = stored["type"]
		if(!counts[item_type])
			counts[item_type] = list("type" = item_type, "count" = 0, "total_worth" = 0)
		counts[item_type]["count"]++
		if(isnum(stored["worth"]))
			counts[item_type]["total_worth"] += stored["worth"]
	for(var/item_type in counts)
		var/list/entry = counts[item_type]
		var/item_path = text2path(item_type)
		if(ispath(item_path, /obj/item))
			summary += list(list("type" = item_type, "name" = initial(item_path:name), "count" = entry["count"], "total_worth" = entry["total_worth"]))
	return summary

/datum/game_master/proc/set_hub_trader_offer(mob/user, trader_role, item_path, price)
	if(!can_manage_hub(user) || !ispath(item_path, /obj/item) || ispath(item_path, /obj/item/spacecash))
		return FALSE
	var/list/role_offers = GLOB.hub_campaign_state.hub_trader_offers[trader_role]
	if(!islist(role_offers))
		role_offers = list()
	else
		role_offers = role_offers.Copy()
	if(!isnum(price) || price < 0 || price > 1000000)
		return FALSE
	if(price == 0)
		role_offers -= item_path
		if(length(role_offers))
			GLOB.hub_campaign_state.hub_trader_offers[trader_role] = role_offers
		else
			GLOB.hub_campaign_state.hub_trader_offers -= trader_role
		GLOB.hub_campaign_state.save()
		message_admins("[key_name_admin(user)] removed [item_path] from [trader_role].")
		return TRUE
	role_offers[item_path] = round(price)
	GLOB.hub_campaign_state.hub_trader_offers[trader_role] = role_offers
	GLOB.hub_campaign_state.save()
	message_admins("[key_name_admin(user)] set [trader_role] price for [item_path] to [round(price)].")
	return TRUE

/datum/game_master
	var/selected_hub_trader_profile = "Quartermaster"

/mob/living/carbon/human/hub_trader
	name = "mission trader"
	real_name = "Mission Trader"
	var/trader_role = "Quartermaster"

/mob/living/carbon/human/hub_trader/Initialize(mapload)
	. = ..()
	equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(src), WEAR_BODY)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/black(src), WEAR_FEET)

/mob/living/carbon/human/hub_trader/proc/randomize_hub_identity()
	gender = pick(MALE, FEMALE)
	var/datum/preferences/random_preferences = new
	random_preferences.randomize_appearance(src)
	change_real_name(src, random_name(gender))

/mob/living/carbon/human/hub_trader/proc/get_hub_appearance()
	var/list/appearance = list()
	var/list/appearance_vars = list("gender", "age", "body_type", "body_size", "skin_color", "r_skin", "g_skin", "b_skin", "h_style", "f_style", "r_hair", "g_hair", "b_hair", "r_gradient", "g_gradient", "b_gradient", "grad_style", "r_facial", "g_facial", "b_facial", "r_eyes", "g_eyes", "b_eyes", "undershirt", "underwear")
	for(var/variable in appearance_vars)
		appearance[variable] = vars[variable]
	return appearance

/mob/living/carbon/human/hub_trader/proc/restore_hub_identity(saved_name, list/appearance)
	randomize_hub_identity()
	if(istext(saved_name) && length(saved_name))
		change_real_name(src, saved_name)
	if(!islist(appearance))
		return
	for(var/variable in appearance)
	if(variable in list("gender", "age", "body_type", "body_size", "skin_color", "r_skin", "g_skin", "b_skin", "h_style", "f_style", "r_hair", "g_hair", "b_hair", "r_gradient", "g_gradient", "b_gradient", "grad_style", "r_facial", "g_facial", "b_facial", "r_eyes", "g_eyes", "b_eyes", "undershirt", "underwear"))
			vars[variable] = appearance[variable]
	update_body()
	update_hair()

/mob/living/carbon/human/hub_trader/quartermaster
	trader_role = "Quartermaster"

/mob/living/carbon/human/hub_trader/armorer
	trader_role = "Armorer"

/mob/living/carbon/human/hub_trader/medical
	trader_role = "Medical Supplier"

/mob/living/carbon/human/hub_trader/mechanic
	trader_role = "Field Mechanic"

/datum/game_master/proc/get_hub_trader_type(profile)
	switch(profile)
		if("Quartermaster")
			return /mob/living/carbon/human/hub_trader/quartermaster
		if("Armorer")
			return /mob/living/carbon/human/hub_trader/armorer
		if("Medical Supplier")
			return /mob/living/carbon/human/hub_trader/medical
		if("Field Mechanic")
			return /mob/living/carbon/human/hub_trader/mechanic
	return null

/mob/living/carbon/human/hub_trader/attack_hand(mob/user)
	if(!ishuman(user) || !user.Adjacent(src))
		return ..()
	user.set_interaction(src)
	tgui_interact(user)
	return TRUE

/mob/living/carbon/human/hub_trader/attackby(obj/item/W, mob/living/user)
	var/datum/game_master/gm = user?.client?.game_master_menu
	if(!gm || !gm.can_manage_hub(user) || W.loc != user)
		return ..()
	var/price = tgui_input_number(user, "Set a physical cash price. Enter 0 to remove this item.", "List [W.name] with [trader_role]", 100, 1000000, 0)
	if(isnull(price) || QDELETED(W) || !user.Adjacent(src))
		return TRUE
	gm.set_hub_trader_offer(user, trader_role, W.type, price)
	SStgui.update_uis(src)
	return TRUE

/mob/living/carbon/human/hub_trader/ui_state(mob/user)
	return GLOB.physical_state

/mob/living/carbon/human/hub_trader/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MissionHubTrader", "[trader_role] — [real_name]")
		ui.open()

/mob/living/carbon/human/hub_trader/ui_data(mob/user)
	var/list/data = list("offers" = list(), "sellables" = list(), "can_manage" = (user?.client && check_client_rights(user.client, R_ADMIN, FALSE)), "trader_role" = trader_role)
	var/list/role_offers = GLOB.hub_campaign_state.hub_trader_offers[trader_role]
	if(!islist(role_offers))
		role_offers = list()
	for(var/item_path in role_offers)
		data["offers"] += list(list("name" = initial(item_path:name), "price" = role_offers[item_path], "path" = "[item_path]"))
	if(ishuman(user))
		for(var/obj/item/sell_item in user.contents)
			if(istype(sell_item, /obj/item/spacecash) || isnull(role_offers[sell_item.type]))
				continue
			data["sellables"] += list(list("name" = sell_item.name, "price" = role_offers[sell_item.type], "ref" = REF(sell_item)))
	return data

/mob/living/carbon/human/hub_trader/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = ui.user
	if(!user.Adjacent(src))
		return TRUE
	if(action == "buy")
		var/item_path = text2path(params["path"])
		if(!ispath(item_path, /obj/item) || ispath(item_path, /obj/item/spacecash))
			return TRUE
		var/list/role_offers = GLOB.hub_campaign_state.hub_trader_offers[trader_role]
		var/price = role_offers?[item_path]
		if(!isnum(price) || !hub_take_cash(user, price))
			to_chat(user, SPAN_WARNING("You do not have enough physical cash."))
			return TRUE
		var/obj/item/purchased = new item_path(get_turf(src))
		user.put_in_hands(purchased)
		return TRUE
	if(action == "sell")
		var/obj/item/sold_item = locate(params["ref"])
		if(!istype(sold_item) || sold_item.loc != user || istype(sold_item, /obj/item/spacecash))
			return TRUE
		var/list/role_offers = GLOB.hub_campaign_state.hub_trader_offers[trader_role]
		var/sale_price = role_offers?[sold_item.type]
		if(!isnum(sale_price))
			return TRUE
		qdel(sold_item)
		var/obj/item/spacecash/bundle/payment = new(get_turf(src))
		payment.worth = sale_price
		payment.update_icon()
		user.put_in_hands(payment)
		return TRUE
	if(action == "remove_offer")
		var/item_path = text2path(params["path"])
		if(!user?.client || !check_client_rights(user.client, R_ADMIN, FALSE) || !ispath(item_path, /obj/item))
			return TRUE
		var/list/role_offers = GLOB.hub_campaign_state.hub_trader_offers[trader_role]
		if(islist(role_offers))
			role_offers -= item_path
			if(length(role_offers))
				GLOB.hub_campaign_state.hub_trader_offers[trader_role] = role_offers
			else
				GLOB.hub_campaign_state.hub_trader_offers -= trader_role
		GLOB.hub_campaign_state.save()
		SStgui.update_uis(src)
		return TRUE
	return FALSE

/proc/hub_take_cash(mob/living/carbon/human/user, amount)
	if(!user || amount <= 0)
		return FALSE
	var/list/cash_items = list()
	var/total = 0
	for(var/obj/item/spacecash/cash in user.contents)
		if(cash.counterfeit)
			continue
		cash_items += cash
		total += cash.worth
	if(total < amount)
		return FALSE
	var/remaining = total - amount
	for(var/obj/item/spacecash/cash in cash_items)
		if(remaining >= cash.worth)
			remaining -= cash.worth
			continue
		qdel(cash)
	if(remaining > 0)
		var/obj/item/spacecash/bundle/change = new(user.loc)
		change.worth = remaining
		change.update_icon()
		user.put_in_hands(change)
	return TRUE

/obj/structure/closet/hub_persistent_stash
	name = "mission hub group supply locker"
	desc = "Shared group storage for equipment and physical cash between missions."

/obj/structure/closet/hub_persistent_stash/attackby(obj/item/item, mob/user)
	if(!ishuman(user) || !istype(item, /obj/item))
		return ..()
	if(!user.Adjacent(src) || item.loc != user)
		return
	var/list/items = GLOB.hub_campaign_state.get_group_stash()
	if(length(items) >= 100)
		to_chat(user, SPAN_WARNING("The group supply locker is full."))
		return
	if(istype(item, /obj/item/spacecash))
		var/obj/item/spacecash/cash = item
		if(cash.counterfeit)
			to_chat(user, SPAN_WARNING("Counterfeit cash cannot be stored."))
			return
	var/list/stored_item = GLOB.hub_campaign_state.serialize_group_item(item)
	if(!stored_item)
		return
	items += list(stored_item)
	if(!user.drop_inv_item_to_loc(item, src))
		return
	GLOB.hub_campaign_state.save_group_stash(items)
	qdel(item)
	to_chat(user, SPAN_NOTICE("Equipment added to the group supply locker."))

/obj/structure/closet/hub_persistent_stash/attack_hand(mob/user)
	if(!ishuman(user))
		return ..()
	var/list/items = GLOB.hub_campaign_state.get_group_stash()
	if(!islist(items) || !length(items))
		to_chat(user, SPAN_NOTICE("The group supply locker is empty."))
		return
	var/list/item_options = list()
	var/item_option_index = 0
	for(var/list/stored_item as anything in items)
		item_option_index++
		var/item_type_text = stored_item["type"]
		var/item_path_option = text2path(item_type_text)
		if(!ispath(item_path_option, /obj/item))
			continue
		var/item_label = initial(item_path_option:name)
		if(istype(item_path_option, /obj/item/spacecash))
			item_label = "$[stored_item["worth"]] [item_label]"
		item_options["[item_option_index]. [item_label]"] = stored_item
	var/selection = tgui_input_list(user, "Retrieve group equipment or cash", name, item_options)
	var/list/selected_item = item_options[selection]
	if(!selected_item || !user.Adjacent(src) || !(selected_item in items))
		return
	var/selected_index = items.Find(selected_item)
	if(!selected_index)
		return
	var/obj/item/retrieved = GLOB.hub_campaign_state.restore_group_item(selected_item, get_turf(src))
	if(!retrieved)
		return
	items.Cut(selected_index, selected_index + 1)
	GLOB.hub_campaign_state.save_group_stash(items)
	user.put_in_hands(retrieved)

/datum/game_master/proc/can_manage_hub(mob/user)
	return user?.client && check_client_rights(user.client, R_ADMIN, FALSE)

/datum/game_master/proc/issue_group_stash_item(mob/user, item_type)
	if(!can_manage_hub(user) || !istext(item_type))
		return FALSE
	var/item_path = text2path(item_type)
	if(!ispath(item_path, /obj/item))
		return FALSE
	var/obj/structure/closet/hub_persistent_stash/group_locker
	for(var/obj/structure/closet/hub_persistent_stash/locker in world)
		group_locker = locker
		break
	if(!group_locker)
		return FALSE
	var/list/items = GLOB.hub_campaign_state.get_group_stash()
	var/list/recipients = list()
	var/area/group_area = get_area(group_locker)
	for(var/mob/living/carbon/human/recipient in GLOB.player_list)
		if(recipient.stat == DEAD || get_area(recipient) != group_area)
			continue
		recipients += recipient
	if(!length(recipients))
		to_chat(user, SPAN_WARNING("No living group members are in the supply area."))
		return FALSE
	var/list/issued = list()
	for(var/i in 1 to length(items))
		var/list/entry = items[i]
		if(entry["type"] == item_type)
			issued += i
			if(length(issued) >= length(recipients))
				break
	if(length(issued) < length(recipients))
		to_chat(user, SPAN_WARNING("The group locker does not have enough copies for everyone present."))
		return FALSE
	for(var/r in 1 to length(recipients))
		var/item_index = issued[length(issued) - r + 1]
		var/list/entry = items[item_index]
		var/obj/item/gift = GLOB.hub_campaign_state.restore_group_item(entry, get_turf(recipients[r]))
		if(!gift)
			continue
		recipients[r].put_in_hands(gift)
		items.Cut(item_index, item_index + 1)
	GLOB.hub_campaign_state.save_group_stash(items)
	message_admins("[key_name_admin(user)] issued [length(recipients)] [initial(item_path:name)] from the group locker.")
	return TRUE

/datum/game_master/proc/queue_hub_mission(mob/user, mission_id)
	if(!can_manage_hub(user) || !istext(mission_id) || !length(mission_id) || length(mission_id) > 64)
		return FALSE
	if(length(GLOB.hub_campaign_state.mission_queue) >= GM_HUB_MAX_MISSIONS)
		return FALSE
	if(mission_id in GLOB.hub_campaign_state.mission_queue)
		return FALSE
	GLOB.hub_campaign_state.mission_queue += mission_id
	GLOB.hub_campaign_state.mission_votes = list()
	var/brief = tgui_input_text(user, "Mission briefing shown when the GM starts it", "Mission briefing", multiline = TRUE, max_length = 512)
	if(isnull(brief))
		GLOB.hub_campaign_state.mission_queue -= mission_id
		return FALSE
	GLOB.hub_campaign_state.mission_briefs[mission_id] = trim(brief)
	GLOB.hub_campaign_state.save()
	message_admins("[key_name_admin(user)] queued hub mission '[mission_id]'.")
	return TRUE

/datum/game_master/proc/remove_hub_mission(mob/user, mission_id)
	if(!can_manage_hub(user) || !(mission_id in GLOB.hub_campaign_state.mission_queue))
		return FALSE
	GLOB.hub_campaign_state.mission_queue -= mission_id
	GLOB.hub_campaign_state.mission_briefs -= mission_id
	GLOB.hub_campaign_state.mission_votes = list()
	GLOB.hub_campaign_state.save()
	message_admins("[key_name_admin(user)] removed hub mission '[mission_id]' from the queue.")
	return TRUE

/datum/game_master/proc/advance_hub_mission(mob/user)
	if(!can_manage_hub(user) || !length(GLOB.hub_campaign_state.mission_queue))
		return FALSE
	var/selected_mission = GLOB.hub_campaign_state.mission_queue[1]
	var/highest_vote_count = -1
	for(var/mission_id in GLOB.hub_campaign_state.mission_queue)
		var/vote_count = 0
		for(var/voter_ckey in GLOB.hub_campaign_state.mission_votes)
			if(GLOB.hub_campaign_state.mission_votes[voter_ckey] == mission_id)
				vote_count++
		if(vote_count > highest_vote_count)
			highest_vote_count = vote_count
			selected_mission = mission_id
	GLOB.hub_campaign_state.current_hub_mission = selected_mission
	var/selected_index = GLOB.hub_campaign_state.mission_queue.Find(selected_mission)
	if(selected_index)
		GLOB.hub_campaign_state.mission_queue.Cut(selected_index, selected_index + 1)
	GLOB.hub_campaign_state.mission_votes = list()
	GLOB.hub_campaign_state.save()
	var/brief = GLOB.hub_campaign_state.mission_briefs[GLOB.hub_campaign_state.current_hub_mission]
	message_admins("[key_name_admin(user)] started next ship mission '[GLOB.hub_campaign_state.current_hub_mission]'.")
	if(length(brief))
		to_chat(world, SPAN_NOTICE("<b>MISSION: [GLOB.hub_campaign_state.current_hub_mission]</b><br>[brief]"))
	return GLOB.hub_campaign_state.current_hub_mission

/datum/hub_campaign_state/proc/get_mission_options(mob/user)
	var/list/options = list()
	var/player_vote = user?.ckey ? mission_votes[user.ckey] : null
	for(var/mission_id in mission_queue)
		var/vote_count = 0
		for(var/voter_ckey in mission_votes)
			if(mission_votes[voter_ckey] == mission_id)
				vote_count++
		options += list(list(
			"id" = mission_id,
			"brief" = mission_briefs[mission_id] || "No mission briefing provided.",
			"votes" = vote_count,
			"selected" = player_vote == mission_id
		))
	return options

/datum/hub_campaign_state/proc/cast_mission_vote(mob/user, mission_id)
	if(!user?.ckey || !(mission_id in mission_queue))
		return FALSE
	mission_votes[user.ckey] = mission_id
	save()
	return TRUE

/obj/structure/machinery/computer/hub_mission_console
	name = "mission selection console"
	desc = "Review mission briefings and vote for the next assignment. A Game Master authorizes the final mission."
	icon_state = "computer_generic"
	use_power = USE_POWER_NONE

/obj/structure/machinery/computer/hub_mission_console/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_state

/obj/structure/machinery/computer/hub_mission_console/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MissionSelectionConsole", name)
		ui.open()

/obj/structure/machinery/computer/hub_mission_console/ui_data(mob/user)
	return list(
		"current_mission" = GLOB.hub_campaign_state.current_hub_mission,
		"missions" = GLOB.hub_campaign_state.get_mission_options(user)
	)

/obj/structure/machinery/computer/hub_mission_console/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = ui.user
	if(action != "vote_mission" || !ishuman(user) || !user.Adjacent(src))
		return
	if(GLOB.hub_campaign_state.cast_mission_vote(user, params["mission_id"]))
		. = TRUE
		SStgui.update_uis(src)

/obj/structure/machinery/computer/hub_mission_console/attack_hand(mob/user)
	if(..())
		return
	tgui_interact(user)
	return TRUE

#undef GM_HUB_MAX_MISSIONS
