extends Node

# -------------------------------------------------
# Rules state and logic
# -------------------------------------------------

enum Rule {
	NOTHING_BURNS,
	NOTHING_DROWNS,
	NOTHING_STINGS,
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
}

var ruleSlots = 1

var rules_available = [
	Rule.NOTHING_BURNS,
	Rule.NOTHING_DROWNS,
	Rule.NOTHING_STINGS,
]
var rules_active = []

# Proxy to hold content of Nothing... rules.
# Transformed into rules_active list after every change.
var rules_holders = {}

func generate_rules_list():
	rules_active = []
	for rule in rules_holders.values():
		print(rule)
		rules_active.append(rule)

func set_rule(index, rule):
	rules_holders[index] = rule
	generate_rules_list()


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
	'res://Levels/TestAdrian.tscn',
	'res://Levels/LevelHard.tscn',
]

var current_level = 0

func next_level():
	if current_level == levels.size() - 1:
		# End of game!
		print('you win!')
	else:
		current_level += 1
		get_tree().reload_current_scene()


# -------------------------------------------------
# Generic logic
# -------------------------------------------------

func reset_state():
	rules_active = []
	rules_holders = {}
