extends Node2D
var items=7
func find():
	items=items-1
	if items==0:
		win()

func win():
	get_tree().change_scene("res://VictoryPlaceholder.tscn")
	
