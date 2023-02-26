extends Marker2D

@onready var SpawnTimer = $SpawnTimer

var PipePair = preload("res://scenes/PipePair.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.connect("state_changed", _check_spawning_pipes)
	#start_spawner()

func _spawn():
	var instance = PipePair.instantiate()
	add_child(instance)
	
func start_spawner():
	_spawn()
	SpawnTimer.timeout.connect(_spawn)
	SpawnTimer.start()
	
func stop_spawner():
	SpawnTimer.stop()
	
func _check_spawning_pipes():
		if GameManager.STATE.RUNNING == GameManager.current_state:
			start_spawner()
		else:
			stop_spawner()
	
