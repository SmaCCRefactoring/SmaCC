generated
reduceActionFortype_parameter_constraints_clause1: nodes
	| result |
	result := CSTypeParameterConstraintsClauseNode new.
	result whereToken: (nodes at: 1).
	result parameter: (nodes at: 2).
	result colon: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result constraints.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^result