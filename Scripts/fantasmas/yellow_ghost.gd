extends CharacterBody2D
@export var type: int = 2


const speed = 3
var target : Vector2
var hp = 70
var damage = 1
var direction_rotate = 0.0
var radius = 200
var direction: Vector2

@onready var _transform := $ghost_animated as AnimatedSprite2D

var counter = 0
var counter_limit = 5
@onready var hplimit = hp
func _hit_animation():
	if (hp != hplimit):
		counter += 1
		if (counter == counter_limit):
			if (_transform.modulate == Color(1,1,1,1)):
				_transform.modulate = Color(0,0,0,1)
			elif (_transform.modulate == Color(0,0,0,1)):
				_transform.modulate = Color(1,1,1,1)
			counter = 0
		hplimit = hp
	else:
		_transform.modulate = Color(1,1,1,1)

func _physics_process(delta):
	_hit_animation()
	if hp <= 0:
		_dead()
	move_and_slide()
	target = Global.player_node.position
	direction_rotate += delta
	global_position = Vector2(sin(direction_rotate * (speed))* radius, cos(direction_rotate * (speed))* radius) + target

func _ready():
	_transform.play("yellow_animate")
	target = Global.player_node.position
	global_position = Vector2(sin(direction_rotate * (speed))* radius, cos(direction_rotate * (speed))* radius) + target

func _attack():
	target = Global.player_node.position
	_transform.play("yellow_attack")

func _iddle():
	_transform.play("yellow_animate")
	self.visible = true

func _dead():
	queue_free()


func _on_ghost_animated_animation_finished():
	if $ghost_animated.animation == "yellow_attack":
		_transform.play("yellow_animate")
	pass # Replace with function body.
	
