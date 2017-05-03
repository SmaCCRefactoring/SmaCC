generated-reduction actions
reduceActionForexport2: nodes
	| result |
	result := ASTExportNode new.
	result constDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result