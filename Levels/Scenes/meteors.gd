extends ParallaxLayer

# Variables para los meteoros
@export var meteor_texture: Texture2D = load("res://Art/PNG/pngegg.png")
@export var meteor_speed: Vector2 = Vector2(200, 500)  # Velocidad en X y Y
@export var meteor_spawn_interval: float = 1 # Intervalo de aparición
@export var meteor_size_range: Vector2 = Vector2(0.5, 1.5)  # Escala de tamaño de los meteoros

var spawn_timer : Timer

func _ready():
	# Inicializar el temporizador para el spawn de meteoros
	spawn_timer = Timer.new()
	spawn_timer.wait_time = meteor_spawn_interval
	spawn_timer.one_shot = false
	spawn_timer.start()
	add_child(spawn_timer)
	
	spawn_timer.timeout.connect(_spawn_meteor)

# Función para crear meteoros
func _spawn_meteor():
	var meteor_sprite = Sprite2D.new()
	meteor_sprite.texture = meteor_texture
	
	# Randomizar la escala de los meteoros
	var scale = randf_range(meteor_size_range.x, meteor_size_range.y)
	meteor_sprite.scale = Vector2(scale, scale)
	
	# Posición aleatoria fuera de la pantalla (parte superior)
	meteor_sprite.position = Vector2(randf_range(0, get_viewport_rect().size.x), -50)
	
	# Agregar el meteoro como hijo
	add_child(meteor_sprite)
	
	# Mover el meteoro hacia abajo
	var tween = get_tree().create_tween()
	tween.tween_property(meteor_sprite, "position", Vector2(meteor_sprite.position.x, get_viewport_rect().size.y + 100), meteor_speed.y / 100)

	# Remover el meteoro al llegar al final de la pantalla
	tween.finished.connect(func(): meteor_sprite.queue_free())

func _process(delta):
	# Puedes ajustar la velocidad de movimiento del ParallaxLayer aquí
	motion_offset += meteor_speed * delta
