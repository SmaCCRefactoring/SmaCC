generated-reduction actions
reduceActionForwildcard_expression1: nodes
	| result |
	result := SwiftWildcardExpressionNode new.
	result _Token: (nodes at: 1).
	^ result