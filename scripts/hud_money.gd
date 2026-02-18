extends Sprite2D

@onready var label: Label = $Money

@onready var player : CharacterBody2D = $".."

func _process(_delta: float) -> void:
	label.text = str(player.Money)
