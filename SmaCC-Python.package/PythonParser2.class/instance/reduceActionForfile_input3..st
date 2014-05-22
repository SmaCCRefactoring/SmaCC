generated-reduction actions
reduceActionForfile_input3: nodes
	| result |
	result := PyFileInputNode new.
	result addVariablesFrom: (nodes at: 1).
	result addObject: (nodes at: 2) to: result statements.
	^ result