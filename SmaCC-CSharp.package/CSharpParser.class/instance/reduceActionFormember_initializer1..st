generated-reduction actions
reduceActionFormember_initializer1: nodes
	| result |
	result := CSMemberInitializerNode new.
	result identifier: ((nodes at: 1) at: 1).
	result leftBracketToken: ((nodes at: 1) at: 2).
	result addNodes: ((nodes at: 1) at: 3) to: result arguments.
	result addTokens: ((nodes at: 1) at: 4) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 5).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result