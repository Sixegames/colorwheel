extends Node2D


func _ready():
	if all.can_play != false:
		all.score += 1
	pass




func _on_miss_anim_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
