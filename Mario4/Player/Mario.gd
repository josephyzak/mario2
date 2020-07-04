extends KinematicBody2D

const SPEED : float = 200.0
const GRAVITY : float = 10.0
const JUMP : float = -400.0
var velocidad : Vector2 = Vector2.UP
var sentido : float = 1.0
var direccion : float = sentido
var salto : float = 0

onready var playerTree : AnimationTree = $marioTree

func _physics_process(delta):
	sentido = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	salto = Input.get_action_strength("salto")
	
	if salto == 1 and is_on_floor():
		$jump_sound.play()
		main.get_animation(playerTree,main.mario_level,2,direccion)
		velocidad.y += JUMP
	if sentido != 0:
		direccion = sentido
		main.get_animation(playerTree,main.mario_level,1,direccion)
		velocidad.x = SPEED * direccion
	if sentido == 0 and is_on_floor():
		main.get_animation(playerTree,main.mario_level,0,direccion)
		velocidad.x = delta * direccion
	if not is_on_floor():
		main.get_animation(playerTree,main.mario_level,2,direccion)
	velocidad.y += GRAVITY
	velocidad = move_and_slide(velocidad,Vector2.UP)
	
