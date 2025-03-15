extends CharacterBody2D

var player_nearby: bool = false

func _process(_delta):
	look_at(Globals.player_pos)
	if player_nearby:
		pass


func _on_attack_area_body_entered(body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(body: Node2D) -> void:
	player_nearby = false
