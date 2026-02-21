extends Node2D

func _ready() -> void:
	# 1. Check if we have a stored ID from a door or workstation
	if Global.last_door_id != "":
		# 2. Search the current scene for a Marker2D with that exact name
		# (True = search sub-children, False = don't force exact type match yet)
		var spawn_point = find_child(Global.last_door_id, true, false)
		
		# 3. If found, move the player to it
		if spawn_point and spawn_point is Marker2D:
			$Player.global_position = spawn_point.global_position
		
		# 4. Clear the ID so it doesn't trigger again by accident
		Global.last_door_id = ""
