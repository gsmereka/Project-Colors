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
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "Bom Dia Cabeção",
		"title": "Caveira"
	},
	1: {
		"faceset": "res://Sprites/light.png",
		"dialog": "MEU PAI NA SUA MAE",
		"title": "???????"
	},
	2: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "que é isso",
		"title": "Caveira"
	},
	3: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "quanta violencia,  violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia, violencia,",
		"title": "Caveira"
	},
	4: {
		"faceset": "res://Sprites/light.png",
		"dialog": "´Não aguenta uma brincadeirinha que quebra",
		"title": "???????"
	},
	5: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "verdade",
		"title": "Caveira"
	},
	6: {
		"faceset": "res://Sprites/light.png",
		"dialog": "Mas eu estou na sua cabeça",
		"title": "???????"
	},
	7: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "Eu tb to te ouvindo",
		"title": "Ham"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):

	if (body.is_in_group("playable")):
		player_inside = true
		if (!Global.on_cutscene):
			Global.player_warning_text = "O Caveira Quer Falar, pressione 'E'!"
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = false
		Global.player_warning_text = ""
	pass # Replace with function body.
