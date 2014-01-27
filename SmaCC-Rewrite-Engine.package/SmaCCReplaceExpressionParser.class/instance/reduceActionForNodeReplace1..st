generated
reduceActionForNodeReplace1: nodes
	| result |
	result := SmaCCNodeReplaceExpression new.
	result addVariablesFrom: (nodes at: 1).
	result beforeWhitespace: ((nodes at: 3) at: 1).
	result beforePrefix: ((nodes at: 3) at: 2).
	result prefix: ((nodes at: 3) at: 3).
	result name: (nodes at: 4).
	result postfix: ((nodes at: 5) at: 1).
	result afterPostfix: ((nodes at: 5) at: 2).
	result afterWhitespace: ((nodes at: 5) at: 3).
	result addVariablesFrom: (nodes at: 6).
	^result