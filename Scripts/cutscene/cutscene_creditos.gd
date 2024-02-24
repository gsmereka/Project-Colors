extends VideoStreamPlayer

var aviso: bool = false
@export var text: Label = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (aviso):
		text.visible = true
		if Input.is_action_just_pressed("Interact"):
			get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
	pass

func _input(event):
	if (!aviso):
		if event is InputEventKey:
			if event.pressed:
				aviso = true

func _on_finished():
	get_tree().change_scene_to_file("res://Scenes/Menu/menu.tscn")
	pass # Replace with function body.
