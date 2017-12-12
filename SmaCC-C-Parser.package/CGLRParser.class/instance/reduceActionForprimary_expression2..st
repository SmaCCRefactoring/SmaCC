generated-reduction actions
reduceActionForprimary_expression2: nodes
	| result |
	result := CGLRConstantNode new.
	result cONSTANTToken: (nodes at: 1).
	^ result