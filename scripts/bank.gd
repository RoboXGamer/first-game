extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_exit_pressed() -> void:
	Global.last_door_id="WithdrawSpawn"
	SceneTransition.change_scene("res://scenes/bank_interior.tscn")


func _on_deposit_pressed() -> void:
	$"../Deposit_or_Withdraw_Window/Text".text = "Deposit Money:"
	$"../Deposit_or_Withdraw_Window".show()
	$".".hide()


func _on_withdraw_pressed() -> void:
	$"../Deposit_or_Withdraw_Window/Text".text = "Withdraw Money:"
	$"../Deposit_or_Withdraw_Window".show()
	$".".hide()
