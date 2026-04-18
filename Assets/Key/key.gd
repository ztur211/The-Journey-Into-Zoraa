extends Area2D

signal key_collected

func _ready():
	$AnimationPlayer.play("bounce")

func _on_key_body_entered(body):
	$AnimationPlayer.play("collect")
	emit_signal("key_collected")
	set_collision_mask_bit(0, false)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
