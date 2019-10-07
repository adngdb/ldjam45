extends MeshInstance

# Euler degress per second
export var speed = 60

func _process(delta):
	rotation_degrees.y -= speed * delta