generated-reduction actions
reduceActionForarray_declarator1: nodes
	| result |
	result := ASTArrayDeclaratorNode new.
	result id: (nodes at: 1).
	result fixedArraySizes: (nodes at: 2).
	^ result