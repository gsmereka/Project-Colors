extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var config_node = preload("res://Scenes/Menu/configurations.tscn")
			
func _on_pressed():
	var config = config_node.instantiate()
	get_parent().add_child(config)
	pass # Replace with function body.
