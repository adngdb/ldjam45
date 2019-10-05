extends Node

enum {
	NOTHING_MOVES,
}

var rules_available = [NOTHING_MOVES]
var rules_active = []

func select_rule(rule):
	rules_active = [rule]