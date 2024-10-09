extends Control

var lifes
var heart1
var heart2
var heart3

func _ready():
	Global.PointsChanged.connect(updatePoints)
	heart1 = get_node("CanvasLayer/11-1/heart")
	heart2 = get_node("CanvasLayer/11-1/heart2")
	heart3 = get_node("CanvasLayer/11-1/heart3")
	updateLifes()
	updatePoints()

func updatePoints():
	$CanvasLayer/Points.text = str(Global.points)

func updateLifes():
	pass


func _on_player_total_health_changed(totalLifes):
	print(totalLifes)
	if totalLifes == 0:
		heart1.visible = false
		
	if totalLifes == 1:
		heart2.visible = false
	if totalLifes == 2:
		heart3.visible = false
