extends CharacterBody2D

signal shoot_laser(pos, direction)
signal throw_grenade(pos, direction)
signal update_stats

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed

func _process(_delta: float) -> void:
	
	# movement
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# rotate
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	# laser shooting
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		var laser_markers = $ProjectileStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		Globals.laser_amount -= 1
		$LaserTimer.start()
		shoot_laser.emit(selected_marker.global_position, player_direction)
		#$LaserParticles.rotation_degrees = rad_to_deg(player_direction.angle())
		$LaserParticles.emitting = true
	
	
	# grenade throwing
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		var pos_marker = $ProjectileStartPositions.get_children()[0]
		can_grenade = false
		Globals.grenade_amount -= 1
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


func add_item(type: String) -> void:
	if type == 'laser':
		Globals.laser_amount += 5
	elif type == 'grenade':
		Globals.grenade_amount += 2
	elif type == 'health':
		Globals.health += 50
	update_stats.emit()
		
