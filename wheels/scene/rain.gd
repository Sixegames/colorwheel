extends Node2D


func _ready():
	pass

func _process(delta):
	$CPUParticles2D.speed_scale = all.rain_speed


func _on_Timer_timeout():
	
	if all.begin == true and all.gameover == false:
		$CPUParticles2D.amount += 1
	pass # Replace with function body.
