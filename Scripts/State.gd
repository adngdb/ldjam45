extends Node

enum {
	NOTHING_MOVES,
}

var rules_available = [NOTHING_MOVES]
var rules_active = []

func toggle_rule(rule):
	if rules_active.has(rule):
		self.deactivate_rule(rule)
	else:
		self.activate_rule(rule)

func activate_rule(rule):
	if not rules_active.has(rule):
		rules_active.append(rule)

func deactivate_rule(rule):
	if rules_active.has(rule):
		rules_active.remove(rules_active.find(rule))
