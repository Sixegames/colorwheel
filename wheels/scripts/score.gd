extends Label

var target_meet = false

func _ready():
#	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	all.target = stepify(all.target,10)
#	if all.can_play == true:
#		show()
	if all.score >= all.target and target_meet == false:
		all.congrats = true
		target_meet = true
		$AnimationPlayer2.play("New Anim")
#	if target_meet != true:
#		var color = ColorN(all.color)
#
#		var darker = color.darkened(0.4)
#		var lighter = color.lightened(0.4)
#		if all.color != "white":
#			modulate = lighter
#		if all.color == "white":
#			modulate = darker
#	elif target_meet == true:
#		if all.color != "white":
#			modulate = ColorN("white")
#		if all.color == "white":
#			modulate = ColorN("black")
	if all.gameover != true:
		text = str(all.score,"/",all.target)
	pass
