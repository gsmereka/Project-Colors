extends PointLight2D

var right
var save
# Called when the node enters the scene tree for the first time.
func _ready():
	right = get_parent().get_node("right")
	save = right.rotation
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (right.rotation < save):
		self.scale.x -= 0.02
		self.scale.y -= 0.02
	elif (right.rotation > save):
		self.scale.x += 0.02
		self.scale.y += 0.02
	save = right.rotation
	pass
