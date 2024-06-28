extends Area2D

@export var damage := int(5)

func _ready():
	monitoring = false

func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " damaged: " + str(damage))
