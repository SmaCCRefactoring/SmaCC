generated-reduction actions
reduceActionForexport5: nodes
	| result |
	result := ASTExportNode new.
	result opDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result