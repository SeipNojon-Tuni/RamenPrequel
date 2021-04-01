extends Light2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var maxVal = 1.7
var minVal = 0.8
var time = 3.7

onready var tween = get_node("../tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	tween.interpolate_property(self, "energy", minVal, maxVal, time, Tween.TRANS_SINE)
	tween.start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
	

# When glow is finished to maximum or minimum value.
func _on_tween_tween_completed(object, key):
	
	time = rand_range(1.5, 4.5)
	
	if (self.energy <= minVal + 0.1):
		tween.interpolate_property(self, "energy", minVal, maxVal, time, Tween.TRANS_SINE)
		tween.start()
		
	elif (self.energy >= maxVal - 0.1):
		tween.interpolate_property(self, "energy", maxVal, minVal, time, Tween.TRANS_SINE)
		tween.start()
	
	pass # Replace with function body.
