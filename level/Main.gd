extends Node

var MagicBall: PackedScene = preload("res://projectiles/MagicBall.tscn")
var Arrow: PackedScene = preload("res://projectiles/Arrow.tscn")



func _ready():
	pass 
	
#func _process(delta):
#	pass

func _on_Archer_attack(pos, direction):
	var arrow = Arrow.instance() as Area2D
	arrow.position = pos
	arrow.rotation_degrees = rad2deg(direction.angle())
	arrow.direction = direction
	$Projectiles.add_child(arrow)
	

func _on_Wizzard_attack(pos, direction):
	var magic_ball = MagicBall.instance() as Area2D
	magic_ball.position = pos
	magic_ball.rotation_degrees = rad2deg(direction.angle())
	magic_ball.direction = direction
	$Projectiles.add_child(magic_ball)
	
func _on_Wizzard_charging():
	print("CAMERA SHAKE")

func _on_Door_body_entered(body):
	print("ENTROu")


func _on_inside_body_entered(body):
	print("body entered")
	print(body)
	var tween = get_tree().create_tween()
	tween.tween_property($Wizzard/Camera2D, "zoom", Vector2(0.3, 0.3), 0.5)

func _on_inside_body_exited(body):
	print("body existed")
	print(body)
	var tween = get_tree().create_tween()
	tween.tween_property($Wizzard/Camera2D, "zoom", Vector2(0.5, 0.5), 0.5)

