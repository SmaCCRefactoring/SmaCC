generated-reduction actions
reduceActionForInstantiatedGenericVariableExpression1: nodes
	| result |
	result := DelphiInstantiatedGenericVariableExpressionNode new.
	result name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result typeArguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result