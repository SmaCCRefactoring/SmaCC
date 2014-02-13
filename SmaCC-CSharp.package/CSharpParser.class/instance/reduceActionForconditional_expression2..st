generated-reduction actions
reduceActionForconditional_expression2: nodes
	| result |
	result := CSConditionalExpressionNode new.
	result booleanExpression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result