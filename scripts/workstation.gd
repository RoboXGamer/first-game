extends Node2D

var Hold_Timer = 0.0
const Required_Time = 3.0
var assemble = false
var inspect = false
var repair = false
var is_holding = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if assemble and repair and  inspect and is_holding:
		$RepairProgress.show()
		Hold_Timer+= delta
		$RepairProgress.value = Hold_Timer/ Required_Time * 100
		if Hold_Timer >= Required_Time:
			_on_task_complete()
	else:
		$RepairProgress.hide()
		Hold_Timer = 0.0
	
	

func _on_task_complete():
	Hold_Timer = 0.0
	assemble = false
	repair = false
	inspect = false
	Global.Money += 200

func _on_exit_pressed() -> void:
	Global.last_door_id = "WorkshopInteriorSpawn"
	get_tree().change_scene_to_file("res://scenes/workshop_interior.tscn")


func _on_inspect_pressed() -> void:
	inspect = true


func _on_repair_pressed() -> void:
	repair = true


func _on_assemble_pressed() -> void:
	assemble = true


func _on_repair_button_down() -> void:
	repair = true
	is_holding = true


func _on_repair_button_up() -> void:
	is_holding = false
