generated
reduceActionForconstructor_constraint1: nodes
	| result |
	result := CSConstructorConstraintNode new.
	result newToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^result