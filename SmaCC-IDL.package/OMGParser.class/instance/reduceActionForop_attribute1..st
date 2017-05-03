generated-reduction actions
reduceActionForop_attribute1: nodes
	| result |
	result := ASTOpAttributeNode new.
	result onewayToken: (nodes at: 1).
	^ result