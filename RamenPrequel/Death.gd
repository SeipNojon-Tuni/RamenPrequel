extends Node2D

onready var _sound = get_node("/root/Ambience")
onready var _effect = get_node("/root/DialoguePlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	_effect.play_death()
	_effect.play_crash()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
