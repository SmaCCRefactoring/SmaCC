generated-reduction actions
reduceActionForoctet_type1: nodes
	| result |
	result := ASTOctetTypeNode new.
	result octetToken: (nodes at: 1).
	^ result