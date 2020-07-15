extends Label


func _process(delta):
	var color = ColorN(all.color)
		
	var darker = color.darkened(0.4)
	var lighter = color.lightened(0.4)
	if all.color != "white":
		modulate = lighter
	if all.color == "white":
		modulate = darker
	pass
