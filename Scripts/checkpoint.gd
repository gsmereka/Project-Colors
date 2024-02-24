extends Area2D

@export var boss_fight:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if (!body.is_in_group("playable")):
		return
	Global.save_game()
	#if boss_fight:
		#body.animation.play("zoom_out")
	Global.checkpoint_position = self.position
	pass # Replace with function body.
