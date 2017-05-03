generated-reduction actions
reduceActionForinterface_header2: nodes
	| result |
	result := ASTInterfaceHeaderNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	result inheritanceSpec: (nodes at: 3).
	^ result