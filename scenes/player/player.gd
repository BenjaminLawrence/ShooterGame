extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal shoot_laser(pos, direction)
signal throw_grenade(pos, direction)

func _process(_delta: float) -> void:
	
	# movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	
	# laser shooting
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		shoot_laser.emit(selected_marker.global_position)
	
	# grenade throwing
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var pos_marker = $ProjectileStartPositions.get_children()[0]
		var player_direction = (get_global_mouse_position() - position).normalized()
		throw_grenade.emit(pos_marker.global_position, player_direction)


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
