extends Node2D

onready var world_map_node = get_node("MapCanvas/WorldMap")

export var MAX_SPEED = 80
export var ACCELERATION = 700
export var FRICTION = 2000
export var SHIP_SPEED_FACTOR = .0025

var velocity = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO && input_vector != null:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
#		print(direction_vector)
		world_map_node.material.set_shader_param("POSITION", world_map_node.material.get_shader_param("POSITION") + input_vector.normalized()*SHIP_SPEED_FACTOR)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = $Player/Airship.move_and_slide(velocity)

	if Input.is_action_just_pressed("rotate_left"):
		_rotate_map("left")
		pass

	if Input.is_action_just_pressed("rotate_right"):
		_rotate_map("right")
		pass

func _rotate_map(direction):
	match direction:
		"left":
			print('rotating map left')
#			place holder for when rotation works
			pass
		"right":
#			place holder for when rotation works
			print('rotating map right')
			pass
