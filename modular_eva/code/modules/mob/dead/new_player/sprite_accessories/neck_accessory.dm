/datum/sprite_accessory/neck_accessory
	icon = 'modular_eva/icons/mob/sprite_accessory/neck_accessory.dmi'
	key = "neck_acc"
	generic = "Neck Accessory"
	relevent_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/neck_accessory/none
	name = "None"
	icon_state = "none"
	color_src = null
	factual = FALSE

/datum/sprite_accessory/neck_accessory/is_hidden(mob/living/carbon/human/H, obj/item/bodypart/HD)
	if(H.wear_suit && (H.try_hide_mutant_parts || H.wear_suit.flags_inv & HIDEJUMPSUIT))
		return TRUE
	return FALSE

/datum/sprite_accessory/neck_accessory/sylveon_bow
	name = "Sylveon Neck Bow"
	icon_state = "sylveon_bow"
	recommended_species = list("synthmammal", "mammal", "human", "synthhuman", "felinid", "humanoid")
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	color_src = USE_MATRIXED_COLORS
	ckey_whitelist = list("whirlsam" = TRUE)
