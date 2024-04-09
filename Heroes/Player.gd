class_name Player extends KinematicBody2D

var speed = 200

var velocity = Vector2.ZERO

func setSpeed(_speed: int):
	speed = _speed

func _ready():
	pass

func _process(delta):
	handle_movement(delta)
	
func handle_movement(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play();
		
	move_and_slide(velocity)	
	
	if velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "idle"
