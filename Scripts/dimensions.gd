extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.dimension_list.append(get_node("red_dimension"))
	Global.dimension_list.append(get_node("blue_dimension"))
	Global.dimension_list.append(get_node("yellow_dimension"))
	if (Global.dimension_list):
		Global.dimension_list[0].visible = false
		Global.dimension_list[1].visible = false
		Global.dimension_list[2].visible = false
	Global.actual_color = 1
	Global.actual_dimension = Global.dimension_list[Global.actual_color]
	if (Global.actual_dimension):
		Global.actual_dimension.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
