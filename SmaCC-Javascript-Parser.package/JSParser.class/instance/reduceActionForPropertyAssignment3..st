generated-reduction actions
reduceActionForPropertyAssignment3: nodes
	| result |
	result := JSSetPropertyAssignmentNode new.
	result setToken: (nodes at: 1).
	result key: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result variable: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result