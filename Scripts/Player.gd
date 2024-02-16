extends CharacterBody2D


const SPEED = 300.0
var speed: float
var run_speed: float = 300
var walk_speed: float = 150
var stamina: float = 0
var max_stamina: float = 2000
var	stamina_decrease: float = 10
var stamina_increase: float = 20
var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
var color_selected: int = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Global.player_node = self

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
		
		#var dimension = Global.dimensions[color_selected]
		#
		#if (dimension):
			#dimension.visible = false
		
		color_selected += 1
		if (color_selected == len(color_array)):
			color_selected = 0
		
		#Global.color_shader
	pass

func _physics_process(delta):
	velocity = run()
	change_lantern()
	look_at(get_global_mouse_position())
	move_and_slide()
