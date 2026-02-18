extends Node2D

@export var workshop_interioir : PackedScene

var inside = false

func _process(_delta: float) -> void:
	if inside and Input.is_action_pressed("Interact"):
		get_tree().change_scene_to_packed(workshop_interioir)

func _on_enter(body: Node2D) -> void:
	if body is PlayerController:
		inside = true


func _on_exit(body: Node2D) -> void:
	if body is PlayerController:
		inside = false
