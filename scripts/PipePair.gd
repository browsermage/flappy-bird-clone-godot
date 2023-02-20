extends CanvasGroup

@onready var screenNotifier = get_node("VisibleOnScreenNotifier2D")
@export var SPEED = -60

func _ready():
	screenNotifier.screen_exited.connect(delete)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += SPEED * delta

func delete():
	self.queue_free()
