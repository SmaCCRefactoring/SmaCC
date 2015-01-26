generated-reduction actions
reduceActionFortestlist2: nodes
	| result |
	result := PyTestlistNode new.
	result addNode: (nodes at: 1) to: result tests.
	result addToken: ((nodes at: 2) at: 1) to: result commaTokens.
	^ result