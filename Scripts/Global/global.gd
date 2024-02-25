extends Node

var play_test: int = 1
var boss_fight: bool = false
var player_node: CharacterBody2D
var color_shader: Sprite2D
var dimension_list: Array = []
var actual_dimension
var	actual_color: int
var on_cutscene: bool = false
var player_warning_text: String = ""
var veia_tired: bool  = false
var final_fight: bool = false
# Variaveis de save
var player_keys = 0
var keys: Array = [1, 1, 1, 1]
var doors: Array = [1, 1, 1, 1]
var chests: Array = [1,1,1,1,1]
var phantoms: Array = [1, 1, 1, 1, 1, 1, 1, 1] # 1 no tutorial, 2 ma entrada, 1 spawn de tres na sala dois, 1 na sala 4, 3 na sala 5
var phantom_spawn_sala_2: bool = true
#var checkpoint_position: Vector2 = Vector2(-5033, 4648) 
var checkpoint_position: Vector2 = Vector2(0,0) 
var phantoms_killed: int = 0
var block: TextureRect = null

var saveData = Save.new()
var	save_path = "user://save.tres"
#var	save_path = "res://save.tres"

func save_game():
	saveData.player_keys = player_keys
	saveData.keys = keys
	saveData.doors = doors
	saveData.chests = chests
	saveData.phantoms  = phantoms
	saveData.phantom_spawn_sala_2 = phantom_spawn_sala_2
	saveData.checkpoint_position = checkpoint_position
	saveData.phantoms_killed = phantoms_killed
	ResourceSaver.save(saveData, save_path)
	pass
	
func load_game():
	saveData = ResourceLoader.load(save_path).duplicate(true)
	player_keys = saveData.player_keys
	keys = saveData.keys
	doors = saveData.doors
	chests = saveData.chests
	phantoms  = saveData.phantoms
	phantom_spawn_sala_2 = saveData.phantom_spawn_sala_2
	checkpoint_position = saveData.checkpoint_position
	phantoms_killed = saveData.phantoms_killed
	pass

func reset_game_data():
	final_fight = false
	dimension_list = []
	player_keys = 0 #Ok
	keys = [1, 1, 1, 1] #Ok
	doors = [1, 1, 1, 1] #Ok
	chests = [1,1,1,1,1] #Ok
	phantoms = [1, 1, 1, 1, 1, 1, 1, 1] # 1 no tutorial, 2 ma entrada, 1 spawn de tres na sala dois, 1 na sala 4, 3 na sala 5
	phantom_spawn_sala_2 = true
	checkpoint_position = Vector2(0,0)
	#checkpoint_position = Vector2(-5033, 4648) #Ok
	phantoms_killed = 0
	Global.veia_tired = false
	boss_fight = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	self.process_mode = PROCESS_MODE_ALWAYS
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
