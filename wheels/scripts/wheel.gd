extends RigidBody2D

var rot_amount = 0
#trying out a control original rot = 2
var rot = 0
var rotating = false
#trying out a control original main_rot = 2
onready var main_rot = all.main_rot
var rot_number = 0
var touch_counts = 0
var start_spinning = false

onready var pad1_scene = load("res://scene/pad1.tscn")
#redpad
onready var pad2_scene = load("res://scene/pad2.tscn")
onready var circular_redpad = load("res://scene/circular_redpad.tscn")
onready var circular_purplepad = load("res://scene/circle_purplepad.tscn")
onready var triangle_redpad = load("res://scene/triangle_redpad.tscn")
onready var triangle_purplepad = load("res://scene/triangle_purplepad.tscn")

#purplepad
func _ready():
	twowheel()
	start_spinning = false
	pass # Replace with function body.

func clears():
	for child in get_children():
#		print(child.name)
		if child.get_name().find("redpad") != -1:
			child.play_exit = true
		if child.get_name().find("purplepad") != -1:
			child.play_exit = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if all.once == true:
#		all.clear = true
	if all.once == true:
		clears()
		all.delay = true
		$delay.start()
		$revert.start()
		if all.wheel_status =="twowheel":
			twowheel()
			all.once = false
		if all.wheel_status =="fourwheel":
			fourwheel()
			all.once = false
		if all.wheel_status =="fourwheelnorot":
			fourwheel_norot()
			all.once = false
		if all.wheel_status =="diamond":
			diamond()
			all.once = false
		if all.wheel_status =="h_shape":
			h_shape()
			all.once = false
		if all.wheel_status =="s_shape":
			s_shape()
			all.once = false
		if all.wheel_status =="twocircular":
			two_circular()
			all.once = false
		if all.wheel_status == "fourcircular":
			four_circular()
			all.once = false
		if all.wheel_status =="fourtriangle":
			four_triangle()
			all.once = false
			pass
	
	if start_spinning == true:
		main_rot = all.main_rot
	#	print(touch_counts)
		rot = lerp(rot,main_rot,0.2)
	#	if all.can_play == true:
		if rotating:
			angular_velocity = -rot
		else:
			angular_velocity= rot
	pass

func switchrot():
	rotating = !rotating
	pass

func clear():
	if has_node("redpad"):
		get_node("redpad").queue_free()
	if has_node("redpad2"):
		get_node("redpad2").queue_free()
	if has_node("redpad3"):
		get_node("redpad3").queue_free()
	if has_node("redpad4"):
		get_node("redpad4").queue_free()
	
	if has_node("purplepad"):
		get_node("purplepad").queue_free()
	if has_node("purplepad2"):
		get_node("purplepad2").queue_free()
	if has_node("purplepad3"):
		get_node("purplepad3").queue_free()
	if has_node("purplepad4"):
		get_node("purplepad4").queue_free()
		

func twowheel():
	var pad2 = pad2_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
#	pad2.name ="redpad"
	
	var pad1 = pad1_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
#	pad1.name ="purplepad"
	
	all.once = false
func fourwheel():
	
	var pad2 = pad1_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
#	pad2.name ="redpad"
	
	var pad1 = pad1_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
#	pad1.name ="purplepad"
	
	var pad3 = pad2_scene.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
	pad3.rotation_degrees = 90
#	pad3.name ="redpad2"

	var pad4 = pad2_scene.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
	pad4.rotation_degrees = 90
#	pad4.name ="purplepad2"
		
	all.once = false
	
func fourwheel_norot():
	
	var pad2 = pad1_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	#red
#	pad2.name ="redpad"
	
	var pad1 = pad1_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
	#purple
#	pad1.name ="purplepad"
	
	var pad3 = pad2_scene.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
#	pad3.name="redpad2"
		
	var pad4 = pad2_scene.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
#	pad4.name="purplepad2"

func s_shape():
	
	var pad2 = pad1_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	pad2.rotation_degrees=45
#	pad2.name ="redpad"
	
	var pad1 = pad1_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
	pad1.rotation_degrees=45
#	pad1.name ="purplepad"
	
	var pad3 = pad2_scene.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
	pad3.rotation_degrees = 90
	pad3.rotation_degrees=-45
#	pad3.name ="redpad2"

	var pad4 = pad2_scene.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
	pad4.rotation_degrees = 90
	pad4.rotation_degrees=-45
#	pad4.name ="purplepad2"
		
	all.once = false
	

func diamond():
	
	var pad2 = pad1_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $"top-left".position
	pad2.rotation_degrees=-45
#	pad2.name ="redpad"
	
	var pad1 = pad2_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $"top-right".position
	pad1.rotation_degrees=45
#	pad1.name ="purplepad"
	
	var pad3 = pad1_scene.instance()
	call_deferred("add_child",pad3)
	pad3.position = $"bottom-right".position
	pad3.rotation_degrees=-45
#	pad3.name ="redpad2"

	var pad4 = pad2_scene.instance()
	call_deferred("add_child",pad4)
	pad4.position = $"bottom-left".position
	pad4.rotation_degrees = 45
#	pad4.name ="purplepad2"
		
	all.once = false
	
	

func h_shape():
	
	var pad2 = pad1_scene.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	pad2.rotation_degrees=45
#	pad2.name ="redpad"
	
	var pad1 = pad1_scene.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
	pad1.rotation_degrees=45
#	pad1.name ="purplepad"
	
	var pad3 = pad2_scene.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
	pad3.rotation_degrees = 90
	pad3.rotation_degrees=45
#	pad3.name ="redpad2"

	var pad4 = pad2_scene.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
	pad4.rotation_degrees = 90
	pad4.rotation_degrees=45
#	pad4.name ="purplepad2"
		
	all.once = false
	
	
func two_circular():
	var pad2 = circular_redpad.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	pad2.rotation_degrees = 180
#	pad2.name ="redpad"
	
	var pad1 = circular_purplepad.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position

func four_circular():
	var pad2 = circular_redpad.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	pad2.rotation_degrees = 180
#	pad2.name ="redpad"
	
	var pad1 = circular_redpad.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
	
	var pad3 = circular_purplepad.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
	pad3.rotation_degrees = -90
#	pad2.name ="redpad"

	var pad4 = circular_purplepad.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
	pad4.rotation_degrees = 90
	
	
	
func four_triangle():
	var pad2 = triangle_redpad.instance()
	call_deferred("add_child",pad2)
	pad2.position = $down.position
	pad2.rotation_degrees = 180
#	pad2.name ="redpad"
	
	var pad1 = triangle_redpad.instance()
	call_deferred("add_child",pad1)
	pad1.position = $top.position
	
	var pad3 = triangle_purplepad.instance()
	call_deferred("add_child",pad3)
	pad3.position = $left.position
	pad3.rotation_degrees = -90
#	pad2.name ="redpad"

	var pad4 = triangle_purplepad.instance()
	call_deferred("add_child",pad4)
	pad4.position = $right.position
	pad4.rotation_degrees = 90





func _input(event):
	
	if all.gameover != true and all.can_play == true:
		if event is InputEventScreenTouch:
			
			if event.pressed:
				if start_spinning == false:
					start_spinning = true
					all.begin = true
				rot_amount = all.rot_amount
#				switchrot()
#				$doubleclick.start()
#				if touch_counts >= 1:
#					rot += rot_amount
				touch_counts += 1
				$Timer.start()
				if event.position.x <= 360:
#					switchrot()
#					rot += rot_amount
					if rotating == false:
						rotating = true
						rot_number = 0
					if rotating == true:
						rot_number += 1
					if rot_number >= 2:
						if touch_counts >= 2:
							rot += all.rot_amount
							pass
				if event.position.x > 360:

#					switchrot()
#
					if rotating == true:
						rotating = false
						rot_number = 0

					if rotating == false:
						rot_number += 1

					if rot_number >= 2:
						if touch_counts >= 2:
							rot += all.rot_amount
							pass



func _on_Timer_timeout():
	touch_counts = 0
	pass # Replace with function body.


func _on_doubleclick_timeout():
	if touch_counts < 2:
		switchrot()
	pass # Replace with function body.


func _on_delay_timeout():
	all.delay = false
	pass # Replace with function body.


func _on_revert_timeout():
	clears()
	twowheel()
	$delay.start()
	pass # Replace with function body.
