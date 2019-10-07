extends TextureRect

func _ready():
	var word = State.RULES_DATA[State.new_rule].word
	var texture_path = 'res://Assets/GUI/key_nothing_%s_active.png' % word
	var texture = load(texture_path)
	self.texture = texture
	
	State.rules_available.append(State.new_rule)
	State.new_rule = null
