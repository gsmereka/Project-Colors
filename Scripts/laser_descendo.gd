extends Node2D

@export var inicio: Marker2D = null
@export var fim: Marker2D = null
@export var content: Node2D = null
@export var type: int = 0
@export var atraso: float = 2000

var init_time
var time
var offline: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	init_time = Time.get_ticks_msec()
	get_node("content/ray_shader").type = type
	pass # Replace with function body.

@export var speed = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (offline):
		time = Time.get_ticks_msec()
		if (time - init_time) >= atraso:
			offline = false
		return
	content.position.y += speed
	if content.position.y > fim.position.y:
		content.position.y = inicio.position.y
	pass
