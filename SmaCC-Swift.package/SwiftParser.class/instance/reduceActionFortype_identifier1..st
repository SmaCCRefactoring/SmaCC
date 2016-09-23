generated-reduction actions
reduceActionFortype_identifier1: nodes
	| result |
	result := SwiftTypeIdentifierNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: ((nodes at: 2) at: 3) to: result greaterThanTokens.
	^ result