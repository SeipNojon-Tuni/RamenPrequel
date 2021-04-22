extends Node2D

onready var ambience = get_node("/root/Ambience")

# Request to play ambience
func _ready():
	ambience.scene_loaded("Wasteland")
	pass

var items=7
func find():
	items=items-1
	if items==0:
		win()

func win():
	get_tree().change_scene("res://VictoryPlaceholder.tscn")
	
