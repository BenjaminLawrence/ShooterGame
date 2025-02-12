extends RigidBody2D

const speed = 750

func explode():
	$AnimationPlayer.play("Explosion")
