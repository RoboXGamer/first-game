extends Node2D



func _on_start_pressed() -> void:
	Global.new_game()
	SceneTransition.change_scene("res://scenes/main.tscn")


func _on_continue_pressed() -> void:
	if Global.load_game():
		SceneTransition.change_scene(Global.current_scene_path)
	else:
		Global.new_game()
		SceneTransition.change_scene("res://scenes/main.tscn")


func _on_options_pressed() -> void:
	print("Menu Opened")


func _on_exit_pressed() -> void:
	get_tree().quit()
