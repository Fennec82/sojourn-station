/obj/structure/reagent_dispensers
	name = "dispenser"
	desc = "..."
	icon = 'icons/obj/objects.dmi'
	icon_state = "watertank"
	density = TRUE
	anchored = FALSE
	reagent_flags = DRAINABLE | AMOUNT_VISIBLE
	var/volume = 1500
	var/starting_volume = 0
	var/starting_reagent = null
	var/amount_per_transfer_from_this = 10
	var/possible_transfer_amounts = list(10,25,50,100)
	var/contents_cost

/obj/structure/reagent_dispensers/attackby(obj/item/W as obj, mob/user as mob)
	if(W.is_refillable())
		return 0 //so we can refill them via their afterattack.
	else
		return ..()

/obj/structure/reagent_dispensers/New()
	create_reagents(volume)

	if (starting_reagent)
		//If a starting volume is not 0, use that for the volume amount
		if(starting_volume)
			reagents.add_reagent(starting_reagent, starting_volume)
		else
			reagents.add_reagent(starting_reagent, volume)

	if (!possible_transfer_amounts)
		src.verbs -= /obj/structure/reagent_dispensers/verb/set_APTFT
	..()

/obj/structure/reagent_dispensers/verb/set_APTFT() //set amount_per_transfer_from_this
	set name = "Set transfer amount"
	set category = "Object"
	set src in view(1)
	var/N = input("Amount per transfer from this:","[src]") as null|anything in possible_transfer_amounts
	if (N)
		amount_per_transfer_from_this = N

/obj/structure/reagent_dispensers/proc/explode()
	visible_message(SPAN_DANGER("\The [src] ruptures!"))
	chem_splash(loc, 5, list(reagents))
	qdel(src)

/obj/structure/reagent_dispensers/ex_act(severity)
	switch(severity)
		if(1)
			explode()
			return
		if(2)
			if (prob(50))
				explode()
				return
		if(3)
			if (prob(5))
				explode()
				return
/obj/structure/reagent_dispensers/get_item_cost(export)
	if(export)
		return ..() + round(reagents.total_volume * 0.125)
	return ..() + contents_cost

//Dispensers
/obj/structure/reagent_dispensers/watertank
	name = "water tank"
	desc = "A water tank. It is used to store high amounts of water."
	icon_state = "watertank"
	amount_per_transfer_from_this = 10
	volume = 1500
	starting_reagent = "water"
	price_tag = 25
	contents_cost = 150

/obj/structure/reagent_dispensers/watertank/derelict
	icon_state = "watertank-derelict"

/obj/structure/reagent_dispensers/watertank/huge
	name = "high-capacity water tank"
	desc = "A high-capacity water tank. It is used to store HUGE amounts of water."
	icon_state = "hvwatertank"
	volume = 3000
	price_tag = 50
	contents_cost = 300

/obj/structure/reagent_dispensers/watertank/huge/derelict
	icon_state = "hvwatertank-derelict"

/obj/structure/reagent_dispensers/fueltank
	name = "fuel tank"
	desc = "A tank full of industrial welding fuel. Do not consume."
	icon = 'icons/obj/objects.dmi'
	icon_state = "weldtank"
	amount_per_transfer_from_this = 10
	var/modded = 0
	var/obj/item/device/assembly_holder/rig = null
	volume = 500
	starting_reagent = "fuel"
	price_tag = 25
	contents_cost = 750

/obj/structure/reagent_dispensers/fueltank/derelict
	icon_state = "weldtank-derelict"

/obj/structure/reagent_dispensers/fueltank/huge
	name = "high-capacity fuel tank"
	desc = "A high-capacity tank full of industrial welding fuel. Do not consume."
	icon_state = "hvweldtank"
	volume = 1000
	price_tag = 50
	contents_cost = 1500

/obj/structure/reagent_dispensers/fueltank/huge/derelict
	icon_state = "hvweldtank-derelict"

/obj/structure/reagent_dispensers/fueltank/examine(mob/user)
	if(!..(user, 2))
		return
	if(modded)
		to_chat(user, SPAN_WARNING("Fuel faucet is wrenched open, leaking the fuel!"))
	if(rig)
		to_chat(user, SPAN_NOTICE("There is some kind of device rigged to the tank."))

/obj/structure/reagent_dispensers/fueltank/attack_hand()
	if (rig)
		usr.visible_message(SPAN_NOTICE("\The [usr] begins to detach [rig] from \the [src]."), SPAN_NOTICE("You begin to detach [rig] from \the [src]."))
		if(do_after(usr, 20, src))
			usr.visible_message(SPAN_NOTICE("\The [usr] detaches \the [rig] from \the [src]."), SPAN_NOTICE("You detach [rig] from \the [src]"))
			rig.loc = get_turf(usr)
			rig = null
			cut_overlays()

/obj/structure/reagent_dispensers/fueltank/attackby(obj/item/I, mob/user)
	src.add_fingerprint(user)
	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			user.visible_message("[user] wrenches [src]'s faucet [modded ? "closed" : "open"].", \
				"You wrench [src]'s faucet [modded ? "closed" : "open"]")
			modded = modded ? 0 : 1
			if (modded)
				message_admins("[key_name_admin(user)] opened fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]), leaking fuel. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[loc.x];Y=[loc.y];Z=[loc.z]'>JMP</a>)")
				log_game("[key_name(user)] opened fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]), leaking fuel.")
				leak_fuel(amount_per_transfer_from_this)
	if (istype(I,/obj/item/device/assembly_holder))
		if (rig)
			to_chat(user, SPAN_WARNING("There is another device in the way."))
			return ..()
		user.visible_message(SPAN_DANGER("\The [user] begins rigging [I] to \the [src]."), SPAN_WARNING("You begin rigging [I] to \the [src]"))
		if(do_after(user, 20, src))
			user.visible_message(SPAN_DANGER("\The [user] rigs [I] to \the [src]."), SPAN_WARNING("You rig [I] to \the [src].</span>"))

			var/obj/item/device/assembly_holder/H = I
			if (istype(H.left_assembly,/obj/item/device/assembly/igniter) || istype(H.right_assembly,/obj/item/device/assembly/igniter))
				message_admins("[key_name_admin(user)] rigged fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]) for explosion. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[loc.x];Y=[loc.y];Z=[loc.z]'>JMP</a>)")
				log_game("[key_name(user)] rigged fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]) for explosion.")

			rig = I
			user.drop_item()
			I.loc = src

			var/icon/test = getFlatIcon(I)
			test.Shift(NORTH,1)
			test.Shift(EAST,6)
			add_overlay(test)

	var/obj/item/tool/T = I
	if(istype(T) && T.use_fuel_cost)
		return 0

	return ..()


/obj/structure/reagent_dispensers/fueltank/bullet_act(var/obj/item/projectile/Proj)
	if(Proj.get_structure_damage())
		if (!(Proj.testing))
			if(istype(Proj.firer))
				message_admins("[key_name_admin(Proj.firer)] shot fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[loc.x];Y=[loc.y];Z=[loc.z]'>JMP</a>).")
				log_game("[key_name(Proj.firer)] shot fueltank at [loc.loc.name] ([loc.x],[loc.y],[loc.z]).")

			if(!istype(Proj ,/obj/item/projectile/plasma/lastertag) && !istype(Proj ,/obj/item/projectile/beam/practice) )
				explode()

/obj/structure/reagent_dispensers/fueltank/ex_act()
	explode()

/obj/structure/reagent_dispensers/fueltank/ignite_act()
	if(modded)
		explode()

/obj/structure/reagent_dispensers/fueltank/explode()
	if (reagents.total_volume > 500)
		explosion(src.loc,1,2,4)
	else if (reagents.total_volume > 100)
		explosion(src.loc,0,1,3)
	else if (reagents.total_volume > 50)
		explosion(src.loc,0,1,2)
	if(src)
		qdel(src)

/obj/structure/reagent_dispensers/fueltank/fire_act(datum/gas_mixture/air, temperature, volume)
	if (modded)
		explode()
	else if (temperature > T0C+500)
		explode()
	return ..()

/obj/structure/reagent_dispensers/fueltank/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	if ((. = ..()) && modded)
		leak_fuel(amount_per_transfer_from_this/10.0)

/obj/structure/reagent_dispensers/fueltank/proc/leak_fuel(amount)
	if (reagents.total_volume == 0)
		return

	amount = min(amount, reagents.total_volume)
	reagents.remove_reagent("fuel",amount)
	new /obj/effect/decal/cleanable/liquid_fuel(src.loc, amount,1)

/obj/structure/reagent_dispensers/peppertank
	name = "pepper spray refiller"
	desc = "Contains condensed capsaicin for use in law \"enforcement.\""
	icon_state = "peppertank"
	anchored = 1
	density = 0
	amount_per_transfer_from_this = 45
	volume = 1000
	starting_reagent = "condensedcapsaicin"

/obj/structure/reagent_dispensers/ammonia
	name = "ammonia dispenser"
	desc = "Contains ammonia meant to clean things and mix to make spacecleaner."
	icon_state = "ammoniatank"
	anchored = 1
	density = 0
	amount_per_transfer_from_this = 10
	volume = 1000
	starting_reagent = "cleaner"
	possible_transfer_amounts = list(1,5,10,25,50,100)

/obj/structure/reagent_dispensers/water_cooler
	name = "water cooler"
	desc = "A machine that dispenses water to drink."
	amount_per_transfer_from_this = 5
	icon = 'icons/obj/vending.dmi'
	icon_state = "water_cooler"
	possible_transfer_amounts = null
	anchored = 1
	volume = 500
	starting_reagent = "water"
	var/cups = 20
	var/cup_type = /obj/item/reagent_containers/drinks/sillycup
	sanity_damage = 0.1 //Talk around these RP!

/obj/structure/reagent_dispensers/water_cooler/attack_hand(var/mob/user)
	if(cups > 0)
		var/visible_messages = DispenserMessages(user)
		visible_message(visible_messages[1], visible_messages[2])
		var/cup = new cup_type(loc)
		user.put_in_active_hand(cup)
		cups--
	else
		to_chat(user, RejectionMessage(user))

/obj/structure/reagent_dispensers/water_cooler/proc/DispenserMessages(var/mob/user)
	return list("\The [user] grabs a paper cup from \the [src].", "You grab a paper cup from \the [src]'s cup compartment.")

/obj/structure/reagent_dispensers/water_cooler/proc/RejectionMessage(var/mob/user)
	return "\The [src]'s cup dispenser is empty."

/obj/structure/reagent_dispensers/water_cooler/attackby(obj/item/I, mob/user)
	if(QUALITY_BOLT_TURNING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			src.add_fingerprint(user)
			if(anchored)
				user.visible_message("\The [user] begins unsecuring \the [src] from the floor.", "You start unsecuring \the [src] from the floor.")
			else
				user.visible_message("\The [user] begins securing \the [src] to the floor.", "You start securing \the [src] to the floor.")

			if(do_after(user, 20, src))
				if(!src) return
				to_chat(user, SPAN_NOTICE("You [anchored? "un" : ""]secured \the [src]!"))
				anchored = !anchored
			return
	else
		return ..()

/obj/structure/reagent_dispensers/beerkeg
	name = "beer keg"
	desc = "A beer keg"
	icon_state = "beer_keg" //Sprite by greenteaguzzler
	amount_per_transfer_from_this = 10
	volume = 1000
	starting_reagent = "beer"
	price_tag = 25
	contents_cost = 700

/obj/structure/reagent_dispensers/meadkeg
	name = "mead keg"
	desc = "A keg of honey and beer"
	icon_state = "barrel"
	amount_per_transfer_from_this = 10
	volume = 1000
	starting_reagent = "mead"
	price_tag = 25
	contents_cost = 1200

/obj/structure/reagent_dispensers/cahorsbarrel
	name = "Absolutism Cahors barrel"
	desc = "Barrel a day - keeps liver away."
	icon_state = "barrel_alt"
	volume = 1000
	starting_reagent = "ntcahors"
	price_tag = 25
	contents_cost = 950

/obj/structure/reagent_dispensers/acid
	name = "sulphuric acid dispenser"
	desc = "A dispenser of acid for industrial processes."
	icon_state = "acidtank"
	amount_per_transfer_from_this = 10
	anchored = 1
	density = 0
	volume = 1000
	starting_reagent = "sacid"

/obj/structure/reagent_dispensers/premiumwhiskey
	name = "Special Blend Whiskey Barrel"
	desc = "A barrel full of Special Blend whiskey, the finest whiskey this side of the galaxy, and every other side as well."
	icon_state = "premiumwhiskey"
	amount_per_transfer_from_this = 10
	volume = 1000 //Limited, rare stock! But still should be plenty to go around for everyone
	starting_reagent = "specialwhiskey"
	price_tag = 30
	contents_cost = 1000 // This keg's not meant to be ordered through cargo, you start every shift with it and that's it! Big profits though...

