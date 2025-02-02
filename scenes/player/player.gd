extends CharacterBody2D

func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	
	if Input.is_action_pressed("secondary action"):
		print("shoot grenade")
