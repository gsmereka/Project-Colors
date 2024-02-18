extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.scale.x = 1920
	#self.scale.y = 1080
	self.position = Global.player_node.position
	pass
