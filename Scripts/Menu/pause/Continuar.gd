extends Button


# Called when the node enters the scene tree for the first time.
@onready var init_time = Time.get_ticks_msec()


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = Time.get_ticks_msec()
	
	if (time - init_time) >= 100:
		if (Input.is_action_just_pressed("Pause")):
				get_tree().paused = false
				get_parent().get_parent().queue_free()
	pass


func _on_pressed():
	get_tree().paused = false
	get_parent().get_parent().queue_free()
	pass # Replace with function body.
