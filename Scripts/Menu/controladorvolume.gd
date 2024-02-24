extends HSlider

@export var bus_name: String = "Master"
var bus_index
# Called when the node enters the scene tree for the first time.
func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	pass # Replace with function body.

func _on_value_changed(value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
