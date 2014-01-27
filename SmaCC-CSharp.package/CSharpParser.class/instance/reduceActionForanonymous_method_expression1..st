generated
reduceActionForanonymous_method_expression1: nodes
	| result |
	result := CSAnonymousMethodExpressionNode new.
	result delegateToken: (nodes at: 1).
	result signature: (nodes at: 2).
	result block: (nodes at: 3).
	^result