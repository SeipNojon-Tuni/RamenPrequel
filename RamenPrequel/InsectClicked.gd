extends Area2D

onready var sprite = $Sprite

func _ready():
	pass # Replace with function body.


func _on_Insect_mouse_entered():
	sprite.modulate = Color(0.65, 0.65, 0.65)

func _on_Insect_mouse_exited():
	sprite.modulate = Color(1, 1, 1)


func _on_Insect_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_child($Sprite)
			remove_child($CollisionPolygon2D)


func _on_Insect5_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_child($Sprite)
			remove_child($CollisionPolygon2D)


func _on_Insect2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_child($Sprite)
			remove_child($CollisionPolygon2D)


func _on_Insect3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_child($Sprite)
			remove_child($CollisionPolygon2D)


func _on_Insect4_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			remove_child($Sprite)
			remove_child($CollisionPolygon2D)


func _on_Insect5_mouse_exited():
	sprite.modulate = Color(1, 1, 1)
