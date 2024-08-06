extends Node

var master_bus = AudioServer.get_bus_index("Master")
@onready var hslider = $HSlider
var saved_volume

func _ready():
	pass

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	hslider.value = value
	saved_volume = hslider.value
	print(hslider.value)
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)


func _on_opciones_pressed():
	self.visible = true


func _on_toggle_full_screen_btn_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(3,0)
	else:
		DisplayServer.window_set_mode(0,0)
