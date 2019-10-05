extends RigidBody

export var force: float

func _physics_process(delta):
	if not State.rules_active.has(State.NOTHING_MOVES):
		add_central_force(Vector3(force, 0, 0))