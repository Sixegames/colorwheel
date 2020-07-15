extends Node2D

export var timer_counts = float(2)
onready var color_scene = load("res://scene/colors.tscn")
onready var ai_scene = load("res://scene/ai.tscn")
var pos =""

func _ready():
	$Timer.wait_time = timer_counts
#	print($Timer.wait_time)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(get_child_count())
#	print(all.speed)
#	print(all.rot)
	pass

func spawn_color():
	var color = color_scene.instance()
	randomize()
	randomize()
	var color_points = randi()%8
	if color_points == 0:
		randomize()
		all.spawn_pos = "top-left"
		randomize()
		color.position = $"top-left".position
		#top-left
		
	if color_points == 1:
		randomize()
		all.spawn_pos = "top-right"
		randomize()
		color.position = $"top-right".position
		#top-right
		
	if color_points == 2:
		randomize()
		all.spawn_pos = "right-top"
		randomize()
		color.position = $"right-top".position
		#right-top
	if color_points == 3:
		randomize()
		all.spawn_pos = "right-down"
		randomize()
		color.position = $"right-down".position
		#right-down
	if color_points == 4:
		randomize()
		all.spawn_pos = "down-left"
		randomize()
		color.position = $"down-left".position
		#down-left
	if color_points == 5:
		randomize()
		all.spawn_pos = "down-right"
		randomize()
		color.position = $"down-right".position
		#down-right
	if color_points == 6:
		randomize()
		all.spawn_pos = "left-top"
		randomize()
		color.position = $"left-top".position
		#left-top
	if color_points == 7:
		randomize()
		all.spawn_pos = "left-down"
		randomize()
		color.position =$"left-down".position
		#left-down
	add_child(color)
		

func spawn_ai():
	var color = ai_scene.instance()
	randomize()
	randomize()
	var color_points = randi()%8
	if color_points == 0:
		randomize()
		all.spawn_pos = "top-left"
		randomize()
		color.position = $"top-left".position
		#top-left
		
	if color_points == 1:
		randomize()
		all.spawn_pos = "top-right"
		randomize()
		color.position = $"top-right".position
		#top-right
		
	if color_points == 2:
		randomize()
		all.spawn_pos = "right-top"
		randomize()
		color.position = $"right-top".position
		#right-top
	if color_points == 3:
		randomize()
		all.spawn_pos = "right-down"
		randomize()
		color.position = $"right-down".position
		#right-down
	if color_points == 4:
		randomize()
		all.spawn_pos = "down-left"
		randomize()
		color.position = $"down-left".position
		#down-left
	if color_points == 5:
		randomize()
		all.spawn_pos = "down-right"
		randomize()
		color.position = $"down-right".position
		#down-right
	if color_points == 6:
		randomize()
		all.spawn_pos = "left-top"
		randomize()
		color.position = $"left-top".position
		#left-top
	if color_points == 7:
		randomize()
		all.spawn_pos = "left-down"
		randomize()
		color.position =$"left-down".position
		#left-down
	add_child(color)
		

#randomize bteween color and the ai
func spawn():
	randomize()
	randomize()
	var spawning = randi()%2
	randomize()
	if spawning == 0:
		spawn_color()
	if spawning == 1:
		spawn_ai()

func _on_Timer_timeout():
	if all.begin == true:
		spawn()
	pass # Replace with function body.


func _on_timereduce_timeout():
	if all.begin == true and all.gameover == false:
		all.max_speed += 2
		all.speed += 2
		all.main_rot += 0.025
		all.rot_amount += 0.025
		all.rain_speed += 0.01
		
		if $Timer.wait_time >= 0.5:
			$Timer.wait_time -= 0.0125
		
		
		
	pass # Replace with function body.
