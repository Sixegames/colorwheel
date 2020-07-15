extends Label


func _ready():
	pass

func _process(delta):
	if all.congrats != true:
		text = str("Game") + str("Over")
		
	else:
		text = str("Congrats Yu passed the checkmark")
		
