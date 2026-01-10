extends Node2D

var music := preload("res://music/gameplay-ambient.ogg")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicController.play_music(music) # Replace with function body.
