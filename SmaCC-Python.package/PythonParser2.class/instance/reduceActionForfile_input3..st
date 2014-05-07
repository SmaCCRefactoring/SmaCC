generated-reduction actions
reduceActionForfile_input3: nodes
	| result |
	result := ASTFileInputNode new.
	result addVariablesFrom: (nodes at: 1).
	result addVariablesFrom: (nodes at: 2).
	^ result