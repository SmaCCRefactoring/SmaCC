generated
reduceActionFordefault_value_expression1: nodes
	| result |
	result := CSDefaultValueExpressionNode new.
	result defaultToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^result