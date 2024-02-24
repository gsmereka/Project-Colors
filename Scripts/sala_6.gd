extends Node2D

var player_inside:bool = false
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#var scene = preload("res://Scenes/final_fight.tscn").instantiate()
		#scene.position = position
		#get_parent().add_child(scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!player_inside):
		return
	if (Global.on_cutscene):
		return
	if (Input.is_action_just_pressed("Interact")):
		Global.player_warning_text = ""
		var intro = preload("res://Scenes/cutscenes/cutscene_boss.tscn").instantiate()
		intro.position = position
		get_parent().add_child(intro)
		Global.on_cutscene = true
		queue_free()

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = true
		Global.on_cutscene = false
		if (!Global.on_cutscene):
			Global.player_warning_text = "Para cobrar sua Reconpensa, pressione 'E'!"
	pass # Replace with function body.


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = false
		Global.player_warning_text = ""
	pass # Replace with function body.
