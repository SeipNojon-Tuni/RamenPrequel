extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var maxVal = 0.9
export var minVal = 0.2
export var time = 1.7

onready var tween = get_node("../Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	tween.interpolate_property(self, "energy", minVal, maxVal, time, Tween.TRANS_SINE)
	tween.start()
	

func _on_Tween_tween_completed(_object, _key):	

	time = abs(rand_range((_object.time - 0.5), (_object.time + 0.5)))
	
	if (_object.energy <= _object.minVal + 0.1):
		tween.interpolate_property(_object, "energy", _object.minVal, _object.maxVal, time, Tween.TRANS_SINE)
		tween.start()
		
	elif (_object.energy >= _object.maxVal - 0.1):
		tween.interpolate_property(_object, "energy", _object.maxVal, _object.minVal, time, Tween.TRANS_SINE)
		tween.start()
	
