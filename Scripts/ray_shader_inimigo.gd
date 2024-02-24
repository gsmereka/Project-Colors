extends Sprite2D

@export var type: int = 0
@export var azul: int = 0
@export var lateral: Node2D = null

var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
# Called when the node enters the scene tree for the first time.
func _ready():
	material.set_shader_parameter("color", color_array[type])
	lateral = get_node("Lateral")
	lateral.modulate = color_array[type]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.veia_tired):
		material.set_shader_parameter("color", Color(0,0,0,0))
		return
	lateral.modulate = color_array[type]
	if (Global.actual_color != type):
		material.set_shader_parameter("color", Color(0,0,0,0))
	else:
		if (azul):
			material.set_shader_parameter("color", color_array[1])
		else:
			material.set_shader_parameter("color", color_array[type])
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body || Global.veia_tired):
		return
	if (body.is_in_group("playable")):
		if body.hp:
			if type == Global.actual_color:
				body.hp -= 1
	pass # Replace with function body.
