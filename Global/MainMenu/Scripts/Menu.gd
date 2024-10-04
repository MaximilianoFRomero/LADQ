extends VBoxContainer

func _on_salir_pressed():
	get_tree().quit()


func _on_nueva_partida_pressed():
	get_tree().change_scene_to_file("res://Levels/Scenes/world_01.tscn")


func _on_opciones_pressed():
	self.visible = false
