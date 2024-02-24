extends Node2D

@export var inicio: Marker2D = null
@export var fim: Marker2D = null
@export var content: Node2D = null
@export var type: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("content/ray_shader").type = type
	pass # Replace with function body.

var speed = 6
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	content.position.x += speed
	if content.position.x > fim.position.x:
		content.position.x = inicio.position.x
	pass
