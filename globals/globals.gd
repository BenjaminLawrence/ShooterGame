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
var health = 60:
	get:
		return health
	set(value):
		if (value > 100):
			health = 100
		else:
			health = value
		stat_change.emit()

var player_pos: Vector2
