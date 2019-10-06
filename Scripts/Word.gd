extends TextureRect

func _ready():
	var word = State.RULES_DATA[State.new_rule].word
	var texture_path = 'res://Assets/GUI/word_%s.png' % word
	var texture = load(texture_path)
	self.texture = texture
	
	State.rules_available.append(State.new_rule)
	State.new_rule = null
