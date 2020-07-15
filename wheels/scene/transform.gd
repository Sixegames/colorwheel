extends Node2D

var speed = 2
onready var red_scene = preload("res://scene/redsplash.tscn")

func _ready():
	pass

func _process(delta):
	$Area2D.rotate(0.02)
	move_local_y(speed)

func red_splash():
	var reds = red_scene.instance()
	
	get_parent().call_deferred("add_child",reds)
	reds.position =self.global_position
	reds.set_as_toplevel(true)


	
func splashedred():
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	red_splash()
	

func _on_VisibilityNotifier2D_screen_exited():
#	print("left")
	queue_free()
	pass # Replace with function body.

func color_rand():
	randomize()
	var cr = randi()%5
	if cr == 0:
		all.redpad_color ="yellow"
		all.purple_color ="teal"
	if cr == 1:
		all.redpad_color ="green"
		all.purple_color ="violet"
	if cr == 2:
		all.redpad_color ="cyan"
		all.purple_color ="pink"
	if cr == 3:
		all.redpad_color ="indianred"
		all.purple_color ="gold"
	if cr ==4:
		all.redpad_color = "crimson"
		all.purple_color = "purple"
	pass



func _on_Area2D_body_entered(body):
	if body.get_name().find("purplepad") != -1 or body.get_name().find("redpad") != -1:
		splashedred()
		queue_free()
		transformed()
		color_rand()
		all.camera_shake = true
		all.once = true
	pass # Replace with function body.

func transformed():
	randomize()
	var t = randi()%all.transform_amount
	
	if t == 0:
		all.wheel_status ="twowheel"
	if t == 1:
		all.wheel_status ="fourwheel"
	if t == 2:
		all.wheel_status ="twocircular"
	if t == 3:
		all.wheel_status ="fourwheelnorot"
	if t == 4:
		all.wheel_status ="s_shape"
	if t == 5:
		all.wheel_status ="fourcircular"
	if t == 6:
		all.wheel_status = "fourtriangle"
	if t == 7:
		all.wheel_status ="h_shape"
	if t == 8:
		all.wheel_status ="diamond"
		
