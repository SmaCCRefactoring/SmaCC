generated-reduction actions
reduceActionForchecked_expression1: nodes
	| result |
	result := CSCheckedExpressionNode new.
	result checkedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result