generated-reduction actions
reduceActionForProgram1: nodes
	| result |
	result := JSFileNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result