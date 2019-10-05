extends Panel

func _ready():
	var count = 0
	for rule in State.rules_available:
		var data = State.RULES_DATA[rule]
		var word = WordDragable.new(rule, data.word)
		add_child(word)
		word.set_position(Vector2(count * 100 + 50, 50))
		count += 1
