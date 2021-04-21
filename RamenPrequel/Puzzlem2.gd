extends Node2D
var trycode = ""
var code ="2-5-6-4-1-12-3-10-7-8-11-9-"
var numbers=12
func add(name):
	numbers-=1
	trycode+=name+"-"
	print(trycode)
	if(trycode==code):
		get_tree().change_scene("res://Scenes/Puzzle3.tscn")
	elif(numbers==0):
		get_tree().change_scene("res://Scenes/Puzzle1.tscn")

