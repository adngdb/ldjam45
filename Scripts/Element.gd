extends Area

export (State.Rule) var rule
var colliding_bodies = []
onready var light = $SpotLight

func _on_body_entered(body):
	colliding_bodies.append(body)

func _on_body_exited(body):
	colliding_bodies.remove(colliding_bodies.find(body))
	if body.is_in_group('Player') and body.is_alive:
		body.reset_health()
		SuccessSound.play()

func _process(delta):
	if rule in State.rules_active:
		if light:
			light.visible = false
	else:
		if light:
			light.visible = true

		for body in colliding_bodies:
			if body.is_in_group('Enemies'):
				body.kill()

			if body.is_in_group('Player') and body.is_alive:
				body.hurt(delta)
				if not body.is_alive and $DeathSound:
					$DeathSound.play()
