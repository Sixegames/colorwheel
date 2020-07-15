extends Node2D

#export(Gradient) var gradient
export var speed = 1
var once = false
#var colors = Gradient.new()
#var color_array = [Color(1,.5,.5),Color(.5,.5,1)]
func _ready():
#	for color in color_array:
#		colors.add_point(10,color)
	pass
	
#
func _process(delta):
	if all.begin == true:
		$splash.move_local_y(1.5)
		$Sprite.move_local_y(1)
		if once == false:
			$AnimationPlayer.play("fade")
			once = true
#	if $Sprite.global_position.y >= 200:
#		$Sprite.queue_free()
	if $splash.global_position.y >= 1400:
		queue_free()
##	print($Sprite.flip_h )
#	$Sprite.move_local_y(speed)
#	$Sprite2.move_local_y(speed)
#	$Sprite3.move_local_y(speed)
#	if $Sprite.global_position.y >= 1920:
#		$Sprite.global_position.y = -1920
##		randomize()
##		var swap = randi()%2
##		if swap == 0:
##			$Sprite.flip_v = !$Sprite.flip_v
##		if swap == 1:
##			$Sprite.flip_h = !$Sprite.flip_h
#	if $Sprite2.global_position.y >= 1920:
#		$Sprite2.global_position.y = -1920
#		randomize()
#		var swap = randi()%2
#		if swap == 0:
#			$Sprite2.flip_v = !$Sprite2.flip_v
#		if swap == 1:
#			$Sprite2.flip_h = !$Sprite2.flip_h
#	if $Sprite3.global_position.y >= 1920:
#		$Sprite3.global_position.y = -1920
##		randomize()
##		var swap = randi()%2
##		if swap == 0:
##			$Sprite3.flip_v = !$Sprite3.flip_v
##		if swap == 1:
##			$Sprite3.flip_h = !$Sprite3.flip_h
#	pass
#

