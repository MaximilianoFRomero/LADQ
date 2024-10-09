extends Area2D

signal parallaxChanger

func _on_body_entered(body):
	if body.name == "Player":
		print("parallax changed")
		emit_signal("parallaxChanger")
