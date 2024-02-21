extends CollisionShape2D

var dimension: int = 0
var dimension_name = ""
var node
# Called when the node enters the scene tree for the first time.
func _ready():
	node = get_parent().get_parent().get_parent()
	##print(get_parent())
	#dimension = get_parent().get_parent().Dimension
	while (true):
		if (!node):
			break
		dimension_name = node.name
		if (dimension_name == "red_dimension"):
			dimension = 0
			break
		elif (dimension_name == "blue_dimension"):
			dimension = 1
			break
		elif (dimension_name == "yellow_dimension"):
			dimension = 2
			break
		else:
			node = node.get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (dimension == Global.actual_color):
		self.disabled = false
	else:
		self.disabled = true
	pass
