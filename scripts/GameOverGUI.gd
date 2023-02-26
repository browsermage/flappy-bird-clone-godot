extends Control

@onready var game_over_score_label: = $GameOverScore
@onready var start_over_button: = $Button


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("score_added", _update_score)
	GameManager.connect("state_changed", _toggle_label)
	start_over_button.connect("button_up", _reset_game)
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update_score():
	game_over_score_label.text = str(GameManager.score)


func _toggle_label():
	if GameManager.STATE.GAME_OVER == GameManager.current_state:
		self.visible = true
	else:
		self.visible = false


func _reset_game():
	GameManager.reset_game()
