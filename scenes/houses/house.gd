extends Area2D

signal player_entered

func _on_body_entered(_body: Node2D) -> void:
	player_entered.emit()
