extends CharacterBody2D

func _process(_delta):
	look_at(Globals.player_pos)
