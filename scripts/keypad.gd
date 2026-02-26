extends Control

signal num_confirm(final_num: String)
var num = ''
var num_len = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_number_pressed(extra_arg_0: int) -> void:
	if extra_arg_0 == 0 and num_len == 0:
		return
	num_len+=1
	num+=str(extra_arg_0)

func _on_delete_pressed() -> void:
	if num_len<=0:
		return
	num=num.substr(0,num_len-1)
	num_len-=1

func _on_confirm_pressed() -> void:
	num_confirm.emit(int(num))
	num=''
	num_len=0
