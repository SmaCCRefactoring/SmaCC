generated-reduction actions
reduceActionForsubscript3: nodes
	| result |
	result := PySubscriptNode new.
	result addToken: (nodes at: 2) to: result colonTokens.
	^ result