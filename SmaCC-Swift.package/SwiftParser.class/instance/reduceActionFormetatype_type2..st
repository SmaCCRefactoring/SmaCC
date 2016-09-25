generated-reduction actions
reduceActionFormetatype_type2: nodes
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result protocolTokens.
	^ result