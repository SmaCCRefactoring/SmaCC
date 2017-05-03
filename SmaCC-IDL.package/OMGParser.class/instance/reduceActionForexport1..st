generated-reduction actions
reduceActionForexport1: nodes
	| result |
	result := ASTExportNode new.
	result typeDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result