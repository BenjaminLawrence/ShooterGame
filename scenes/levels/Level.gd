extends Node2D

var test_array: Array[String] = ["Test", "Hello", "stuff"]

func _ready() -> void:
	$Logo.rotation_degrees = 90
	
	for i in test_array:
		print(i)

func _process(delta: float) -> void:
	$Logo.rotation_degrees += 200 * delta
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
