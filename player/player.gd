extends Area2D

var speed = 200
const MAX_HITPOINTS = 200
var hitpoints = MAX_HITPOINTS

signal hitpoints_changed(percentage)

func _ready():
	pass

func _process(delta):
	var movement = Vector2(0, 0)
	if Input.is_action_pressed("ui_left"):
		movement.x = -1
	elif Input.is_action_pressed("ui_right"):
		movement.x = 1
	if Input.is_action_pressed("ui_down"):
		movement.y = 1
	elif Input.is_action_pressed("ui_up"):
		movement.y = -1
	position += movement * speed * delta

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		var direction = (event.position - global_position).normalized()
		
		var Projectile = preload("res://projectile/projectile.tscn")
		var new_projectile = Projectile.instance()
		new_projectile.position = position
		new_projectile.rotation = direction.angle()
		get_parent().add_child(new_projectile)

func take_damage(damage):
	hitpoints -= damage
	emit_signal("hitpoints_changed", hitpoints / float(MAX_HITPOINTS))
	if hitpoints <= 0:
		queue_free()
