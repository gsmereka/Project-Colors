extends Label

@export var icon: Sprite2D = null

var increasing: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.player_warning_text == ""):
		if icon:
			icon.visible = false
	else:
		if icon:
			icon.visible = true
	self.text = Global.player_warning_text
	if (increasing):
		modulate.a += 0.03
		if (modulate.a >= 1):
			increasing = !increasing
	else:
		modulate.a -= 0.01
		if (modulate.a <= 0.3):
			increasing = true
	pass
