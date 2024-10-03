extends Control

@export var playerDamageable : Damageable

func _ready():
	Global.PointsChanged.connect(updatePoints)
	playerDamageable.on_health_changed.connect(updateLifes)
	updateLifes()

func updatePoints():
	$Points.text = str(Global.points)

func updateLifes():
	$lifes.text = str(playerDamageable.health)
