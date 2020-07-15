extends RigidBody2D
onready var splash_scene = load("res://scene/red.tscn")
onready var miss_scene = load("res://scene/miss.tscn")
onready var red_scene = load("res://scene/redsplash.tscn")
var purple = false
#it helps the code to judge if it touches the ball
var once = false
onready var speed = all.speed
onready var max_speed = all.max_speed
var vel = Vector2(0,0)
var offset = Vector2(0,0)
var stop_vel = Vector2(0,0)
var trail_off = false

#screen entered to know if baal has spawned
var entered = false
var color = "red"
var color_once = false

#effects
var effect ="linear"
var offset_y = 10

func _ready():
	$Sprite.modulate = ColorN(all.redpad_color)

	start_speed()
	randomize()
#	if effect == "zigzag":
#		$AnimationPlayer.play("zigzag")
#		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity += vel * delta
		
	
	if color != all.redpad_color :
		$Sprite.modulate = ColorN(all.redpad_color)
		color = all.redpad_color
		
#
#	if effect =="circular":
#		$Sprite.rotation += PI * delta
#		$Sprite.offset = Vector2(0,offset_y)
#		$Sprite/rot.position.y = offset_y
#		$CollisionShape2D.global_position = $Sprite/rot.global_position
#		$Area2D.global_position = $Sprite/rot.global_position
#		$miss.global_position = $Sprite/rot.global_position
#	else:
#		$CollisionShape2D.global_position = $Sprite.global_position
#		$Area2D.global_position = $Sprite.global_position
#		$miss.global_position = $Sprite.global_position
#		$Sprite/rot.global_position = $Sprite.global_position
	
	pass

func start_speed():
	randomize()
	speed = rand_range(speed,max_speed)
	if all.spawn_pos == "top-left":
		randomize()
		vel = Vector2(rand_range(0,speed),speed)
	if all.spawn_pos == "top-right":
		randomize()
		vel = Vector2(rand_range(-speed,0),speed)
	if all.spawn_pos == "right-top":
		randomize()
		vel = Vector2(-speed,rand_range(0,speed))
	if all.spawn_pos == "right-down":
		randomize()
		vel = Vector2(-speed,rand_range(-speed,0))
	
	if all.spawn_pos == "down-left":
		randomize()
		vel = Vector2(rand_range(0,speed),-speed)
		
	if all.spawn_pos == "down-right":
		randomize()
		vel = Vector2(rand_range(-speed,0),-speed)
		
	if all.spawn_pos == "left-top":
		randomize()
		vel = Vector2(speed,rand_range(0,speed))
		
	if all.spawn_pos == "left-down":
		randomize()
		vel = Vector2(speed,rand_range(-speed,0))
	
	
func miss():
	var miss = miss_scene.instance()
	get_parent().add_child(miss)
	miss.position = $Sprite.global_position
	miss.set_as_toplevel(true)
	
	

func splash():
	var splash = splash_scene.instance()
	get_parent().call_deferred("add_child",splash)
	splash.position = $Sprite.global_position
	splash.set_as_toplevel(true)
	
func red_splash():
	var reds = red_scene.instance()
	
	get_parent().call_deferred("add_child",reds)
	reds.position = $Sprite.global_position
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


func _on_Area2D_body_entered(body):
	if body.get_name().find("redpad") != -1:
		splash()
		queue_free()
		if all.gameover != true:
			if all.can_play == true:
				all.score += 1
		trail_off = true
	if body.get_name().find("purplepad") != -1:
		purple = true
		if all.can_play == true and all.delay != true:
				all.gameover = true
	
	pass # Replace with function body.



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	
	$exit_screen.start()
	pass # Replace with function body.


func _on_exit_screen_timeout():
	queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_viewport_entered(viewport):
	
	entered = true
	pass # Replace with function body.


func _on_enter_screen_timeout():
	if entered == false:
		queue_free()
	pass # Replace with function body.


func _on_miss_body_entered(body):
	pass # Replace with function body.


func _on_miss_body_exited(body):
	if body.get_name().find("purplepad") != -1:
		if purple!= true:
			miss()
	pass # Replace with function body.


