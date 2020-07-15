extends Label


func _ready():
	pass

func _process(delta):
	if all.congrats != true:
		text = str("HIGHSCORE:",all.highscore)
	if all.congrats == true:
		text = str("NEW HIGHSCORE:",all.highscore)
