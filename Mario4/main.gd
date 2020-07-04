extends Node

onready var text_puntaje : Label
onready var text_coin : Label
onready var text_time : Label
var vida : int = 1
var mario_level : int = 0
var puntos : int = 0
var coin : int = 0
var sound_coin : AudioStreamPlayer2D = get("res://Sound/coin_sound.tscn")
var tiempo : int = 0
	
func get_animation(playerTree,level_mario,state_mario,_direccion):
	var _state : String
	var _level : String
	match state_mario:
		0:
			_state = "_Idle"
		1:
			_state = "_Run"
		2:
			_state = "_Up"
	match level_mario:
		0:
			_level = "mario1"
		1:
			_level = "mario2"
	playerTree["parameters/state" + _state + "/blend_amount"] = level_mario
	playerTree["parameters/state/current"] = state_mario
	playerTree["parameters/" + _level + _state + "/blend_position"] = _direccion

func parpadeo(playerTree,direccion):
	playerTree["parameters/level_Up/blend_position"] = direccion
	playerTree["parameters/OneShot/active"] = true

func get_premio(mi_premio,globalpos):
	var punto = preload("res://Caja/text_punto.tscn").instance()
	get_node("/root/World").add_child(punto)
	get_node("/root/World").add_child(mi_premio)
	punto.rect_position = globalpos.global_position
	mi_premio.position = globalpos.global_position
	text_coin.text = str(coin).pad_zeros(2)
	text_puntaje.text = str(puntos).pad_zeros(6)

func fin_juego():
	pass
