extends Resource

class_name Save

@export var player_keys:int = 0
@export var keys: Array = [1, 1, 1, 1]
@export var doors: Array = [1, 1, 1, 1]
@export var chests: Array = [1,1,1,1,1]
@export var phantoms: Array = [1, 1, 1, 1, 1, 1, 1, 1] # 1 no tutorial, 2 ma entrada, 1 spawn de tres na sala dois, 1 na sala 4, 3 na sala 5
@export var phantom_spawn_sala_2: bool = true
@export var checkpoint_position: Vector2 = Vector2(0, 0)
@export var phantoms_killed: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
