generated-reduction actions
reduceActionForPropertyAssignment2: nodes
	| result |
	result := JSGetPropertyAssignmentNode new.
	result getToken: (nodes at: 1).
	result key: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result statements.
	result rightBrace: (nodes at: 7).
	^ result