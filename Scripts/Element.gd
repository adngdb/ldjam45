extends Area

export (State.Rule) var rule
var colliding_bodies = []

func _on_body_entered(body):
	colliding_bodies.append(body)

func _on_body_exited(body):
	colliding_bodies.remove(colliding_bodies.find(body))

func _process(delta):
	if colliding_bodies.size() > 0 and not rule in State.rules_active:
		State.kill_player()