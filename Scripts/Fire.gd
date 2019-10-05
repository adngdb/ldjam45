extends Area

func _on_Fire_body_entered(body):
	print(body)
	
	if not State.NOTHING_BURNS in State.rules_active:
		State.kill_player()
