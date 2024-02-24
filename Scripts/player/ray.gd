extends RayCast2D

@export var sparkle: Sprite2D = null
@export var occluder: LightOccluder2D = null
@export var limit: LightOccluder2D = null
@export var parede_sound: AudioStreamPlayer2D = null

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
		if (parede_sound.playing):
			parede_sound.stop()
		return
	if (is_colliding()):
		enemy = get_collider()
		distance = global_position.distance_to(get_collision_point())
		if distance <= 30:
			distance = 30
		if (enemy):
			if (enemy.is_in_group("killable")):
				if (enemy.type == Global.actual_color || enemy.type == -1):
					if (parede_sound.playing):
						parede_sound.stop()
					if enemy:
						enemy.hp -= 1
						#if enemy.hp <= 0:
							#Global.phantoms_killed += 1
					sparkle.modulate = color_array[Global.actual_color]
					#print(get_collision_point())
					sparkle.visible = true
					sparkle.position.x = distance
					limit.position.x = distance
			else:
				sparkle.modulate = color_array[Global.actual_color]
				#print(get_collision_point())
				sparkle.visible = true
				if (!parede_sound.playing):
					parede_sound.play()
				parede_sound.position.x =  distance
				sparkle.position.x = distance
				limit.position.x = distance					#sparkle.position.x  = position.distance_to(get_collision_point())
	else:
		if (parede_sound.playing):
			parede_sound.stop()
		limit.position.x = 2000
		sparkle.visible = false
	pass
