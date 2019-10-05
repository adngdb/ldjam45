extends RigidBody

export var velocity: float

func _ready():
	linear_velocity = Vector3(velocity, 0, 0)