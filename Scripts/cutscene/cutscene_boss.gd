extends VideoStreamPlayer

var aviso: bool = false
@export var text: Label = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func place_fight():
	var scene = preload("res://Scenes/final_fight.tscn").instantiate()
	#scene.position = position
	get_parent().get_parent().get_parent().add_child(scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (aviso):
		text.visible = true
		if Input.is_action_just_pressed("Interact"):
			place_fight()
			get_parent().get_parent().queue_free()
	pass

func _input(event):
	if (!aviso):
		if event is InputEventKey:
			if event.pressed:
				aviso = true

func _on_finished():
	place_fight()
	get_parent().get_parent().queue_free()
	pass # Replace with function body.
