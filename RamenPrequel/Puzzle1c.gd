extends Node2D

onready var _sound = get_node("/root/DialoguePlayer")

var puz1=null
var puz2=null
var puz3=null
func puzzle1(name,rottaa):
	
	# Play sound
	_sound.play_puzzle1()
	
	if(name=="puz1"):
		puz1=rottaa
	if(name=="puz2"):
		puz2=rottaa
	if(name=="puz3"):
		puz3=rottaa
	if(puz1==0&&puz2==90&&puz3==270 or puz1==180&&puz2==270&&puz3==90):
		print("jee")
		get_tree().change_scene("res://Scenes/Puzzle2.tscn")
