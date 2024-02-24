extends Control

class_name DialogScreen
var _step: float = 0.02
var _id: int = 0
var data: Dictionary = {}

@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null
@export var _faceset: TextureRect = null


# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize_dialog()
	get_tree().paused = true
	pass # Replace with function body.

func _initialize_dialog():
	_name.text = data[_id]["title"]
	_dialog.text = data[_id]["dialog"]
	_faceset.texture = load(data[_id]["faceset"])
	_dialog.visible_characters = 0 
	while _dialog.visible_ratio < 1:
		if (_step != 0):
			await get_tree().create_timer(_step).timeout
		_dialog.visible_characters += 1
		pass
#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("Interact") && _dialog.visible_ratio < 1):
		_step = 0
		return
	if (Input.is_action_just_pressed("Interact")):
		_id += 1
		_step = 0.02
		if (_id == data.size()):
			queue_free()
			#Global.on_cutscene = false
			get_tree().paused = false
			return
		_initialize_dialog()
	pass
