extends Node

# -------------------------------------------------
# Rules state and logic
# -------------------------------------------------

enum Rule {
	NONE = -1,
	NOTHING_BURNS,
	NOTHING_DROWNS,
	NOTHING_STINGS,
	NOTHING_GRABS,
	NOTHING_FLIES,
	NOTHING_MATTERS,
}

const RULES_DATA = {
	Rule.NOTHING_BURNS: {
		"word": "burns",
	},
	Rule.NOTHING_DROWNS: {
		"word": "drowns",
	},
	Rule.NOTHING_STINGS: {
		"word": "stings",
	},
	Rule.NOTHING_FLIES: {
		"word": "flies",
	},
}

var rule_slots = 1

var rules_available = [
	#Rule.NOTHING_BURNS,
	#Rule.NOTHING_DROWNS,
	#Rule.NOTHING_STINGS,
	#Rule.NOTHING_GRABS,
	#Rule.NOTHING_FLIES,
]
var rules_active = []

# Proxy to hold content of Nothing... rules.
# Transformed into rules_active list after every change.
var rules_holders = {}

var new_rule = null;

func generate_rules_list():
	rules_active = []
	for rule in rules_holders.values():
		print(rule)
		rules_active.append(rule)

func set_rule(index, rule):
	rules_holders[index] = rule
	generate_rules_list()

func enable_rule(rule):
	if (
		rule in rules_available
		and not rule in rules_active
	):
		rules_active.append(rule)

func disable_rule(rule):
	if rule in rules_active:
		rules_active.remove(rules_active.find(rule))


# -------------------------------------------------
# Player state and logic
# -------------------------------------------------

func kill_player():
	print('player is dead')
	reset_state()
	get_tree().reload_current_scene()


# -------------------------------------------------
# Levels state and logic
# -------------------------------------------------

const levels = [
	#'res://Levels/SpikesSimple.tscn',
	'res://Levels/Empty.tscn',
	'res://Levels/FireSimple.tscn',
	'res://Levels/FireAdvanced.tscn',
	'res://Levels/FireWaterSimple.tscn',
	'res://Levels/FireWaterAdvanced.tscn',
	'res://Levels/FireWaterExpert.tscn',
]

var current_level = 0

func next_level():
	if current_level == levels.size() - 1:
		# End of game!
		print('you win!')
	else:
		current_level += 1
		reset_state()

		if new_rule != null:
			get_tree().change_scene('res://Screens/WordFound.tscn')
		else:
			get_tree().reload_current_scene()


# -------------------------------------------------
# Generic logic
# -------------------------------------------------

func reset_state():
	rules_active = []
	rules_holders = {}
