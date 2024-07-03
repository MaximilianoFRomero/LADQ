extends ParallaxLayer

@export var CLOUD_SPEED := float(-10)

func _process(_delta) -> void:
	self.motion_offset.x += CLOUD_SPEED * _delta
