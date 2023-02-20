extends ParallaxLayer

@export var SPEED = -15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion_offset.x += SPEED * delta
	pass
