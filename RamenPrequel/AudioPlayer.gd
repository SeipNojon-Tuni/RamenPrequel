extends AudioStreamPlayer


# Declare member variables here. Examples:
var cid = 1;
var current_bank = ""
var rng = RandomNumberGenerator.new()

var banks = {"obeep": 8, "tinheart": 8, "elder": 5, "guard": 5}
var translate = {"O'Beep": "obeep", "TinHeart": "tinheart", "Spurff Elder": "elder", "Spurff Guard": "guard"}


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

func play_audio(bank):
	if(self.playing):
		self.stop()
	
	
	var cleanBank = translate[bank]
	
	print("Current audio bank name " + cleanBank)
		
	if(cleanBank in banks):
		
		# Get random audio from sample bank by actor name
		var id = rng.randi_range(1, banks[cleanBank])
		
		self.stream = load("res://Audio/dialogue/" + cleanBank + "/" + cleanBank + str(id) + ".wav")
		self.play()

# Stop audio if playing and start playing next audio by defined bank, id names
func reset_audio(bank, id):
	if(self.playing):
		self.stop()
	
	self.stream = load("res://Audio/dialogue/" + bank + "/Dialogue" + str(id) + ".wav")
	self.play()
