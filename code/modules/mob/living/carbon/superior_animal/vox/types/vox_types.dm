/mob/living/carbon/superior/vox/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has a crudely fitted riot helmet on"
	icon_state = "vox_marsmud_helm"

	maxHealth = 125 * VOXBIRD_HEALTH_MOD
	health = 125 * VOXBIRD_HEALTH_MOD

	armor = list(melee = 15, bullet = 3, energy = 3, bomb = 20, bio = 20, rad = 0)

	//Simulate the helmet falling apart
	drop_items = list(/obj/item/stack/material/plastic/random)


//Silver Bird
/mob/living/carbon/superior/vox/posin_thrower
	name = "Arginto Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has spears coated in something..."
	icon_state = "vox_silversynth"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear/toxic
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 1
	mag_type = /obj/item/stack/ore
	mags_left = 3
	rounds_per_fire = 1
	reload_message = "picks up a hidden spear!"
	fire_verb = "flings a makeshift spear"

/mob/living/carbon/superior/vox/posin_thrower/trained
	name = "Arginto Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one wares a mask and has a odd shimer on their claws"
	icon_state = "vox_silversynth_masked"

	//Just faster throwing and better melee
	delay_for_range = 0.3 //Fast throwers

	poison_per_bite = 2
	poison_type = "amatoxin"
	mob_ablative_armor = 12

	armor = list(melee = 6, bullet = 8, energy = 0, bomb = 20, bio = 20, rad = 0)

	maxHealth = 95 * VOXBIRD_HEALTH_MOD
	health = 95 * VOXBIRD_HEALTH_MOD


//Coal Bird
/mob/living/carbon/superior/vox/thrower_spear
	name = "Kovlo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one throws spears with deadly speed!"
	icon_state = "vox_abyssal"

	melee_damage_lower = 12
	melee_damage_upper = 16

	projectiletype = /obj/item/projectile/bullet/spear
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 2
	mag_type = /obj/item/stack/ore
	mags_left = 2
	rounds_per_fire = 2
	reload_message = "picks up a hidden spear!"
	fire_verb = "flings a makeshift spear"


/mob/living/carbon/superior/vox/thrower_spear/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one throws spears with deadly speed, holding a bag in hand this one hands out rocks to other Ciriklo's"
	icon_state = "vox_abyssal_backpack"

	//See vox/ai.dm for fancy affects

	delay_for_range = 0.1 //Fast throwers
	mob_ablative_armor = 12

	armor = list(melee = 6, bullet = 8, energy = 0, bomb = 20, bio = 20, rad = 0)

	maxHealth = 95 * VOXBIRD_HEALTH_MOD
	health = 95 * VOXBIRD_HEALTH_MOD

	drop_items = list(/obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/ore, /obj/item/stack/material/silk)

//Solar Bird
/mob/living/carbon/superior/vox/armord
	name = "Solarno Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one's chest looks rather tougher than the rest of them."
	icon_state = "vox_solar"

	melee_damage_lower = 18
	melee_damage_upper = 20

	reload_message = "picks up a rock!"

	armor = list(melee = 8, bullet = 5, energy = 0, bomb = 50, bio = 0, rad = 0)

	ranged = FALSE
	armor_divisor = 1.25

/mob/living/carbon/superior/vox/armord/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one's chest looks rather tougher than the rest of them as well as holds a shield."
	icon_state = "vox_solar_shield"


	armor = list(melee = 12, bullet = 9, energy = 9, bomb = 50, bio = 0, rad = 0)

	ranged = FALSE
	armor_divisor = 1.25

	maxHealth = 135 * VOXBIRD_HEALTH_MOD
	health = 135 * VOXBIRD_HEALTH_MOD


	mob_ablative_armor = 70

	armor_divisor = 1.5


	drop_items = list(/obj/item/shield/buckler/handmade/damaged)


//Hidden Bird
/mob/living/carbon/superior/vox/hider
	name = "Garavdo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is harder to see as it stalks low to the ground, hiding in bushes or other shadows."
	icon_state = "vox_ultraviolet"

	melee_damage_lower = 16
	melee_damage_upper = 22
	alpha = 50

	knock_over_odds = 15

	reload_message = "picks up a rock!"

	maxHealth = 35 * VOXBIRD_HEALTH_MOD //Glass cannon
	health = 35 * VOXBIRD_HEALTH_MOD

/mob/living/carbon/superior/vox/hider/UnarmedAttack()
	. = ..()
	alpha = 255

/mob/living/carbon/superior/vox/hider/findTarget()
	. = ..()
	alpha = 50

/mob/living/carbon/superior/vox/hider/death()
	. = ..()
	alpha = 255

/mob/living/carbon/superior/vox/hider/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is harder to see as it stalks low to the ground, hiding in bushes or other shadows waiting to pounce with hands covered in muck and dirt."
	icon_state = "vox_ultraviolet_belted"

	knock_over_odds = 50

	melee_damage_lower = 20
	melee_damage_upper = 22

	maxHealth = 65 * VOXBIRD_HEALTH_MOD //Glass cannon
	health = 65 * VOXBIRD_HEALTH_MOD

	mob_ablative_armor = 15

	ranged = FALSE

	armor_divisor = 2


	drop_items = list(/obj/item/stack/ore/glass, /obj/item/stack/ore/glass, /obj/item/stack/ore/glass, /obj/item/stack/ore/glass)

	//No better armor its just a belt

//Feathery Bird
/mob/living/carbon/superior/vox/ashen
	name = "Ciriklo Pherdo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. It looks rather strong."
	icon_state = "vox_pitchblack"

	turns_per_move = 7
	see_in_dark = 20

	melee_damage_lower = 24
	melee_damage_upper = 28

	knock_over_odds = 35

	reload_message = "picks up a rock!"

	maxHealth = 90 * VOXBIRD_HEALTH_MOD
	health = 90 * VOXBIRD_HEALTH_MOD
	armor_divisor = 1.25


/mob/living/carbon/superior/vox/ashen/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. \
	This one seems to be using a crude spear rather then its exstreamly sharp claws as well as a blood lust aura radiating off it..."

	icon_state = "vox_pitchblack_spear"

	melee_damage_lower = 18
	melee_damage_upper = 22

	knock_over_odds = 5

	reload_message = "picks up a rock!"

	maxHealth = 120 * VOXBIRD_HEALTH_MOD
	health = 120 * VOXBIRD_HEALTH_MOD
	armor_divisor = 3

	ranged = FALSE
	target_dummy = TRUE //Target me

	armor = list(melee = 9, bullet = 9, energy = 5, bomb = 50, bio = 0, rad = 0)

	delay_for_all = 0.2

	attacktext = "rapidly stabs and jabs"

	drop_items = list(/obj/item/tool/spear)


//Weak Bird
/mob/living/carbon/superior/vox/weak
	name = "Slabo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one is young but still deadly."
	icon_state = "vox_acid"

	melee_damage_lower = 12
	melee_damage_upper = 15

	reload_message = "picks up a rock!"

	knock_over_odds = 15

	maxHealth = 35 * VOXBIRD_HEALTH_MOD
	health = 35 * VOXBIRD_HEALTH_MOD

/mob/living/carbon/superior/vox/weak/trained
	name = "Slabo Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one waring a modifed vest and is young but still deadly."
	icon_state = "vox_acid_armored"

	melee_damage_lower = 17
	melee_damage_upper = 19

	reload_message = "picks up a rock!"

	knock_over_odds = 25

	maxHealth = 65 * VOXBIRD_HEALTH_MOD
	health = 65 * VOXBIRD_HEALTH_MOD

	armor = list(melee = 15, bullet = 12, energy = 12, bomb = 50, bio = 0, rad = 0)


//Rage Bird
/mob/living/carbon/superior/vox/rage
	name = "Xoli Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. Their long arms pack a stronger than normal punch."
	icon_state = "vox_infrared"

	reload_message = "picks up a rock!"

	melee_damage_lower = 32
	melee_damage_upper = 35

	knock_over_odds = 25
	armor_divisor = 1.25

/mob/living/carbon/superior/vox/rage/trained
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. Their long arms hold a firstaid kit and pack a stronger than normal punch."
	icon_state = "vox_infrared_medical"

	armor = list(melee = 8, bullet = 8, energy = 5, bomb = 50, bio = 0, rad = 0)

	drop_items = list(/obj/item/storage/firstaid/regular/empty, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost, /obj/random/medical_lowcost)
	var/healing_kit = 50

/mob/living/carbon/superior/vox/rage/trained/updatehealth()
	..()
	if(healing_kit < 0)
		return

	//Heal thyself.
	if(stat == CONSCIOUS && health != maxHealth)
		if(bruteloss)
			adjustBruteLoss(-3)
			healing_kit -= 3
		if(fireloss)
			adjustFireLoss(-3)
			healing_kit -= 3

		var/image/I
		I = image(icon ='icons/mob/battle_overlays.dmi', icon_state = "healed")
		add_overlay(I)

		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), I), 40)

	for(var/mob/living/carbon/superior/vox/V in oview(3, src))
		if(V.stat == CONSCIOUS && V.health != V.maxHealth)
			var/image/I
			I = image(icon ='icons/mob/battle_overlays.dmi', icon_state = "healed")
			V.add_overlay(I)
			addtimer(CALLBACK(V, TYPE_PROC_REF(/atom, cut_overlay), I), 40)

			if(V.bruteloss)
				V.adjustBruteLoss(-3)
				healing_kit -= 3
			if(V.fireloss)
				V.adjustFireLoss(-3)
				healing_kit -= 3

//Looking Bird
/mob/living/carbon/superior/vox/scout
	name = "Dikhindoj Ciriklo"
	desc = "A small predator native to these lands. They are known for their limited craftsmanship and manipulation of objects. This one has pure white feathers and seems untouched by filth and muck."
	icon_state = "grayscale" //Temp sprite

	melee_damage_lower = 23
	melee_damage_upper = 20

	attacktext = "slashes"

	knock_over_odds = 30

	armor = list(melee = 10, bullet = 8, energy = 2, bomb = 60, bio = 0, rad = 0)
	ranged = FALSE

	can_burrow = TRUE
	var/timeout = 0
	research_value = 1500

/mob/living/carbon/superior/vox/scout/pointed(atom/A as mob|obj|turf in view())
	set name = "Point To"
	set category = "Object"

	if(istype(A, /obj/effect/decal/point))
		return FALSE

	DEFAULT_QUEUE_OR_CALL_VERB(VERB_CALLBACK(src, PROC_REF(_pointed), A))

	usr.visible_message("<b>[src]</b> points to [A]")
	if(timeout >= world.time)
		return

	//Small cooldown to prevent lag
	timeout = world.time + 5 SECONDS

	if(isliving(A))
		for(var/mob/living/carbon/superior/vox/V in oview(6, src))
			V.loseTarget(TRUE,TRUE)
			V.react_to_attack(A,src,A)
	if(ishuman(A))
		var/mob/living/carbon/superior/H = A
		H.stats.addPerk(PERK_ARMOR_REDUCTION)

   //Ciriklo Pig Jockey
/mob/living/carbon/superior/vox/pigjockey
	name = "Rider Ciriklo"
	desc = "The venerable evolution of a tengolo charger, morphed into a violent and destructive beast that is being ridden by a Ciriklo.  Tight ropes bound around the the hell pig maw as the Ciriklo twists the beast's violent charge."
	icon = 'icons/mob/mobs-voxy64.dmi'
	icon_state = "vox_pigjockey"
	var/has_made_jockey = FALSE

	maxHealth = 750 * VOXBIRD_HEALTH_MOD // Hellpig stats
	health = 750 * VOXBIRD_HEALTH_MOD

	turns_per_move = 4
	move_to_delay = 4
	stop_automated_movement_when_pulled = 1

	speak_emote = list("emits a challenging roar!", "stomps the ground angrily.")
	emote_see = list("points at a target.")

	meat_type = /obj/item/reagent_containers/snacks/meat/pork
	meat_amount = 8
	leather_amount = 20
	bones_amount = 10
	mob_size = MOB_LARGE
	deathmessage = "slumps down and seems to no longer move as the Ciriklo on their back jumps off!"

	melee_damage_lower = 33
	melee_damage_upper = 30

	melee_sharp = FALSE
	attacktext = "rammed"
	attack_sound = 'sound/xenomorph/alien_bite2.ogg'

	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	knock_over_odds = 40

	armor = list(melee = 8, bullet = 6, energy = 10, bomb = 5, bio = 10, agony = 10, rad = 25)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_CLUMSY, MUTATION_BLINDNESS, MUTATION_NO_PAIN, MUTATION_HYPERION, MUTATION_BLOOD_BANK)

	ranged = FALSE

/mob/living/carbon/superior/vox/pigjockey/death(var/gibbed,var/message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		if(!has_made_jockey)
			name = "trained hell pig"
			desc = "The venerable evolution of a tengolo charger, morphed into a violent and destructive beast that has been strangley tamed by the Ciriklo as a crude rope harness has been tied over their head"
			new /mob/living/carbon/superior/vox(src.loc)
			has_made_jockey = TRUE

	. = ..()

/mob/living/carbon/superior/vox/wheelchair_gunner
	name = "Gunner Ciriklo"
	desc = "A cheaply mass-printed wheelchair, crudely modified with a 'Bastard' SMG bolted to the frame on a swivel mount, brutally traps the Ciriklo gunner in a cage of twisted metal. An armored Ciriklo awkwardly shoves it from behind, barely managing to grip the handles."
	icon = 'icons/mob/mobs-voxy64.dmi'
	icon_state = "vox_wheelchairgunner_nopassenger"  // We have nopassenger as default since the game tick updates to this base icon, and having it initialized with passenger first works
	icon_living = "vox_wheelchairgunner" //default living as wheelchairgunner, switches to no passenger once knock off happens
	var/support_gunner = TRUE

	maxHealth = 50 * VOXBIRD_HEALTH_MOD
	health = 50 * VOXBIRD_HEALTH_MOD

	faction = "vox_tribe" //In case of different tribes
	turns_per_move = 4
	speak_emote = list("grumbles")
	emote_see = list("looks around for a target.")
	meat_type = /obj/item/reagent_containers/snacks/meat/chicken/vox
	mob_size = MOB_MEDIUM
	deathmessage = "falls apart as the gunner inside slumps down and seems to no longer move!"
	attack_sound = 'sound/weapons/slash.ogg'

	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	armor = list(melee = 15, bullet = 30, energy = 0, bomb = 30, bio = 20, rad = 0) // lightly armored cage, helps endurance and prevents death from friendly-fire

	get_stat_modifier = TRUE

	armor_divisor = 1.25
	fancy_attack_overlay = "claw_attack_flick" // replace with ram fancy_attack when possible
	fancy_attack_shading = "#FFFFFF"

	fire_verb = "fires from the wheelchair-mounted 'Bastard' SMG"

	melee_damage_lower = 6
	melee_damage_upper = 8
	colony_friend = FALSE
	friendly_to_colony = FALSE

	rapid = TRUE
	projectiletype = /obj/item/projectile/bullet/light_rifle_257
	projectilesound = 'sound/weapons/guns/fire/sfrifle_fire.ogg'
	rapid_fire_shooting_amount = 5
	delay_for_rapid_range = 0.15 SECONDS
	mag_type = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty
	casingtype = /obj/item/ammo_casing/light_rifle_257/spent
	limited_ammo = TRUE
	mag_drop = TRUE
	rounds_left = 100 // Stats taken from Bastard SMG
	mags_left = 3
	reload_message = "scrambles to reload the wheelchair-mounted gun with the ammo box!"
	range_telegraph = "lines up a shot on the wheelchair-mounted gun, orienting it towards"

/mob/living/carbon/superior/vox/wheelchair_gunner/Initialize()
	. = ..()
	icon_state = "vox_wheelchairgunner"

/mob/living/carbon/superior/vox/wheelchair_gunner/death(var/gibbed,var/message = deathmessage) //if killed before support gunner is knocked off, create vox mob
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		if(support_gunner)
			new /mob/living/carbon/superior/vox/armord(src.loc)
			support_gunner = FALSE

	. = ..()

/mob/living/carbon/superior/vox/wheelchair_gunner/handle_ammo_check() // Everyshot will have 10% chance to knock off Support Gunner
	..()
	if(ranged)
		if(support_gunner && prob(10))
			playsound(loc, 'sound/weapons/punch1.ogg', 70)
			visible_message(SPAN_WARNING("The armored Ciriklo behind the wheelchair goes flying from the recoil of the cannon!"))
			knock_off_support_gunner()

/mob/living/carbon/superior/vox/wheelchair_gunner/proc/knock_off_support_gunner()
	if(!support_gunner) return

	desc = "A cheaply mass-printed wheelchair, crudely modified with a 'Bastard' SMG bolted to the frame on a swivel mount, brutally traps the Ciriklo gunner in a cage of twisted metal."
	icon_state = "vox_wheelchairgunner_nopassenger"
	icon_living = "vox_wheelchairgunner_nopassenger"
	update_icon()

	// Spawn and throw the gunner
	var/mob/living/carbon/superior/vox/armord/thrown_gunner = new /mob/living/carbon/superior/vox/armord(src.loc)
	var/throwdir = pick(NORTH, SOUTH, EAST, WEST)
	var/turf/target_turf = get_edge_target_turf(thrown_gunner, throwdir)
	thrown_gunner.throw_at(target_turf, rand(3,6), 30)

	move_to_delay = 999999999  // only way we can turn them 'static', they still move but at a fraction of a crawl
	support_gunner = FALSE

/mob/living/carbon/superior/vox/wheelchair_cannon
	name = "Cannon Ciriklo"
	desc = "A cheaply mass-printed wheelchair, crudely modified with a makeshift 'China Lake' grenade launcher bolted to the frame on a swivel mount, brutally traps the Ciriklo gunner in a cage of twisted metal. An armored Ciriklo awkwardly shoves it from behind, barely managing to grip the handles."
	icon = 'icons/mob/mobs-voxy64.dmi'
	icon_state = "vox_wheelchaircannon_nopassenger"
	icon_living = "vox_wheelchaircannon"
	var/support_cannon = TRUE

	maxHealth = 50 * VOXBIRD_HEALTH_MOD
	health = 50 * VOXBIRD_HEALTH_MOD

	faction = "vox_tribe" //In case of different tribes
	turns_per_move = 4
	speak_emote = list("grumbles")
	emote_see = list("looks around for a target.")
	meat_type = /obj/item/reagent_containers/snacks/meat/chicken/vox
	mob_size = MOB_MEDIUM
	deathmessage = "falls apart as the gunner inside slumps down and seems to no longer move!"
	attack_sound = 'sound/weapons/slash.ogg'

	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/wolf_tooth)

	armor = list(melee = 15, bullet = 30, energy = 0, bomb = 30, bio = 20, rad = 0) // lightly armored cage, helps endurance and prevents death from friendly-fire

	get_stat_modifier = TRUE

	armor_divisor = 1.25
	fancy_attack_overlay = "claw_attack_flick"
	fancy_attack_shading = "#FFFFFF"

	fire_verb = "lobs an explosive shell from the wheelchair-mounted grenade launcher"

	melee_damage_lower = 6
	melee_damage_upper = 8

	colony_friend = FALSE
	friendly_to_colony = FALSE

	projectiletype = /obj/item/projectile/bullet/grenade/frag  // fire frag grenade
	projectilesound = 'sound/weapons/guns/fire/GLfire.ogg'
	limited_ammo = TRUE
	mag_drop = FALSE
	rounds_left = 1
	mags_left = 6
	reload_message = "scrambles to reload another frag shell into the wheelchair-mounted grenade launcher!"
	range_telegraph = "lines up a shot on the wheelchair-mounted grenade launcher, orienting it towards"

/mob/living/carbon/superior/vox/wheelchair_cannon/Initialize()
	. = ..()
	icon_state = "vox_wheelchaircannon"

/mob/living/carbon/superior/vox/wheelchair_cannon/death(var/gibbed,var/message = deathmessage) //if killed before support cannon is knocked off, create vox mob
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		if(support_cannon)
			new /mob/living/carbon/superior/vox/armord(src.loc)
			support_cannon = FALSE

	. = ..()

/mob/living/carbon/superior/vox/wheelchair_cannon/handle_ammo_check() // Everyshot will have 40% chance to knock off Support Gunner behind them
	..()
	if(ranged)
		if(support_cannon && prob(40))
			playsound(loc, 'sound/weapons/punch2.ogg', 70)
			visible_message(SPAN_WARNING("The armored Ciriklo behind the wheelchair goes flying from the recoil of the cannon!"))
			knock_off_support_cannon()

/mob/living/carbon/superior/vox/wheelchair_cannon/proc/knock_off_support_cannon()
	if(!support_cannon) return

	desc = "A cheap wheelchair crudely modified with a makeshift 'China Lake' grenade launcher bolted to the frame of a swivel mount, brutally trapping the Ciriklo gunner in a cage of twisted metal."
	icon_state = "vox_wheelchaircannon_nopassenger"
	icon_living = "vox_wheelchaircannon_nopassenger"
	update_icon()

	var/mob/living/carbon/superior/vox/armord/thrown_cannon = new /mob/living/carbon/superior/vox/armord(src.loc)
	var/throwdir = pick(NORTH, SOUTH, EAST, WEST)
	var/turf/target_turf = get_edge_target_turf(thrown_cannon, throwdir)
	thrown_cannon.throw_at(target_turf, rand(3,6), 30)

	move_to_delay = 999999999
	support_cannon = FALSE
