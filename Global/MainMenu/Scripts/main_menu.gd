extends Control

@onready var Audio : AudioStreamPlayer = $MenuMusic
# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.autoplay = true
	Audio.stream.loop = true

func _process(delta):
	pass


func _on_opciones_pressed():
	$Volver.visible = true


func _on_volver_pressed():
	$VBoxContainer.visible = true
	$Settings.visible = false
	$Volver.visible = false
