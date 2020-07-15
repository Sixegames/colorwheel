extends Node2D

var splash = false
func _ready():
	splash = true
	if splash == false:
		$a
	pass

func _process(delta):
	if splash == false:
		$splash/color_wheel_.rotation -= 2 * delta
		$splash/color_wheel_2.rotation += 2 * delta
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://scene/play.tscn")
	pass # Replace with function body.
