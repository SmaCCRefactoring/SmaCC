generated-reduction actions
reduceActionForprotocol_composition_type1: nodes
	| result |
	result := SwiftProtocolCompositionTypeNode new.
	result protocolToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addToken: (nodes at: 4) to: result greaterThanTokens.
	^ result