generated-reduction actions
reduceActionForblock1: nodes
	| result |
	result := CSBlockStatementNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result