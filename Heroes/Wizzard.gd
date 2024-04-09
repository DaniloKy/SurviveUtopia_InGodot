class_name Wizzard extends Player

var wizzard_speed = 210

signal attack(pos, direction)
signal charging(isCharging)
var can_charge = true
var charging = false

func _ready():
	setSpeed(wizzard_speed)


func _process(delta):
			
	if Input.is_action_just_pressed("secundary_action") and can_charge:
		print("HOLDING")
		charging = true
		emit_signal("charging", true)
	
	if Input.is_action_just_pressed("primary_action") and charging:
			
			print("ATACK")
			charging = false
			can_charge = false
			$Charge_Timer.start()
			
			var pos = $Hands/Staff/Position2D.global_position
			var direction = (get_global_mouse_position() - position).normalized()
			emit_signal("charging", false)
			emit_signal("attack", pos, direction)
			
	if Input.is_action_just_released("secundary_action") and charging:
		print("RESEASE")
		charging = false
		can_charge = false
		$Charge_Timer.start()
		emit_signal("charging", false)
			
func _on_Charge_Timer_timeout():
	print("PODES DAR CHARGE")
	can_charge = true
	$Charge_Timer.stop()
