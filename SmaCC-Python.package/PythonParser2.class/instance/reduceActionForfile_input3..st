generated-reduction actions
reduceActionForfile_input3: nodes
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result statements.
	^ result