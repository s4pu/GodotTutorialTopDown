extends Node2D

var target: Node2D
var speed = 300.0

func _process(delta):
	if target:
		var direction = (target.position - position).normalized()
		position += direction * speed * delta

func _on_enemy_area_entered(area):
	if area == target:
		print("Damage!")
