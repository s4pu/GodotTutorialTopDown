extends Node2D


func _ready():
	pass


func _on_enemy_spanw_timer_timeout():
	var Enemy = preload("res://enemy/enemy.tscn")
	var new_enemy = Enemy.instance()
	new_enemy.target = $player
	new_enemy.position = Vector2(rand_range(0, 600), rand_range(0, 400))
	add_child(new_enemy)
