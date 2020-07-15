extends Node2D

var once = false
var pause = false
var pause_button = true

# Called when the node enters the scene tree for the first time.
func _ready():
	all.redpad_color ="pink"
	all.purple_color ="purple"
	all.congrats = false
	all.gameover = false
	all.score = 0
	all.speed = 110
	all.max_speed = 210
	all.rot_amount = 30
	all.main_rot = 3
	all.can_play = true
	
	pass # Replace with function body.
#
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST and pause == false and all.gameover == false and all.begin == true:
		$pause.show()
		get_tree().paused = true
		pause = true
#		$pause/anim_p.play("New Anim")


	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST and pause == true and all.gameover == false and all.begin == true:
		$pause.hide()
		get_tree().paused = false
		pause = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(pause_button)
#	print(get_child_count())
#	print(all.stars)
#	print(all.begin)
#	print(all.mainscene)
	if all.camera_shake == true:
		$camerashake.play("shake")
		all.camera_shake = false
		
	if all.gameover == true and once == false :
		once = true
		$AnimationPlayer.play("New Anim")
#		$flash_anim.play("flash")
		all.begin = false
#	if all.gameover == true and once == false and all.congrats == true:
#		once = true
#		$AnimationPlayer.play("congrats")
#		all.begin = false
##		$flash_anim.play("flash")
#
		if all.score >= all.highscore:
			all.highscore = all.score
			all.save_score()
			
		
	pass

func _on_Button_pressed():
	#1
	get_tree().reload_current_scene()
	$gameover.hide()
	once = false
	all.no_intro = true
	all.can_play = true
	all.congrats = false
	#retry
	pass # Replace with function body.


func _on_Button2_pressed():
	#3 home
	get_tree().reload_current_scene()
	$gameover.hide()
	once = false
	all.no_intro = false
	all.mainscene = false
	all.congrats = false
	#home
	pass # Replace with function body.



func _on_AnimationPlayer_animation_finished(anim_name):
	if all.score >= all.target:
			all.target += all.score
			all.save_score()
	pass # Replace with function body.


func _on_pausebutton_pressed():
	#
	if all.gameover != true and all.begin == true:
		pause_button = !pause_button
		print("pressed")
		if pause_button == false:
			$pause.show()
			get_tree().paused = true
			pause = true
			
			
		if pause_button == true:
			$pause.hide()
			get_tree().paused = false
			pause = false
			
	pass # Replace with function body.


func _on_continue_pressed():
	#2
	$gameover.hide()
	once = false
	all.no_intro = true
	all.can_play = true
	all.congrats = false
	all.gameover = false
	$wheel/delay.start()
	all.begin = true
	pass # Replace with function body.


