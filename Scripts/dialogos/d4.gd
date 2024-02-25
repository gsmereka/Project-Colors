extends Area2D

var player_inside: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!player_inside):
		return
	if (Global.on_cutscene):
		return
	if (Input.is_action_just_pressed("Interact")):
		Global.player_warning_text = ""
		var new_Dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		new_Dialog.data = _dialog_data
		_hud.add_child(new_Dialog)
		Global.on_cutscene = true
	pass


const _DIALOG_SCREEN: PackedScene = preload("res://Scenes/User Interface/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav4.png",
		"dialog": "Dó, ré, mi, fá, fá, fá. Dó, ré, dó, ré, ré, ré. Dó, sol, fá, mi, mi, mi. Dó, ré, mi, fá, fá, fá!",
		"title": "Caveira"
	},
	1: {
		"faceset": "res://Sprites/Dialogo/ham/ham3.png",
		"dialog": "Nossa caveira, isso foi lindo, não sabia que cantarolava tão bem.",
		"title": "Ham"
	},
	2: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav5.png",
		"dialog": "Foi eu que escrevi essa!",
		"title": "Caveira"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):

	if (body.is_in_group("playable")):
		player_inside = true
		Global.on_cutscene = false
		var hey = get_parent().get_parent().get_node("hey")
		if (!hey.playing):
			hey.play()
		if (!Global.on_cutscene):
			Global.player_warning_text = "O Caveira Quer Falar, pressione 'E'!"
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = false
		Global.on_cutscene = false
		Global.player_warning_text = ""
	pass # Replace with function body.
