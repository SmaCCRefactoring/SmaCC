generated-reduction actions
reduceActionForoptional_chaining_expression1: nodes
	| result |
	result := SwiftOptionalChainingExpressionNode new.
	result expression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^ result