extends GridContainer

var buttons = []

var blank_texture = load('res://Assets/GUI/key_nothing_blank_gray.png')

func _ready():
	buttons = [
		{
			'rule': State.Rule.NOTHING_BURNS,
			'instance': get_node("NothingBurns"),
			'disabled': load('res://Assets/GUI/key_nothing_burns.png'),
			'enabled': load('res://Assets/GUI/key_nothing_burns_active.png'),
		},
		{
			'rule': State.Rule.NOTHING_DROWNS,
			'instance': get_node("NothingDrowns"),
			'disabled': load('res://Assets/GUI/key_nothing_drowns.png'),
			'enabled': load('res://Assets/GUI/key_nothing_drowns_active.png'),
		},
		{
			'rule': State.Rule.NOTHING_STINGS,
			'instance': get_node("NothingStings"),
			'disabled': load('res://Assets/GUI/key_nothing_stings.png'),
			'enabled': load('res://Assets/GUI/key_nothing_stings_active.png'),
		},
		{
			'rule': State.Rule.NOTHING_GRABS,
			'instance': get_node("NothingGrabs"),
			'disabled': load('res://Assets/GUI/key_nothing_grabs.png'),
			'enabled': load('res://Assets/GUI/key_nothing_grabs_active.png'),
		},
		{
			'rule': State.Rule.NOTHING_FLIES,
			'instance': get_node("NothingFlies"),
			'disabled': load('res://Assets/GUI/key_nothing_flies.png'),
			'enabled': load('res://Assets/GUI/key_nothing_flies_active.png'),
		},
		{
			'rule': State.Rule.NOTHING_MATTERS,
			'instance': get_node("NothingMatters"),
			'disabled': load('res://Assets/GUI/key_nothing_matters.png'),
			'enabled': load('res://Assets/GUI/key_nothing_matters_active.png'),
		},
	]

func _process(delta):
	for button in buttons:
		if button.rule in State.rules_available:
			if button.rule in State.rules_active:
				button.instance.texture = button.enabled
			else:
				button.instance.texture = button.disabled
		else:
			button.instance.texture = null
