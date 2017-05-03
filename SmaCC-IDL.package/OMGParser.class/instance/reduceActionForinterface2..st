generated-reduction actions
reduceActionForinterface2: nodes
	| result |
	result := ASTInterfaceNode new.
	result forwardDcl: (nodes at: 1).
	^ result