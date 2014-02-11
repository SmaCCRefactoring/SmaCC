generated-reduction actions
reduceActionForcatch_clause1: nodes
	| result |
	result := JavaCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result left: (nodes at: 2).
	result addNodes: (nodes at: 3) modifiers to: result modifiers.
	result type: (nodes at: 3) type.
	result variable: (nodes at: 3) variable.
	result right: (nodes at: 4).
	result block: (nodes at: 5).
	^ result