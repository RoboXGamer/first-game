extends CharacterBody2D
class_name PlayerController

# Interact Prompt 
var Interact_Node = null : set = set_interact
func _ready():
	set_interact(null)
	$Camera2D.zoom = camera_zoom
func set_interact(new_value):
	if new_value != null:
		$ButtonPrompt.show()
	else:
		$ButtonPrompt.hide()
	Interact_Node = new_value

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("Interact") and Interact_Node!=null:
		Global.player_pos=global_position

var Money = 1500


@export var move_speed = 85.0
@export var camera_zoom = Vector2(1,1)

var direction : Vector2

enum Facing {DOWN,UP,LEFT,RIGHT}
var player_facing : Facing


func _physics_process(delta):# direction & movement
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
