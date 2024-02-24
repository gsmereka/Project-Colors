extends Area2D

var player_inside: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!player_inside):
		return
	if (Global.on_cutscene):
		return
	if (Input.is_action_just_pressed("Interact")):
		Global.player_warning_text = ""
		var new_Dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		new_Dialog.data = _dialog_data
		_hud.add_child(new_Dialog)
		Global.on_cutscene = true
	pass


const _DIALOG_SCREEN: PackedScene = preload("res://Scenes/User Interface/dialog_screen.tscn")
	
var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav5.png",
		"dialog": "Ah, Muleque! Ham e caveirão de volta ao jogo, já tirei a poeira das minhas têmporas! Aperta E para pular as falas meu chapa.",
		"title": "Caveira"
	},
	1: {
		"faceset": "res://Sprites/Dialogo/ham/ham1.png",
		"dialog": "Quero só saber quanto a senhora vai nos pagar, espero que o serviço seja proporcional ao tamanho desse lugar.",
		"title": "Ham"
	},
	2: {
		"faceset": "res://Sprites/Dialogo/Caveira/cav4.png",
		"dialog": "O importante é o caminho, não o destino final meu jovem. Você ainda lembra como eu funciono?",
		"title": "Caveira"
		},
	3: {
		"faceset":"res://Sprites/Dialogo/ham/ham1.png",
		"dialog": "Tem muito tempo que não trabalhamos, preciso que você refresque minha memória.",
		"title": "Ham"
	   },
	4: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav1.png",
		"dialog": "Segurando o botão esquerdo do mouse eu solto um raio que absorve os fantasmas, raio vermelho serve para fantasmas com cor vermelha!",
		"title": "Caveira"
		},
	5: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav8.png",
		"dialog": "Apertando o botão direito do mouse eu mudo as cores da lanterna e você enxerga outras dimensões! Raio amarelo serve para fantasmas com cor amarela!",
		"title": "Caveira"
		},
	6: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav9.png",
		"dialog": "Você corre com shift e se movimenta com WASD. Ligue os pontos, você já sabe para quais fantasmas o raio azul serve.",
		"title": "Caveira"
		},
	7: {
		"faceset":"res://Sprites/Dialogo/ham/ham3.png",
		"dialog": "Simples como exorcizar um velhinho.",
		"title": "Ham"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):

	if (body.is_in_group("playable")):
		player_inside = true
		Global.on_cutscene = false
		if (!Global.on_cutscene):
			Global.player_warning_text = "Para ver o TUTORIAL, pressione 'E'!"
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = false
		Global.on_cutscene = false
		Global.player_warning_text = ""
	pass # Replace with function body.
