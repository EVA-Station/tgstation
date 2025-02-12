/datum/species/jelly
	species_traits = list(MUTCOLORS,EYECOLOR,NOBLOOD,HAIR,FACEHAIR)
	default_mutant_bodyparts = list("tail" = "None", "snout" = "None", "ears" = "None", "taur" = "None", "wings" = "None", "legs" = "Normal Legs")
	mutant_bodyparts = list()
	hair_color = "mutcolor"
	hair_alpha = 160 //a notch brighter so it blends better.

/datum/species/jelly/roundstartslime
	name = "Xenobiological Slime Hybrid"
	id = "slimeperson"
	limbs_id = "slime"
	limbs_icon = 'modular_eva/icons/mob/species/slime_parts_greyscale.dmi'
	default_color = "00FFFF"
	say_mod = "says"
	coldmod = 3
	heatmod = 1
	burnmod = 1
	specific_alpha = 155
	markings_alpha = 130 //This is set lower than the other so that the alpha values don't stack on top of each other so much

/datum/action/innate/slime_change
	name = "Alter Form"
	check_flags = AB_CHECK_CONSCIOUS
	button_icon_state = "alter_form"
	icon_icon = 'modular_eva/icons/mob/actions/actions_slime.dmi'
	background_icon_state = "bg_alien"
	var/slime_restricted = TRUE

/datum/action/innate/slime_change/admin
	slime_restricted = FALSE

/datum/action/innate/slime_change/Activate()
	var/mob/living/carbon/human/H = owner
	if(slime_restricted && !isjellyperson(H))
		return
	if(slime_restricted)
		H.visible_message("<span class='notice'>[owner] gains a look of \
		concentration while standing perfectly still.\
		 Their body seems to shift and starts getting more goo-like.</span>",
		"<span class='notice'>You focus intently on altering your body while \
		standing perfectly still...</span>")
	change_form()

/datum/action/innate/slime_change/proc/change_form()
	var/mob/living/carbon/human/H = owner
	var/select_alteration = input(H, "Select what part of your form to alter", "Form Alteration", "cancel") in list("Body Colors","Hair Style", "Facial Hair Style", "Mutant Body Parts", "Markings", "Cancel")
	if(!select_alteration || select_alteration == "Cancel" || QDELETED(H))
		return
	var/datum/dna/DNA = H.dna
	switch(select_alteration)
		if("Body Colors")
			var/color_choice = input(H, "What color would you like to change?", "Form Alteration", "cancel") in list("Primary", "Secondary", "Tertiary", "All", "Cancel")
			if(!color_choice || color_choice == "Cancel" || QDELETED(H))
				return
			var/color_target
			switch(color_choice)
				if("Primary", "All")
					color_target = "mcolor"
				if("Secondary")
					color_target = "mcolor2"
				if("Tertiary")
					color_target = "mcolor3"
			var/new_mutantcolor = input(H, "Choose your character's new [lowertext(color_choice)] color:", "Form Alteration","#"+DNA.features[color_target]) as color|null
			if(!new_mutantcolor)
				return
			var/marking_reset = alert(H, "Would you like to reset your markings to match your new colors?", "", "Yes", "No")
			var/mutantpart_reset = alert(H, "Would you like to reset your mutant body parts(not limbs) to match your new colors?", "", "Yes", "No")
			if(color_choice == "All")
				DNA.features["mcolor"] = sanitize_hexcolor(new_mutantcolor)
				DNA.features["mcolor2"] = sanitize_hexcolor(new_mutantcolor)
				DNA.features["mcolor3"] = sanitize_hexcolor(new_mutantcolor)
			else
				DNA.features[color_target] = sanitize_hexcolor(new_mutantcolor)
			if(marking_reset && marking_reset == "Yes")
				for(var/zone in DNA.body_markings)
					for(var/key in DNA.body_markings[zone])
						var/datum/body_marking/BD = GLOB.body_markings[key]
						if(BD.always_color_customizable)
							continue
						DNA.body_markings[zone][key] = BD.get_default_color(DNA.features, DNA.species)
				H.icon_render_key = "" //Currently the render key doesnt recognize the markings colors
			if(mutantpart_reset && mutantpart_reset == "Yes")
				H.mutant_renderkey = "" //Just in case
				for(var/mutant_key in DNA.species.mutant_bodyparts)
					var/mutant_list = DNA.species.mutant_bodyparts[mutant_key]
					var/datum/sprite_accessory/SP = GLOB.sprite_accessories[mutant_key][mutant_list[MUTANT_INDEX_NAME]]
					mutant_list[MUTANT_INDEX_COLOR_LIST] = SP.get_default_color(DNA.features, DNA.species)

			H.update_body()
			H.update_hair()
		if("Hair Style")
			var/new_style = input(owner, "Select a hair style", "Hair Alterations")  as null|anything in GLOB.hairstyles_list
			if(new_style)
				H.hairstyle = new_style
				H.update_hair()
		if("Facial Hair Style")
			var/new_style = input(H, "Select a facial hair style", "Hair Alterations")  as null|anything in GLOB.facial_hairstyles_list
			if(new_style)
				H.facial_hairstyle = new_style
				H.update_hair()
		if("Mutant Body Parts")
			var/list/key_list = DNA.mutant_bodyparts
			var/chosen_key = input(H, "Select the part you want to alter", "Body Part Alterations")  as null|anything in key_list + "Cancel"
			if(!chosen_key || chosen_key == "Cancel")
				return
			var/choice_list = GLOB.sprite_accessories[chosen_key]
			var/chosen_name_key = input(H, "What do you want the part to become?", "Body Part Alterations")  as null|anything in choice_list + "Cancel"
			if(!chosen_name_key || chosen_name_key == "Cancel")
				return
			var/datum/sprite_accessory/SA = GLOB.sprite_accessories[chosen_key][chosen_name_key]
			H.mutant_renderkey = "" //Just in case
			if(!SA.factual)
				if(SA.organ_type)
					var/obj/item/organ/path = SA.organ_type
					var/slot = initial(path.slot)
					var/obj/item/organ/got_organ = H.getorganslot(slot)
					if(got_organ)
						got_organ.Remove(H)
						qdel(got_organ)
				else
					DNA.species.mutant_bodyparts -= chosen_key
			else
				if(SA.organ_type)
					var/obj/item/organ/path = SA.organ_type
					var/slot = initial(path.slot)
					var/obj/item/organ/got_organ = H.getorganslot(slot)
					if(got_organ)
						got_organ.Remove(H)
						qdel(got_organ)
					path = new SA.organ_type
					var/list/new_acc_list = list()
					new_acc_list[MUTANT_INDEX_NAME] = SA.name
					new_acc_list[MUTANT_INDEX_COLOR_LIST] = SA.get_default_color(DNA.features, DNA.species)
					DNA.mutant_bodyparts[chosen_key] = new_acc_list.Copy()
					if(ROBOTIC_DNA_ORGANS in DNA.species.species_traits)
						path.status = ORGAN_ROBOTIC
						path.organ_flags |= ORGAN_SYNTHETIC
					path.build_from_dna(DNA, chosen_key)
					path.Insert(H, 0, FALSE)

				else
					var/list/new_acc_list = list()
					new_acc_list[MUTANT_INDEX_NAME] = SA.name
					new_acc_list[MUTANT_INDEX_COLOR_LIST] = SA.get_default_color(DNA.features, DNA.species)
					DNA.species.mutant_bodyparts[chosen_key] = new_acc_list
					DNA.mutant_bodyparts[chosen_key] = new_acc_list.Copy()
			H.update_mutant_bodyparts()
		if("Markings")
			var/list/candidates = GLOB.body_marking_sets
			var/chosen_name = input(H, "Select which set of markings would you like to change into", "Marking Alterations")  as null|anything in candidates + "Cancel"
			if(!chosen_name || chosen_name == "Cancel")
				return
			var/datum/body_marking_set/BMS = GLOB.body_marking_sets[chosen_name]
			DNA.species.body_markings = assemble_body_markings_from_set(BMS, DNA.features, DNA.species)
			H.icon_render_key = "" //Just in case
			H.update_body()
