extends KinematicBody2D

const SPEED = 300
const JUMPSPEED = -700
const GRAVITY = 30

var velocity = Vector2(0,0)
var last_direction = Vector2(0,1)


var health = 0
var health_max = 100
var health_regeneration = 1
var keys = 0

signal player_stats_changed

func _physics_process(delta):
	#player movement left and right
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")
	
	#gravity
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPSPEED
		$AnimatedSprite.play("jump")
	
	#collisions
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	

func _get_animation_direction(direction:Vector2):
	var norm_direction = direction.normalized()
	if norm_direction.x <= -0.707:
		return "left"
	if norm_direction.x <= 0.707:
		return "right"

# fix jumping animation
#func _input(event):
#	if event.is_action_pressed("jump"):
#		$AnimatedSprite.play("jump")

func add_keys():
	keys = keys + 1

func _on_fallzone_body_entered(body):
	keys = 0
	get_tree().change_scene("res://Lvl3.tscn")


func _on_door1_body_entered(body):
	get_tree().change_scene("res://Lvl2.tscn")
	keys = 0


func _on_spike_hit():
	get_tree().change_scene("res://Lvl3.tscn")
	keys = 0


func _on_door2_body_entered(body):
	get_tree().change_scene("res://Lvl3.tscn")
	keys = 0


func _on_door3_body_entered(body):
	get_tree().change_scene("res://TitleMenu.tscn")
	keys = 0
