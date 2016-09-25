generated-reduction actions
reduceActionForcode_block1: nodes
	| result |
	result := SwiftBlockNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result