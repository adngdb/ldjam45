extends Spatial

func _ready():
	var level_path = State.levels[0]
	var level = load(level_path).instance()
	add_child(level)
