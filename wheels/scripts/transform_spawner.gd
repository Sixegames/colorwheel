extends Node2D

onready var wheel_scene = load("res://scene/transform.tscn")
var once = false
var transform_wheel = 0

func _ready():
	pass

func _process(delta):
	if all.begin == true and once == false:
		once = true
		$Timer.start()
	if all.begin == false and once == true:
		$Timer.stop()
		once = false
		
		


func _on_Timer_timeout():
	if all.begin == true and all.gameover == false:
		$Timer.wait_time += 5
		transform_wheel += 1
		if transform_wheel >= 4:
			if all.transform_amount <= 9:
				all.transform_amount += 1
			transform_wheel = 0
		spawn_wheel()
	pass # Replace with function body.
	

func spawn_wheel():
	var wheel = wheel_scene.instance()
	call_deferred("add_child", wheel)
	wheel.position = Vector2(360,-10)
