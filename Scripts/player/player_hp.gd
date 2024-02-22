extends Control

@export var hp1: TextureRect = null
@export var hp2: TextureRect = null
@export var hp3: TextureRect = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!Global.player_node):
		return
	if (Global.player_node.hp == 3):
		hp1.visible = true
		hp2.visible = true
		hp3.visible = true
	if (Global.player_node.hp == 2):
		hp1.visible = true
		hp2.visible = true
		hp3.visible = false
	if (Global.player_node.hp == 1):
		hp1.visible = true
		hp2.visible = false
		hp3.visible = false
	if (Global.player_node.hp == 0):
		hp1.visible = false
		hp2.visible = false
		hp3.visible = false
	pass
