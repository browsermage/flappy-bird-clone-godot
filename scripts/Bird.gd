extends CharacterBody2D

const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_alive = true

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("flap") and is_alive:
		velocity.y = JUMP_VELOCITY

	move_and_slide()

# Gets called when a collision happen with a node with the collision.gd attached
func _on_collision():
	is_alive = false
