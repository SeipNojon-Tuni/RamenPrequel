extends Sprite

var tween = Tween.new()

# Declare member variables here. Examples:
var orig_rot = 0
var mod = 1
var time = 2
var randGen = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	orig_rot = rotation
	time = randGen.randf_range(1.4, 2.7) * abs(self.position.x / 10)
	add_child(tween)
	tween.interpolate_property(self, 'rotation', orig_rot, orig_rot+0.1, 2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

# Change rotation between two values within random time frame
func _process(_delta):
	randGen.randomize()
	time = randGen.randf_range(1.4, 2.7) * abs(self.position.x / 10)
	
	if(rotation > orig_rot + 0.1 ):
		tween.interpolate_property(self, 'rotation', orig_rot+0.1, orig_rot-0.1, time, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	elif(rotation < orig_rot - 0.1 ):
		tween.interpolate_property(self, 'rotation', orig_rot-0.1, orig_rot+0.1, time, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

	#rotation = rotation + mod * 0.1 * delta
