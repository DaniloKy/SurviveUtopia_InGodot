extends Area2D

func _process(delta):
	pass
	#look_at(get_global_mouse_position())

func _on_Wizzard_charging(isCharging):
	if isCharging:
		$Light2D.energy = 5
		$Particles2D.emitting = true
	else:
		$Light2D.energy = 1
		$Particles2D.emitting = false
	
	
"""
var tween = create_tween()
	tween.parallel()
	tween.tween_property($Light2D, "energy", 5, 2)
	tween.tween_property($Particles2D, "amount", 32, 2)
	
"""
