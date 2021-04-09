/datum/loadout_item/head
	category = LOADOUT_CATEGORY_HEAD

//MISC
/datum/loadout_item/head/baseball
	name = "Ballcap"
	path = /obj/item/clothing/head/soft/mime
	extra_info = LOADOUT_INFO_ONE_COLOR

/datum/loadout_item/head/beanie
	name = "Beanie"
	path = /obj/item/clothing/head/beanie
	extra_info = LOADOUT_INFO_ONE_COLOR

/datum/loadout_item/head/beret
	name = "Black beret"
	path = /obj/item/clothing/head/beret/black

/datum/loadout_item/head/flatcap
	name = "Flat cap"
	path = /obj/item/clothing/head/flatcap

/datum/loadout_item/head/pirate
	name = "Pirate hat"
	path = /obj/item/clothing/head/pirate

/datum/loadout_item/head/rice_hat
	name = "Rice hat"
	path = /obj/item/clothing/head/rice_hat

/datum/loadout_item/head/ushanka
	name = "Ushanka"
	path = /obj/item/clothing/head/ushanka

/datum/loadout_item/head/slime
	name = "Slime hat"
	path = /obj/item/clothing/head/collectable/slime

/datum/loadout_item/head/fedora
	name = "Fedora"
	path = /obj/item/clothing/head/fedora

/datum/loadout_item/head/that
	name = "Top Hat"
	path = /obj/item/clothing/head/that

/datum/loadout_item/head/bunnyears
	name = "Bunny Ears"
	path = /obj/item/clothing/head/rabbitears

/datum/loadout_item/head/mailmanhat
	name = "Mailman's Hat"
	path = /obj/item/clothing/head/mailman

/datum/loadout_item/head/cardboard
	name = "Cardboard Helmet"
	path = /obj/item/clothing/head/cardborg
	cost = 2

/datum/loadout_item/head/wig
	name = "Wig"
	path = /obj/item/clothing/head/wig
	extra_info = LOADOUT_INFO_ONE_COLOR

/datum/loadout_item/head/wignatural
	name = "Natural Wig"
	path = /obj/item/clothing/head/wig/natural

/*Commenting out Until next Christmas or made automatic
/datum/gear/santahatr
	name = "Red Santa Hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/christmashat
/datum/gear/santahatg
	name = "Green Santa Hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/christmashatg
*/

//JOB
/datum/loadout_item/head/job
	subcategory = LOADOUT_SUBCATEGORY_JOB

/datum/loadout_item/head/job/navybluehosberet
	name = "Head of security's navyblue beret"
	path = /obj/item/clothing/head/beret/sec/navyhos
	restricted_roles = list("Head of Security")

/datum/loadout_item/head/job/navyblueofficerberet
	name = "Security officer's Navyblue beret"
	path = /obj/item/clothing/head/beret/sec/navyofficer
	restricted_roles = list("Security Officer")

/datum/loadout_item/head/job/navybluewardenberet
	name = "Warden's navyblue beret"
	path = /obj/item/clothing/head/beret/sec/navywarden
	restricted_roles = list("Warden")

/datum/loadout_item/head/job/nursehat
	name = "Nurse Hat"
	path = /obj/item/clothing/head/nursehat
	restricted_roles = list("Medical Doctor", "Chief Medical Officer", "Geneticist", "Chemist", "Virologist")
	restricted_desc = "Medical"
