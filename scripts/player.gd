extends CharacterBody2D

class_name PlayerController

@export var move_speed = 85.0

var direction : Vector2

enum Facing {DOWN,UP,LEFT,RIGHT}
var player_facing : Facing


func _physics_process(delta):
	# Vertical Direction Script
	if Input.is_action_pressed("Player_Down"):
		direction.y = 1
		player_facing = Facing.DOWN
	elif Input.is_action_pressed("Player_Up"):
		direction.y = -1
		player_facing = Facing.UP
	else:
		direction.y=0
	# Horizontal Direction Script
	if Input.is_action_pressed("Player_Left"):
		direction.x = -1
		player_facing = Facing.LEFT
	elif Input.is_action_pressed("Player_Right"):
		direction.x = 1
		player_facing = Facing.RIGHT
	else:
		direction.x = 0
	
	# Normalizing Direction Variable
	direction = direction.normalized()
	# Velocity Set
	velocity = direction * move_speed * delta * 200
	move_and_slide()
