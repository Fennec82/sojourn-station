/obj/item/pc_part/scanner/price
	name = "export scanner module"
	desc = "A module used to check objects against commercial database. Uses NTNet to connect to database."

/obj/item/pc_part/scanner/price/can_use_scanner(user, atom/movable/target, proximity)
	if(!istype(target))
		return 0
	return ..()

/obj/item/pc_part/scanner/price/do_on_afterattack(mob/user, atom/movable/target, proximity)
	if(!can_use_scanner(user, target, proximity))
		return
	if (!scan_power_use())
		return

	var/dat = price_scan_results(target)
	if(dat && driver && driver.using_scanner)
		if(!driver.data_buffer)
			driver.data_buffer = dat
		else
			driver.data_buffer += "<br>[dat]"
		if(!SSnano.update_uis(driver.NM))
			holder2.run_program(driver.filename)
			driver.NM?.nano_ui_interact(user)
