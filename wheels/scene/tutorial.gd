extends Node2D

var counts = 0
var once = false
var steps ="start"

func _ready():
	if all.tutorial == 0:
		pass
	else:
		queue_free()
	pass
func _process(delta):
	
	var color = ColorN(all.color)
		
	var darker = color.darkened(1)
	var lighter = color.lightened(0.8)
	if all.color != "white":
		$Label.modulate = lighter
		$Label2.modulate = lighter
		$Label3.modulate = lighter
		
	if all.color == "white":
		$Label.modulate = darker
		$Label2.modulate = darker
		$Label3.modulate = darker
	if all.can_play == true and once == false:
		if all.tutorial == 0:
			once = true
			$Timer.start()
			
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			$"double tap".start()
			counts += 1
			if event.position.x < 360 and steps == "step1":
				$Timer.start()
				get_tree().paused = false
				steps ="next1"
				$AnimationPlayer.play("exit")
			if event.position.x > 360 and steps == "step2":
				$Timer.start()
				get_tree().paused = false
				steps ="next2"
				$AnimationPlayer.play("exit")
			if counts >= 2 and steps == "step3":
				get_tree().paused = false
				$AnimationPlayer.play("exit")
				steps ="final"
				


func _on_Timer_timeout():
#	print("welcome")
	if steps == "start":
		$AnimationPlayer.play("step1")
		get_tree().paused = true
	if steps == "next1":
		$AnimationPlayer.play("step2")
		get_tree().paused = true
	if steps == "next2":
		$AnimationPlayer.play("step3")
#		get_tree().paused = true
	pass # Replace with function body.




func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name =="step1":
		steps = "step1"
	if anim_name =="step2":
		steps = "step2"
	if anim_name =="step3":
		steps = "step3"
	if anim_name =="exit" and steps =="final":
		queue_free()
		all.tutorial = 1
		all.save_score()
	pass # Replace with function body.


func _on_double_tap_timeout():
	counts = 0
	pass # Replace with function body.
