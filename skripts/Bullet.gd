extends RigidBody2D

export (int) var speed = 500

func fire():
	apply_impulse(Vector2.ZERO, Vector2(speed, 0).rotated(rotation))

func _on_RigidBody2D_body_entered(body: Node) -> void:
	if body.has_method("damage"):
		body.damage()
