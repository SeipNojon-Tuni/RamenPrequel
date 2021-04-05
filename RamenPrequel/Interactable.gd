extends Node2D

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Mouse hover event on item, tint
func _on_MouseTrigger_mouse_entered():
	sprite.modulate = Color(0.65, 0.65, 0.65)
	
		
func _on_MouseTrigger_mouse_exited():
	sprite.modulate = Color(1.0, 1.0, 1.0)
