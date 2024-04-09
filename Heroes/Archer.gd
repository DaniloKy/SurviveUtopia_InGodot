class_name Archer extends Player

var archer_speed = 220;

signal attack(pos, direction)
var can_attack = true

func _ready():
	setSpeed(archer_speed)


func _process(delta):
	
	if Input.is_action_pressed("primary_action") and can_attack:
		var pos = $Weapon/Bow/Position2D.global_position
		can_attack = false
		$Atack_Timer.start()
		var direction = (get_global_mouse_position() - position).normalized()
		emit_signal("attack", pos, direction)
	
	
func _on_Atack_Timer_timeout():
	can_attack = true
