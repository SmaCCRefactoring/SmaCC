generated-reduction actions
reduceActionForsuperclass_subscript_expression1: nodes
	| result |
	result := SwiftSuperclassSubscriptExpressionNode new.
	result superToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result