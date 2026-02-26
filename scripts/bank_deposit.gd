extends TextureRect

@onready var keypad = $Keypad

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	keypad.num_confirm.connect(_on_keypad_num_confirmed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
func _on_keypad_num_confirmed(number : int)-> void:
	Global.Money-=int(number)
	Global.Money_Deposited+=int(number)


func _on_exit_pressed() -> void:
	$".".hide()
	$"../Bank_Menu".show()
