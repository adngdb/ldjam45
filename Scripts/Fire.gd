extends Area

func _on_Fire_body_entered(body):
	print(body)
	State.kill_player()
