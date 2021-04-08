extends AudioStreamPlayer


# Restart ambient loop when ended
func _process(delta):
	if(!playing):
		play()
