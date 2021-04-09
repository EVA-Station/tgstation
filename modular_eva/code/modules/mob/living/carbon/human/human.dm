/mob/living/carbon/human/Topic(href, href_list)
	. = ..()
	if(href_list["lookup_info"])
		switch(href_list["lookup_info"])
			if("flavor_text")
				if(length(dna.features["flavor_text"]))
					var/datum/browser/popup = new(usr, "[name]'s flavor text", "[name]'s Flavor Text", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s flavor text", replacetext(dna.features["flavor_text"], "\n", "<BR>")))
					popup.open()
					return

			if("ooc_prefs")
				if(client)
					var/str = "[src]'s OOC Notes : <br> <b>ERP :</b> [client.prefs.erp_pref] <b>| Non-Con :</b> [client.prefs.noncon_pref] <b>| Vore :</b> [client.prefs.vore_pref]"
					str += "<br>[html_encode(client.prefs.ooc_prefs)]"
					var/datum/browser/popup = new(usr, "[name]'s ooc info", "[name]'s OOC Information", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s OOC information", replacetext(str, "\n", "<BR>")))
					popup.open()
					return

			if("general_record")
				if(client && usr.client.holder)
					var/datum/browser/popup = new(usr, "[name]'s gen rec", "[name]'s General Record", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s general record", replacetext(client.prefs.general_record, "\n", "<BR>")))
					popup.open()
					return

			if("security_record")
				if(client && usr.client.holder)
					var/datum/browser/popup = new(usr, "[name]'s sec rec", "[name]'s Security Record", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s security record", replacetext(client.prefs.security_record, "\n", "<BR>")))
					popup.open()
					return

			if("medical_record")
				if(client && usr.client.holder)
					var/datum/browser/popup = new(usr, "[name]'s med rec", "[name]'s Medical Record", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s medical record", replacetext(client.prefs.medical_record, "\n", "<BR>")))
					popup.open()
					return

			if("background_info")
				if(client && usr.client.holder)
					var/datum/browser/popup = new(usr, "[name]'s flav bg", "[name]'s Background", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s background flavor", replacetext(client.prefs.background_info, "\n", "<BR>")))
					popup.open()
					return

			if("exploitable_info")
				if(client && usr.client.holder)
					var/datum/browser/popup = new(usr, "[name]'s exp info", "[name]'s Exploitable Info", 500, 200)
					popup.set_content(text("<HTML><HEAD><TITLE>[]</TITLE></HEAD><BODY><TT>[]</TT></BODY></HTML>", "[name]'s exploitable information", replacetext(client.prefs.exploitable_info, "\n", "<BR>")))
					popup.open()
					return

/mob/living/carbon/human/species/synthliz
	race = /datum/species/robotic/synthliz

/mob/living/carbon/human/species/vox
	race = /datum/species/vox

/mob/living/carbon/human/species/ipc
	race = /datum/species/robotic/ipc

/mob/living/carbon/human/species/mammal
	race = /datum/species/mammal

/mob/living/carbon/human/species/podweak
	race = /datum/species/pod/podweak

/mob/living/carbon/human/species/xeno
	race = /datum/species/xeno

/mob/living/carbon/human/species/dwarf
	race = /datum/species/dwarf

/mob/living/carbon/human/species/roundstartslime
	race = /datum/species/jelly/roundstartslime

/mob/living/carbon/human/revive(full_heal = 0, admin_revive = 0)
	if(..())
		if(dna && dna.species)
			dna.species.spec_revival(src)

/mob/living/carbon/human/verb/toggle_mutant_part_visibility()
	set category = "IC"
	set name = "Show/Hide Mutant Parts"
	set desc = "Allows you to choose to try and hide your mutant bodyparts under your clothes."

	if(stat != CONSCIOUS)
		to_chat(usr, "<span class='warning'>You can't do this right now...</span>")
		return
	if(!try_hide_mutant_parts && !do_after(src, 3 SECONDS,target = src))
		return
	try_hide_mutant_parts = !try_hide_mutant_parts
	to_chat(usr, "<span class='notice'>[try_hide_mutant_parts ? "You try and hide your mutant body parts under your clothes." : "You no longer try and hide your mutant body parts"]</span>")
	update_mutant_bodyparts()
