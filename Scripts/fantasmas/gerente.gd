extends CharacterBody2D

@export var key: Area2D = null
@export var dialogo: Area2D = null
@export var speed = 300.0
var _state : int = iddle
var _target : Vector2
var direction :Vector2
var pos_start:Vector2
var pos_cur:Vector2
@export var hp = 50
@onready var max_hp = hp
var damage = 1
@export var type = 0

@onready var _transform := $ghost_animated as AnimatedSprite2D

enum {persue, back, dead, iddle, explode, attack, low_hp}

var enemy: bool = false

func _physics_process(delta):
	if hp  ==  0:
		_dead()
	if (Global.player_node):
		if (!enemy && Global.keys[0] ==  0):
			enemy = true
			pass
	if hp != max_hp:
		enemy = true
	if (!enemy):
		_iddle()
		return
	if dialogo:
		dialogo.monitoring = false
		pass
	match _state:
		iddle:
			_iddle()
		persue:
			_persue()
			move_and_slide()
		back:
			_back()
			move_and_slide()
		dead:
			_dead()
		explode:
			_explode()
		attack:
			_attack()
			move_and_slide()
		low_hp:
			_low_hp()
			move_and_slide()
	
func _ready():
	pos_start = global_position
	
func _attack():
		_target = Global.player_node.position
		direction =  _target + self.position
		if hp <= 4:
			_transform.play("red_rageattack")
		else: 
			_transform.play("red_attack")
		
		
			
func _iddle():
	#self.visible = false
	_transform.play("red_animate")
	
func _dead():
	queue_free()

func _explode():
	direction = Vector2(0,0)
	velocity = Vector2(0,0)
	damage = 2
	_transform.play("red_explosion")
			
func _back():
		if hp <= 4:
			_low_hp()
			
		if  $ghost_animated.animation == "red_explosion":
			return
			
		if global_position.distance_to(pos_start) <= 10:
			_state = iddle
			
		velocity = direction.normalized() * speed
		direction = pos_start - self.position
		
func _persue():
		if hp <= 4:
			_low_hp()
		
		self.visible = true
		_target = Global.player_node.position
		direction =  _target - self.position
		velocity = direction.normalized() * speed
		pos_cur = self.position
		
func _low_hp():
		self.visible = true
		_transform.play("red_rage")
		_target = Global.player_node.position
		direction =  _target - self.position
		velocity = direction.normalized() * speed * 1.5
		pos_cur = self.position
		if global_position.distance_to(_target) <= 150:
			_explode()

func _on_ghost_radar_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body):
		return
	if body.is_in_group("playable"):
		_state = persue
	pass # Replace with function body.

func _on_ghost_toattack_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body):
		return
	if body.is_in_group("playable"):
		if hp <=  40:
			_state = explode
			body.hp -= damage
	pass # Replace with function body.

func _on_ghost_radar_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (!body):
		return
	if body.is_in_group("playable"):
		_state = back
	
	pass # Replace with function body.

func _on_ghost_animated_animation_finished():
	if $ghost_animated.animation == "red_explosion":
		_dead()
	if $ghost_animated.animation == "red_attack":
		_transform.play("red_animate")
		
	pass # Replace with function body.


func _on_ghost_toattack_1_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body):
		return
	if body.is_in_group("playable"):
		_state = attack
		body.hp -= damage
	return
	pass # Replace with function body.


func _on_hitbox_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body):
		return
	if body.is_in_group("projetil"):
		hp -= body.damage
	pass # Replace with function body.
