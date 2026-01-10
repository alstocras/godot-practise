extends Node2D

var music := preload("res://music/menu.ogg")

func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _ready() -> void:
	MusicController.play_music(music)


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level0.tscn") # Replace with function body.
