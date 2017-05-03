generated-reduction actions
reduceActionForexport4: nodes
	| result |
	result := ASTExportNode new.
	result attrDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result