extends Spatial

func _ready():
	update_level()

func update_level():
	var level_path = State.levels[State.current_level]
	var level = load(level_path).instance()
	add_child(level)
