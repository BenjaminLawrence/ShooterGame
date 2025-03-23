extends Node

signal stat_change

var laser_amount = 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value 
		stat_change.emit()
var grenade_amount = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		stat_change.emit()
var player_vulnerable: bool = true
var health = 60:
	get:
		return health
	set(value):
		if value > health:
			health = min(value, 100)
		elif player_vulnerable:
			health = value
			player_vulnerable = false
			player_invulnerable_timer()
			stat_change.emit()

func player_invulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true

var player_pos: Vector2
