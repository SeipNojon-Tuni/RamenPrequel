extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var timeBetween = 1.5
export var lightningTime = 0.3

export var num = 1
onready var sprite = $Sprite
onready var glow = $LightningGlow

onready var timer = get_node("Timer")

# Don't show on start
func _ready():
	
	# Set sprites based on numerating
	sprite.texture = load("res://Sprites/SpurffWorld/Lightning/lightning"+String(num)+".png") 
	glow.texture = load("res://Sprites/SpurffWorld/Lightning/lightning"+String(num)+"glow.png") 
	
	modulate.a = 0
	glow.energy = 0
	timer.set_one_shot(true)
	timer.start(timeBetween)


func _on_Timer_timeout():
	if(modulate.a == 0):
		modulate.a = 0.6
		glow.energy = 0.3
		timer.start(lightningTime)
	else:
		modulate.a = 0
		glow.energy = 0
		var time = rand_range(timeBetween-0.5, timeBetween+0.5)
		
		timer.start(time)
