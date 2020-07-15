extends Node2D

export var speed_amount = 77
var speed = 0
var press = false 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	print($body/about.global_position.x)
#	VisualServer.set_default_clear_color(all.color)
#	var color = all.color
#
#	var darker = color.darkened(0.35)
#	modulate = darker
#	$down.modulate = color.darkened(0.5)
	speed = lerp(speed,0,0.1)
	$body.move_local_x(speed)
	pass
	

func _on_leftarrow_pressed():
	if press == false:
		if $body/options.global_position.x >= 700:
			speed = -speed_amount
		$Buttonanim.play("leftbutton")
		press = true
	pass # Replace with function body.


func _on_rightarrow_pressed():
	if press == false:
		if $body/about.global_position.x <= 0 :
			speed = speed_amount
		press = true
		$Buttonanim.play("rightbutton")
		
	pass # Replace with function body.


func _on_Buttonanim_animation_finished(anim_name):
	press = false
	pass # Replace with function body.


func _on_play_pressed():
	if press == false:
		get_parent().get_node("AnimationPlayer").play("exit")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "exit":
		get_tree().change_scene("res://scene/Mainscene.tscn")
	pass # Replace with function body.


func _on_options_pressed():
	if press == false:
		$optionspress.play("optionenter")
		press = true
	pass # Replace with function body.


func _on_down_pressed():
	$optionspress.play("optionexit")
	press = false
	pass # Replace with function body.


func _on_about_pressed():
	if press == false:
		$optionspress.play("optionenter")
		press = true
	pass # Replace with function body.
