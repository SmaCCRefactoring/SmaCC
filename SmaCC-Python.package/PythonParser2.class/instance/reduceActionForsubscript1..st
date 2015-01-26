generated-reduction actions
reduceActionForsubscript1: nodes
	| result |
	result := PySubscriptNode new.
	result addToken: (nodes at: 1) to: result periodTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result periodTokens.
	^ result