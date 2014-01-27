generated
reduceActionForpointer_element_access1: nodes
	| result |
	result := CSPointerElementAccessNode new.
	result expression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result indexExpression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^result