extends Area2D

signal deaded
@export var transitioner : Transitioner


func _on_body_entered(body):
	if body.name == "Player":
		print("deadArea")
		get_tree().reload_current_scene()
