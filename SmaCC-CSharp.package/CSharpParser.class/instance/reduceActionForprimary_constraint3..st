generated
reduceActionForprimary_constraint3: nodes
	| result |
	result := CSPrimaryConstraintNode new.
	result structToken: (nodes at: 1).
	^result