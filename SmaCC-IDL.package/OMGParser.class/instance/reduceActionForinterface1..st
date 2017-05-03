generated-reduction actions
reduceActionForinterface1: nodes
	| result |
	result := ASTInterfaceNode new.
	result interfaceDcl: (nodes at: 1).
	^ result