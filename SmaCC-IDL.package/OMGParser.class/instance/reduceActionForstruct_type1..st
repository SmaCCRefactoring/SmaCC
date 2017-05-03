generated-reduction actions
reduceActionForstruct_type1: nodes
	| result |
	result := ASTStructTypeNode new.
	result structToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result memberList: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result