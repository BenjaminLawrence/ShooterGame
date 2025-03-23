extends RigidBody2D

const speed = 750
const explosion_range = 500
var exploding: bool = false

func _process(_delta: float) -> void:
	if exploding:
		var targets = get_tree().get_nodes_in_group('Container') + get_tree().get_nodes_in_group('Scout')
		for target in targets:
			if (target as Node2D).position.distance_to(position) < explosion_range:
				target.hit()

func explode():
	$AnimationPlayer.play("Explosion")
	exploding = true
