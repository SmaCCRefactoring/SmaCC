generated-reduction actions
reduceActionForprimary_expression1: nodes
	| result |
	result := CGLRIdentifierExpressionNode new.
	result symbol: (nodes at: 1).
	^ result