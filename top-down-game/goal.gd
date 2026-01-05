extends Area2D

@export var next_scene: String = "1"
var formatted_next_scene: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("finishes") 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("players"):
		formatted_next_scene = "res://level" + next_scene + ".tscn"
		print("Switching to scene" + formatted_next_scene)
		get_tree().call_deferred("change_scene_to_file", formatted_next_scene) # Replace with function body.
