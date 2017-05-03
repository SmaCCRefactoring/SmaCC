generated-reduction actions
reduceActionForinterface_header1: nodes
	| result |
	result := ASTInterfaceHeaderNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result