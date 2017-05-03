generated-reduction actions
reduceActionFornameof_expression1: nodes
	| result |
	result := CSNameofExpressionNode new.
	result nameofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result name: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result