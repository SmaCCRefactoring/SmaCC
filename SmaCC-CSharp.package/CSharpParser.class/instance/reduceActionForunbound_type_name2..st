generated-reduction actions
reduceActionForunbound_type_name2: nodes
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result colonColonToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^ result