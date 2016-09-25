generated-reduction actions
reduceActionForsuperclass_method_expression1: nodes
	| result |
	result := SwiftSuperclassMethodExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result