generated-reduction actions
reduceActionFordots2: nodes
	| result |
	result := PyDotsNode new.
	result addToken: (nodes at: 1) to: result periodTokens.
	^ result