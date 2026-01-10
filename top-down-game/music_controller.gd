extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play_music(music: AudioStream):
	if music == stream and playing:
		pass
	else:
		stream = music
		play()
