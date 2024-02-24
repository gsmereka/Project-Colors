extends Area2D

var player_inside: bool = false
var new_Dialog: DialogScreen
# Called when the node enters the scene tree for the first time.
func _ready():
	new_Dialog = _DIALOG_SCREEN.instantiate()
	new_Dialog.data = _dialog_data
	_hud.add_child(new_Dialog)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


const _DIALOG_SCREEN: PackedScene = preload("res://Scenes/User Interface/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav2.png",
		"dialog": "Que loucura Ham, essa com certeza foi uma noite alucinante!",
		"title": "Caveira"
	},
	1: {
		"faceset": "res://Sprites/Dialogo/ham/ham1.png",
		"dialog": "E a recompensa ficou com Deus, acho que da próxima vez a gente tem que cobrar metade do valor antes.",
		"title": "Ham"
	},
	2: {
		"faceset": "res://Sprites/light.png",
		"dialog": "Ei, vocês que estavam fazendo essa bagunça?",
		"title": "Gerente"
		},
	3: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav4.png",
		"dialog": "A gente tinha te mandado pro beleleu meu chapa. Tá entrosando por que?",
		"title": "Caveira"
	   },
	4: {
		"faceset":"res://Sprites/light.png",
		"dialog": "Meus caros, a bagunça que vocês fizeram foi a melhor coisa que aconteceu aos hóspedes dessa mansão, quando vocês mataram a senhora, vocês nos libertaram.",
		"title": "Gerente"
		},
5: {
		"faceset":"res://Sprites/Dialogo/ham/ham3.png",
		"dialog": "Pelo menos algo de bom com essa confusão toda. Eu posso conduzir as almas de vocês para o pós vida, vocêss não precisam ficar presos nesse plano por toda a existência.",
		"title": "Ham"
		},
	6: {
		"faceset":"res://Sprites/light.png",
		"dialog": "Nossa, você tem um coração bom meu jovem, essa mansão não tem mais proprietário, vocês podem ficar com a escritura da propriedade depois que nos conduzirem desse plano!",
		"title": "Gerente"
		},
	7: {
		"faceset":"res://Sprites/Dialogo/Caveira/cav5.png",
		"dialog": "Gerente, você é um cara maravilhoso, nunca falei mal de você. Parece que no final tudo acabou bem Ham.",
		"title": "Caveira"
		},
	8: {
		"faceset":"res://Sprites/Dialogo/ham/ham3.png",
		"dialog": "Não é um final, meu amigo, é apenas um novo começo.",
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
			Global.player_warning_text = "O Caveira Quer Falar, pressione 'E'!"
	pass # Replace with function body.


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if (body.is_in_group("playable")):
		player_inside = false
		Global.on_cutscene = false
		Global.player_warning_text = ""
	pass # Replace with function body.
