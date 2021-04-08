extends Node2D

onready var protag = $Protagonist
onready var enemy_back = $enemies
onready var enemy_front = $enemies2
onready var tween = $Tween

onready var exp1 = $Protagonist/protExp1
onready var exp2 = $Protagonist/protExp2
onready var exp3 = $Protagonist/protExp3

var moved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	move_element(protag, 9, 80, -60)
	move_element(enemy_front, 8, -80, 70)
	move_element(enemy_back, 5, -60, 30)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func move_element(element, time, offX, offY):
	var startX = element.position.x
	var startY = element.position.y
	
	tween.interpolate_property(element, 'position:x', startX, startX + offX, time, Tween.TRANS_SINE)
	tween.interpolate_property(element, 'position:y', startY, startY + offY, time, Tween.TRANS_SINE)
	tween.start()



func _on_Tween_tween_completed(object, key):
	
	# When protagonist stops moving trigger 
	if (object.name == "Protagonist" && !moved):
		# Only trigger after first sequence
		moved = true
		
		var startX = object.position.x
		var startY = object.position.y
		var startRot = object.rotation
		
		# start Explosions
		exp1.maxA = 1.0
		exp2.maxA = 1.0
		exp3.maxA = 1.0
		
		exp1.maxE = 0.6
		exp2.maxE = 0.6
		exp3.maxE = 0.6
		
		
		# Start crash animation
		tween.interpolate_property(object, 'position:x', startX, startX + 600, 9, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.interpolate_property(object, 'position:y', startY, startY + 600, 9, Tween.TRANS_LINEAR, Tween.EASE_IN)
		tween.interpolate_property(object, 'rotation', startRot, startRot + 7, 5, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
		
		tween.start()
		
		
		
