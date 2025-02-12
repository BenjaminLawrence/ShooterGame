extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
#var can_flash_light: bool = true
signal shoot_laser(pos, direction)
signal throw_grenade(pos, direction)

func _process(_delta: float) -> void:
	
	# movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# laser shooting
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		shoot_laser.emit(selected_marker.global_position, player_direction)
		#$LaserParticles.rotation_degrees = rad_to_deg(player_direction.angle())
		$LaserParticles.emitting = true
	
	
	# grenade throwing
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos_marker = $ProjectileStartPositions.get_children()[0]
		can_grenade = false
		$GrenadeTimer.start()
		throw_grenade.emit(pos_marker.global_position, player_direction)
	
	
	# flash light
	if Input.is_action_just_pressed("flashlight"):
		var flash_light = $FlashLight
		if flash_light.enabled == true:
			flash_light.enabled = false
		else:
			flash_light.enabled = true


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
