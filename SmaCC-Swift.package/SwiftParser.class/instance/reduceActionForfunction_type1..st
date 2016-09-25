generated-reduction actions
reduceActionForfunction_type1: nodes
	| result |
	result := SwiftFunctionTypeNode new.
	result addToken: (nodes at: 2) to: result minusGreaterThanTokens.
	^ result