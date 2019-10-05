extends Panel

func _ready():
	for rule in State.rules_available:
		var data = State.RULES_DATA[rule]
		var word = WordDragable.new(rule, data.word)
		add_child(word)
		word.set_position(Vector2(20, 50))
