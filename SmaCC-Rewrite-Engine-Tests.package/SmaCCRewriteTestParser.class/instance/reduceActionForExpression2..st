generated
reduceActionForExpression2: nodes
	| result |
	result := SmaCCRewriteTestBinaryExpressionNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^result