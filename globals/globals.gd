extends Node

signal health_change

var laser_amount = 20
var grenade_amount = 5
var health = 60:
	get:
		return health
	set(value):
		if (health + value > 100):
			health = 100
		else:
			health += value
		health_change.emit()
