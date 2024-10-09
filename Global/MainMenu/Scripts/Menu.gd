extends VBoxContainer


var playerPosSavePath = "res://saves.txt"
var playerPos = Vector2(296, 616)

func _ready():
	var file = FileAccess.open(playerPosSavePath, FileAccess.WRITE)
	file.store_var(playerPos)
	pass


func _on_salir_pressed():
	get_tree().quit()


func _on_nueva_partida_pressed():
	#var scene_instance = preload("res://Levels/Scenes/world_01.tscn").instantiate()
	#add_child(scene_instance)
	get_tree().change_scene_to_file("res://Levels/Scenes/LVL01.tscn")


func _on_opciones_pressed():
	self.visible = false
