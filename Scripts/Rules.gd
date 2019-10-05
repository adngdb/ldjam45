extends Panel

const BASE_SIZE = 70

func _ready():
	var count = 0
	for rule in State.rules_available:
		var data = State.RULES_DATA[rule]
		var word = WordDragable.new(rule, data.word)
		add_child(word)
		word.set_position(Vector2(count * BASE_SIZE * 3 + BASE_SIZE, (200 - BASE_SIZE) / 2))
		word.rect_size = Vector2(BASE_SIZE * 2, BASE_SIZE)
		count += 1
