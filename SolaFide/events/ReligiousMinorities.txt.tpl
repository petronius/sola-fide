namespace = sola_fide

# The goal with the religious minorities mechanic is as follows:
# 	1. When converting a province, there is a chance to trigger the entrenchment of that religion (event)
#	2. When conversion finishes (or is triggered as the result of another event or action), then the entrenched religion becomes a religiious minority (on_action)
# 	3. The minority is cleared if a) they are expelled (another mechanic), b) supressed (another mechanic), or c) they become the majority religion again

# MTTH trigger on provinces undergoing conversion. This sets up the entrenched religion,
# which will later be converted to the minority province attribute via on_action
province_event = {

	id = sola_fide.1
	title = "sola_fide_religion_entrenched_title"
	desc = "sola_fide_religion_entrenched_desc"
	picture = "RELIGION_eventPicture"

	mean_time_to_happen = {
		months = 1
	}

	trigger = {
		has_construction = missionary
		OR = {
			% for religion, name in religions.items():
 			AND = {
					religion = {{religion}}
					NOT = { has_province_modifier = sola_fide.religion_entrenched.{{religion}} }
			}
			% end

		}
	}

	immediate = {
		% for religion, name in religions.items():
		if = {
				limit = {
						religion = {{religion}}
				}
				add_province_modifier = {
						name = sola_fide.religion_entrenched.{{religion}}
						duration = -1
				}
		}
		% end

	}

	option = {
		name = "SOLA_FIDE_RELIGION_ENTRENCHED_ACCEPT"
	}
}

#province_event = {}