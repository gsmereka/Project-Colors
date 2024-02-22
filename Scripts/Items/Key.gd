extends Area2D

var player_inside:bool = false
var player = null
@export var id: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if (!Global.keys[id]):
		queue_free()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!player_inside):
		return
	if (Input.is_action_just_pressed("Interact")):
		Global.keys[id] = 0
		player.keys += 1
		queue_free()
	pass

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	player = body
	Global.player_warning_text = "Chave Velha, Deve servir pra algo!"
	player_inside = true
	pass # Replace with function body.
	

func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	Global.player_warning_text = ""
	player_inside = false
	player = null
	pass # Replace with function body.
