extends Marker2D

@onready var SpawnTimer = get_node("SpawnTimer")

var PipePair = preload("res://scenes/PipePair.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	start_spawner()

func _spawn():
	var instance = PipePair.instantiate()
	add_child(instance)
	
func start_spawner():
	_spawn()
	SpawnTimer.timeout.connect(_spawn)
	SpawnTimer.start()
	
func stop_spawner():
	SpawnTimer.stop()
	
