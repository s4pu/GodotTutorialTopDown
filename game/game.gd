extends Node2D

var score = 0

func _ready():
	$player.connect("hitpoints_changed", self, "update_hitpoints")

func _on_enemy_spanw_timer_timeout():
	var Enemy = preload("res://enemy/enemy.tscn")
	var new_enemy = Enemy.instance()
	new_enemy.target = $player
	new_enemy.position = Vector2(rand_range(0, 600), rand_range(0, 400))
	new_enemy.connect("hit", self, "increase_score")
	add_child(new_enemy)

func increase_score():
	score += 1
	$score.text = "Score: " + str(score)

func update_hitpoints(percentage):
	$hitpoints.rect_scale.x = percentage
