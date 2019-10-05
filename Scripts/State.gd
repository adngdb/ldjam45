extends Node

enum Rule {
	NOTHING_MOVES,
	NOTHING_BURNS
	NOTHING_DROWNS
}

var rules_available = []
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

func set_rule(index, rule):
	if not rule in rules_active:
		rules_active[index] = rule

func kill_player():
	print('player is dead')
	rules_active = []
	get_tree().reload_current_scene()
