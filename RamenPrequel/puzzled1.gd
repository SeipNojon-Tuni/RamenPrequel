extends Area2D
onready var puzzleMaster = get_node("/root/Puzzle1")
func _on_Puzzle1_input_event(_viewport, event, _shape_idx):
		if event is InputEventMouseButton:
			if event.is_pressed():
				
				print(name + " rotating " + str(rotation_degrees) + ">" + str(round(rotation_degrees+90)))
				
				rotation_degrees=round(rotation_degrees+90)
				
				if rotation_degrees==360:
					rotation_degrees=0
				puzzleMaster.puzzle1(name,rotation_degrees)
