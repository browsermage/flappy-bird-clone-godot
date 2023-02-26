extends Control

@onready var score_label: = $ScoreLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("score_added", _update_score)
	GameManager.connect("state_changed", _toggle_label)
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_score():
	score_label.text = str(GameManager.score)


func _toggle_label():
	if GameManager.STATE.RUNNING == GameManager.current_state:
		self.visible = true
	else:
		self.visible = false
