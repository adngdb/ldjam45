extends Control

var timer = Timer.new()

func _ready():
	timer.one_shot = true
	timer.wait_time = 5
	timer.start()
	timer.connect("timeout", self, "on_timeout")
	add_child(timer)

func on_timeout():
	State.new_rule = null
	get_tree().change_scene('res://Screens/Title.tscn')
