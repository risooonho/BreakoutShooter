extends KinematicBody2D

signal shoot
signal hit

export var speed: = Vector2(400, 400)
export (PackedScene) var bullet

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	var move_direction: = get_move_direction().normalized()
	var velocity: = get_move_velocity(move_direction)
	rotate_to_mouse()
	# Check for shooting
	if Input.is_action_just_pressed("shoot"):
		emit_signal("shoot", bullet, $bullet_spawn.position.rotated(rotation)+position, rotation)
	
	move_and_slide(velocity)

func get_move_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		)

func get_move_velocity(direction) -> Vector2:
	return speed * direction

func rotate_to_mouse():
	var mouse_pos: = get_viewport().get_mouse_position()
	var angle: = self.get_angle_to(mouse_pos)
	rotate(angle)

func damage():
	emit_signal("hit")