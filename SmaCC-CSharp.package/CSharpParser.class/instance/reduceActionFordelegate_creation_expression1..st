generated
reduceActionFordelegate_creation_expression1: nodes
	| result |
	result := CSDelegateCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	^result