extends CharacterBody2D

func _process(delta):
	look_at(Globals.player_pos)
