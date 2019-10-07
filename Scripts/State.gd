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
	Rule.NOTHING_GRABS: {
		"word": "grabs",
	},
	Rule.NOTHING_FLIES: {
		"word": "flies",
	},
}

var rule_slots = 1

var rules_available = [
	# Rule.NOTHING_BURNS,
	# Rule.NOTHING_DROWNS,
	# Rule.NOTHING_STINGS,
	# Rule.NOTHING_GRABS,
	# Rule.NOTHING_FLIES,
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
	'res://Levels/Empty.tscn',

	# Introduce Fire and Enemies
	'res://Levels/FireSimple.tscn',
	'res://Levels/FireEnemy.tscn',
	'res://Levels/FireEnemies.tscn',

	# Introduce Water
	'res://Levels/WaterSimple.tscn',
	'res://Levels/FireWaterSimple.tscn',
	'res://Levels/FireWaterAdvanced.tscn',

	# Introduce Lava
	'res://Levels/LavaSimple.tscn',
	'res://Levels/LavaAdvanced.tscn',
	'res://Levels/LavaExpert.tscn',

	# Introduce Spikes
	'res://Levels/SpikesSimple.tscn',
	'res://Levels/SpikesAdvanced.tscn',

	# All Elements
	'res://Levels/AllElementsHard.tscn',

	#'res://Levels/LavaSimple.tscn',
	#'res://Levels/PlantSimple.tscn',
	#'res://Levels/ThornsSimple.tscn',
]

var current_level = 0

func next_level():
	if current_level == levels.size() - 1:
		# End of game!
		get_tree().change_scene('res://Screens/YouWin.tscn')
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
