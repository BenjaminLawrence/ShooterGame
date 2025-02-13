extends Node2D

var is_day: bool = true
var is_night: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CycleTimer.start()


func _on_cycle_timer_timeout() -> void:
	if is_day:
		is_day = false
		_sun_set()
	else:
		is_night = false
		_sun_rise()


func _sun_set() -> void:
	var day_tween = create_tween()
	day_tween.tween_property($DayLight, "energy", 0, 10)
	await day_tween.finished
	var night_tween = create_tween()
	night_tween.tween_property($NightLight, "energy", 1, 10)
	await night_tween.finished
	is_night = true
	$CycleTimer.start()


func _sun_rise() -> void:
	var night_tween = create_tween()
	night_tween.tween_property($NightLight, "energy", 0, 10)
	await night_tween.finished
	var day_tween = create_tween()
	day_tween.tween_property($DayLight, "energy", 1, 10)
	await day_tween.finished
	is_day = true
	$CycleTimer.start()
