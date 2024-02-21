extends Control

@export var color: Color
@export var color_exit: Color
@export var skin: int = 0
var skins: Array = [preload("res://Sprites/menu/sem_cor.png"),
preload("res://Sprites/menu/vermelho.png"),
preload("res://Sprites/menu/azul.png"),
preload("res://Sprites/menu/amarelo.png")]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_mouse_entered():
	get_parent().material.set_shader_parameter("color", color)
	get_parent().mouse_inside = true
	get_parent().get_parent().get_node("bezalihamlet_image").texture = skins[skin]
	pass # Replace with function body.


func _on_mouse_exited():
	get_parent().material.set_shader_parameter("color", color_exit)
	get_parent().mouse_inside = false
	get_parent().get_parent().get_node("bezalihamlet_image").texture = skins[0]
	pass # Replace with function body.
