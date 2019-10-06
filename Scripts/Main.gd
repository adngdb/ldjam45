extends Spatial

func _ready():
	update_level()


func _process(delta):
	# Burns
	if Input.is_action_pressed("nothing_burns"):
		State.enable_rule(State.Rule.NOTHING_BURNS)

	if Input.is_action_just_released("nothing_burns"):
		State.disable_rule(State.Rule.NOTHING_BURNS)

	# Drowns
	if Input.is_action_pressed("nothing_drowns"):
		State.enable_rule(State.Rule.NOTHING_DROWNS)

	if Input.is_action_just_released("nothing_drowns"):
		State.disable_rule(State.Rule.NOTHING_DROWNS)

	# Stings
	if Input.is_action_pressed("nothing_stings"):
		State.enable_rule(State.Rule.NOTHING_STINGS)

	if Input.is_action_just_released("nothing_stings"):
		State.disable_rule(State.Rule.NOTHING_STINGS)


func update_level():
	var level_path = State.levels[State.current_level]
	var level = load(level_path).instance()
	add_child(level)
