extends Button

func _ready():
	self.connect("pressed", State, "select_rule", [State.NOTHING_MOVES])
