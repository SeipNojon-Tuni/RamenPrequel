extends AudioStreamPlayer


var music_book = {"Wasteland": "Wasteland_ambience",
				  "MainMenu": "Beyond the Stars", 
				  "Credits": "Last of our kind",
				  "SpurffCave": "Echoes from the Void",
				  "Puzzle1": "Eye Ever Watchful",
				  "Puzzle2": "Eye Ever Watchful",
				  "Puzzle3": "Eye Ever Watchful",
				  "SpurffVillage": "The Undertribe"}
				
var current_track = ""


func _process(_delta):
	
	# If song stops replay
	if(!playing):
		replay_current()

func scene_loaded(name):
	
	if(!name):
		print("No name for loaded scene in Ambience player!")
	elif( music_book.has(name) ):
		stop()
		set_music(name)
		play()
		print("Playing music for " + name)
	else:
		print("No music for scene " + name)

# Set music stream by bank name
func set_music(name):
	var track = music_book[name]
	if(track != current_track):
		current_track = track
		stream = load("res://Audio/music/" + track + ".wav")

# Replay latest track
func replay_current():
	stream = load("res://Audio/music/" + current_track + ".wav")
