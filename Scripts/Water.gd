extends "res://Scripts/Element.gd"

func _process(delta):
	$Floor/CollisionShape.disabled = not rule in State.rules_active
