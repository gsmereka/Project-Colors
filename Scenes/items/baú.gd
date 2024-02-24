extends StaticBody2D

var player = null
var open:bool = false
var player_inside: bool = false
var texture = preload("res://Sprites/cenario/bau aberto.png")
@export var id: int = 0
@export var Fantasma: CharacterBody2D = null

func _ready():
	if (!Global.chests[id]):
		open = true
		get_node("bau").texture = texture
	pass # Replace with function body.

var fantasma: PackedScene = preload("res://Scenes/fantasmas/yellow_ghost.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!player_inside):
		return
	if (Input.is_action_just_pressed("Interact")):
		Global.chests[id] = 0
		get_node("bau").texture = texture
		open = true
		var enemy = fantasma.instantiate()
		add_child(enemy)
		Global.player_warning_text = ""
		player_inside = false
		player = null


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	if (open):
		return
	player = body
	Global.player_warning_text = "Pressione 'E'"
	player_inside = true
	pass # Rep	pass # Replace with function body.


func _on_area_2d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	if (open):
		return
	Global.player_warning_text = ""
	player_inside = false
	player = null
	pass 
