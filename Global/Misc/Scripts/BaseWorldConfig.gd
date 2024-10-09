extends Node2D

var playerPosSavePath = "res://saves.txt"
var playerPos = Vector2()

func _ready():
	#var file = FileAccess.open(playerPosSavePath, FileAccess.READ)
	#playerPos = file.get_var()
	#$Entities/Player.global_position = playerPos
	pass

func _on_environment_finished():
	$Sound/Environment.play()

