extends StaticBody2D

var once = false
var play_exit = false

func _ready():
	$Sprite.modulate = ColorN(all.purple_color)
	pass

func _process(delta):
	if play_exit == true and once == false:
		$AnimationPlayer.play("exit")
		once = true



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name =="exit":
		queue_free()
	pass # Replace with function body.
