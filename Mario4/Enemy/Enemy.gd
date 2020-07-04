extends Area2D

export var distancia : int = 1
var derecha : bool = true
var uno : bool = true
var velocidad : Vector2 = Vector2.ZERO
var inicio : Vector2 = Vector2.ZERO
var vida : bool = true
var dead : bool = true

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		$coll_enemy.disabled = true
		vida = false
	if vida:
		$spr_enemy.play("enemyRun")
	else:
		if dead:
			$Timer.start()
			dead = false
		$spr_enemy.play("enemyDead")
	if uno:
		inicio = position
		uno = false
	if derecha:
		position.x += 1
		if position.x >= (inicio.x + ((distancia - 1) * 32)):
			derecha = false
	else:
		position.x -= 1
		position.y += 0 * delta
		if position.x <= inicio.x:
			derecha = true


func _on_Enemy_body_entered(body):
	if body.is_in_group("player"):
		if main.vida > 0:
			main.vida -= 1
		elif main.vida == 0:
			main.fin_juego()
		if main.mario_level > 0:
			main.mario_level = 0


func _on_Timer_timeout():
	queue_free()
