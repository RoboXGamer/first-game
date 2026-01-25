extends Node2D

@export var player_controller : PlayerController
@onready var animation_player = $AnimatedSprite2D

func _process(_delta):
	if player_controller.velocity.length() > 0.0:
		#play Animations 
		if player_controller.player_facing == player_controller.Facing.DOWN:
			animation_player.play("Player_Down")
		if player_controller.player_facing == player_controller.Facing.UP:
			animation_player.play("Player_Up")
		if player_controller.player_facing == player_controller.Facing.LEFT:
			animation_player.play("Player_Left")
		if player_controller.player_facing == player_controller.Facing.RIGHT:
			animation_player.play("Player_Right")
		
	else:
		#Idle animations
		if player_controller.player_facing == player_controller.Facing.DOWN:
			animation_player.play("Idle_Down")
		if player_controller.player_facing == player_controller.Facing.UP:
			animation_player.play("Idle_Up")
		if player_controller.player_facing == player_controller.Facing.LEFT:
			animation_player.play("Idle_Left")
		if player_controller.player_facing == player_controller.Facing.RIGHT:
			animation_player.play("Idle_Right")
