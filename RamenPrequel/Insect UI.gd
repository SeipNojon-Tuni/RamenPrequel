extends Control

onready var scoreText = get_node("ScoreText")

func set_score_text (score):

	scoreText.text = str("Blight bugs collected: ",score,"/8")

func _ready ():
 
	scoreText.text = "Blight bugs collected: 0/8"
