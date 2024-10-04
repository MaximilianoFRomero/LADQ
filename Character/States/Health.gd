extends Node
class_name Health

@export var max_health := 3
var _current_health := max_health
signal health_changed(health)

func _ready():
	pass

func take_damage(damage):
	_current_health -= damage
	if _current_health < 0:
		_current_health = 0
	emit_signal("health_changed", _current_health)
	
func get_health() -> int:
	return _current_health

func is_alive() -> bool:
	return _current_health > 0
