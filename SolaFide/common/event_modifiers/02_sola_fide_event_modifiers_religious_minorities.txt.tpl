% for religion, name in religions.items():
sola_fide.religious_minority.{{religion}} = {
        local_unrest = 0.5
        local_religious_unity_contribution = -0.01
        picture = "church_loyalty_modifier_opposite"
}
sola_fide.religion_entrenched.{{religion}} = {
        local_missionary_strength = -0.005
}
% end