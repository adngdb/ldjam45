extends Button

var ruleIndex = null
var wordName: String

func _ready():
	var parent = get_node('..')
	ruleIndex = parent.ruleIndex
	wordName = parent.wordName
	set_text(wordName)

func get_drag_data(_pos):
	var preview = Label.new()
	preview.set_text(wordName)
	set_drag_preview(preview)
	return ruleIndex
