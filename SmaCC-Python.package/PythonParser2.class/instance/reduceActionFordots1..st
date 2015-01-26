generated-reduction actions
reduceActionFordots1: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	^ result