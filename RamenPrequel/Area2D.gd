extends Area2D

var place=0




func _on_Area2D_mouse_entered():
	Input.set_default_cursor_shape(2)
	
func _on_Area2D_mouse_exited():
	Input.set_default_cursor_shape(0)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Puzzle1.tscn")
			
