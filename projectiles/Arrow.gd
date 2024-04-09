extends Area2D

var speed:int = 400
var direction:Vector2;

func _process(delta):
	position += direction * speed * delta
	

