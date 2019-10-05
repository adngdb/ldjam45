extends Panel

func can_drop_data(_pos, data):
	return data in State.rules_available

func drop_data(_pos, data):
	var word = State.RULES_DATA[data].word
	get_node('Label').set_text('Nothing %s' % word)
	State.activate_rule(data)
