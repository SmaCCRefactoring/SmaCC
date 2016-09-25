generated-reduction actions
reduceActionForarray_type1: nodes
	| result |
	result := SwiftArrayTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result rightBracketTokens.
	^ result