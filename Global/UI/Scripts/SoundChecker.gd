extends Area2D



func _on_body_entered(body):
	if body.name == "Player":
		print("entro")
		$ost01.play(0.0)
		$Start.queue_free()
