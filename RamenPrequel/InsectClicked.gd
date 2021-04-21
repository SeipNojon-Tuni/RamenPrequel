extends Area2D

onready var sprite = $Sprite
onready var ui = get_node("res://Insect UI.gd")
export var value = 1
var score : int = 0

func _ready():
	pass # Replace with function body.


func _on_Insect_mouse_entered():
	sprite.modulate = Color(0.65, 0.65, 0.65)

func _on_Insect_mouse_exited():
	sprite.modulate = Color(1, 1, 1)


func _on_Insect_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			queue_free()
		if win():
			print("Win")
			queue_free()

func win():
	score == 8

