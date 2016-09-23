generated-reduction actions
reduceActionFormetatype_type1: nodes
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result typeTokens.
	^ result