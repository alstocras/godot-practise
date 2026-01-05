extends CharacterBody2D


@export var repel_force = 5000
var polarity: int = 1
var force_vector: Vector2 = Vector2(0, 0)
var temp_force_vector: Vector2
var direction_vector: Vector2 = Vector2(0, 0)
var temp_direction_vector: Vector2

@onready var positive_texture := preload("res://sprites/player/proton.png")
@onready var negative_texture := preload("res://sprites/player/electron.png")
@onready var camera := $Camera2D

var target_zoom := Vector2(1, 1)

func _ready() -> void:
	add_to_group("players")

func _physics_process(delta: float) -> void:
	force_vector = Vector2.ZERO
	if Input.is_action_just_pressed("flip_player_polarity"):
		polarity *= -1
		sprite_update()
	for wall in get_tree().get_nodes_in_group("walls"):
		if wall.polarity != 0:
			temp_direction_vector = (global_position - wall.position).normalized()
			temp_force_vector = temp_direction_vector * polarity * wall.polarity * repel_force / ((global_position.distance_to(wall.position)) ** 2 + 1)
		force_vector += temp_force_vector
	velocity += force_vector
	move_and_slide()
			
	
		
func sprite_update() -> void:
	if polarity == 1:
		$Sprite2D.texture = positive_texture
	elif polarity == -1:
		$Sprite2D.texture = negative_texture
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("zoom_in"):
		target_zoom *= 1.1
	if Input.is_action_just_pressed("zoom_out"):
		target_zoom *= 0.9
	target_zoom = clamp(Vector2(1, 1), target_zoom, Vector2(4, 4))
	camera.zoom = camera.zoom.lerp(target_zoom, 0.1)


	
	
