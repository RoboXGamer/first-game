extends Node2D

var inside_work = false
var exit_area = false
var Outside = "res://scenes/main.tscn"

func _ready() -> void:
	if Global.last_door_id == "WorkshopInteriorSpawn":
		$Player.global_position = $WorkshopInteriorSpawn.global_position

func _process(_delta: float) -> void:
	if inside_work and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_file("res://scenes/work.tscn")
	if exit_area and Input.is_action_just_pressed("Interact"):
		Global.last_door_id = "MechanicShop"
		get_tree().change_scene_to_file(Outside)

func _on_work_place_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		body.Interact_Node = self
		inside_work = true


func _on_work_place_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		if body.Interact_Node == self:
			body.Interact_Node = null
			inside_work = false


func _on_exit_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		body.Interact_Node = self
		exit_area = true


func _on_exit_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		if body.Interact_Node == self:
			body.Interact_Node = null
			exit_area = false
