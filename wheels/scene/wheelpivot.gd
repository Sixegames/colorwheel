extends Node2D

export(NodePath) var wheel
export var speed = float(0.0015)
var wheelbody_pos_x
var wheelbody_pos_y
var once = true
func _ready():
	wheelbody_pos_y = get_node(wheel).global_position.y
	wheelbody_pos_x = get_node(wheel).global_position.x
	pass

func _process(delta):
	print(global_position.y - wheelbody_pos_y)
	if all.can_play == true and once == true and all.begin == false:
		global_position.y = lerp(global_position.y,wheelbody_pos_y,speed)
		global_position.x = lerp(global_position.x,wheelbody_pos_x,speed)
	
	if (global_position.y - wheelbody_pos_y) <= 5:
		global_position.y = wheelbody_pos_y
		once = false
		all.begin = true
		pass
	if (global_position.y - wheelbody_pos_y) <= 500:
		speed = lerp(speed,0.012,0.1)
