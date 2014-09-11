generated-reduction actions
reduceActionForlist_if1: nodes
	| result |
	result := PyListIfNode new.
	result addToken: (nodes at: 1) to: result ifTokens.
	result addNode: (nodes at: 2) to: result conditions.
	^ result