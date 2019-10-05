extends RigidBody

export var force: float

func _physics_process(delta):
	add_central_force(Vector3(force, 0, 0))