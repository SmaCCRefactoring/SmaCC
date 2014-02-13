generated-reduction actions
reduceActionForsizeof_expression1: nodes
	| result |
	result := CSSizeofExpressionNode new.
	result sizeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result