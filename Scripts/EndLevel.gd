extends Area

export (State.Rule) var rewards_word

func _ready():
	pass

func _on_EndLevel_body_entered(body):
	if rewards_word != State.Rule.NONE:
		State.new_rule = rewards_word

	State.next_level()
