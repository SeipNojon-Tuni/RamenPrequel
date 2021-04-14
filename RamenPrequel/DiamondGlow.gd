extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var maxVal = 0.9
export var minVal = 0.2
export var time = 1.7

onready var tween = get_node("../Tween")
var rot = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rot = rotation
	
	tween.interpolate_property(self, "energy", minVal, maxVal, time, Tween.TRANS_SINE)
	tween.interpolate_property(self, "rotation", rot - 0.15, rot + 0.15, time*3, Tween.TRANS_SINE)
	tween.start()
	

func _on_Tween_tween_completed(_object, _key):	

	var newTime = time #abs(rand_range((time - 0.5), (time + 0.5)))
	
	if(_key == ":energy"):
		if (energy <= minVal + 0.05):
			tween.interpolate_property(self, "energy", minVal, maxVal, newTime, Tween.TRANS_SINE)
			tween.start()
			
		elif (energy >= maxVal - 0.05):
			tween.interpolate_property(self, "energy", maxVal, minVal, newTime, Tween.TRANS_SINE)
			tween.start()
	elif(_key == ":rotation"):
		# Rotate glow
		if(rotation >= rot + 0.15):
			tween.interpolate_property(self, "rotation", rotation, rot - 0.1, newTime*3, Tween.TRANS_SINE)
		elif(rotation <= rot - 0.15):
			tween.interpolate_property(self, "rotation", rotation, rot + 0.1, newTime*3, Tween.TRANS_SINE)
