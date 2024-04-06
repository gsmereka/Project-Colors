extends Control

@onready var init_time = Time.get_ticks_msec()
var time
var limit = 3000
# Called when the node enters the scene tree for the first time.
func _ready():
	#new_game = preload("res://Scenes/primeira_casa.tscn").instantiate()
	#get_tree().root.add_child(new_game)
	#Global.player_node.get_node("player_hud").visible = false
	pass # Replace with function body.

var new_game

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("Interact")):
		#get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/primeira_casa.tscn")
	time = Time.get_ticks_msec()
	if (time - init_time) > limit:
		get_tree().change_scene_to_file("res://Scenes/primeira_casa.tscn")
