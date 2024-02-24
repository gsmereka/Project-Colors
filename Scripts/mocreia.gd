extends CharacterBody2D

@export var scream_sound: AudioStreamPlayer2D = null
@export var musica_boss: AudioStreamPlayer = null
@export var hp = 200
@export var type = -1
@export var shield_sprite: Sprite2D
@export var shield: CollisionShape2D
@export var veia_sprite: Sprite2D
@onready var save_hp = hp
@export var player_animation: AnimationPlayer = null

var init_time
var time
var limit_time = 3000
var fight_begin

var counter = 0
@export var counter_limit = 5

func _hit_animation():
	counter += 1
	if (counter == counter_limit):
		if (veia_sprite.modulate == Color(1,1,1,1)):
			veia_sprite.modulate = Color(0,0,0,1)
		elif (veia_sprite.modulate == Color(0,0,0,1)):
			veia_sprite.modulate = Color(1,1,1,1)
		counter = 0

func activate_shield():
	shield_sprite.visible = true
	shield.disabled = false

func disable_shield():
	shield_sprite.visible = false
	shield.disabled = true

func _ready():
	Global.player_node.animation.play("zoom_out")
	Global.veia_tired = false
	if !musica_boss.is_playing():
		musica_boss.play()
	init_time = Time.get_ticks_msec()
	player_animation.play("veia_andando")
	disable_shield()

func controlate_shield():
	time = Time.get_ticks_msec()
	if (time - init_time) >= limit_time:
		if shield.disabled:
			if (!player_animation.is_playing()):
				player_animation.play("veia_andando")
			activate_shield()
		else:
			player_animation.pause()
			disable_shield()
		init_time = Time.get_ticks_msec()
		

var direction = 1
var speed = 5

func _physics_process(delta):
	if (Global.veia_tired):
		if musica_boss.is_playing():
			musica_boss.stop()
			Global.veia_tired = false
		if (!player_animation.is_playing()):
			get_tree().change_scene_to_file("res://Scenes/Dialogos/dialogo_final.tscn")
		return
	if (hp != save_hp):
		_hit_animation()
		if (!scream_sound.playing):
			scream_sound.play()
		save_hp = hp
	else:
		veia_sprite.modulate = Color(1,1,1,1)
	controlate_shield()
	if (hp <= 0):
		Global.final_fight = false
		Global.veia_tired = true
		player_animation.pause()
		player_animation.play("veia_morrendo")
		veia_sprite.modulate = Color(1,1,1,1)
		
		#queue_free()
	pass

