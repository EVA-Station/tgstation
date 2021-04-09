/datum/loadout_item/suit
	category = LOADOUT_CATEGORY_SUIT

//MISC
/datum/loadout_item/suit/poncho
	name = "Poncho"
	path = /obj/item/clothing/suit/poncho

/datum/loadout_item/suit/ponchogreen
	name = "Green poncho"
	path = /obj/item/clothing/suit/poncho/green

/datum/loadout_item/suit/ponchored
	name = "Red poncho"
	path = /obj/item/clothing/suit/poncho/red

/datum/loadout_item/suit/ianshirt
	name = "Ian Shirt"
	path = /obj/item/clothing/suit/ianshirt

//COATS
/datum/loadout_item/suit/coat
	subcategory = LOADOUT_SUBCATEGORY_SUIT_COATS

/datum/loadout_item/suit/coat/normal
	name = "Winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat

//JACKETS
/datum/loadout_item/suit/jacket
	subcategory = LOADOUT_SUBCATEGORY_SUIT_JACKETS

/datum/loadout_item/suit/jacket/yakuzajacket
	name = "Asian Jacket"
	path = /obj/item/clothing/suit/yakuza

/datum/loadout_item/suit/jacket/suitblue
	name = "Blue Suit Jacket"
	path = /obj/item/clothing/suit/toggle/lawyer

/datum/loadout_item/suit/jacket/suitpurple
	name = "Purple Suit Jacket"
	path = /obj/item/clothing/suit/toggle/lawyer/purple

/datum/loadout_item/suit/jacket/suitblack
	name = "Black Suit Jacket"
	path = /obj/item/clothing/suit/toggle/lawyer/black

/datum/loadout_item/suit/jacket/jacketbomber
	name = "Bomber jacket"
	path = /obj/item/clothing/suit/jacket

/datum/loadout_item/suit/jacket/jacketleather
	name = "Leather jacket"
	path = /obj/item/clothing/suit/jacket/leather

/datum/loadout_item/suit/jacket/overcoatleather
	name = "Leather overcoat"
	path = /obj/item/clothing/suit/jacket/leather/overcoat

/datum/loadout_item/suit/jacket/jacketpuffer
	name = "Puffer jacket"
	path = /obj/item/clothing/suit/jacket/puffer

/datum/loadout_item/suit/jacket/vestpuffer
	name = "Puffer vest"
	path = /obj/item/clothing/suit/jacket/puffer/vest

/datum/loadout_item/suit/jacket/jacketlettermanbrown
	name = "Brown letterman jacket"
	path = /obj/item/clothing/suit/jacket/letterman

/datum/loadout_item/suit/jacket/jacketlettermanred
	name = "Red letterman jacket"
	path = /obj/item/clothing/suit/jacket/letterman_red

/datum/loadout_item/suit/jacket/jacketlettermanNT
	name = "Nanotrasen letterman jacket"
	path = /obj/item/clothing/suit/jacket/letterman_nanotrasen

/datum/loadout_item/suit/jacket/militaryjacket
	name = "Military Jacket"
	path = /obj/item/clothing/suit/jacket/miljacket

//HOODIES
/datum/loadout_item/suit/hoodie
	subcategory = LOADOUT_SUBCATEGORY_SUIT_HOODIES

//JOB RELATED
/datum/loadout_item/suit/job
	subcategory = LOADOUT_SUBCATEGORY_JOB

/datum/loadout_item/suit/job/coat_med
	name = "Medical winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/medical
	restricted_roles = list("Chief Medical Officer", "Medical Doctor") // Reserve it to Medical Doctors and their boss, the Chief Medical Officer

/datum/loadout_item/suit/job/coat_sci
	name = "Science winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/science
	restricted_roles = list("Research Director", "Scientist", "Roboticist") // Reserve it to the Science Departement

/datum/loadout_item/suit/job/coat_eng
	name = "Engineering winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/engineering
	restricted_roles = list("Chief Engineer", "Station Engineer") // Reserve it to Station Engineers and their boss, the Chief Engineer

/datum/loadout_item/suit/job/coat_atmos
	name = "Atmospherics winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/engineering/atmos
	restricted_roles = list("Chief Engineer", "Atmospheric Technician") // Reserve it to Atmos Techs and their boss, the Chief Engineer

/datum/loadout_item/suit/job/coat_hydro
	name = "Hydroponics winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/hydro
	restricted_roles = list("Head of Personnel", "Botanist") // Reserve it to Botanists and their boss, the Head of Personnel

/datum/loadout_item/suit/job/coat_cargo
	name = "Cargo winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/cargo
	restricted_roles = list("Quartermaster", "Cargo Technician") // Reserve it to Cargo Techs and their boss, the Quartermaster

/datum/loadout_item/suit/job/coat_miner
	name = "Mining winter coat"
	path = /obj/item/clothing/suit/hooded/wintercoat/miner
	restricted_roles = list("Quartermaster", "Shaft Miner") // Reserve it to Miners and their boss, the Quartermaster
