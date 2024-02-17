extends CharacterBody2D


const SPEED = 300.0
var speed: float
var run_speed: float = 300
var walk_speed: float = 150
var stamina: float = 0
var max_stamina: float = 2000
#var	stamina_decrease: float = 10
var	stamina_decrease: float = 0.0
var stamina_increase: float = 20
var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
var color_selected: int = 1
var laser
var steps
var low_steps = preload("res://Sound Effects/andando.mp3")
var run_steps = preload("res://Sound Effects/correndo.mp3")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var left
var right
var	angle = 0

func _ready():
	Global.player_node = self
	Global.dimension_list.append(get_parent().get_node("red_dimension"))
	Global.dimension_list.append(get_parent().get_node("blue_dimension"))
	Global.dimension_list.append(get_parent().get_node("yellow_dimension"))
	Global.actual_dimension = get_parent().get_node("yellow_dimension")
	var shader = get_parent().get_node("Color_Shader")
	if shader:
		shader.material.set_shader_parameter("color", color_array[2])
	left = get_node("FOV/left")
	right = get_node("FOV/right")
	laser = get_node("laser")
	steps = get_node("steps")

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
	var shader = get_parent().get_node("Color_Shader")
	if (!shader):
		return
	if (Input.is_action_just_pressed("Interact")):
		shader.material.set_shader_parameter("color", color_array[color_selected])
		if (Global.actual_dimension):
			Global.actual_dimension.visible = false
		Global.actual_dimension = Global.dimension_list[color_selected]
		if (Global.actual_dimension):
			Global.actual_dimension.visible = true
		color_selected += 1
		if (color_selected == len(color_array)):
			color_selected = 0
		#Global.color_shader
	pass

var light_Speed = 0.02

#0.78539800643921
#-0.78539800643921
func atack():
	if Input.is_action_pressed("Fire"):
		if (!laser.playing):
			laser.play()
		right.rotation -= light_Speed
		if (right.rotation <= 0):
			right.rotation = 0
		left.rotation += light_Speed
		if (left.rotation >= 0):
			left.rotation = 0
	else:
		if (laser.playing):
			laser.stop()
		right.rotation += light_Speed
		if (right.rotation >= 0.78539800643921):
			right.rotation = 0.78539800643921
		left.rotation -= light_Speed
		if (left.rotation <= -0.78539800643921):
			left.rotation = -0.78539800643921

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
	change_lantern()
	look_at(get_global_mouse_position())
	move_and_slide()
