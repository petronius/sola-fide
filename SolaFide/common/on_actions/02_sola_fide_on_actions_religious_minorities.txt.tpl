# province
on_province_religion_converted = {
	on_province_religion_changed_effect = yes
	on_province_religion_converted_effect = yes
	#
	# Entrenched modifiers are added to provinces while they have the mentioned religion, so as
	# soon as the religion changes for any reason, they are replaced with the corresponding
	# religious minority modifier.
	#
	# In any other circumstance where there is a pre-existing religious minority, that modifier
	# should be removed as soon as that religion becomes the majority.
	#
	% for religion, name in religions.items():
	if = {
		limit = {
			has_province_modifier = sola_fide.religion_entrenched.{{religion}}
		}
		add_permanent_province_modifier = {
			name = sola_fide.religious_minority.{{religion}}
			duration = -1
		}
		remove_province_modifier = sola_fide.religion_entrenched.{{religion}}
	}
	if = {
		limit = {
			has_province_modifier = sola_fide.religious_minority.{{religion}}
			religion = {{religion}}
		}
		remove_province_modifier = sola_fide.religious_minority.{{religion}}
	}
	% end

}

on_siege_won_province = {
	#
	# on_province_religion_converted doesn't seem to fire when a rebel siege converts,
	# so we add a check here to cover that case, so we don't have to do it in each and every
	# rebel txt file for each religion.
	#
	% for religion, name in religions.items():
	if = {
		limit = {
			has_province_modifier = sola_fide.religious_minority.{{religion}}
			religion = {{religion}}
		}
		remove_province_modifier = sola_fide.religious_minority.{{religion}}
	}
	% end
}