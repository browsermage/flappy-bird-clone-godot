extends Control

@onready var start_button: = $TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("state_changed", _toggle_label)
	start_button.connect("button_up", _start_game)
	self.visible = true


func _toggle_label():
	if GameManager.STATE.START == GameManager.current_state:
		self.visible = true
	else:
		self.visible = false


func _start_game():
	GameManager.set_state(GameManager.STATE.RUNNING) 
