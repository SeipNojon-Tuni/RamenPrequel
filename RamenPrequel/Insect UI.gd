extends Control

onready var scoreText = get_node("ScoreText")

var score = 0
var value = 1


func set_score_text ():
	scoreText.text = str("Blight bugs collected: ",score,"/11")
	
func collect_insect():
		score += value
		set_score_text()
		if win():
			get_tree().change_scene("res://Scenes/MainMenu.tscn")
			queue_free()
	
func win ():
	if score == 11:
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
	

func _on_Insect_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			collect_insect()




func _on_Insect5_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			collect_insect()



func _on_Insect2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			collect_insect()


func _on_Insect3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			collect_insect()


func _on_Insect4_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			collect_insect()
