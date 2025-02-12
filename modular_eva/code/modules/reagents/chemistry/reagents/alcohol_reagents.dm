// Modular Booze REAGENTS, see the following file for the mixes: modular_skyrat\modules\customization\modules\food_and_drinks\recipes\drinks_recipes.dm

/datum/reagent/consumable/ethanol/whiskey
	process_flags = REAGENT_ORGANIC | REAGENT_SYNTHETIC //let's not force the detective to change his alcohol brand

// ROBOT ALCOHOL PAST THIS POINT
// WOOO!

/datum/reagent/consumable/ethanol/synthanol
	name = "Synthanol"
	description = "A runny liquid with conductive capacities. Its effects on synthetics are similar to those of alcohol on organics."
	color = "#1BB1FF"
	process_flags = REAGENT_ORGANIC | REAGENT_SYNTHETIC
	boozepwr = 50
	quality = DRINK_NICE
	glass_icon = 'modular_eva/icons/obj/drinks.dmi' // This should cover anything synthanol related. Will have to individually tag others unless we make an object path for skyrat drinks.
	glass_icon_state = "synthanolglass"
	glass_name = "Glass of Synthanol"
	glass_desc = "The equivalent of alcohol for synthetic crewmembers. They'd find it awful if they had tastebuds too."
	taste_description = "motor oil"

/datum/reagent/consumable/ethanol/synthanol/on_mob_life(mob/living/carbon/C)
	if(!(C.mob_biotypes & MOB_ROBOTIC))
		C.reagents.remove_reagent(type, 3.6) //gets removed from organics very fast
		if(prob(25))
			C.vomit(5, FALSE, FALSE)
	return ..()

/datum/reagent/consumable/ethanol/synthanol/expose_mob(mob/living/carbon/C, method=TOUCH, volume)
	. = ..()
	if(C.mob_biotypes & MOB_ROBOTIC)
		return
	if(method == INGEST)
		to_chat(C, pick("<span class = 'danger'>That was awful!</span>", "<span class = 'danger'>That was disgusting!</span>"))

/datum/reagent/consumable/ethanol/synthanol/robottears
	name = "Robot Tears"
	description = "An oily substance that an IPC could technically consider a 'drink'."
	color = "#363636"
	boozepwr = 25
	glass_icon_state = "robottearsglass"
	glass_name = "Glass of Robot Tears"
	glass_desc = "No robots were hurt in the making of this drink."
	taste_description = "existential angst"

/datum/reagent/consumable/ethanol/synthanol/trinary
	name = "Trinary"
	description = "A fruit drink meant only for synthetics, however that works."
	color = "#ADB21f"
	boozepwr = 20
	glass_icon_state = "trinaryglass"
	glass_name = "Glass of Trinary"
	glass_desc = "Colorful drink made for synthetic crewmembers. It doesn't seem like it would taste well."
	taste_description = "modem static"

/datum/reagent/consumable/ethanol/synthanol/servo
	name = "Servo"
	description = "A drink containing some organic ingredients, but meant only for synthetics."
	color = "#5B3210"
	boozepwr = 25
	glass_icon_state = "servoglass"
	glass_name = "Glass of Servo"
	glass_desc = "Chocolate - based drink made for IPCs. Not sure if anyone's actually tried out the recipe."
	taste_description = "motor oil and cocoa"

/datum/reagent/consumable/ethanol/synthanol/uplink
	name = "Uplink"
	description = "A potent mix of alcohol and synthanol. Will only work on synthetics."
	color = "#E7AE04"
	boozepwr = 15
	glass_icon_state = "uplinkglass"
	glass_name = "Glass of Uplink"
	glass_desc = "An exquisite mix of the finest liquoirs and synthanol. Meant only for synthetics."
	taste_description = "a GUI in visual basic"

/datum/reagent/consumable/ethanol/synthanol/synthncoke
	name = "Synth 'n Coke"
	description = "The classic drink adjusted for a robot's tastes."
	color = "#7204E7"
	boozepwr = 25
	glass_icon_state = "synthncokeglass"
	glass_name = "Glass of Synth 'n Coke"
	glass_desc = "Classic drink altered to fit the tastes of a robot, contains de-rustifying properties. Bad idea to drink if you're made of carbon."
	taste_description = "fizzy motor oil"

/datum/reagent/consumable/ethanol/synthanol/synthignon
	name = "Synthignon"
	description = "Someone mixed wine and alcohol for robots. Hope you're proud of yourself."
	color = "#D004E7"
	boozepwr = 25
	glass_icon_state = "synthignonglass"
	glass_name = "Glass of Synthignon"
	glass_desc = "Someone mixed good wine and robot booze. Romantic, but atrocious."
	taste_description = "fancy motor oil"

// Other Booze

/datum/reagent/consumable/ethanol/gunfire
	name = "Gunfire"
	description = "A drink that tastes like tiny explosions."
	color = "#e4830d"
	boozepwr = 40
	quality = DRINK_GOOD
	taste_description = "tiny explosions"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "gunfire"
	glass_name = "Gunfire"
	glass_desc = "It pops constantly as you look at it, giving off tiny sparks."

/datum/reagent/consumable/ethanol/gunfire/on_mob_life(mob/living/carbon/M)
	if (prob(3))
		to_chat(M,"<span class='notice'>You feel the gunfire pop in your mouth.</span>")
	return ..()

/datum/reagent/consumable/ethanol/hellfire
	name = "Hellfire"
	description = "A nice drink that isn't quite as hot as it looks."
	color = "#fb2203"
	boozepwr = 60
	quality = DRINK_VERYGOOD
	taste_description = "cold flames that lick at the top of your mouth"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "hellfire"
	glass_name = "Hellfire"
	glass_desc = "An amber colored drink that isn't quite as hot as it looks."

/datum/reagent/consumable/ethanol/hellfire/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(30 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL + 30)
	return ..()

/datum/reagent/consumable/ethanol/sins_delight
	name = "Sin's Delight"
	description = "The drink smells like the seven sins."
	color = "#330000"
	boozepwr = 66
	quality = DRINK_FANTASTIC
	taste_description = "sin"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "sins_delight"
	glass_name = "Sin's Delight"
	glass_desc = "You can smell the seven sins rolling off the top of the glass."

/datum/reagent/consumable/ethanol/strawberry_daiquiri
	name = "Strawberry Daiquiri"
	description = "Pink looking alcoholic drink."
	boozepwr = 20
	color = "#FF4A74"
	quality = DRINK_NICE
	taste_description = "sweet strawberry, lime and the ocean breeze"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "strawberry_daiquiri"
	glass_name = "Strawberry Daiquiri"
	glass_desc = "Pink looking drink with flowers and a big straw to sip it. Looks sweet and refreshing, perfect for warm days."

/datum/reagent/consumable/ethanol/liz_fizz
	name = "Liz Fizz"
	description = "Triple citrus layered with some ice and cream."
	boozepwr = 0
	color = "#D8FF59"
	taste_description = "brain freezing sourness"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "liz_fizz"
	glass_name = "Liz Fizz"
	glass_desc = "Looks like a citrus sherbet seperated in layers? Why would anyone want that is beyond you."

/datum/reagent/consumable/ethanol/miami_vice
	name = "Miami Vice"
	description = "A drink layering Pina Colada and Strawberry Daiquiri"
	boozepwr = 30
	color = "#D8FF59"
	quality = DRINK_FANTASTIC
	taste_description = "sweet and refreshing flavor, complemented with strawberries and coconut, and hints of citrus"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "miami_vice"
	glass_name = "Miami Vice"
	glass_desc = "Strawberries and coconut, like yin and yang."

/datum/reagent/consumable/ethanol/malibu_sunset
	name = "Malibu Sunset"
	description = "A drink consisting of creme de coconut and tropical juices"
	boozepwr = 20
	color = "#FF9473"
	quality = DRINK_NICE
	taste_description = "coconut, with orange and grenadine accents"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "malibu_sunset"
	glass_name = "Malibu Sunset"
	glass_desc = "Tropical looking drinks, with ice cubes hovering on the surface and grenadine coloring the bottom."

/datum/reagent/consumable/ethanol/hotlime_miami
	name = "Hotlime Miami"
	description = "The essence of the 90's, if they were a bloody mess that is."
	boozepwr = 40
	color = "#A7FAE8"
	quality = DRINK_FANTASTIC
	taste_description = "coconut and aesthetic violence"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "hotlime_miami"
	glass_name = "Hotlime Miami"
	glass_desc = "This looks very aesthetically pleasing."

/datum/reagent/consumable/ethanol/hotlime_miami/on_mob_life(mob/living/carbon/M)
	M.set_drugginess(50)
	M.adjustStaminaLoss(-2)
	return ..()

/datum/reagent/consumable/ethanol/coggrog
	name = "Cog Grog"
	description = "Now you can fill yourself with the power of Ratvar!"
	color = rgb(255, 201, 49)
	boozepwr = 10
	quality = DRINK_FANTASTIC
	taste_description = "a brass taste with a hint of oil"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "coggrog"
	glass_name = "Cog Grog"
	glass_desc = "Not even Ratvar's Four Generals could withstand this!  Qevax Jryy!"

// RACE SPECIFIC DRINKS

/datum/reagent/consumable/ethanol/coldscales
	name = "Coldscales"
	color = "#5AEB52" //(90, 235, 82)
	description = "A cold looking drink made for people with scales."
	boozepwr = 50 //strong!
	taste_description = "dead flies"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "coldscales"
	glass_name = "glass of Coldscales"
	glass_desc = "A soft green drink that looks inviting!"

/datum/reagent/consumable/ethanol/coldscales/on_mob_life(mob/living/carbon/M)
	if(islizard(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/oil_drum
	name = "Oil Drum"
	color = "#000000" //(0, 0, 0)
	description = "Industrial grade oil mixed with some ethanol to make it a drink. Somehow not known to be toxic."
	boozepwr = 45
	taste_description = "oil spill"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "oil_drum"
	glass_name = "Drum of oil"
	glass_desc = "A gray can of booze and oil..."

/datum/reagent/consumable/ethanol/oil_drum/on_mob_life(mob/living/carbon/M)
	if(MOB_ROBOTIC)
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/nord_king
	name = "Nord King"
	color = "#EB1010" //(235, 16, 16)
	description = "Strong mead mixed with more honey and ethanol. Beloved by its human patrons."
	boozepwr = 50 //strong!
	taste_description = "honey and red wine"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "nord_king"
	glass_name = "Keg of Nord King"
	glass_desc = "A dripping keg of red mead."

/datum/reagent/consumable/ethanol/nord_king/on_mob_life(mob/living/carbon/M)
	if(ishumanbasic(M) || isdwarf(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/velvet_kiss
	name = "Velvet Kiss"
	color = "#EB1010" //(235, 16, 16)
	description = "A bloody drink mixed with wine."
	boozepwr = 10 //weak
	taste_description = "iron with grapejuice"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "velvet_kiss"
	glass_name = "glass of Velvet Kiss"
	glass_desc = "Red and white drink for the upper classes or undead."

/datum/reagent/consumable/ethanol/velvet_kiss/on_mob_life(mob/living/carbon/M)
	if(iszombie(M) || isvampire(M) || isdullahan(M)) //Rare races!
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/abduction_fruit
	name = "Abduction Fruit"
	color = "#DEFACD" //(222, 250, 205)
	description = "Mixing of juices to make an alien taste."
	boozepwr = 80 //Strong
	taste_description = "grass and lime"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "abduction_fruit"
	glass_name = "glass of Abduction Fruit"
	glass_desc = "Mixed fruits that were never meant to be mixed..."

/datum/reagent/consumable/ethanol/abduction_fruit/on_mob_life(mob/living/carbon/M)
	if(isabductor(M)) //add xenohyrids to this at some point
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/bug_zapper
	name = "Bug Zapper"
	color = "#F5882A" //(222, 250, 205)
	description = "Copper and lemon juice. Hardly even a drink."
	boozepwr = 5 //No booze really
	taste_description = "copper and AC power"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "bug_zapper"
	glass_name = "glass of Bug Zapper"
	glass_desc = "An odd mix of copper, lemon juice and power meant for non-human consumption."

/datum/reagent/consumable/ethanol/bug_zapper/on_mob_life(mob/living/carbon/M)
	if(isinsect(M) || isflyperson(M) || ismoth(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/mush_crush
	name = "Mush Crush"
	color = "#F5882A" //(222, 250, 205)
	description = "Soil in a glass."
	boozepwr = 5 //No booze really
	taste_description = "dirt and iron"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "mush_crush"
	glass_name = "glass of Mush Crush"
	glass_desc = "Popular among people that want to grow their own food rather than drink the soil."

/datum/reagent/consumable/ethanol/mush_crush/on_mob_life(mob/living/carbon/M)
	if(ispodperson(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/hollow_bone
	name = "Hollow Bone"
	color = "#FCF7D4" //(252, 247, 212)
	description = "Shockingly none-harmful mix of toxins and milk."
	boozepwr = 15
	taste_description = "Milk and salt"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "hollow_bone"
	glass_name = "skull of Hollow Bone"
	glass_desc = "Mixing of milk and bone hurting juice for enjoyment for rather skinny people."

/datum/reagent/consumable/ethanol/hollow_bone/on_mob_life(mob/living/carbon/M)
	if(isplasmaman(M) || isskeleton(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/jell_wyrm
	name = "Jell Wyrm"
	color = "#FF6200" //(255, 98, 0)
	description = "Horrible mix of Co2, toxins and heat. Meant for slime based life."
	boozepwr = 40
	taste_description = "tropical sea"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "jell_wyrm"
	glass_name = "glass of Jell Wyrm"
	glass_desc = "A bubbly drink that is rather inviting to those that don't know who it's meant for."

/datum/reagent/consumable/ethanol/jell_wyrm/on_mob_life(mob/living/carbon/M)
	if(isjellyperson(M) || isslimeperson(M) || isluminescent(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
		M.adjustToxLoss(1, 0) //Low tox due to being carp + jell toxins.
	return ..()

/datum/reagent/consumable/ethanol/laval_spit //Yes Laval
	name = "Laval Spit"
	color = "#DE3009" //(222, 48, 9)
	description = "Heat minerals and some mauna loa. Meant for rock based life."
	boozepwr = 30
	taste_description = "tropical island"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "laval_spit"
	glass_name = "glass of Laval Spit"
	glass_desc = "Piping hot drink for those who can stomach the heat of lava."

/datum/reagent/consumable/ethanol/laval_spit/on_mob_life(mob/living/carbon/M)
	if(isgolem(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()

/datum/reagent/consumable/ethanol/frisky_kitty
	name = "Frisky Kitty"
	color = "#FCF7D4" //(252, 247, 212)
	description = "Warm milk mixed with catnip."
	boozepwr = 0
	taste_description = "Warm milk and catnip"
	glass_icon = 'modular_eva/icons/obj/drinks.dmi'
	glass_icon_state = "frisky_kitty"
	glass_name = "cup of Frisky Kitty"
	glass_desc = "Warm milk and some catnip."

/datum/reagent/consumable/ethanol/frisky_kitty/on_mob_life(mob/living/carbon/M)
	if(ismammal(M) || isfelinid(M))
		quality = RACE_DRINK
	else
		M.adjust_disgust(25)
	return ..()
