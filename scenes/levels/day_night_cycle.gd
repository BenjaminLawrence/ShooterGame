extends Node2D

var is_day: bool = true
var is_night: bool = false
var is_sun_rising: bool = false
var is_sun_setting: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CycleTimer.start()


func _on_cycle_timer_timeout() -> void:
	if is_day:
		is_day = false
		is_sun_setting = true
		$TransitionTimer.start()
	elif is_night:
		is_night = false
		is_sun_rising = true
		$TransitionTimer.start()


func _on_transition_timer_timeout() -> void:
	if is_sun_setting:
		if $DayLight.energy > 0:
			$DayLight.energy -= 0.01
		elif $NightLight.energy < 1:
			$NightLight.energy += 0.01
		else:
			is_sun_setting = false
			is_night = true
			$TransitionTimer.stop()
			$CycleTimer.start()
	elif is_sun_rising:
		if $NightLight.energy > 0:
			$NightLight.energy -= 0.01
		elif $DayLight.energy < 1:
			$DayLight.energy += 0.01
		else:
			is_sun_rising = false
			is_day = true
			$TransitionTimer.stop()
			$CycleTimer.start()
