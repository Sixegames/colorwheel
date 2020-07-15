extends StaticBody2D

var play_exit = false
var once = false
func _ready():
#	print(once)
	$Sprite.modulate = ColorN(all.redpad_color)
	pass

func _process(delta):
	if play_exit == true and once == false:
		$player.play("exit")
		once = true
		


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name =="exit":
		queue_free()
	pass # Replace with function body.
