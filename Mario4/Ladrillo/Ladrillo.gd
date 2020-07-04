extends KinematicBody2D

var uno : float = true
var inicio : Vector2 = Vector2.ZERO

func _physics_process(delta):
	if uno:
		inicio = position
		uno = false
	if inicio.y > position.y:
		position.y += 1
	else:
		position = inicio

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		position.y += -5
