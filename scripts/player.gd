extends CharacterBody2D
class_name PlayerController


var Escape_Menu = false
# Interact Prompt 
var Interact_Node = null:
	set(new_value):
		Interact_Node = new_value
		if Interact_Node != null:
			$ButtonPrompt.show()
		else:
			$ButtonPrompt.hide()
func _ready():
	Interact_Node = null
	$Escape_Menu.hide()
	$Camera2D.zoom = camera_zoom
	if Global.player_pos!= Vector2.ZERO:
		global_position = Global.player_pos
		Global.player_pos = Vector2.ZERO
	elif Global.last_door_id != "":
		var spawn_point = get_parent().find_child(Global.last_door_id, true, false)
		if spawn_point and spawn_point is Marker2D:
			global_position = spawn_point.global_position
		Global.last_door_id = ""

#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventKey and event.is_action_pressed("Interact") and Interact_Node!=null:



@export var move_speed = 85.0
@export var camera_zoom = Vector2(1,1)

var direction : Vector2

enum Facing {DOWN,UP,LEFT,RIGHT}
var player_facing : Facing

func _process(_delta: float) -> void:
	if Escape_Menu:
		$Escape_Menu.show()
	else:
		$Escape_Menu.hide()
	if Input.is_action_just_pressed("Escape"):
		Escape_Menu = !Escape_Menu


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
	# Escape Button for Menu
	
	# Normalizing Direction Variable
	direction = direction.normalized()
	# Velocity Set
	velocity = direction * move_speed * delta * 200
	move_and_slide()
