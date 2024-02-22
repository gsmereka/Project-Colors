extends Node

var play_test: int = 1
var player_node: CharacterBody2D
var color_shader: Sprite2D
var dimension_list: Array = []
var actual_dimension
var	actual_color
var on_cutscene: bool = false
var player_warning_text: String = ""

# Variaveis de save
var player_keys = 0
var keys: Array = [1, 1]
var doors: Array = [1, 1]
var chests: Array = [1,1,1,1,1]
var phantoms: Array = [1, 1, 1, 1, 1, 1, 1, 1] # 1 no tutorial, 2 ma entrada, 1 spawn de tres na sala dois, 1 na sala 4, 3 na sala 5
var phantom_spawn_sala_2: bool = true
var checkpoint_position: Vector2 = Vector2(0, 0)
var phantoms_killed: int = 0


func reset_game_data():
	player_keys = 0 #Ok
	keys = [1, 1] #Ok
	doors = [1, 1] #Ok
	chests = [1,1,1,1,1] #Ok
	phantoms = [1, 1, 1, 1, 1, 1, 1, 1] # 1 no tutorial, 2 ma entrada, 1 spawn de tres na sala dois, 1 na sala 4, 3 na sala 5
	phantom_spawn_sala_2 = true
	checkpoint_position = Vector2(0, 0) #Ok
	phantoms_killed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
