extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.last_door_id == "MechanicShop":
		$Player.global_position = $Infrastucture/Workshop/MechanicShopSpawn.global_position
