extends CharacterBody2D

@export var keys: int = 0
@export var steps_frame_speed_walking: int = 400
@export var steps_frame_speed_running: int = 150
const SPEED = 300.0
@export var hp: int = 3
@export var interface: CanvasLayer = null
var speed: float
var run_speed: float = 400
var walk_speed: float = 200
var stamina: float = 0
var max_stamina: float = 2000
var	stamina_decrease: float = 0.0
var stamina_increase: float = 20
var mana: float = 0
var max_mana: float = 2000
#var	mana_decrease: float = 20.0
var	mana_decrease: float = 0.0
var mana_increase: float = 20
var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
#var color_selected: int = 1

var low_steps = preload("res://Sound Effects/andando.mp3")
var run_steps = preload("res://Sound Effects/correndo.mp3")

var light_Speed = 0.02
var	angle = 0
var	can_shot: bool = true

# Nodes do player
@export var animation: AnimationPlayer = null
@export var shader: Sprite2D = null
@export var player_sprite: Sprite2D = null
@export var left: LightOccluder2D = null
@export var right: LightOccluder2D = null
@export var ray: Sprite2D = null
@export var laser_sound: AudioStreamPlayer = null
@export var steps: AudioStreamPlayer = null
@export var hurt_sound: AudioStreamPlayer = null

func _ready():
	Global.player_node = self
	if (self.visible == false):
		self.visible = true
	if (Global.checkpoint_position):
		self.position = Global.checkpoint_position
	keys = Global.player_keys
	init_step_time = Time.get_ticks_msec()
	interface.visible = true
		

func prepare_dimension():
	shader.material.set_shader_parameter("color", color_array[2])

func run():
	if Input.is_action_pressed("Run"):
		if stamina > 0:
			stamina -= stamina_decrease
			step_limit = steps_frame_speed_running
			speed = run_speed
		else:
			step_limit = steps_frame_speed_walking
			speed = walk_speed
	else:
		if stamina < max_stamina:
			stamina += stamina_increase
			if (stamina > max_stamina):
				stamina = max_stamina
		speed = walk_speed
		step_limit = steps_frame_speed_walking
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	var velocity = input_direction * speed
	return (velocity)
	
func change_lantern():
	if (!shader):
		return
	if (Input.is_action_just_pressed("Swap_dimension")):
		if (Global.actual_dimension):
			Global.actual_dimension.visible = false
		Global.actual_color += 1
		if (Global.actual_color == len(color_array)):
			Global.actual_color = 0
		shader.material.set_shader_parameter("color", color_array[Global.actual_color])
		Global.actual_dimension = Global.dimension_list[Global.actual_color]
		if (Global.actual_dimension):
			Global.actual_dimension.visible = true
		
		#Global.color_shader
	pass


# 0.78539800643921
#-0.78539800643921
func atack():
	if Input.is_action_pressed("Fire") && can_shot:
		if (!laser_sound.playing && right.rotation == 0):
			laser_sound.play()
		right.rotation -= light_Speed
		if (right.rotation <= 0):
			right.rotation = 0
			ray.visible = true
			#shader.material.set_shader_parameter("color", Color(1,1,1,1))
		left.rotation += light_Speed
		if (left.rotation >= 0):
			left.rotation = 0
	else:
		shader.material.set_shader_parameter("color", color_array[Global.actual_color])
		ray.visible = false
		if (laser_sound.playing):
			laser_sound.stop()
		right.rotation += light_Speed
		if (right.rotation >= 0.78539800643921):
			right.rotation = 0.78539800643921
		left.rotation -= light_Speed
		if (left.rotation <= -0.78539800643921):
			left.rotation = -0.78539800643921

func control_atack():
	if left.rotation == 0:
		if mana > 0:
			mana -= mana_decrease
		else:
			can_shot = false
	else:
		if mana < max_mana:
			mana += mana_increase
			if (mana > max_mana):
				mana = max_mana
	#if (Input.is_action_just_pressed("Fire")):
		#can_shot = true
	#if (!can_shot && mana == max_mana): # sobrecarga
	
	if (!can_shot && mana > max_mana / 10): # Menos sobrecarga
		can_shot = true
	pass

func steps_sound():
	if (Input.is_action_just_pressed("Run")):
		steps.stream = run_steps
	if (Input.is_action_just_released("Run")):
		steps.stream = low_steps
	if (velocity):
		if (!steps.playing):
			steps.play()
	else:
		if (steps.playing):
			steps.stop()
	pass

func change_scene():
	Global.dimension_list = []
	Global.boss_fight = false
	Global.on_cutscene = false
	Global.save_game()
	get_tree().change_scene_to_file("res://Scenes/cutscenes/faleceu.tscn")
	#get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
	pass

var die: bool = false
@export var animação_morte: AnimatedSprite2D = null
@export var bigluz: PointLight2D = null
@export var luz: PointLight2D = null
@export var luz2: PointLight2D = null

func _player_die():
	if (hp <= 0):
		player_sprite.visible = false
		animação_morte.visible = true
		bigluz.enabled = false
		luz.enabled = false
		luz2.enabled = false
		if (!animação_morte.is_playing()):
			animação_morte.frame = 0
			animação_morte.play()
		if (animação_morte.frame == 7):
			change_scene()
		die = true
	#if (Input.is_action_just_pressed("Fire")):
		#change_scene()
	pass

@onready var save_hp = hp

var pause_node = preload("res://Scenes/Menu/pause.tscn")
			
	
func _physics_process(delta):
		
	if (!die):
		if (hp != save_hp):
			if (!hurt_sound.playing):
				hurt_sound.play()
			save_hp = hp
		velocity = run()
		steps_sound()
		animate_steps()
		atack()
		control_atack()
		change_lantern()
		look_at(get_global_mouse_position())
		move_and_slide()
		Global.player_keys = keys
		if (Input.is_action_just_pressed("Pause")):
			var pause = pause_node.instantiate()
			get_tree().root.add_child(pause)
			get_tree().paused = true
	_player_die()
	

var frame_direction: int = 1
var step_limit = steps_frame_speed_walking
var init_step_time
var step_time

func animate_steps():
		if velocity:
			step_time = Time.get_ticks_msec()
			if (step_time - init_step_time) < step_limit:
				return
			init_step_time = Time.get_ticks_msec()
			player_sprite.frame += 1 * frame_direction
			if (player_sprite.frame == 2):
				frame_direction *= -1
			if (player_sprite.frame == 1 && frame_direction == -1):
				frame_direction *= -1
		else:
			player_sprite.frame = 0
			frame_direction = 1
		pass
