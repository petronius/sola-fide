# province
on_province_religion_converted = {
	on_province_religion_changed_effect = yes
	on_province_religion_converted_effect = yes
	#
	# Entrenched modifiers are added to provinces while they have the mentioned religion, so as
	# soon as the religion changes for any reason, they are replaced with the corresponding
	# religious minority modifier
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
	% end

}