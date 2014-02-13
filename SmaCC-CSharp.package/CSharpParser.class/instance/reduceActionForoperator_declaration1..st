generated-reduction actions
reduceActionForoperator_declaration1: nodes
	| result |
	result := CSOperatorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result operatorToken: ((nodes at: 3) at: 2).
	result operator: ((nodes at: 3) at: 3).
	result leftParenToken: ((nodes at: 3) at: 4).
	result addNodes: ((nodes at: 3) at: 5) to: result types.
	result addTokens: ((nodes at: 3) at: 6) to: result arguments.
	result rightParenToken: ((nodes at: 3) at: 7).
	result commaToken: ((nodes at: 3) at: 8).
	result implicitToken: ((nodes at: 3) at: 9).
	result explicitToken: ((nodes at: 3) at: 10).
	result body: (nodes at: 4).
	^ result