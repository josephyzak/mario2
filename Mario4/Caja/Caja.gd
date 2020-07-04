extends KinematicBody2D

export var tipo_premio : bool = false

onready var player : AnimationPlayer = get_node("cajaPlayer")
onready var globalpos : Position2D = $Position2D
var inicio : Vector2 = Vector2.ZERO
var velocidad : Vector2 = Vector2.ZERO
var golpe : float = true
var uno : float = true
var premio : float = true

func _physics_process(delta):
	if uno:
		uno = false
		inicio = position
	if golpe:
		player.play("cajaRun")
	else:
		player.play("cajaStop")
		showpremio()
	if inicio.y > position.y:
		position.y += 1
	else:
		position = inicio

func showpremio():
	if premio and not tipo_premio:
		premio = false
		main.puntos += 100
		main.coin += 1
		$coin_sound.play()
		var moneda = preload("res://Caja/Moneda.tscn").instance()
		main.get_premio(moneda,globalpos)
		
	if premio and tipo_premio:
		$coin_sound.play()
		premio = false
		var hongo = preload("res://Caja/Hongo.tscn").instance()
		main.get_premio(hongo,globalpos)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		golpe = false
		position.y += -10
