extends Area2D

@export_file("*.tscn") var target_scene: String 
@export var spawn_location_id: String = ""      

var player_in_range: PlayerController = null

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Interact"):
		if target_scene != "":
			Global.last_door_id = spawn_location_id 
			get_tree().change_scene_to_file(target_scene)

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		player_in_range = body
		body.Interact_Node = self 

func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		if body.Interact_Node == self:
			body.Interact_Node = null 
		player_in_range = null
