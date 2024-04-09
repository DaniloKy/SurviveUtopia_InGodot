extends Area2D

var speed:int = 250
var direction:Vector2;

func _process(delta):
	position += direction * speed * delta
	

