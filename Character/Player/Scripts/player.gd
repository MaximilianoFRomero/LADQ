extends CharacterBody2D

@export var speed : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

func _physics_process(_delta):

	if not is_on_floor():
		velocity.y += gravity * _delta

	direction = Input.get_vector("left", "right", "jump", "down")
	
	if direction.x != 0 && state_machine.check_if_can_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation_parameters()
	update_facing_direction()
	run_sound()
	
func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)

func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Global/MainMenu/Scenes/main_menu.tscn")

func run_sound():
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		$AudioStreamPlayer.stream.loop = true
		$AudioStreamPlayer.playing = true
	elif Input.is_action_just_released("left") or Input.is_action_just_released("right"):
		$AudioStreamPlayer.playing = false
	
