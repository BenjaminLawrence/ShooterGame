extends CharacterBody2D

func _process(_delta: float) -> void:
	
	var direction = Vector2(1,0)
	velocity = direction * 100
	move_and_slide()


func hit():
	print("Drone was hit")
