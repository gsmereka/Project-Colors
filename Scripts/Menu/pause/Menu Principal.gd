extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_tree().paused = false
	Global.save_game()
	Global.reset_game_data()
	get_parent().get_parent().queue_free()
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
	pass # Replace with function body.
