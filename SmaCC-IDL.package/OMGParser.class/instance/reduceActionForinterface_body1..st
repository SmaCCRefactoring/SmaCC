generated-reduction actions
reduceActionForinterface_body1: nodes
	| result |
	result := ASTInterfaceBodyNode new.
	result export: (nodes at: 1).
	^ result