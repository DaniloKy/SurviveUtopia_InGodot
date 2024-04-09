extends Node2D

func _on_Archer_attack(pos, direction):
	$AnimatedSprite.animation = "shoot"
	$AnimatedSprite.frame = 0
	$AnimatedSprite.play()
	
func _process(delta):
	look_at(get_global_mouse_position())
	
