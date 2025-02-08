extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate() -> void:
	print("player has entered gate")


func _on_player_shoot_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)


func _on_player_throw_grenade(pos) -> void:
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)
