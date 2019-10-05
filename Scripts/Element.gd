extends Area

export (State.Rule) var rule

func _on_body_entered(body):
	print(body)
	
	if not rule in State.rules_active:
		State.kill_player()
