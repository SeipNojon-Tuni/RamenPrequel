extends Area2D

onready var sprite = $Sprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Object_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("Object Clicked")
			queue_free()

func _on_Object_mouse_entered():
	sprite.modulate = Color(0.65, 0.65, 0.65)


func _on_Object_mouse_exited():
	sprite.modulate = Color(1, 1, 1)
