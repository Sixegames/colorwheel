extends Sprite

export var bootsplash = true

func _ready():
	pass
	
func _process(delta):
	if bootsplash == false:
		$color_wheel_.rotation -= 2 * delta
		$color_wheel_2.rotation += 2 * delta
