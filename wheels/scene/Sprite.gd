extends Sprite

export (NodePath) var wheel_scene
var wheel


func _ready():
	wheel = get_node(wheel_scene)
	position = wheel.position
	pass
