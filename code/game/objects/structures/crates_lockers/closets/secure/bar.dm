/obj/structure/closet/secure_closet/bar
	name = "booze closet"
	req_access = list(access_bar)
	icon_state = "cabinet"
	icon_lock = "cabinet"


/obj/structure/closet/secure_closet/bar/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
	new /obj/item/reagent_containers/drinks/bottle/small/beer(src)
