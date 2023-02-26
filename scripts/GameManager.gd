extends Node

signal score_added
signal state_changed


enum STATE {
	RUNNING,
	START,
	GAME_OVER
}

var score: = 0
var current_state: = STATE.START

func set_state(new_state: STATE):
	current_state = new_state
	emit_signal("state_changed")
	
func add_score(score_to_add: int):
	score += score_to_add
	emit_signal("score_added")


func reset_game():
	score = 0
	set_state(STATE.START)
	emit_signal("state_changed")
	emit_signal("score_added")
	get_tree().reload_current_scene()
