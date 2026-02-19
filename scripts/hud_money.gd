extends Sprite2D

@onready var label: Label = $Money

func _process(_delta: float) -> void:
	label.text = str(Global.Money)
