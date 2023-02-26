extends CharacterBody2D

@onready var jumpSound = $AudioStreamPlayerJump
@onready var hitSound = $AudioStreamPlayerHit
@onready var sprite = $Sprite

const JUMP_VELOCITY: = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_alive = true

func _ready():
	velocity.y = JUMP_VELOCITY

func _physics_process(delta):
	
	if velocity.y > 0:
		sprite.texture = load("res://sprites/bird-flap.png")
	else:
		sprite.texture = load("res://sprites/bird.png")
	
	if GameManager.STATE.RUNNING == GameManager.current_state:
		# Add the gravity.
		velocity.y += gravity * delta

		# Handle Jump.
		if Input.is_action_just_pressed("flap") and is_alive:
			jumpSound.play()
			velocity.y = JUMP_VELOCITY

		move_and_slide()

# Gets called when a collision happen with a node with the collision.gd attached
func _on_collision():
	is_alive = false
	hitSound.play()
	GameManager.set_state(GameManager.STATE.GAME_OVER)
