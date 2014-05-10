generated-reduction actions
reduceActionForfile_input2: nodes
	| result |
	result := ASTFileInputNode new.
	result file: (nodes at: 1).
	result nEWLINEToken: (nodes at: 2).
	^ result