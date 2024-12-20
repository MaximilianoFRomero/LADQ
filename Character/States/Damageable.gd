extends Node
class_name Damageable

signal on_hit(node: Node, damage_taken : int, knockback_direction : Vector2)
signal on_health_changed

@export var points : int = 10
@export var dead_animation_name := String("dead")
@export var health : float = 20:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func hit(damage : int, knockback_direction : Vector2):
	health -= damage
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	emit_signal("on_health_changed")

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		print("Murio")
		Global.setPoints(points)
		get_parent().queue_free()
