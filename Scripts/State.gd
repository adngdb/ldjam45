extends Node

enum Rule {
	NOTHING_BURNS,
	NOTHING_DROWNS,
}

const RULES_DATA = {
	Rule.NOTHING_BURNS: {
		"word": "burns",
	},
	Rule.NOTHING_DROWNS: {
		"word": "drowns",
	},
}

var rules_available = [
	Rule.NOTHING_BURNS,
	Rule.NOTHING_DROWNS,
]
var rules_active = []

func toggle_rule(rule):
	if rule in rules_active:
		self.deactivate_rule(rule)
	else:
		self.activate_rule(rule)

func activate_rule(rule):
	if not rule in rules_active:
		rules_active.append(rule)

func deactivate_rule(rule):
	if rule in rules_active:
		rules_active.remove(rules_active.find(rule))

func kill_player():
	print('player is dead')
	rules_active = []
	get_tree().reload_current_scene()
