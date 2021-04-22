extends Node2D

onready var _sound = get_node("/root/DialoguePlayer")
onready var ambience = get_node("/root/Ambience")

# Request to play ambience
func _ready():
	ambience.scene_loaded("Puzzle3")
	pass


var code="1234"
var place=0
func _on_InstruArea_mouse_entered():
	get_node("instruction").visible=true
func _on_InstruArea_mouse_exited():
	get_node("instruction").visible=false


func _on_DiamondArea_mouse_entered():
	Input.set_default_cursor_shape(2)
func _on_DiamondArea_mouse_exited():
	Input.set_default_cursor_shape(0)
func _on_DiamondArea_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
			if event.is_pressed():
				get_node("bridge").visible=true
				get_node("InstruArea").visible=false
				get_node("DiamondArea").visible=false
func add(name):
	
	# Play sound effect
	_sound.play_puzzle3()
	
	if name=="deaths":
		print("ee")
		get_tree().change_scene("res://Scenes/Puzzle1.tscn")
		
	if name==code.substr(place,1):
		place+=1
	elif name!=code.substr(place,1):
		get_tree().change_scene("res://Scenes/Puzzle1.tscn")
	if place==4:
		get_tree().change_scene("res://TheDiamondEye.tscn")
