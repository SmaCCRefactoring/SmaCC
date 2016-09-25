generated-reduction actions
reduceActionForoptional_type1: nodes
	| result |
	result := SwiftOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result questionMarkTokens.
	^ result