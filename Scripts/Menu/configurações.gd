extends TextureButton


var mouse_inside = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var config_node = preload("res://Scenes/Menu/configurations.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (mouse_inside):
		if (Input.is_action_just_pressed("Fire")):
			var config = config_node.instantiate()
			get_parent().add_child(config)
	pass
