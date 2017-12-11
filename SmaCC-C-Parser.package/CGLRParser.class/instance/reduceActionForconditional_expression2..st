generated-reduction actions
reduceActionForconditional_expression2: nodes
	| result |
	result := CGLRTernaryNode new.
	result condition: (nodes at: 1).
	result then: (nodes at: 3).
	result else: (nodes at: 5).
	^ result