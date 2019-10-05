extends Button

func _ready():
	self.connect("pressed", State, "toggle_rule", [State.Rule.NOTHING_BURNS])
