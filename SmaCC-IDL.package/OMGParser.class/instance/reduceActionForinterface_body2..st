generated-reduction actions
reduceActionForinterface_body2: nodes
	| result |
	result := ASTInterfaceBodyNode new.
	result interfaceBody: (nodes at: 1).
	result export: (nodes at: 2).
	^ result