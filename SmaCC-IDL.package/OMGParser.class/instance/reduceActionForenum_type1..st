generated-reduction actions
reduceActionForenum_type1: nodes
	| result |
	result := ASTEnumTypeNode new.
	result enumToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result enumerators: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result