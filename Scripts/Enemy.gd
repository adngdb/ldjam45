extends KinematicBody

var is_active = false

func _on_screen_entered():
	is_active = true
	print(is_active)

func _on_screen_exited():
	is_active = false
	print(is_active)

func _physics_process(delta):
	if is_active:
		if State.Rule.NOTHING_FLIES in State.rules_active:
			move_and_collide(Vector3(0, -2, 0) * delta)
		else:
			move_and_collide(Vector3(-3, 0, 0) * delta)

func kill():
	queue_free()

func _on_Hitbox_body_entered(body):
	body.kill()
