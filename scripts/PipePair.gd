extends CanvasGroup

@onready var screenNotifier = get_node("VisibleOnScreenNotifier2D")
@onready var scoreArea = get_node("ScoreArea")
@onready var topPipe = $TopPipe
@onready var audio = $ScoreArea/AudioStreamPlayer
@onready var bottomPipe = $BottomPipe

@export var SPEED: = -60

var Bird: = preload("res://scripts/Bird.gd")

var scored = false

func _ready():

	# Remove itself when it goes out of screen
	screenNotifier.screen_exited.connect(delete)
	
	# If the bird enteres the scoreArea
	scoreArea.body_entered.connect(score_if_bird)

	# Randomise the pipes position
	var startPos = floor(randf_range(-130, 50))
	topPipe.position.y = startPos
	bottomPipe.position.y += startPos + 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.current_state == GameManager.STATE.RUNNING or GameManager.current_state ==  GameManager.STATE.START:
		position.x += SPEED * delta

func delete():
	self.queue_free()

func score_if_bird(body: Node2D):
	if body is Bird && GameManager.current_state == GameManager.STATE.RUNNING:
		audio.play()
		GameManager.add_score(1)
