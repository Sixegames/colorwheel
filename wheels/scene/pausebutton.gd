extends TouchScreenButton

var press = false
func _ready():
	
	pass

func _process(delta):
#	print(press)
	if all.begin == true and press == false:
		modulate = Color(1,1,1,1)
	if all.begin == false or press == true:
		modulate = Color(0,0,0,0)
		
	pass
	
func _input(event):

	if event is InputEventScreenTouch:
#		print(event.position)
		if event.pressed and get_parent().pause == true:
			get_parent().get_node("pause").hide()
			get_tree().paused = false
			get_parent().pause = false
			get_parent().pause_button = true
			modulate = Color(1,1,1,1)
			press = false
		if (get_global_mouse_position().x > self.global_position.x + 60)  or (get_global_mouse_position().x < self.global_position.x -30):
			get_parent().pause_button = true


func _on_pausebutton_pressed():
	press = true
	pass # Replace with function body.
