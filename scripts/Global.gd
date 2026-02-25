extends Node

const save_path = "user://GameSave.save"

var last_door_id : String = ""
var Clock = 0
var Money = 1500
var Money_Deposited = 0
var Loan_Interest_Rate = 9
var Day = 1
var Frames = 0
var current_scene_path: String  = "res://scenes/main.tscn"
var player_pos : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Clock+=delta
	if Clock >= 180:
		Clock = 0
		Day+=1
func save_game():
	var place = get_tree() # to get what scene the player is currently in 
	if place.current_scene:
		current_scene_path = place.current_scene.scene_file_path
	var player = place.get_first_node_in_group("Player") #to check the position if the player node exists in tree
	if player:
		player_pos = player.global_position
	
	#Variables to save the game {dictionary}
	var save_var = {
		"Money":Money,
		"Clock":Clock,
		"Money_Deposited": Money_Deposited,
		"Loan_Interest_Rate": Loan_Interest_Rate,
		"Day": Day,
		"current_scene_path": current_scene_path,
		"player_pos": player_pos
	}
	
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	if file:
		file.store_var(save_var)

func load_game()->bool:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		if file:
			var load_var = file.get_var()
			if typeof(load_var) == TYPE_DICTIONARY:
				Money = load_var.get("Money",200)
				Loan_Interest_Rate = load_var.get("Loan_Interest_Rate",9)
				Clock = load_var.get("Clock",0)
				Day = load_var.get("Day",0)
				Money_Deposited = load_var.get("Money_Deposited",0)
				current_scene_path = load_var.get("current_scene_path","res://scenes/main.tscn")
				player_pos = load_var.get("player_pos",Vector2.ZERO)
				return true
	return false

func new_game():
	Money = 1500
	Clock =0
	Money_Deposited = 0
	Loan_Interest_Rate = 9
	Day = 1
	current_scene_path = "res://scenes/main.tscn"
	player_pos = Vector2.ZERO
	last_door_id = ""
