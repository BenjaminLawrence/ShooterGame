extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal shoot_laser
signal throw_grenade

func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		#print("shoot laser")
		shoot_laser.emit()
		can_laser = false
		$LaserTimer.start()
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		#print("throw grenade")
		throw_grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
