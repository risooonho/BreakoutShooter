extends Node2D




func _on_shoot(bullet: PackedScene, pos: Vector2, rot: float) -> void:
	var shot = bullet.instance()
	add_child(shot)
	shot.position = pos
	shot.rotation = rot
	shot.fire()
	

func _on_Player_hit() -> void:
	get_tree().reload_current_scene()
