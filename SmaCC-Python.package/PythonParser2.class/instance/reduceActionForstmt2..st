generated-reduction actions
reduceActionForstmt2: nodes
	| result |
	result := ASTStmtNode new.
	result statement: (nodes at: 1).
	^ result