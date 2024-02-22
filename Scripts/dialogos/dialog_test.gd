extends Node2D
class_name dialog

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
		"title": "lUZ BACANA"
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
		"title": "lUZ BACANA"
	},
	5: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "verdade",
		"title": "Caveira"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("Run")):
		var new_Dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		new_Dialog.data = _dialog_data
		_hud.add_child(new_Dialog)
	pass
