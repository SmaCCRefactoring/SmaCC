generated
reduceActionForunbound_type_name3: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^result