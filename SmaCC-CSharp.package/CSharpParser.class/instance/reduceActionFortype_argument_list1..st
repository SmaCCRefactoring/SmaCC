generated-reduction actions
reduceActionFortype_argument_list1: nodes
	| result |
	result := CSTypeArgumentListNode new.
	result lessThanToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result types.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: (nodes at: 3).
	^ result