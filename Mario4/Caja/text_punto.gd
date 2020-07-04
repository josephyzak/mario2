extends Label

var vida : bool = true
var visi : float = 1.0

func _physics_process(delta):
	if vida:
		$Timer.start()
		vida = false
	rect_position.y -= 1

func _on_Timer_timeout():
	queue_free()
