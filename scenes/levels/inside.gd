extends LevelParent


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	await tween.finished
	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
