extends RayCast2D

@export var sparkle: Sprite2D = null
@export var occluder: LightOccluder2D = null
@export var limit: LightOccluder2D = null
@export var enemy_scream: AudioStreamPlayer2D = null
#var sounds: Array = [preload(),
#preload("res://Sound Effects/219433__bash360__crying.mp3"),
#preload("res://Sound Effects/664665__meatballmars__laughter-from-macintosh-hysterical.wav")]
var color_array: Array = [Color(1,0,0,1), Color(0,0,1,1), Color(1,1,0,1)]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var distance
var enemy = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if occluder.rotation != 0:
		sparkle.visible = false
		limit.position.x = 2000
		#if (enemy_scream.playing):
			#enemy_scream.stop()
		return
	if (is_colliding()):
		enemy = get_collider()
		distance = global_position.distance_to(get_collision_point())
		if distance <= 30:
			distance = 30
		if (enemy):
			if (enemy.is_in_group("killable")):
				if (enemy.type == Global.actual_color || enemy.type == -1):
					if (enemy.type != -1):
						if (!enemy_scream.playing):
							enemy_scream.play()
					if enemy:
						enemy.hp -= 1
					sparkle.modulate = color_array[Global.actual_color]
					sparkle.visible = true
					sparkle.position.x = distance
					limit.position.x = distance
			else:
				sparkle.modulate = color_array[Global.actual_color]
				#print(get_collision_point())
				#if (enemy_scream.playing):
					#enemy_scream.stop()
				sparkle.visible = true
				enemy_scream.position.x =  distance
				sparkle.position.x = distance
				limit.position.x = distance					#sparkle.position.x  = position.distance_to(get_collision_point())
	else:
		limit.position.x = 2000
		sparkle.visible = false
	pass
