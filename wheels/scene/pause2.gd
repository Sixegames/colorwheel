extends TouchScreenButton
var target_meet = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target_meet != true:
		var color = ColorN(all.color)
		
		var darker = color.darkened(0.4)
		var lighter = color.lightened(0.4)
		if all.color != "white":
			modulate = lighter
		if all.color == "white":
			modulate = darker
