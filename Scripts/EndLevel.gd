extends Area

export (State.Rule) var rewards_word

var timer = Timer.new()

func _ready():
	timer.one_shot = true
	timer.wait_time = 2
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)

func _on_EndLevel_body_entered(body):
	$AudioStreamPlayer.play()
	timer.start()
	body.stop_movement()

func on_timeout():
	if rewards_word != State.Rule.NONE:
		State.new_rule = rewards_word
	State.next_level()
