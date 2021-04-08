extends Node2D

onready var sprite = $Sprite
onready var light = $Light2D
onready var tween = $Tween

var time = 1.5
export var minA = 0.0
export var maxA = 1.0

export var minE = 0.0
export var maxE = 0.6

export var timeOff = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	time = rand_range(0.8, 1.5) * abs(position.x)/ 1000 + timeOff
	
	tween.interpolate_property(sprite, 'modulate:a', minA, maxA, time, Tween.TRANS_EXPO)
	tween.interpolate_property(light, 'energy', minE, maxE, time, Tween.TRANS_EXPO)
	tween.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	time = rand_range(0.8, 1.5) * abs(position.x)/ 1000 + timeOff
	
	if(light.energy <= 0):
		tween.interpolate_property(sprite, 'modulate:a', minA, maxA, time, Tween.TRANS_EXPO)
		tween.interpolate_property(light, 'energy', minE, maxE, time, Tween.TRANS_EXPO)
	elif(light.energy >= 0.6):
		tween.interpolate_property(sprite, 'modulate:a', maxA, minA, time, Tween.TRANS_EXPO)
		tween.interpolate_property(light, 'energy', maxE, minE, time, Tween.TRANS_EXPO)
	
	tween.start()
