extends Control

@export var game_manager : GameManager

func _ready():
	hide()
	game_manager.connect("toggle_game_paused", on_game_manager_toggle_game_paused)


func on_game_manager_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else :
		hide()


func _on_resume_btn_pressed():
	game_manager.game_paused = false


func _on_exit_btn_pressed():
	get_tree().quit()
