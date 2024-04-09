extends Camera2D

export var randomStrength:float = 1
export var shakeFade: float = 5.0
var charging = false
var shoot = false

var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func _ready():
	pass

func apply_shake():
	shake_strength = randomStrength
	
func _process(delta):
	if charging:
		randomStrength = 1
		apply_shake()
	if shoot:
		shoot = false
		randomStrength = 10
		apply_shake()
		
	if shake_strength > 0:
		shake_strength = lerp(shake_strength, 0, shakeFade * delta)
		offset = randomOffset()
		

func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength, shake_strength), rng.randf_range(-shake_strength, shake_strength))


func _on_Wizzard_charging(isCharging):
	charging = isCharging
	

func _on_Wizzard_attack(pos, direction):
	shoot = true;
