generated-reduction actions
reduceActionForinheritance_spec1: nodes
	| result |
	result := ASTInheritanceSpecNode new.
	result colonToken: (nodes at: 1).
	result scopedNames: (nodes at: 2).
	^ result