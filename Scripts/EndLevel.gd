extends Area

func _ready():
	pass

func _on_EndLevel_body_entered(body):
	State.next_level()
