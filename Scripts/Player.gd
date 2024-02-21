extends CharacterBody2D

@export var has_key: bool = false

const SPEED = 300.0
var speed: float
var run_speed: float = 400
var walk_speed: float = 200
var stamina: float = 0
var max_stamina: float = 2000
#var	stamina_decrease: float = 10
var	stamina_decrease: float = 0.0
var stamina_increase: float = 20
var mana: float = 0
var max_mana: float = 2000
var	mana_decrease: float = 20.0
var mana_increase: float = 20
var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
#var color_selected: int = 1
var laser_sound
var steps
var low_steps = preload("res://Sound Effects/andando.mp3")
var run_steps = preload("res://Sound Effects/correndo.mp3")
var ray
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var left
var right
var	angle = 0
var	can_shot: bool = true
var shader

func _ready():
	#get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
	Global.player_node = self
	if (self.visible == false):
		self.visible = true
	Global.dimension_list.append(get_parent().get_node("dimensions").get_node("red_dimension"))
	Global.dimension_list.append(get_parent().get_node("dimensions").get_node("blue_dimension"))
	Global.dimension_list.append(get_parent().get_node("dimensions").get_node("yellow_dimension"))
	Global.dimension_list[0].visible = false
	Global.dimension_list[1].visible = false
	Global.dimension_list[2].visible = false
	shader = get_node("Color_Shader")
	if shader:
		shader.material.set_shader_parameter("color", color_array[2])
	left = get_node("FOV/left")
	right = get_node("FOV/right")
	laser_sound = get_node("laser")
	steps = get_node("steps")
	ray = get_node("ray_shader")
	Global.actual_color = 1
	Global.actual_dimension = Global.dimension_list[Global.actual_color]
	if (Global.actual_dimension):
		Global.actual_dimension.visible = true
		

func run():
	if Input.is_action_pressed("Run"):
		if stamina > 0:
			stamina -= stamina_decrease
			speed = run_speed
		else:
			speed = walk_speed
	else:
		if stamina < max_stamina:
			stamina += stamina_increase
			if (stamina > max_stamina):
				stamina = max_stamina
		speed = walk_speed
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

var light_Speed = 0.02

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
			shader.material.set_shader_parameter("color", Color(1,1,1,1))
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

func _physics_process(delta):
	velocity = run()
	steps_sound()
	atack()
	control_atack()
	change_lantern()
	look_at(get_global_mouse_position())
	move_and_slide()
