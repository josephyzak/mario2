extends Node2D



func _ready():
	main.text_puntaje = $CanvasLayer/text_puntaje
	main.text_coin = $CanvasLayer/text_coin
	main.text_time = $CanvasLayer/text_tiempo


func _on_Timer_timeout():
	main.tiempo += 1
	main.text_time.text = str(main.tiempo)
