extends HBoxContainer

var wordDraggable = preload("res://Scenes/WordDraggable.tscn")

func _ready():
	for rule in State.rules_available:
		var data = State.RULES_DATA[rule]
		var word = wordDraggable.instance()
		word.set_data(rule, data.word)
		add_child(word)
