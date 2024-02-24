extends CharacterBody2D


const speed = 100
const gota_scene = preload("res://Scenes/fantasmas/gota.tscn")

var hp = 100
var damage = 1
var direction = 1.0
var gota_instance
var pos_start: Vector2
var direction_rotate = 0.0
var radius = 100

@onready var _animate := $AnimatedSprite2D as AnimatedSprite2D
@onready var wall_detector := $wall_detector as RayCast2D
@onready var spawn_choro = $spawn_choro as Marker2D


func _physics_process(delta):
		
	_move()
	
	if hp == 0:
		dead()
	
func ready():
	pos_start = global_position

func _move():
	
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
	
	_animate.play("azul_iddle")
	velocity.x = direction * speed
	move_and_slide()

func dead():
	queue_free()
	
func chorar():
	gota_instance = gota_scene.instantiate()
	add_sibling(gota_instance)
	gota_instance.global_position = spawn_choro.global_position
	

func _on_cooldown_timeout():
	_animate.play("azul_run")
	chorar()
	pass # Replace with function body.

func _on_hitbox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("grupoplayer"):
		body.hp -= damage
		hp -= body.damage
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "azul_run":
		_animate.play("azul_iddle")
	pass # Replace with function body.
