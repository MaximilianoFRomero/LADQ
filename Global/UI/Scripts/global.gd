extends Node

var points : int = 0
signal PointsChanged

func setPoints(p: int):
	points += p
	emit_signal("PointsChanged")
	

func quitPoints(p: int):
	points -= p
	emit_signal("PointsChanged")
