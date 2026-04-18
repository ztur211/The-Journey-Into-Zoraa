extends Node2D


export (int) var speed
export (int) var left_limit

func _process(delta):
	position.x += speed * delta
	if position.x <= left_limit:
		position.x = 0
