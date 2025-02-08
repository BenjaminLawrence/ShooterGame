extends Node2D


func _on_gate_player_entered_gate() -> void:
	print("player has entered gate")


func _on_player_shoot_laser() -> void:
	print("laser from level")


func _on_player_throw_grenade() -> void:
	print("grenade from level")
