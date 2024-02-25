extends Node2D

var damage = 1
var speed = 5
var target: Vector2
var direction = 1
var _state: int = cima
var random_num
@onready var _animate := $AnimatedSprite2D as AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_animate.play("gota_anim")
	pass # Replace with function body.

enum {direita, esquerda, baixo, cima}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match _state:
		direita:
			_direita()
		esquerda:
			_esquerda()
		cima:
			_cima()
		baixo:
			_baixo()
	

func _direita():
		position.x += speed * direction 
		
func _esquerda():
		position.x -= speed * direction
		
func _baixo():
		position.y -= speed * direction

func _cima():
		position.y += speed * direction

func _gerar_num():
	random_num = randi() % 4

func _random_direction():
	match random_num:
		0:
			_cima()
		1:
			_esquerda()
		2:
			_baixo()
		3:
			_direita()

func _on_lifetime_timeout():
	queue_free()
	$lifetime.start()
	_gerar_num()
	pass # Replace with function body.

func _on_gota_colisão_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("playable"):
		body.hp -= damage
		queue_free()
	pass # Replace with function body.

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
