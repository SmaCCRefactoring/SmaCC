generated-reduction actions
reduceActionForfile_input3: nodes
	| result |
	result := ASTFileInputNode new.
	result file: (nodes at: 1).
	result statements: (nodes at: 2).
	^ result