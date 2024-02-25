extends CharacterBody2D

const speed = 100
var target : Vector2
var _state: int = rotate
var damage = 1
var direction_rotate = 0.0
var radius= 150

@onready var _animate :=  $decoy_anim  as AnimatedSprite2D


enum {rotate, dead}
	

func _physics_process(delta):
	get_node("decoy_anim").rotation += 0.05
	match _state:
		rotate:
			_rotate(target, delta)
			move_and_slide()
		dead:
			_dead()

func _ready():
	_animate.play("decoy_iddle")
	
func _dead():
	queue_free()

func _rotate(target, delta):
	direction_rotate += delta
	position = Vector2(sin(direction_rotate * (speed/25))* radius, cos(direction_rotate * (speed/25))* radius) + target
		
func _on_perseguir_body_entered(body):
	if body.is_in_group("playable"):
		_state = rotate
	pass # Replace with function body.

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("playable"):
		body.hp -= damage
		_dead()
	pass # Replace with function body.


