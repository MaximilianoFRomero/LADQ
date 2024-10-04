extends CharacterBody2D
class_name Enemy

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine
@export var starting_move_direction : Vector2 = Vector2.LEFT
@export var movement_speed := float(30.0)
@export var hit_state : State
var player : Player

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction : Vector2 = starting_move_direction
	if direction && state_machine.check_if_can_move():
		velocity.x = direction.x * movement_speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)

	move_and_slide()
	turn()

func turn():
	if $RayCast2D.is_colliding():
		if $RayCast2D.rotation_degrees == 0:
			$RayCast2D.rotation_degrees = 180
		else:
			$RayCast2D.rotation_degrees = 0
		starting_move_direction = -starting_move_direction
		$Sprite2D.flip_h = !$Sprite2D.flip_h


func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		print("Daño hecho")
		body.loseLife()
