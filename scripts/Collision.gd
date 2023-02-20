extends Area2D

const Bird: = preload("res://scripts/Bird.gd")

func _ready():
	self.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body is Bird:
		body._on_collision()
