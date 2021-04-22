extends Node2D

onready var _sound = get_node("/root/DialoguePlayer")
onready var ambience = get_node("/root/Ambience")

# Request to play ambience
func _ready():
	ambience.scene_loaded("Puzzle2")
	pass

var trycode = "$"
var code ="$2-5-6-4-1-12-3-10-7-8-11-9-"
var numbers=12
func add(name):
	
	# Play sound effect
	_sound.play_puzzle2()
	
	numbers-=1
	trycode+=name+"-"
	print(trycode)
	if(trycode==code):
		get_tree().change_scene("res://Scenes/Puzzle3.tscn")
	elif(numbers==0):
		# Play death sound
		_sound.play_audio("Keypad")
		get_tree().change_scene("res://Scenes/Puzzle1.tscn")
	if (!trycode in code):
		# Play death sound
		_sound.play_audio("Keypad")
		get_tree().change_scene("res://Scenes/Puzzle1.tscn")
