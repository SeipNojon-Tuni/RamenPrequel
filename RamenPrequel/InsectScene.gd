extends Node2D

onready var ambience = get_node("/root/Ambience")

# Request to play ambience
func _ready():
	ambience.scene_loaded("SpurffVillage")
	pass
