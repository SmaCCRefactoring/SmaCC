generated-reduction actions
reduceActionForexport3: nodes
	| result |
	result := ASTExportNode new.
	result exceptDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result