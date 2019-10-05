extends Button

class_name WordDragable

var ruleIndex = null
var wordName: String

func _init(rule, word):
	ruleIndex = rule
	wordName = word

func _ready():
	set_text(wordName)

func get_drag_data(_pos):
	var preview = Label.new()
	preview.set_text(wordName)
	set_drag_preview(preview)
	return ruleIndex
