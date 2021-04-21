extends Area2D
onready var puzzleMaster2 = get_node("/root/Puzzle2")
onready var puzzleMaster3 = get_node("/root/Puzzle3")
func _on_puzzle2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
			if event.is_pressed():
				puzzleMaster2.add(name)


func _on_puzzle3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
			if event.is_pressed():
				puzzleMaster3.add(name)
