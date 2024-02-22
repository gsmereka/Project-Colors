extends StaticBody2D

var player_inside: bool = false
var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (player_inside):
		if (!player.keys):
			return
		if (Input.is_action_just_pressed("Interact")):
			player.keys -= 1
			queue_free()
	pass


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	Global.player_warning_text = "Aperte 'E', Se tiver uma chave velha..."
	player_inside = true
	player = body
	pass # Replace with function body.


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	Global.player_warning_text = ""
	player = null
	player_inside = false
	pass # Replace with function body.
