extends Sprite


func _ready():
	pass
	
func _process(delta):
	
		var color = ColorN(all.color)
		
		var darker = color.darkened(0.9)
		var lighter = color.lightened(0.9)
		if all.color != "white":
			modulate = lighter
		if all.color == "white":
			modulate = darker
