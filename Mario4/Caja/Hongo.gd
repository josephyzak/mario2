extends KinematicBody2D

var velocidad : Vector2 = Vector2.ZERO

func _physics_process(delta):
	velocidad.x += 1.0
	velocidad.y += 300 * delta
	velocidad = move_and_slide(velocidad)
	for i in get_slide_count():
		var colision = get_slide_collision(i).collider
		if colision.is_in_group("player"):
			queue_free()
			$up_sound.play()
			main.parpadeo(colision.playerTree,colision.direccion)
			if main.mario_level == 0:
				main.mario_level += 1

