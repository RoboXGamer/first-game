extends Node2D

@export var Playlist : Array[AudioStream] = []
var current_track = 0
@onready var player = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_track()

func _process(_delta: float) -> void:
	if player.playing != true:
		next_track()
		
func next_track():
	current_track = current_track+1
	if current_track > Playlist.size():
		current_track = 0

func play_track():
	if Playlist.size()>0:
		player.stream = Playlist[current_track]
		player.play()
