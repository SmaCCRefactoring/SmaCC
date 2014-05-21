generated-reduction actions
reduceActionForcomparison2: nodes
	| result |
	result := ASTComparisonNode new.
	result one: (nodes at: 1).
	result op: (nodes at: 2).
	result two: (nodes at: 3).
	^ result