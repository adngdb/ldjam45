extends KinematicBody

export var motion: Vector3

func _physics_process(delta):
	move_and_collide(delta * motion)