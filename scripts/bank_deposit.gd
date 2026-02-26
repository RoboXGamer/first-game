extends TextureRect

@onready var keypad = $Keypad

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	keypad.num_confirm.connect(_on_keypad_num_confirmed)
	keypad.num_entered.connect(_on_number_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_keypad_num_confirmed(number : int)-> void:
	$Number.text=''
	if $Text.text == "Deposit Money:":
		if int(number) > Global.Money:
			$Number.hide()
			$Text.text = "Incorrect Amount"
			await get_tree().create_timer(1.0).timeout
			$Text.text = "Deposit Money:"
		else:
			Global.Money-=int(number)
			Global.Money_Deposited+=int(number)
	elif $Text.text == "Withdraw Money:":
		if int(number) > Global.Money_Deposited:
			$Number.hide()
			$Text.text = "Incorrect Amount"
			await get_tree().create_timer(1.0).timeout
			$Text.text = "Withdraw Money:"
		else:
			Global.Money_Deposited-=int(number)
			Global.Money+=int(number)

func _on_number_entered(text : String)-> void:
	if text.length()>10:
		$Text.hide()
	else:
		$Text.show()
	$Number.show()
	$Number.text = text
func _on_exit_pressed() -> void:
	$".".hide()
	$"../Bank_Menu".show()
