extends Node2D

signal hit

var target: Node2D
var speed = 300.0

func _process(delta):
	if target:
		var direction = (target.position - position).normalized()
		position += direction * speed * delta

func _on_enemy_area_entered(area):
	if area == target:
		target.take_damage(50)
		queue_free()

func hit():
	emit_signal("hit")
	queue_free()
