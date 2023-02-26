extends ParallaxLayer

@export var SPEED: = -15

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.current_state == GameManager.STATE.RUNNING or GameManager.current_state ==  GameManager.STATE.START:
		motion_offset.x += SPEED * delta
