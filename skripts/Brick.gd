extends StaticBody2D

export (int) var hitpoints = 1

func _ready() -> void:
	$AnimatedSprite.frame = hitpoints - 1

func damage():
	hitpoints -= 1
	if hitpoints == 0:
		get_parent().remove_child(self)
	else:
		$AnimatedSprite.frame -= 1