extends State
class_name HitState

@export var damageable : Damageable
@export var dead_state : State
@export var dead_animation_node := String("dead")

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_damageable_hit(node: Node, damage_amount : int):
	if(damageable.health > 0):
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation_node)
