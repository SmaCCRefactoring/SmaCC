generated-reduction actions
reduceActionForcomma_opt2: nodes
	| result |
	result := ASTNullPatternFooNode new.
	result commaToken: (nodes at: 1).
	^ result