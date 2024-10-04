extends Node
class_name EnemyAttack

@export var player : Player
@export var damage_amount = 1

func _ready():
	player.connect("health_changed",Callable(self,  "_on_body_entered"))

func _on_body_entered(body):
	if body is Player:
		var health_component = body.health_component
		if health_component:
			health_component.take_damage(damage_amount)
			print("El jugador ha recibido %s de daño. Salud restante: %s" % [damage_amount, health_component.get_health()])
