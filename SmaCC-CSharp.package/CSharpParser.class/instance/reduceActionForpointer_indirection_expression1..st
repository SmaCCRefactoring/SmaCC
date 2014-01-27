generated
reduceActionForpointer_indirection_expression1: nodes
	| result |
	result := CSPrefixExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^result