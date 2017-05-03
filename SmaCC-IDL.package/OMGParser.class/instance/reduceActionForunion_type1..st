generated-reduction actions
reduceActionForunion_type1: nodes
	| result |
	result := ASTUnionTypeNode new.
	result unionToken: (nodes at: 1).
	result id: (nodes at: 2).
	result switchToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result switchTypeSpec: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result leftBraceToken: (nodes at: 7).
	result switchBody: (nodes at: 8).
	result rightBraceToken: (nodes at: 9).
	^ result