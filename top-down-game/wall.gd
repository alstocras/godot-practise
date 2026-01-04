extends CharacterBody2D

@export var polarity := 0

@onready var neutral_texture = preload("res://sprites/environment/walls/neutral-wall.png")
@onready var positive_texture = preload("res://sprites/environment/walls/pos-wall.png")
@onready var negative_texture = preload("res://sprites/environment/walls/neg-wall.png")
@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("walls")
	update_visuals() # Replace with function body.


func update_visuals() -> void:
	if polarity == 0:
		sprite.texture = neutral_texture
	elif polarity == 1:
		sprite.texture = positive_texture
	elif polarity == -1:
		sprite.texture = negative_texture
