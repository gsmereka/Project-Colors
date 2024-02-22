extends RayCast2D

@export var sparkle: Sprite2D = null
@export var occluder: LightOccluder2D = null
@export var limit: LightOccluder2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if occluder.rotation != 0:
		sparkle.visible = false
		limit.position.x = 2000
		return
	if (is_colliding()):
		#print(get_collision_point())
		sparkle.visible = true
		sparkle.position.x = global_position.distance_to(get_collision_point())
		limit.position.x = global_position.distance_to(get_collision_point())
		#sparkle.position.x  = position.distance_to(get_collision_point())
		if (get_collider()):
			if (get_collider().is_in_group("killable")):
				get_collider().hp -= 1
		pass
	else:
		limit.position.x = 2000
		sparkle.visible = false
	pass
