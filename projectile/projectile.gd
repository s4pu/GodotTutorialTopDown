extends Area2D

var speed = 400
var acceleration = 3

func _process(delta):
	var direction = Vector2(1, 0).rotated(rotation)
	position += direction * speed * delta
	# simple acceleration, optional, potentially also not desirable
	speed *= 1 + acceleration  * delta

func _on_projectile_area_entered(area):
	if area.is_in_group("enemy"):
		area.hit()
		queue_free()
