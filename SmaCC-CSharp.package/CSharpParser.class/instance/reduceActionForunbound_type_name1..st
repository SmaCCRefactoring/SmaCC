generated
reduceActionForunbound_type_name1: nodes
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: ((nodes at: 2) at: 3) to: result gtTokens.
	^result