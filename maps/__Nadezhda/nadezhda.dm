#include "area/_Nadezhda_areas.dm"
#include "data/_Nadezhda_factions.dm"
#include "data/_Nadezhda_Turbolifts.dm"
#include "data/shuttles-nadezhda.dm"
#include "data/overmap-eris.dm"
#include "data/shuttles-eris.dm"
#include "data/reports.dm"

#include "unused\_Nadezhda_Colony_Omni_STU.dmm" //ChaosStation Change: This map has some stuff we like that the new map doesn't, so we're keeping it around. We're also hosting it on production assuming everything goes well. -Arrhythmia_V
#include "map/_Nadezhda_Solar_Area.dmm"

/obj/map_data/eris
	name = "Eris"
	is_sealed = TRUE
	height = 1

/obj/map_data/nadezda //Omni level has all three surface underground and stairs
	name = "Nadezhda Omni Map"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 3
	digsites = "HOUSE"

/obj/map_data/nadezda_s
	name = "Nadezhda Surface"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 1

/obj/map_data/nadezda_u
	name = "Nadezhda Underground"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/nadezda_e
	name = "Nadezhda Elevator and Stairs"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/admin
	name = "Admin Level"
	is_admin_level = TRUE
	is_accessable_level = FALSE
	height = 1

/obj/map_data/nadezda_solars
	name = "Nadezhda Mountain Solars"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 1

/obj/map_data/nadezda_labor
	name = "Nadezhda Labor Camp"
	is_station_level = TRUE
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = FALSE
	is_sealed = TRUE
	generate_asteroid = TRUE
	height = 1

/obj/map_data/hunting_lodge
	name = "Hunting Lodge"
	is_station_level = FALSE
	is_player_level = TRUE
	is_contact_level = FALSE
	is_accessable_level = FALSE
	is_sealed = TRUE
	height = 2
