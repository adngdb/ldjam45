extends KinematicBody

export (bool) var flying

var is_active = false

func _on_screen_entered():
	is_active = true

func _on_screen_exited():
	is_active = false

func _physics_process(delta):
	if is_active:
		if flying and State.Rule.NOTHING_FLIES in State.rules_active:
			move_and_collide(Vector3(0, -2, 0) * delta)
		else:
			move_and_collide(Vector3(-3, -3, 0) * delta)

func kill():
	if is_active:
		$DeathSound.play()
		var anim_player = $AnimationPlayer
		if anim_player:
			anim_player.stop()

		is_active = false

func _on_Hitbox_body_entered(body):
	if body.is_in_group('Player') and is_active:
		body.kill()

func _on_DeathSound_finished():
	queue_free()
