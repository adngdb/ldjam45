extends HBoxContainer

var nothingHolder = preload("res://Scenes/NothingHolder.tscn")

func _ready():
	for i in range(State.ruleSlots):
		print('add holder %d' % i)
		var holder = nothingHolder.instance()
		add_child(holder)
		holder.holderIndex = i
