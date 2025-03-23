extends RigidBody2D

const speed = 750
var exploding: bool = false

func _process(_delta: float) -> void:
	if exploding:
		for target in get_tree().get_nodes_in_group('Container') + get_tree().get_nodes_in_group('Scout'):\
			if (target as Node2D).position.distance_to(position) < 500:
				target.hit()

func explode():
	exploding = true
	$AnimationPlayer.play("Explosion")
