extends Sprite


# Declare member variables here. Examples:
var trueOffset = 0

export var offX = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x += offX


func _process(_delta):
	# Flow in again from left when offscreen
	if(position.x > 3000): 
		position.x = -2600
	else:
		position.x += offX
