extends Area2D

var key = 0

func _ready():
	$AnimatedSprite.play("closed")

func _on_key_key_collected():
	key = key + 1
	if key == 1:
		$AnimatedSprite.play("open")
		set_collision_mask_bit(0, true)
