extends Control

@onready var label: Label = $TextureRect/Money

@onready var player : CharacterBody2D = $"../../Player"

func _process(_delta: float) -> void:
	label.text = str(Global.Money)
