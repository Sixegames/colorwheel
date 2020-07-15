extends Node2D
var sun = false
var music = true
var sound = true
onready var admob = $Admob
onready var main_scene = preload("res://scene/Mainscene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
#	all.show_ad_banner()
	admob.load_banner()
	get_tree().connect("screen_resized", self, "_on_resize")
	all.load_score()
	all.gameover = false
#	VisualServer.set_default_clear_color(ColorN(all.color))
	if all.no_intro != true:
		$intro.play("enters")
		all.can_play = false
#		get_tree().paused = true
	if all.no_intro == true:
		queue_free()
		mainScene()
	pass # Replace with function body.
	

func _on_resize():
#	debug_out.text = debug_out.text + "Banner resized\n"
	admob.banner_resize()
#
func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST and all.mainscene == false :
		get_tree().quit()


func _process(delta):
	if sound == true:
		$soundon.show()
		$soundoff.hide()
	if sound == false:
		$soundon.hide()
		$soundoff.show()
	if music == true:
		$musicon.show()
		$musicoff.hide()
	if music == false:
		$musicon.hide()
		$musicoff.show()

func _on_play_pressed():
	$intro.play("exit")
	all.can_play = true
	pass # Replace with function body.


func _on_intro_animation_finished(anim_name):
	if anim_name =="exit":
#		get_tree().paused = false
		all.mainscene = true
	pass # Replace with function body.
#
#
#func _on_sun_pressed():
#	sun = false
#	all.color = "black"
#	VisualServer.set_default_clear_color(Color("171717"))
##
##	all.color = "white"
##	VisualServer.set_default_clear_color(ColorN(all.color))
#	pass # Replace with function body.

#
#func _on_moon_pressed():
#	sun = true
##	all.color = "black"
##	VisualServer.set_default_clear_color(ColorN(all.color))
##
#	all.color = "white"
#	VisualServer.set_default_clear_color(ColorN(all.color))
#
#
#	pass # Replace with function body.


func _on_musicon_pressed():
	music = false
	pass # Replace with function body.


func _on_musicoff_pressed():
	music = true
	pass # Replace with function body.


func _on_soundon_pressed():
	sound = false
	pass # Replace with function body.


func _on_soundoff_pressed():
	sound = true
	pass # Replace with function body.


func _on_TouchScreenButton_pressed():
	$AnimationPlayer.play("outro")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name =="outro":
		queue_free()
		mainScene()
#		get_tree().change_scene("res://scene/Mainscene.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	OS.shell_open("https://twitter.com/6egames")
	pass # Replace with function body.
	
func mainScene():
	var scene = main_scene.instance()
	get_parent().call_deferred("add_child",scene)
