extends Node2D

@export var Playlist: Array[AudioStream] = []
var current_track = 0
@onready var player = $AudioStreamPlayer2D

func _ready():
	player.finished.connect(_on_player_finished)
	play_track()

func _on_player_finished():
	next_track()

func next_track():
	current_track += 1
	if current_track >= Playlist.size():
		current_track = 0
	play_track()

func play_track():
	if Playlist.size() > 0:
		player.stream = Playlist[current_track]
		player.play()
