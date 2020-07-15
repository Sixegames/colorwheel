extends Line2D

export (NodePath) var body_scene
export var trail_length = 15
var body
func _ready():
	body = get_node(body_scene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_rotation = 0
	global_position = Vector2(0,0)
	add_point(body.global_position)
	while get_point_count() > trail_length:
		remove_point(0)
		
		


	pass
