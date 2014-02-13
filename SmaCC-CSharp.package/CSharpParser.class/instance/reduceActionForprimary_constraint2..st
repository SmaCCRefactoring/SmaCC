generated-reduction actions
reduceActionForprimary_constraint2: nodes
	| result |
	result := CSPrimaryConstraintNode new.
	result classToken: (nodes at: 1).
	^ result