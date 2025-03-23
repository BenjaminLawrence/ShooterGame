extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var second_shot: bool = false

var health: int = 30
var damageable: bool = true

signal laser(pos, direciton)

func hit():
	if damageable:
		health -= 10
		damageable = false
		$Timers/DamageCooldown.start()
		$Sprite2D.material.set_shader_parameter("progress",1)
	if health <= 0:
		queue_free()


func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var pos: Vector2 = $LaserSpawnPositions.get_child(second_shot).global_position
			second_shot = !second_shot
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserCooldown.start()


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true


func _on_damage_cooldown_timeout() -> void:
	damageable = true
	$Sprite2D.material.set_shader_parameter("progress",0)
