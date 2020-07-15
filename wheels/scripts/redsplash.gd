extends RigidBody2D

var speed_x = 2000
var speed_x2 = 3000
var speed_y = 2000
var scale_amount = 0.165
var vel_x 
var vel_y 
var velocity = Vector2(0,0)
var once = false

func _ready():
	vel()
	color()
	randomize()
	scale_amount = rand_range(0.05,scale_amount)
	$Sprite.scale = Vector2(scale_amount,scale_amount)
	$CollisionShape2D.scale = Vector2(scale_amount,scale_amount)
	$Timer.wait_time = rand_range(0.1,1)
	$Timer.start()
	
	pass

func _process(delta):
	
	velocity = Vector2(vel_x,vel_y)
	linear_velocity += velocity *2* delta
	
	
func color():
	var col = randi()%6
	if col == 0:
		$Sprite.modulate = ColorN("red")
	if col == 1:
		$Sprite.modulate = ColorN("pink")
	if col == 2:
		$Sprite.modulate = ColorN("yellow")
	if col == 3:
		$Sprite.modulate = ColorN("cyan")
	if col == 4:
		$Sprite.modulate = ColorN("purple")
	if col == 5:
		$Sprite.modulate = ColorN("violet")

func vel():
	velocity_x()
	velocity_y()
	velocity = Vector2(vel_x,vel_y)

func velocity_x():
	randomize()
	var dir = randi()%5
	if dir == 0:
		vel_x = rand_range(0,speed_x)
		pass
	if dir == 1:
		randomize()
		vel_x = -speed_x2
	if dir == 2:
		vel_x = rand_range(0,-speed_x)
	if dir == 3:
		randomize()
		vel_x = speed_x2
	if dir == 4:
		randomize()
		vel_x = rand_range(-speed_x,speed_x)
		pass
func velocity_y():
	randomize()
	var dir = randi()%5
	if dir == 0:
		vel_y = rand_range(0,speed_y)
		pass
	if dir == 1:
		randomize()
		vel_y = -speed_y
	if dir == 2:
		vel_y = rand_range(0,-speed_y)
	if dir == 3:
		randomize()
		vel_y = speed_y
	if dir == 4:
		randomize()
		vel_y = rand_range(-speed_y,speed_y)
		pass


func _on_VisibilityNotifier2D_screen_exited():
#	print("left")
	queue_free()
	pass # Replace with function body.


func _on_Timer_timeout():
	$AnimationPlayer.play("New Anim")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
