extends TextureButton

var mouse_inside = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (mouse_inside):
		if (Input.is_action_just_pressed("Fire")):
			if (!FileAccess.file_exists(Global.save_path)):
				return
			Global.load_game()
			get_tree().change_scene_to_file("res://Scenes/primeira_casa.tscn")
	pass
