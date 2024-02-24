extends CharacterBody2D


const speed = 800
var target : Vector2
var _state: int = moviment
var hp = 50
var damage = 1
var random_dir
var direction: Vector2
@export var type: int = 2
@onready var _transform := $ghost_animated as AnimatedSprite2D


enum {iddle, moviment, dead, attack}

func _physics_process(delta):
	get_node("ghost_animated").rotation += 0.05
	if hp ==  0:
		_dead()
	velocity = direction.normalized() * speed
	
	match _state:
		iddle:
			_iddle()
		moviment:
			_random_direction()
			move_and_slide()
		attack:
			_attack()
		dead:
			_dead()
	
func _ready():
	_transform.play("yellow_animate")
	
@onready var save_dir = randi() % 4

func random_generation():
	random_dir = randi() % 4
	if (random_dir == save_dir):
		random_dir = randi() % 4
	save_dir = random_dir
	_random_direction()

func _random_direction():
	self.visible = true
	match random_dir:
		0:
			move_right()
		1:
			move_left()
		2:
			move_up()
		3:
			move_down()

func move_right():
	velocity = Vector2.RIGHT * speed 

func move_left():
	velocity = Vector2.LEFT * speed 
	
func move_up():
	velocity = Vector2.UP * speed 
	
func move_down():
	velocity = Vector2.DOWN * speed 

func _attack():
	target = Global.player_node.position
	_transform.play("yellow_attack")

func _iddle():
	_transform.play("yellow_animate")
	self.visible = true
	
func _dead():
	queue_free()
	
func _on_hitbox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("grupoplayer"):
		
		print("levou")
		hp -= body.damage
	pass # Replace with function body.

func _on_attack_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("grupoplayer"):
		_attack()
		print("bateu")
		body.hp -= damage
	pass # Replace with function body.

func _on_ghost_animated_animation_finished():
	if $ghost_animated.animation == "yellow_attack":
		_transform.play("yellow_animate")
	pass # Replace with function body.

func _on_timer_timeout():
	random_generation()
	$Timer.start()
	pass # Replace with function body.

