extends Node2D

onready var ambience = get_node("/root/Ambience")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	set_process_input(true) 
	##This may or may not be required for inputs to work.

# Show / hide with escape
func _input(_ev):
	if ( Input.is_action_just_released("Menu")):
		visible = !visible
		if(visible):
			get_child(0).get_child(0).show()
		else:
			get_child(0).get_child(0).hide()
		


func _on_Quit_pressed():
	get_tree().quit()


func _on_ReturnMenu_pressed():
	
	# Only return to menu if not in mainmenu
	if(get_tree().get_current_scene().get_name() != "MainMenu"):
		get_tree().change_scene("res://Scenes/MainMenu.tscn")




func _on_HSlider_value_changed(value):
	ambience.set_volume(value)
