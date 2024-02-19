extends CollisionShape2D

@export var dimension: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if (get_parent().get_parent().name == "blue_dimension"):
		dimension = 1
	if (get_parent().get_parent().name == "yellow_dimension"):
		dimension = 2
	if (get_parent().get_parent().name == "red_dimension"):
		dimension = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (dimension == Global.actual_color):
		self.disabled = false
	else:
		self.disabled = true
	pass
