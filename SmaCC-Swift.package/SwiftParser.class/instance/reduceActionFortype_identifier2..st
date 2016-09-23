generated-reduction actions
reduceActionFortype_identifier2: nodes
	| result |
	result := nodes at: 4.
	result addFirstToken: (nodes at: 1) to: result identifierTokens.
	result addFirstToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addFirstTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result
		addFirstToken: ((nodes at: 2) at: 3)
		to: result greaterThanTokens.
	result addFirstToken: (nodes at: 3) to: result periodTokens.
	^ result