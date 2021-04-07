extends AudioStreamPlayer


# Declare member variables here. Examples:
var cid = 0;
var current_bank = ""


# Play audio linked to currently played dialogue node
func set_dialogue_audio(record_name, did):
	# Set current names
	cid = did
	current_bank = record_name
	play_next_dialogue()

# Play the next audio file based on ongoing dialogue
func play_next_dialogue():
	reset_audio(current_bank, cid)
	cid += 1
	

# Stop audio if playing and start playing next audio by defined bank, id names
func reset_audio(bank, id):
	if(self.playing):
		self.stop()
	
	self.stream = load("res://Audio/dialogue/" + bank + "/Dialogue" + str(id) + ".wav")
	self.play()
