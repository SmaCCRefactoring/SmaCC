generated-reduction actions
reduceActionFortestlist1: nodes
	| result |
	result := nodes at: 3.
	result addFirstNode: (nodes at: 1) to: result tests.
	result addFirstToken: (nodes at: 2) to: result commaTokens.
	^ result