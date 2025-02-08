extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal shoot_laser(position)
signal throw_grenade

func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		shoot_laser.emit(selected_laser.global_position)
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		#print("throw grenade")
		throw_grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
