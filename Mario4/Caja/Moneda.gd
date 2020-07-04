extends KinematicBody2D

const JUMP : float = -40.0
const SPEED : float = 4.0
var uno : float = true
var dos : float = true
var inicio : Vector2 = Vector2.ZERO
var fin : Vector2 = Vector2.ZERO

func _physics_process(delta):
	if uno:
		uno = false
		inicio = position
		fin = position
		fin.y += JUMP
	if position.y > fin.y and dos:
		position.y -= SPEED
	else:
		position.y += SPEED
		
	if position.y == fin.y:
		dos = false
	if position.y == inicio.y and not dos:
		queue_free()
	
